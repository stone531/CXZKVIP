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
import com.fh.service.ins.policy.PolicyManager;
import com.fh.service.ins.cardinfo.CardInfoManager;

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
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/index")
	public ModelAndView index() throws Exception{
		
		//*************************************************************************************************************************************************
		System.out.println("index");
		ModelAndView mv = this.getModelAndView();
		mv.addObject("action","cardinfo/verifycard");
		mv.setViewName("ins/policy/verifycard");
		mv.addObject("display", "none");
		return mv;
	}
	
	/**保单详情页
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/detail")
	public ModelAndView detail() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData param = new PageData();
		param=this.getPageData();
		
		System.out.println(param.getString("POLICY_ID"));
		
		PageData pd=policyService.findById(param);
		
		if (pd==null){
			mv.setViewName("error");
			return mv;
		}
		
		if (pd.getString("POLICYNO")==null){
			mv.addObject("display","none");
		}else{
			mv.addObject("display", "block");
		}
		
		
		//生成电子签章。
		
		mv.addObject("CardNo", pd.getString("CARDNO"));
		mv.addObject("CardType", pd.get("CARDTYPE").toString());
		mv.addObject("Name", pd.getString("IANTNAME"));
		mv.addObject("PaperNo", pd.getString("IANTPAPERNO"));
		mv.addObject("IantPhone", pd.getString("IERPHONE"));
		mv.addObject("SvrName", pd.getString("SVRNAME"));
		mv.addObject("SvrPhone", pd.getString("SVRPHONE"));
		mv.addObject("CreateTime", "2016-16-10");
		mv.addObject("PolicyNo", pd.getString("POLICYNO"));
		mv.addObject("DataLine", pd.getString("2016-16-11"));
	
		mv.setViewName("ins/policy/detail");
		return mv;
	}
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Policy");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		System.out.println("policy/save:"+pd);
		
		String uuId=this.get32UUID();
		
		pd.put("POLICY_ID", uuId);	//主键
		pd.put("CARDTYPE",1);
		pd.put("IERPAPERTYPE", 1);
		policyService.save(pd);
		
		PageData cardpd = new PageData();
		cardpd.put("STATE", 2);
		cardpd.put("CARDID",pd.getString("CARDNO"));

		cardinfoService.updatestate(cardpd);
		
		

		//生成电子签章。
		
		mv.addObject("CardNo", pd.getString("CARDNO"));
		mv.addObject("CardType", pd.get("CARDTYPE").toString());
		mv.addObject("Name", pd.getString("IANTNAME"));
		mv.addObject("PaperNo", pd.getString("IANTPAPERNO"));
		mv.addObject("IantPhone", pd.getString("IERPHONE"));
		mv.addObject("SvrName", pd.getString("SVRNAME"));
		mv.addObject("SvrPhone", pd.getString("SVRPHONE"));
		mv.addObject("CreateTime", "2016-16-10");
		mv.addObject("PolicyNo", pd.getString("POLICYNO"));
		mv.addObject("DataLine", pd.getString("2016-16-11"));
	
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
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
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
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		policyService.edit(pd);
		mv.addObject("msg","success");
		
		mv.setViewName("ins/policy/policy_edit");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Policy");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
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
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Policy");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
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
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Policy到excel");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("保单号");	//1
		titles.add("服务卡号");	//2
		titles.add("服务卡类型");	//3
		titles.add("投保人姓名");	//4
		titles.add("投保人证件类型");	//5
		titles.add("投保人证件号码");	//6
		titles.add("投保人手机号");	//7
		titles.add("被保险人姓名");	//8
		titles.add("被保险人证件号码");	//9
		titles.add("被保险人职业");	//10
		titles.add("与被保险人关系");	//11
		titles.add("被保险人年龄");	//12
		titles.add("受益人姓名");	//13
		titles.add("受益人证件号码");	//14
		titles.add("服务人员姓名");	//15
		titles.add("服务人员手机号码");	//16
		titles.add("是否发生短信");	//17
		titles.add("是否已经生成保单号");	//18
		titles.add("投保时间");	//19
		titles.add("保单生效时间");	//20
		titles.add("保单时效时间");	//21
		dataMap.put("titles", titles);
		List<PageData> varOList = policyService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("POLICYNO"));	//1
			vpd.put("var2", varOList.get(i).getString("CARDNO"));	//2
			vpd.put("var3", varOList.get(i).get("CARDTYPE").toString());	//3
			vpd.put("var4", varOList.get(i).getString("IERNAME"));	//4
			vpd.put("var5", varOList.get(i).get("IERPAPERTYPE").toString());	//5
			vpd.put("var6", varOList.get(i).getString("IERPAPERNO"));	//6
			vpd.put("var7", varOList.get(i).getString("IERPHONE"));	//7
			vpd.put("var8", varOList.get(i).getString("IANTNAME"));	//8
			vpd.put("var9", varOList.get(i).getString("IANTPAPERNO"));	//9
			vpd.put("var10", varOList.get(i).getString("IANTPROFESSION"));	//10
			vpd.put("var11", varOList.get(i).getString("IANTRELATION"));	//11
			vpd.put("var12", varOList.get(i).get("IANAGE").toString());	//12
			vpd.put("var13", varOList.get(i).getString("BENNAME"));	//13
			vpd.put("var14", varOList.get(i).getString("BENPAPERNO"));	//14
			vpd.put("var15", varOList.get(i).getString("SVRNAME"));	//15
			vpd.put("var16", varOList.get(i).getString("SVRPHONE"));	//16
			vpd.put("var17", varOList.get(i).getString("ISSENDMESSAGE"));	//17
			vpd.put("var18", varOList.get(i).getString("ISHASPOLICYNO"));	//18
			vpd.put("var19", varOList.get(i).getString("CREATED"));	//19
			vpd.put("var20", varOList.get(i).getString("UPDATED"));	//20
			vpd.put("var21", varOList.get(i).getString("INVALID"));	//21
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
