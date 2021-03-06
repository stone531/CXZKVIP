package com.fh.controller.ins.business;

import java.io.PrintWriter;
import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.PathUtil;
import com.fh.service.ins.business.BusinessManager;
import com.fh.service.ins.company.CompanyManager;
import com.fh.controller.ins.usermanage.UserManageController;

/** 
 * 说明：保险业务
 * 创建人：FH Q313596790
 * 创建时间：2016-10-26
 */
@Controller
@RequestMapping(value="/business")
public class BusinessController extends BaseController {
	
	String menuUrl = "business/list.do"; //菜单地址(权限用)
	@Resource(name="businessService")
	private BusinessManager businessService;
	
	@Resource(name="companyService")
	private CompanyManager companyService;
	
	Map<String, String> compNameMap = new HashMap<String, String>();
	
	// get name from cache
	public String getCompName(String key) throws Exception{
		System.out.println("getCompName param key:"+key);
		
		if(compNameMap.containsKey(key)){
			System.out.println("getCompName from cache:"+compNameMap.get(key).toString());
			return compNameMap.get(key).toString();
		}
		
		PageData pdIn = new PageData();
		PageData pdOut = new PageData();
		
		pdIn.put("COMOANY_ID", key);
		pdOut=companyService.findById(pdIn);
		if (pdOut==null){
			return "";
		}
		String name=pdOut.getString("COMPNAME");
		compNameMap.put(key, name);
		System.out.println("getCompName from mysql:"+name);
		
		return name;		
	}
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(
			@RequestParam(value="CLAIMTEXT",required=false) MultipartFile file,
			@RequestParam(value="NAME") String NAME,
			@RequestParam(value="COMPANYID") String COMPANYID,
			@RequestParam(value="STATE") String STATE,
			@RequestParam(value="CONTEXT") String CONTEXT,
			@RequestParam(value="SERVERTEXT") String SERVERTEXT,
			@RequestParam(value="PROFESSION_LIMIT") String PROFESSION_LIMIT,
			@RequestParam(value="NOTICE") String NOTICE
			) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Business");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		String filePath = PathUtil.getClasspath() + Const.FILEPATHTEXT;		//保险条款上传路径
		String realname = file.getOriginalFilename().substring(0,file.getOriginalFilename().lastIndexOf("."));
		String fileName =  FileUpload.fileUp(file, filePath, realname);	//执行上传
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();

		
		pd.put("NAME", NAME);
		pd.put("COMPANYID",COMPANYID);
		pd.put("STATE", STATE);
		pd.put("CONTEXT",CONTEXT);
		pd.put("CLAIMTEXT", Const.FILEPATHTEXT+fileName);
		pd.put("SERVERTEXT", SERVERTEXT);
		pd.put("PROFESSION_LIMIT", PROFESSION_LIMIT);
		pd.put("BUSINESS_ID", this.get32UUID());	//主键
		pd.put("NOTICE",NOTICE);
		
		businessService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Business");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		businessService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(
			@RequestParam(value="CLAIMTEXT",required=false) MultipartFile file,
			@RequestParam(value="NAME") String NAME,
			@RequestParam(value="COMPANYID") String COMPANYID,
			@RequestParam(value="STATE") String STATE,
			@RequestParam(value="CONTEXT") String CONTEXT,
			@RequestParam(value="SERVERTEXT") String SERVERTEXT,
			@RequestParam(value="BUSINESS_ID") String BUSINESS_ID,
			@RequestParam(value="PROFESSION_LIMIT") String PROFESSION_LIMIT,
			@RequestParam(value="NOTICE") String NOTICE
			) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Business");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		String filePath = PathUtil.getClasspath() + Const.FILEPATHTEXT;		//保险条款上传路径
		String realname = file.getOriginalFilename().substring(0,file.getOriginalFilename().lastIndexOf("."));
		String fileName =  FileUpload.fileUp(file, filePath, realname);	//执行上传
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();

		pd.put("NAME", NAME);
		pd.put("COMPANYID",COMPANYID);
		pd.put("STATE", STATE);
		pd.put("CONTEXT",CONTEXT);
		pd.put("CLAIMTEXT", Const.FILEPATHTEXT+fileName);
		pd.put("SERVERTEXT", SERVERTEXT);
		pd.put("BUSINESS_ID", BUSINESS_ID);
		pd.put("PROFESSION_LIMIT", PROFESSION_LIMIT);
		pd.put("NOTICE",NOTICE);

		businessService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		//UserManageController.SetQX(mv);
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Business");
		
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = businessService.list(page);	//列出Business列表
		
		mv.setViewName("ins/business/business_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		//UserManageController.SetQX(mv);
		return mv;
	}
	
	
	/**获取服务条款
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/fg/getServerText")
	public void addCourier(HttpServletRequest request, HttpServletResponse response) throws Exception{
        response.setContentType("text/html");  
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		PageData pd = new PageData();
		pd = this.getPageData();		
		
		//很据保单号查询是否已经报案
		PageData pdRet = businessService.findById(pd);
		if(null == pdRet){
			pd.put("IsSuccess", false);
		}else{
			pd.put("ServerText", pdRet.getString("SERVERTEXT"));
			pd.put("ClaimText", pdRet.getString("CLAIMTEXT"));
			pd.put("IsSuccess", true);
		}
		JSONObject js = JSONObject.fromObject(pd);
		out.write(js.toString());
		out.close();
	}
	
	
	/**获取告知书
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/fg/getNoticeText")
	public void getNotice(HttpServletRequest request, HttpServletResponse response) throws Exception{
        response.setContentType("text/html");  
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		PageData pd = new PageData();
		pd = this.getPageData();		
		
		//很据保单号查询是否已经报案
		PageData pdRet = businessService.findById(pd);
		if(null == pdRet){
			pd.put("IsSuccess", false);
		}else{
			pd.put("NoticText", pdRet.getString("NOTICE"));
			pd.put("IsSuccess", true);
		}
		JSONObject js = JSONObject.fromObject(pd);
		out.write(js.toString());
		out.close();
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
		
		List<PageData> varListComp=companyService.listAll(pd);
		mv.addObject("varListComp", varListComp);
		System.out.println(varListComp);
		
		mv.setViewName("ins/business/business_edit");
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
		pd = businessService.findById(pd);	//根据ID读取
		
		List<PageData> varListComp=companyService.listAll(pd);
		mv.addObject("varListComp", varListComp);
		System.out.println(varListComp);
		
		mv.setViewName("ins/business/business_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Business");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			businessService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Business到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("具体业务名称");	//1
		titles.add("业务所属公司");	//2
		titles.add("业务状态");	//3
		titles.add("具体内容");	//4
		dataMap.put("titles", titles);
		List<PageData> varOList = businessService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("NAME"));	//1
			vpd.put("var2", varOList.get(i).getString("COMPANYID"));	//2
			vpd.put("var3", varOList.get(i).get("STATE").toString());	//3
			vpd.put("var4", varOList.get(i).getString("CONTEXT"));	//4
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
}
