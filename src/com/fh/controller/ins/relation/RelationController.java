package com.fh.controller.ins.relation;

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
import com.fh.service.ins.business.BusinessManager;
import com.fh.service.ins.cardtype.CardTypeManager;
import com.fh.service.ins.relation.RelationManager;
import com.fh.controller.ins.usermanage.UserManageController;

/** 
 * 说明：卡类型与保险业务关系
 * 创建人：FH Q313596790
 * 创建时间：2016-10-26
 */
@Controller
@RequestMapping(value="/relation")
public class RelationController extends BaseController {
	
	String menuUrl = "relation/list.do"; //菜单地址(权限用)
	@Resource(name="relationService")
	private RelationManager relationService;
	
	@Resource(name="businessService")
	private BusinessManager businessService;
	@Resource(name="cardtypeService")
	private CardTypeManager cardtypeService;
	
	Map<String, String> cardTypeMap = new HashMap<String, String>();
	Map<String,String> businessMap = new HashMap<String, String>();
	
	
	// get name from cache
	public String getCartTypeName(String key) throws Exception{
		System.out.println("getCartTypeName param key:"+key);
		
		if(cardTypeMap.containsKey(key)){
			System.out.println("getCartTypeName from cache:"+cardTypeMap.get(key).toString());
			return cardTypeMap.get(key).toString();
		}
		
		PageData pdIn = new PageData();
		PageData pdOut = new PageData();
		
		pdIn.put("CARDTYPE_ID", key);
		pdOut=cardtypeService.findById(pdIn);
		if (pdOut==null){
			return "";
		}
		String name=pdOut.getString("NAME");
		cardTypeMap.put(key, name);
		System.out.println("getCartTypeName from mysql:"+name);
		
		return name;		
	}
	public String getBusinessName(String key) throws Exception{
		System.out.println("getBusinessName param key:"+key);
		
		if( businessMap.containsKey(key)){
			System.out.println("getBusinessName from cache:"+businessMap.get(key).toString());
			return businessMap.get(key).toString();
		}
		PageData pdIn = new PageData();
		PageData pdOut = new PageData();
	
		pdIn.put("BUSINESS_ID", key);
		pdOut=businessService.findById(pdIn);
		if (pdOut==null){
			return "";
		}
		String name=pdOut.getString("NAME");
		businessMap.put(key, name);
		System.out.println("getBusinessName from mysql:"+name);
		
		return name;
	}
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Relation");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		System.out.println("save BUSINESSID:"+pd.getString("BUSINESSID"));
		System.out.println("save CARDTYPE:"+pd.getString("CARDTYPE"));
		
		pd.put("RELATION_ID", this.get32UUID());	//主键
		relationService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Relation");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		relationService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Relation");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		relationService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Relation");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = relationService.list(page);	//列出Relation列表
		for(int i=0;i<varList.size();i++){
			PageData vpd = varList.get(i);
			vpd.put("CARDTYPE", getCartTypeName(vpd.getString("CARDTYPE")));	//1
			vpd.put("BUSINESSID", getBusinessName(vpd.getString("BUSINESSID")));	//2
		}		
		
		
		
		mv.setViewName("ins/relation/relation_list");
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

		List<PageData> varListC=cardtypeService.listAll(pd);
		mv.addObject("varListC", varListC);
		System.out.println(varListC);
		
		//relationService.edit(pd);
		
		List<PageData> varListB=businessService.listAll(pd);
		mv.addObject("varListB", varListB);
		System.out.println(varListB);
		
		mv.setViewName("ins/relation/relation_edit");
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
		pd = relationService.findById(pd);	//根据ID读取
		
		//System.out.println("111111111111111111111111");

		System.out.println("get card type:"+pd.get("CARDTYPE").toString());
				
		List<PageData> varListC=cardtypeService.listAll(pd);
		mv.addObject("varListC", varListC);
		System.out.println(varListC);
		
		//relationService.edit(pd);
		
		List<PageData> varListB=businessService.listAll(pd);
		mv.addObject("varListB", varListB);
		System.out.println(varListB);
		
		//relationService.edit(pd);

		//System.out.println("111111111111111111111111");
		
		
		mv.setViewName("ins/relation/relation_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Relation");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			relationService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Relation到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("卡类型");	//1
		titles.add("业务id");	//2
		dataMap.put("titles", titles);
		List<PageData> varOList = relationService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("CARDTYPE"));	//1
			vpd.put("var2", varOList.get(i).getString("BUSINESSID"));	//2
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
