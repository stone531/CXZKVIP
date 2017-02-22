package com.fh.controller.ins.worker;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.FileUpload;
import com.fh.util.ObjectExcelRead;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.PathUtil;
import com.fh.service.ins.worker.WorkerManager;

/** 
 * 说明：职业选择
 * 创建人：FH Q313596790
 * 创建时间：2017-02-21
 */
@Controller
@RequestMapping(value="/worker")
public class WorkerController extends BaseController {
	
	String menuUrl = "worker/list.do"; //菜单地址(权限用)
	@Resource(name="workerService")
	private WorkerManager workerService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Worker");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("WORKER_ID", this.get32UUID());	//主键
		workerService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Worker");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		workerService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Worker");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		workerService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Worker");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = workerService.list(page);	//列出Worker列表
		mv.setViewName("ins/worker/worker_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("ins/worker/worker_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = workerService.findById(pd);	//根据ID读取
		mv.setViewName("ins/worker/worker_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Worker");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			workerService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Worker到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("worker id");	//1
		titles.add("worker name");	//2
		titles.add("职业类别");	//3
		titles.add("父id");	//4
		titles.add("备用");	//5
		titles.add("备用");	//6
		dataMap.put("titles", titles);
		List<PageData> varOList = workerService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("ID"));	//1
			vpd.put("var2", varOList.get(i).getString("NAME"));	//2
			vpd.put("var3", varOList.get(i).getString("WORKCLASS"));	//3
			vpd.put("var4", varOList.get(i).getString("PARENTID"));	//4
			vpd.put("var5", varOList.get(i).getString("EXT1"));	//5
			vpd.put("var6", varOList.get(i).getString("EXT2"));	//6
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
//	class MyData {
//		public String N;
//		
//	};
//	class MyData1 {
//		public String N;
//		public ArrayList<MyData> S;
//	};
//	
//	@RequestMapping(value="/testjson")
//	public void testjson(){
//		MyData1 m= new MyData1();
//		m.N = "mydata1";
//		m.S = new ArrayList<MyData>();
//		
//		MyData n = new MyData();
//		n.N = "mydata";
//		
//		m.S.add(n);
//		
//		Object js = JSONObject.fromObject(m);
//		System.out.println(js.toString());
//	}
	
	@RequestMapping(value="/readExcel")
	public ModelAndView readExcel(
			@RequestParam(value="workerexcel",required=false) MultipartFile file
			) throws Exception{
		ModelAndView mv = this.getModelAndView();
		System.out.println(file);
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;}
			String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;								//文件上传路径
			String fileName =  FileUpload.fileUp(file, filePath, "cardtypeexcel");							//执行上传
			
			List<PageData> listPd = (List)ObjectExcelRead.readExcel(filePath,fileName, 2, 0, 0);	//执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
			/**
			 * var0 :ID:职业编号
			 * var1 :NAME：职业名称
			 * var2 :WORKCLASS：职业类别
			 * var3 :PARENTID：保险公司
			 */
			for(int i=0;i<listPd.size();i++){
				
				PageData pageData= new PageData();
				
				pageData.put("ID", listPd.get(i).getString("var0"));	//1
				
				pageData.put("NAME", listPd.get(i).getString("var1"));	//2

				pageData.put("WORKCLASS", listPd.get(i).getString("var2"));	//3

				pageData.put("PARENTID", listPd.get(i).getString("var3"));	//4
		
				pageData.put("WORKER_ID", this.get32UUID());
				
				workerService.save(pageData);
				
				}
			
			
			
				
			/*存入数据库操作======================================*/
			
			mv.addObject("msg","success");
		
		mv.setViewName("save_result");
		Page page=new Page();
		return list(page);
	}
	
	
	public static boolean isNumeric(String str)
	{
	  try{
	   Integer.parseInt(str);
	   return true;
	  }catch(NumberFormatException e)
	  {
	 System.out.println("异常：\"" + str + "\"不是数字/整数...");
	 return false;
	  }
	}
}


