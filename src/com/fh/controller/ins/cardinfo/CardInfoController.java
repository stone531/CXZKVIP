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

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.service.ins.cardinfo.CardInfoManager;
import com.fh.service.ins.relation.RelationManager;
import com.fh.service.ins.business.BusinessManager;

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
	
	
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/verifycard")
	public ModelAndView verifycard() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改CardInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		
		//sql for cardinfo
		PageData pd = new PageData();
		PageData pdmysql = new PageData();
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
		
		if (!cardstate.equals("1")){
			//do something
			System.out.println("card state is Unavailable");
			mv.addObject("msg","此服务卡无效");
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
		System.out.println("*******************card state is Unavailable****************");
		
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
			
			System.out.println(businesslist.size());
			
			mv.addObject("varList", businesslist);
			mv.addObject("businesslistSize", businesslist.size());
					
			String str="aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\n"
					+ "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\n"
					+ "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\n"
					+ "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
					+ "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
					+ "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
					+ "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
					+ "aaaaaaaaaaaaaaaaaaaa"
					+ "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
					+ "aaaaaaaaaaaaaa";
			mv.addObject("servicetext",str);
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
		logBefore(logger, Jurisdiction.getUsername()+"新增CardInfo");
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
