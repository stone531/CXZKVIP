package com.fh.controller.ins.policy;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

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
import com.fh.util.FileDownload;
import com.fh.util.FileUpload;
import com.fh.util.ObjectExcelRead;
import com.fh.util.ObjectExcelView;
import com.fh.util.DateUtil;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.PathUtil;
import com.fh.service.ins.policy.PolicyManager;
import com.fh.service.ins.cardinfo.CardInfoManager;
import com.fh.service.ins.business.BusinessManager;
import com.fh.controller.ins.usermanage.UserManageController;

/** 
 * 说明：保单系统
 * 创建人：FH Q313596790
 * 创建时间：2016-09-24
 */
@Controller
@RequestMapping(value="/policy")
public class PolicyController extends BaseController {
	
	String menuUrl = "policy/list.do"; //菜单地址(权限用)
	@Resource(name="policyService")
	private PolicyManager policyService;
	
	@Resource(name="cardinfoService")
	private CardInfoManager cardinfoService;
	
	@Resource(name="businessService")
	private BusinessManager businessService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/fg/index")
	public ModelAndView index() throws Exception{
		
		//*************************************************************************************************************************************************
		System.out.println("index");
		ModelAndView mv = this.getModelAndView();
		mv.addObject("action","cardinfo/fg/verifycard");
		mv.setViewName("ins/policy/verifycard");
		mv.addObject("display", "none");
		return mv;
	}
	
	/**保单详情页
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/fg/detail")
	public ModelAndView detail() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData param = new PageData();
		param=this.getPageData();
		/*
		System.out.println(param.getString("POLICY_ID"));
		
		PageData pd=policyService.findById(param);
		
		if (pd==null){
			mv.setViewName("error");
			return mv;
		}*/
		List<PageData>	varListPN = new ArrayList<PageData>();
		varListPN = policyService.findByCardId(param);
		if(varListPN.size() != 1){
			mv.setViewName("error");
			return mv;
		}
		PageData pd = varListPN.get(0);
		//System.out.println("policyno"+pd.getString("POLICYNO"));
		if (pd.getString("POLICYNO")==null){
			mv.addObject("display","none");
		}else{
			mv.addObject("display", "block");
		}
		
		
		//生成电子签章。
		
		mv.addObject("CardNo", pd.getString("CARDNO"));
		mv.addObject("Name", pd.getString("IANTNAME"));
		mv.addObject("PaperNo", pd.getString("IANTPAPERNO"));
		mv.addObject("IantPhone", pd.getString("IERPHONE"));
		mv.addObject("SvrName", pd.getString("SVRNAME"));
		mv.addObject("SvrPhone", pd.getString("SVRPHONE"));
		mv.addObject("CreateTime", pd.getString("CREATED"));
		mv.addObject("PolicyNo", pd.getString("POLICYNO"));
		mv.addObject("DataLine", pd.getString("INVALID"));
	
		mv.setViewName("ins/policy/detail");
		return mv;
	}
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/fg/save")
	public ModelAndView save() throws Exception{
		//logBefore(logger, Jurisdiction.getUsername()+"新增Policy");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		System.out.println("policy/save:"+pd);
		
		//获取用户登录session
		PageData pdSession = UserManageController.GetUserData();
		
		if(null != pdSession){
			pd.put("USERID", pdSession.getString("USERMANAGE_ID"));
		}
		
		String uuId=this.get32UUID();
		
		pd.put("POLICY_ID", uuId);	//主键
		
		pd.put("CREATED", DateUtil.getTime());
		pd.put("INVALID", DateUtil.getAfterDayDate("365"));
		
		
		//默认是身份证
		pd.put("IERPAPERTYPE", 1);
		policyService.save(pd);
		
		PageData cardpd = new PageData();
		//1：正常，2卡状态已经激活,无法再激活 3：卡类型有问题
		cardpd.put("STATE", 2);
		cardpd.put("CARDID",pd.getString("CARDNO"));

		cardinfoService.updatestate(cardpd);
		
		

		//生成电子签章。
		
		mv.addObject("CardNo", pd.getString("CARDNO"));
		mv.addObject("Name", pd.getString("IANTNAME"));
		mv.addObject("PaperNo", pd.getString("IANTPAPERNO"));
		mv.addObject("IantPhone", pd.getString("IERPHONE"));
		mv.addObject("SvrName", pd.getString("SVRNAME"));
		mv.addObject("SvrPhone", pd.getString("SVRPHONE"));
		mv.addObject("CreateTime", pd.getString("CREATED"));
		mv.addObject("PolicyNo", pd.getString("POLICYNO"));
		mv.addObject("DataLine", pd.getString("INVALID"));
		
		if (pd.getString("POLICYNO")==null){
			mv.addObject("display","none");
		}else{
			mv.addObject("display", "block");
		}
		
	
		mv.setViewName("ins/policy/detail");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Policy");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		policyService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Policy");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		policyService.edit(pd);
		mv.addObject("msg","success");
		
		//mv.setViewName("ins/policy/policy_edit");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Policy");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = policyService.list(page);	//列出Policy列表
		mv.setViewName("ins/policy/policy_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		//UserManageController.SetQX(mv);
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
		mv.setViewName("ins/policy/policy_edit");
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
		pd = policyService.findById(pd);	//根据ID读取
		mv.setViewName("ins/policy/policy_edit");
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
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "卡单录入模板.xls", "卡单录入模板.xls");
	}
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Policy");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			policyService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	@RequestMapping(value="goreadExcel")
	public ModelAndView goreadExcel() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> varList=businessService.listAll(pd);
		mv.setViewName("ins/policy/readExcel");
		mv.addObject("msg", "readExcel");
		mv.addObject("varList",varList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**导入
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/readExcel")
	public ModelAndView readExcel(
			@RequestParam(value="policyexcel",required=false) MultipartFile file,@RequestParam(value="policy_type") String policy_type
			) throws Exception{	
		ModelAndView mv = this.getModelAndView();
		System.out.println(file);
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;}
		String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;								//文件上传路径
		String fileName =  FileUpload.fileUp(file, filePath, "policyexcel");							//执行上传
			
		List<PageData> listPd = (List)ObjectExcelRead.readExcel(filePath,fileName, 2, 0, 0);	//执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
		/**
		* var0 :CARDNO:服务卡号
	    * var1 :IERPHONE:投保人手机号
		* var2 :IANTNAME:被保险人姓名
		* var3 :IANTPAPERNO:被保险人证件号码
		* var4 :SVRNAME:服务人员姓名
		* var5 :SVRPHONE：服务人员手机号码
		* var6 :CREATED:投保时间
		* var7 :POLICYNO:保单号
		*/			
		for(int i=0;i<listPd.size();i++){
			PageData pageData= new PageData();
			pageData.put("CARDNO", listPd.get(i).getString("var0"));	//1
			List<PageData>	varListPN = new ArrayList<PageData>();
			varListPN = policyService.findByCardId(pageData);
			if(varListPN.size() != 0){
				mv.addObject("msg","该卡号:"+listPd.get(i).getString("var0")+"已投保!");
				mv.setViewName("save_result");
				return mv;
			}

			pageData.put("IERPHONE", listPd.get(i).getString("var1"));	//2
			pageData.put("IANTNAME", listPd.get(i).getString("var2"));	//3
			pageData.put("IANTPAPERNO", listPd.get(i).getString("var3"));	//4				
			pageData.put("SVRNAME", listPd.get(i).getString("var4"));	//5
			pageData.put("SVRPHONE", listPd.get(i).getString("var5"));	//6
			pageData.put("CREATED", listPd.get(i).get("var6").toString());	//7
			pageData.put("POLICYNO", listPd.get(i).getString("var7"));	//8
				
			pageData.put("IERPAPERTYPE", "1");
			pageData.put("BUSINESSID", policy_type);
			pageData.put("POLICY_ID", this.get32UUID());	//主键
				
			policyService.save(pageData);
		}
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
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Policy到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("保单号");	//1
		titles.add("服务卡号");	//2
		titles.add("投保人姓名");	//3
		titles.add("保险类型");	//4
		titles.add("投保人证件号码");	//6
		titles.add("投保人手机号");	//7
		titles.add("被保险人姓名");	//8
		titles.add("被保险人证件号码");	//9
		titles.add("被保险人职业");	//10
		titles.add("与被保险人关系");	//11
		titles.add("受益人姓名");	//13
		titles.add("受益人证件号码");	//14
		titles.add("服务人员姓名");	//15
		titles.add("服务人员手机号码");	//16
		titles.add("是否发送短信");	//17
		titles.add("是否已经生成保单号");	//18
		titles.add("投保时间");	//19
		titles.add("保单生效时间");	//20
		titles.add("保单时效时间");	//21
		//
		dataMap.put("titles", titles);
		List<PageData> varOList = policyService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("POLICYNO"));	//1
			vpd.put("var2", varOList.get(i).getString("CARDNO"));	//2
			vpd.put("var3", varOList.get(i).getString("IERNAME"));	//3
			vpd.put("var4", varOList.get(i).getString("BUSINESSID"));	//4
			vpd.put("var5", varOList.get(i).getString("IERPAPERNO"));	//6
			vpd.put("var6", varOList.get(i).getString("IERPHONE"));	//7
			vpd.put("var7", varOList.get(i).getString("IANTNAME"));	//8
			vpd.put("var8", varOList.get(i).getString("IANTPAPERNO"));	//9
			vpd.put("var9", varOList.get(i).getString("IANTPROFESSION"));	//10
			vpd.put("var10", varOList.get(i).getString("IANTRELATION"));	//11
			vpd.put("var11", varOList.get(i).getString("BENNAME"));	//13
			vpd.put("var12", varOList.get(i).getString("BENPAPERNO"));	//14
			vpd.put("var13", varOList.get(i).getString("SVRNAME"));	//15
			vpd.put("var14", varOList.get(i).getString("SVRPHONE"));	//16
			vpd.put("var15", varOList.get(i).getString("ISSENDMESSAGE"));	//17
			vpd.put("var16", varOList.get(i).getString("ISHASPOLICYNO"));	//18
			vpd.put("var17", varOList.get(i).getString("CREATED"));	//19
			vpd.put("var18", varOList.get(i).getString("UPDATED"));	//20
			vpd.put("var19", varOList.get(i).getString("INVALID"));	//21
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	/**保单激活率查询
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/rankinglist")
	public ModelAndView ranking(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Policy");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		//System.out.println("POLICY_ID ############# 00");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd=this.getPageData();
		
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		
		//System.out.println("POLICY_ID ############# 11");
		List<PageData>	varList=policyService.getRankingList(page);
		//System.out.println("POLICY_ID ############# 220 :"+ varList);
		mv.setViewName("ins/policy/policy_rankinglist");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		//System.out.println("POLICY_ID ############# 22");
		
		//System.out.println("policyno"+pd.getString("POLICYNO"));
		//if (pd.getString("POLICYNO")==null){
		//	mv.addObject("display","none");
		//}else{
		//	mv.addObject("display", "block");
		return mv;
		}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
