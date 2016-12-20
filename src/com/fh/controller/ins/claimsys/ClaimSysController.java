package com.fh.controller.ins.claimsys;

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
import com.fh.service.ins.claimsys.ClaimSysManager;
import com.fh.util.DateUtil;
import net.sf.json.JSONObject;

import com.fh.service.ins.policy.PolicyManager;
import com.fh.service.ins.cardinfo.CardInfoManager;
import com.fh.service.ins.claimcompany.ClaimCompanyManager;

/** 
 * 说明：ICS
 * 创建人：FH Q313596790
 * 创建时间：2016-09-24
 */
@Controller
@RequestMapping(value="/claimsys")
public class ClaimSysController extends BaseController {
	
	String menuUrl = "claimsys/list.do"; //菜单地址(权限用)
	@Resource(name="claimsysService")
	private ClaimSysManager claimsysService;
	@Resource(name="policyService")
	private PolicyManager policyService;
	@Resource(name="cardinfoService")
	private CardInfoManager cardinfoService;
	@Resource(name="claimcompanyService")
	private ClaimCompanyManager claimcompanyService;
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增ClaimSys");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CLAIMSYS_ID", this.get32UUID());	//主键
		//判断此保单号是否存在，外界提供接口
		pd.put("CLAIMSSTATES", 0);
		pd.put("LASTUPDATE", DateUtil.getTime());
		pd.put("ISREMIND", "0");
		PageData pdRet = new PageData();

		//很据保单号查询是否已经报案
		if(null == claimsysService.findByPolicyNo(pd)){
			claimsysService.save(pd); 					//执行保存
			//查询保险公司电话
			pdRet.put("COMPANY_NAME", "中国平安");
			pdRet = claimcompanyService.findByName(pdRet);
			pdRet.put("IsSuccess", true);
		}else{
			pdRet.put("IsSuccess", false);
		}
		JSONObject js = JSONObject.fromObject(pdRet);
		out.write(js.toString());
		out.close();

		//mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**判断是否已经理赔
	 * @return
	 */
	@RequestMapping(value="/hasPolicyNo")
	@ResponseBody
	public Object hasPolicyNo(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(claimsysService.findByPolicyNo(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除ClaimSys");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		claimsysService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改ClaimSys");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("LASTUPDATE",DateUtil.getTime());
		pd.put("ISREMIND", "0");
		claimsysService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表ClaimSys");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		
		PageData pdNew = new PageData();
		pdNew.put("ISREMIND", "1");
		claimsysService.updateSetRemind(pdNew);
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		
		List<PageData>	varList = claimsysService.list(page);	//列出ClaimSys列表
		mv.setViewName("ins/claimsys/claimsys_list");
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
		
		mv.setViewName("ins/claimsys/lipei");
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
		pd = claimsysService.findById(pd);	//根据ID读取

		List<PageData>	varList = claimsysService.listStates(pd);	//列出ClaimSys列表
	
		mv.setViewName("ins/claimsys/claimsys_edit");
		mv.addObject("msg", "edit");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**显示理赔进度
	 * @param
	 * @throws Exception
	 */
	/*
	@RequestMapping(value="/searchState")
	public ModelAndView searchState() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"查询ClaimSys");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		System.out.println("-----------------------1111");
		String policyNo = pd.getString("POLICYNO");
		System.out.println(policyNo);
		String CLAIMSSTATES = pd.getString("CLAIMSSTATES");
		System.out.println(CLAIMSSTATES);
		//根据卡号、密码获取保单号 我ia界提供接口
		//String cardNo = pd.getString("CARDNO");	
		//String cardPasswd = pd.getString("CARDPASSWD");	
		//String policyNo="11111";
					
		//pd.put("POLICYNO", policyNo);
		
		pd = claimsysService.findStateByPolicyNo(pd);	//根据ID读取
		String CLAIMSSTATES1 = pd.getString("CLAIMSSTATES");
		System.out.println(CLAIMSSTATES1);
		//pd.put("POLICYNO", "9999999");
		//pd.put("CLAIMSSTATES", "1111111111111");
		//System.out.println("-------------=="+pd.getString("POLICYNO"));
		mv.setViewName("ins/claimsys/search");
		//mv.addObject("msg", "searchState");
		mv.addObject("pd", pd);
		mv.addObject("msg", "success");
		
		return mv;
	}*/
	
	/**搜索
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/search")
	public ModelAndView search()throws Exception{
		ModelAndView mv = this.getModelAndView();		
		//查询卡号密码
		PageData pdmysql = new PageData();
		PageData pd = new PageData();
		pd = this.getPageData();
		String srcId =pd.getString("CARDID");
		String srcPW =pd.getString("PASSWORD");
		
		int result = 0;
		
		if(pd.getString("searchtype").equals("1")){
			//卡号查询
			pdmysql=cardinfoService.findByCardId(pd);
			if(null == pdmysql){
				result = 1;  //未查到card信息
			}else{
				//get username and password from mysql
				String desId =pdmysql.getString("CARDID");				
				String desPW = pdmysql.getString("PASSWORD");
				if(!srcId.equals(desId) || !srcPW.equals(desPW)){
					result = 2;//卡号密码不正确
				}
			}
		}			
		
		if (0 == result){
			PageData param = new PageData();
			List<PageData>	varListPN = policyService.findByCardId(param);
			if(pd.getString("searchtype").equals("1")){
				//卡号查询
				param.put("CARDNO",pd.getString("CARDID"));
				varListPN = policyService.findByCardId(param);
			}else{
				//身份证查询
				param.put("IANTPAPERNO",pd.getString("IANTPAPERNO"));
				varListPN = policyService.findByPaperNo(param);
			}
			if(varListPN.size() == 0){
				result = 3;//该卡还没有投保
			}else{
				List<PageData> varList = new ArrayList<PageData>();
				for(int i=0;i<varListPN.size();i++){
					PageData pdIn = new PageData();
					pdIn.put("POLICYNO", varListPN.get(i).getString("POLICY_ID"));
					PageData pdOut = claimsysService.findStateByPolicyNo(pdIn);	//列出ClaimSys列表
					if(pdOut != null){
						pdOut.put("IsOrNo", "1");
						varList.add(pdOut);
					}else{
						pdIn.put("IsOrNo", "0");
						varList.add(pdIn);
					}			
				}				
				mv.addObject("varList", varList);
			}			
		}
		mv.addObject("pd",pd);
		mv.addObject("result", result);
		mv.addObject("msg", "search");
		mv.setViewName("ins/claimsys/search");
		return mv;
	}
	
	/**去搜索页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goSearch")
	public ModelAndView goSearch()throws Exception{	
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("searchtype", "1");
		//mv.setViewName("ins/claimsys/myclaim");
		mv.setViewName("ins/claimsys/search");
		mv.addObject("msg", "search");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除ClaimSys");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			claimsysService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**增加快递单号
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/addCourier")
	public void addCourier(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改ClaimSys");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return;} //校验权限

		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("POLICYNO", pd.getString("POLICYNO1"));
		PageData pdRet = new PageData();		
		
		//很据保单号查询是否已经报案
		if(null == claimsysService.findByPolicyNo(pd)){
			pdRet.put("IsSuccess", false);
		}else{
			claimsysService.addCourierNo(pd);
			pdRet.put("IsSuccess", true);
		}
		JSONObject js = JSONObject.fromObject(pdRet);
		out.write(js.toString());
		out.close();
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出ClaimSys到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("保单号");	//1
		titles.add("报案人");	//2
		titles.add("与被保人关系");	//3
		titles.add("电子邮箱");	//4
		titles.add("报险人电话");	//5
		titles.add("出险时间");	//6
		titles.add("出险地点");	//7
		titles.add("出险人");	//8
		titles.add("出险人电话");	//9
		titles.add("出险经过");	//10
		titles.add("理赔状态");	//11
		titles.add("是否提醒");	//12
		dataMap.put("titles", titles);
		List<PageData> varOList = claimsysService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("POLICYNO"));	//1
			vpd.put("var2", varOList.get(i).getString("INFORNAME"));	//2
			vpd.put("var3", varOList.get(i).getString("RELATION"));	//3
			vpd.put("var4", varOList.get(i).getString("EMAIL"));	//4
			vpd.put("var5", varOList.get(i).getString("CLAIMERTEL"));	//5
			vpd.put("var6", varOList.get(i).getString("OCCURTIME"));	//6
			vpd.put("var7", varOList.get(i).getString("OCCURPLACE"));	//7
			vpd.put("var8", varOList.get(i).getString("POLICYNAME"));	//8
			vpd.put("var9", varOList.get(i).getString("POLICERTEL"));	//9
			vpd.put("var10", varOList.get(i).getString("POLICEACCIDENT"));	//10
			vpd.put("var11", varOList.get(i).getString("CLAIMSSTATES"));	//11
			vpd.put("var12", varOList.get(i).get("ISREMIND").toString());	//12
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
