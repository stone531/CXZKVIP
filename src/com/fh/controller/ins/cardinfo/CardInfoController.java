package com.fh.controller.ins.cardinfo;

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
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.PathUtil;
import com.fh.service.ins.cardinfo.CardInfoManager;
import com.fh.service.ins.cardtype.CardTypeManager;
import com.fh.service.ins.relation.RelationManager;
import com.fh.service.ins.business.BusinessManager;
import com.fh.controller.ins.usermanage.UserManageController;

/** 
 * 说明：服务卡
 * 创建人：FH Q313596790
 * 创建时间：2016-10-26
 */
@Controller
@RequestMapping(value="/cardinfo")
public class CardInfoController extends BaseController {
	
	
	String menuUrl = "cardinfo/list.do"; //菜单地址(权限用)
	//卡信息服务
	@Resource(name="cardinfoService")
	private CardInfoManager cardinfoService;
	
	//卡类型与业务的关系服务
	@Resource(name="relationService")
	private RelationManager relationService;
	
	
	//业务服务
	@Resource(name="businessService")
	private BusinessManager businessService;
	//卡类型
	@Resource(name="cardtypeService")
	private CardTypeManager cardtypeservice;
	
	
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/fg/verifycard")
	public ModelAndView verifycard() throws Exception{
		//logBefore(logger, Jurisdiction.getUsername()+"修改CardInfo");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		
		//sql for cardinfo
		PageData pd = new PageData();
		PageData pdmysql = new PageData();
		PageData pdcardtype = new PageData();
		
		pd = this.getPageData();
		
		System.out.println(pd);

		pdmysql=cardinfoService.findByCardId(pd);
		
		if (pdmysql==null){
			mv.addObject("msg","卡号不存在");
			mv.addObject("display", "block");
			mv.setViewName("ins/policy/verifycard");
			return mv;
		}
		
		String cardstate = pdmysql.get("STATE").toString();
		//step 1: check state , get ServiceContext
		
		if (cardstate.equals("3")){
			//do something
			System.out.println("card state is Unavailable");
			mv.addObject("msg","此服务卡无效");
			mv.addObject("display", "block");
			mv.setViewName("ins/policy/verifycard");
			return mv;
		}else if(cardstate.equals("2")){
			System.out.println("card state is Unavailable");
			mv.addObject("msg","此卡已经被激活");
			mv.addObject("display", "block");
			mv.setViewName("ins/policy/verifycard");
			return mv;
		}else if(!cardstate.equals("1")){
			System.out.println("card state is Unavailable");
			mv.addObject("msg","未知的卡错误");
			mv.addObject("display", "block");
			mv.setViewName("ins/policy/verifycard");
			return mv;			
		}	
		
		//get username and password from web
		String srcId = pd.getString("CARDID");	
		String srcpw = pd.getString("PASSWORD");
		
		//get username and password from mysql
		String desId =pdmysql.getString("CARDID");
		String despw = pdmysql.getString("PASSWORD");
		


		//String ServiceText=GetServiceTextByType(type)
		//mv.addObject("Service",ServiceText)
		
		System.out.println(srcId+","+srcpw+","+desId+","+despw);
		
		//step 2: check username and password
		if (srcId.equals(desId) && srcpw.equals(despw)){
			
			String typeid = pdmysql.get("TYPEID").toString();
			System.out.println("typeid:"+typeid);
			
			mv.addObject("cardno", desId);
			mv.addObject("cardtype", typeid);
			
			
			//stet 3: get relation info
			
			//query business id from relation;
			PageData relationPd = new PageData();
			relationPd .put("CARDTYPE", typeid);
			List<PageData>	varList=relationService.findByTypeId(relationPd);
			
			if (varList==null) {
				System.out.println("varList is null");
				return mv;
			}
			
			System.out.println(varList);
			
			//sql for business
			
			List<PageData> businesslist = new ArrayList<PageData>();

			for (int i=0;i< varList.size();i++){
				//System.out.println("BUSINESSID:"+varList.get(i));
				PageData business = new PageData();
				//PageData businessSql = new PageData();
				
				business.put("BUSINESS_ID", varList.get(i).getString("BUSINESSID"));
				
				business=businessService.findById(business);
				if (business!=null){
					System.out.println("bussiness:"+business);
				}
				String state=business.get("STATE").toString();
				if (state.equals("1")) {
					businesslist.add(business);
				}
			}
			
			pd.put("CARDTYPE_ID", typeid);
			pdcardtype=cardtypeservice.findById(pd);
			if (pdcardtype==null){
				mv.addObject("msg","获取卡类型异常，请联系管理员");
				mv.addObject("display", "block");
				mv.setViewName("ins/policy/verifycard");
				return mv;
			}
			
			mv.addObject("minage", pdcardtype.get("MINAGE").toString());
			mv.addObject("maxage", pdcardtype.get("MAXAGE").toString());
			
			String limitamount=pdcardtype.get("LIMITAMOUNT").toString();
			String amount=pdcardtype.get("AMOUNT").toString();
			int copy=Integer.valueOf(limitamount).intValue()/Integer.valueOf(amount).intValue();			
			mv.addObject("copies", copy);
		
			
			//parse professions
			String profession="";
			String[] professions=pdcardtype.getString("PROFESSION").split(";");
			for(int i=0;i<professions.length;i++){
				
				String mate="";
				if (i==0){
					mate="[\""+professions[i]+"\""+",";
				}else if(i==professions.length-1){
					mate="\""+professions[i]+"\"]";
				}else {
					mate="\""+professions[i]+"\",";
				}
				
				System.out.println(mate);
				
				profession+=mate;
				
			}
			System.out.println(profession);
			mv.addObject("PROFESSIONS", profession);
			
			System.out.println(businesslist.size());
			
			mv.addObject("varList", businesslist);
			mv.addObject("businesslistSize", businesslist.size());

			mv.addObject("action", "save");
			mv.setViewName("ins/policy/policy");
		}else {
			mv.addObject("msg","用户名或者密码错误");
			mv.addObject("display", "block");
			mv.setViewName("ins/policy/verifycard");

		}
		
		
		//mv.setViewName("ins/cardinfo/cardinfo_edit");	
		return mv;
	}
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		//logBefore(logger, Jurisdiction.getUsername()+"新增CardInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CARDINFO_ID", this.get32UUID());	//主键
		cardinfoService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除CardInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		cardinfoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改CardInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		cardinfoService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表CardInfo");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = cardinfoService.list(page);	//列出CardInfo列表
		mv.setViewName("ins/cardinfo/cardinfo_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		UserManageController.SetQX(mv);
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
		mv.setViewName("ins/cardinfo/cardinfo_edit");
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
		pd = cardinfoService.findById(pd);	//根据ID读取
		mv.setViewName("ins/cardinfo/cardinfo_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除CardInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			cardinfoService.deleteAll(ArrayDATA_IDS);
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
		List<PageData> varList=cardtypeservice.listAll(pd);
		mv.setViewName("ins/cardinfo/readExcel");
		mv.addObject("msg", "readExcel");
		mv.addObject("varList",varList);
		mv.addObject("pd", pd);
		return mv;
	}
	/**导入修改数据库字段
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/readExcel")
	public ModelAndView readExcel(
			@RequestParam(value="cardexcel",required=false) MultipartFile file,@RequestParam(value="card_type") String card_type
			) throws Exception{
		ModelAndView mv = this.getModelAndView();
		System.out.println(file);
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;}
			String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;								//文件上传路径
			String fileName =  FileUpload.fileUp(file, filePath, "cardexcel");	//执行上传
			PageData pd=this.getPageData();
			
			List<PageData> listPd = (List)ObjectExcelRead.readExcel(filePath,fileName, 2, 0, 0);	//执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
			/**
			 * var0 :CARDID:卡号
			 * var1 :EXPIRYTIME：有效时间
			 * var2 :POLICYNO：保单号
			 * var3:IANTNAME:被投保人姓名或者投保人姓名
			 * var4:IANTPAPERNO:被保险人身份证号
			 * var5:IANTPHONE：投保电话
			 * var6:PASSWORD：密码
			 * 
			 */
			for(int i=0;i<listPd.size();i++){
				PageData pageData= new PageData();
				pageData.put("CARDID", listPd.get(i).getString("var0"));
	
				if(cardinfoService.findByCardId(pageData) != null){
					
					mv.addObject("msg","卡号不能重复");
					mv.setViewName("save_result");
					return mv;
				}
				//PageData pageData= new PageData();
				//pageData.put("CARDID", listPd.get(i).getString("var0"));	//1
				
				pageData.put("EXPIRYTIME", listPd.get(i).get("var1").toString());	//2
				pageData.put("POLICYNO", listPd.get(i).get("var2").toString());	//3
				pageData.put("IANTNAME", listPd.get(i).get("var3").toString());	//4
				if(isNumeric(listPd.get(i).get("var4").toString())){
				pageData.put("IANTPAPERNO", listPd.get(i).get("var4").toString());	//5
				}
				pageData.put("IANTPHONE", listPd.get(i).getString("var5"));	//6
				pageData.put("PASSWORD", listPd.get(i).getString("var6"));	//6
				pageData.put("STATE", "1");
				pageData.put("TYPEID", card_type);
				pageData.put("CARDINFO_ID", this.get32UUID());
				
				cardinfoService.save(pageData);
				}
			
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
	/**下载模版
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/downExcel")
	public void downExcel(HttpServletResponse response)throws Exception{
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "卡录入模板.xls", "卡录入模板.xls");
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出CardInfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("服务卡号");	//1
		titles.add("卡的状态");	//2
		titles.add("卡类型");	//3
		titles.add("有效日期");	//4
		titles.add("保单号");	//5
		titles.add("被保险人姓名");	//6
		titles.add("被保险人身份证号");	//7
		titles.add("被保险人手机号");	//8
		titles.add("密码");	//9
		dataMap.put("titles", titles);
		List<PageData> varOList = cardinfoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("CARDID"));	//1
			vpd.put("var2", varOList.get(i).get("STATE").toString());	//2
			vpd.put("var3", varOList.get(i).getString("TYPEID"));	//3
			vpd.put("var4", varOList.get(i).getString("EXPIRYTIME"));	//4
			vpd.put("var5", varOList.get(i).getString("POLICYNO"));	//5
			vpd.put("var6", varOList.get(i).getString("IANTNAME"));	//6
			vpd.put("var7", varOList.get(i).getString("IANTPAPERNO"));	//7
			vpd.put("var8", varOList.get(i).getString("IANTPHONE"));	//8
			vpd.put("var9", varOList.get(i).getString("PASSWORD"));	//9
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
