package com.fh.controller.ins.worker;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
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
import com.fh.controller.ins.workdata.WorkData;
import com.fh.controller.ins.workssubdata.WorkSSubData;
import com.fh.controller.ins.worksubdata.WorkSubData;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.FileDownload;
import com.fh.util.FileUpload;
import com.fh.util.ObjectExcelRead;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.PathUtil;
import com.fh.service.ins.company.CompanyManager;
import com.fh.service.ins.worker.WorkerManager;
import com.fh.service.ins.business.BusinessManager;


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
	@Resource(name="companyService")
	private CompanyManager companyService;
	@Resource(name="businessService")
	private BusinessManager businessService;
	
	
	String selfCompanyId;
	HashMap<String,String> mapWork = new HashMap<String,String>();
	
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
	
	/**下载模版
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/downExcel")
	public void downExcel(HttpServletResponse response)throws Exception{
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "职业录入模板.xls", "职业录入模板.xls");
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
	
	@RequestMapping(value="goreadExcel")
	public ModelAndView goreadExcel() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> varList=companyService.listAll(pd);
		mv.setViewName("ins/worker/readExcel");
		mv.addObject("msg", "readExcel");
		mv.addObject("varList",varList);
		mv.addObject("pd", pd);
		return mv;
	}
	public class JobData{
		public String id;
		public String name;
		public String workclass;
	}
	
	//GetProfessionList
	@RequestMapping(value="/fg/getworkjson")
	public void GetProfessionList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html");  
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		
		//获取bussinessid
		String businessid=request.getParameter("businessid");
		System.out.println("businessid:"+businessid);
		String professions_limit=null,companyid=null;
		
		//获取保险可用的大类目
		if(businessid!=null && !businessid.equals("")){
			//很据保单号查询是否已经报案
			PageData p_In = new PageData();
			p_In.put("BUSINESS_ID", businessid);
			PageData p_out = businessService.findById(p_In);
			if (p_out!=null){
				professions_limit=p_out.getString("PROFESSION_LIMIT");
				companyid=p_out.getString("COMPANYID");
				System.out.println("professions:"+professions_limit);				
			}
					
		}
		selfCompanyId=companyid;
		//获取所有的职业
		pd.put("PARENTID", companyid);
		List<PageData> professions=workerService.listAll(pd);
		List<JobData> jobList = new ArrayList<JobData>();
		System.out.println(professions);
		
		ArrayList<WorkData> arrList = new ArrayList<WorkData>();
		
		//将职业放入待排序数组
		for(int i=0;i<professions.size();i++){
			String id=professions.get(i).getString("ID");
			String name=professions.get(i).getString("NAME");
			String workcls=professions.get(i).getString("WORKCLASS");
			mapWork.put(id,name);
			
			JobData jd=new JobData();
			jd.id=id;
			jd.name=name;	
			jd.workclass=workcls;
			jobList.add(jd);
		}
		
		//对职业列表进行排序
        Collections.sort(jobList,new Comparator<JobData>(){
            public int compare(JobData arg0, JobData arg1) {
                return arg0.id.compareTo(arg1.id);
            }
        });
		
        
        //对排序后的职业进行筛选，筛选出符合要求的可用职业
		for(int i=0;i<jobList.size();i++){
			String id=jobList.get(i).id;
			String name=jobList.get(i).name;
			String workcls=jobList.get(i).workclass;
			if((id.length()==6) && !isbelong(professions_limit,workcls) ){
				continue;
			}
			//System.out.println("getworkjson id:"+id+" name:"+name);
			this.FormatDataToArr(id, name, mapWork, arrList);	
		}
		
		//返回json串给前端
		JSONArray js  = JSONArray.fromObject(arrList);
		out.write(js.toString());
	}
	
	public Boolean isbelong(String source,String substr){
		if (source==null){
			return true;
		}
		return source.contains(substr);
	}
	
	/**搜索
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/fg/searchWork")
	@ResponseBody
	public Object searchWork() throws Exception{
		//获取bussinessid
		/*
		PageData pd = new PageData();
		pd = this.getPageData();
		String businessid=pd.getString("businessid");

		String professions_limit=null,companyid=null;
		
		//获取保险可用的大类目
		if(businessid!=null && !businessid.equals("")){
			//很据保单号查询是否已经报案
			PageData p_In = new PageData();
			p_In.put("BUSINESS_ID", businessid);
			PageData p_out = businessService.findById(p_In);
			if (p_out!=null){
				professions_limit=p_out.getString("PROFESSION_LIMIT");
				companyid=p_out.getString("COMPANYID");
				System.out.println("professions:"+professions_limit);				
			}					
		}
		*/
		//获取所有的职业
		Map<String,Object> map = new HashMap<String,Object>();
		int nResult = 0;
		PageData pd = new PageData();
		pd = this.getPageData();
		selfCompanyId= new String("00f54515227d415da5e75d7d29304ccb");
		pd.put("PARENTID", selfCompanyId);
		List<PageData> professions=workerService.searchAllWork(pd);

		List<PageData> varList = new ArrayList<PageData>();
		
		if(professions.size()==0){
			nResult = 1; //没有职业
		}

		for(int i=0;i<professions.size();i++){
			String id=professions.get(i).getString("ID");
			String name=professions.get(i).getString("NAME");
			if(id.length()!=6)
				continue;
			
			PageData pageData = new PageData();			
			this.ParseData(id, name, mapWork,pageData);
			pageData.put("selfName", name);
			varList.add(pageData);					
		}
		map.put("varList", varList);
	    map.put("result", nResult);
	    return AppUtil.returnObject(pd, map);
	}
	
	/**去搜索页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/fg/goSearchwork")
	public ModelAndView goSearch()throws Exception{	
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("ins/policy/searchwork");
		//mv.addObject("msg", "search");
		mv.addObject("pd", pd);
		return mv;
	}
	
	@RequestMapping(value="/readExcel")
	public ModelAndView readExcel(
			@RequestParam(value="workerexcel",required=false) MultipartFile file,
			@RequestParam(value="cmpy_type") String companyId
			) throws Exception{
		ModelAndView mv = this.getModelAndView();
		System.out.println(file);
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;}
			String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;								//文件上传路径
			String fileName =  FileUpload.fileUp(file, filePath, "workerexcel");							//执行上传
			
			List<PageData> listPd = (List)ObjectExcelRead.readExcel(filePath,fileName, 2, 0, 0);	//执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
			/**
			 * var0 :ID:职业编号
			 * var1 :NAME：职业名称
			 * var2 :WORKCLASS：职业类别
			 * var3 :PARENTID：保险公司
			 */
			//HashMap<String,String> mapWork = new HashMap<String,String>();
			//ArrayList<WorkData> arrList = new ArrayList<WorkData>();
			
			for(int i=0;i<listPd.size();i++){
				
				PageData pageData= new PageData();
				
				pageData.put("ID", listPd.get(i).getString("var0"));	//1
				
				pageData.put("NAME", listPd.get(i).getString("var1"));	//2

				pageData.put("WORKCLASS", listPd.get(i).getString("var2"));	//3

				pageData.put("PARENTID", companyId);	//4
		
				pageData.put("WORKER_ID", this.get32UUID());
				
				//mapWork.put(listPd.get(i).getString("var0"),listPd.get(i).getString("var1"));
				
				//this.FormatDataToArr(listPd.get(i).getString("var0"), listPd.get(i).getString("var1"), mapWork, arrList);
				
				workerService.save(pageData);
				
				}
			
			//JSONArray js  = JSONArray.fromObject(arrList);

			//PageData cmpPd = new PageData();
			//cmpPd.put("COMPANY_ID", companyId);
			//cmpPd.put("WORKJSON", js.toString());
			//companyService.editjson(cmpPd);
				
			/*存入数据库操作======================================*/
			
			mv.addObject("msg","success");
		
		mv.setViewName("save_result");

		return mv;
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
	
	public void FormatDataToArr(String index,String name,HashMap<String,String> mapWork,ArrayList<WorkData> root) {
		
		PageData pageData = new PageData();
				
		this.ParseData(index, name, mapWork,pageData);

		this.ArrayFromObject(Integer.parseInt(pageData.get("classId").toString()), pageData.get("gName").toString(), pageData.get("fName").toString(), name, root);
	}
	
	public void ParseData(String index , String name ,HashMap<String,String> mapWork ,PageData pageData){
		
		
		StringBuffer bufId = new StringBuffer();
		StringBuffer bufName = new StringBuffer();
		
		String gId;
		String fId;
		
		bufId.append(index);
		bufName.append(name);
		
		int len = bufId.length();
		
		switch (len) {
		case 2:
			pageData.put("classId", "0");
			pageData.put("gName", "");
			pageData.put("fName","");
			break;
		case 4:
			pageData.put("classId", "1");
		    gId = bufId.substring(0, 2);
		    pageData.put("gName", mapWork.get(gId));
		    pageData.put("fName","");
			break;
		case 6:
			pageData.put("classId", "2");
			gId = bufId.substring(0,2);
			pageData.put("gName", mapWork.get(gId));
			fId = bufId.substring(0,4);
			pageData.put("fName", mapWork.get(fId));
			break;
		}
		return;
	}
	
	public void ArrayFromObject(int classId , String gName, String fName , String workName ,ArrayList<WorkData>  root){	
		
		switch (classId) {
		case 0:
			WorkData wd = new WorkData();
			wd.setN(workName);
			root.add(wd);
			break;
		case 1:
			WorkSubData wsd = new WorkSubData();
			wsd.setN(workName);
			for (int i=0; i<root.size(); i++) {
				if (root.get(i).getN() == gName) {
					root.get(i).setS(wsd);
					break;
				}
						
			}
			break;
		case 2:
			WorkSSubData wssd = new WorkSSubData();
			wssd.setN(workName);
			for (int i=0; i<root.size();i++){
				if (root.get(i).getN() == gName) {
					for (int j=0; j<root.get(i).getS().size();j++) {
						if (root.get(i).getS().get(j).getN() == fName){
							root.get(i).getS().get(j).getS().add(wssd);
							break;
						}
					}
					break;
				}
			}
			break;
		}
	}
}


