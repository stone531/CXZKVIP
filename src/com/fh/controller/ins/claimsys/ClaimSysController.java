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
		//System.out.println(pd.toString());
		//判断此保单号是否存在，外界提供接口
		pd.put("CLAIMSSTATES", 0);
		//String occurtime = pd.getString("OCCURTIME");
		pd.put("LASTUPDATE", DateUtil.getTime());
		pd.put("ISREMIND", "0");
		PageData pdRet = new PageData();
		if(true){
			//很据保单号查询是否已经报案
			System.out.println("111111111111111");
			if(null == claimsysService.findByPolicyNo(pd)){
				claimsysService.save(pd); 					//执行保存
				pdRet.put("IsSuccess", true);
				//pdRet.put("Message", "保单报险成功");
				//mv.addObject("msg","success");
				//out.write("success");
			}else{
				//mv.addObject("msg","failed");
				pdRet.put("IsSuccess", false);
				//pdRet.put("Message", "该保单已经申请理赔，详情请进行理赔进度查询");
				//pdRet.put("Message", "ffffffffffff");
				//out.write("success");
			}			
		}else{
			//mv.addObject("msg","failed");	
			pdRet.put("IsSuccess", false);
			//pdRet.put("Message", "保单不存在，请联系客服");
			//out.write("success");
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
		
		//mv.setViewName("ins/claimsys/myclaim");
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
		//获取理赔以后的状态值
		//List<PageData> varList = new ArrayList<PageData>();
		List<PageData>	varList = claimsysService.listStates(pd);	//列出ClaimSys列表
		//for(int i=0;i<5;i++){
		//	PageData pdNew = new PageData();
		//	pdNew.put("CLAIM_INDEX", i);
		//	pdNew.put("STATE_CONTENT", "快来投保吧"+i);
		//	varList.add(pdNew);
		//}
		
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
	
	 /**去理赔查询页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goSearch")
	public ModelAndView goSearch(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		//PageData pd = new PageData();
		//pd = this.getPageData();
		//page.setPd(pd);
		//PageData pdNew = new PageData();
		//pdNew.put("POLICYNO", "10000");
		
		//List<PageData> varList = claimsysService.findStateByPolicyNo(pdNew);	//列出ClaimSys列表
		//mv.setViewName("ins/claimsys/search");
		//mv.addObject("varList", varList);
		//mv.addObject("pd", pd);
		//return mv;
		
		//查询卡号密码
		PageData pdmysql = new PageData();
		PageData pd = new PageData();
		pd.put("CARDID","15212161991");
		pdmysql=cardinfoService.findByCardId(pd);
		//get username and password from mysql
		String desId =pdmysql.getString("CARDID");
		String despw = pdmysql.getString("PASSWORD");
		System.out.println("------"+desId+"------"+despw);
		
		//根据卡号查询保单
		PageData param = new PageData();
		param.put("CARDNO","15212161991");
		List<PageData>	varListPN = policyService.findByCardId(param);
		List<PageData> varList = new ArrayList<PageData>();
		//根据身份证号查询
		//PageData param = new PageData();
		//param.put("POLICYNO","431225199008277732");
		//List<PageData>	varList=policyService.findByPaperNo(param);
/*		
		List<String> varListPolyNo = new ArrayList<String>();
		varListPolyNo.add("10000");
		varListPolyNo.add("10001");
		varListPolyNo.add("10002");
		
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varListPolyNo.size();i++){
			PageData pdNew = new PageData();
			pdNew.put("POLICYNO", varListPolyNo.get(i));
			pdNew = claimsysService.findStateByPolicyNo(pdNew);	//列出ClaimSys列表
			if(pdNew != null){
				pdNew.put("IsOrNo", "1");
			}
			else{
				pdNew = new PageData();
				pdNew.put("IsOrNo", "0");
				pdNew.put("POLICYNO", varListPolyNo.get(i));
			}
			varList.add(pdNew);
		}
*/
		for(int i=0;i<varListPN.size();i++){
			PageData pdIn = new PageData();
			pdIn.put("POLICYNO", varListPN.get(i).getString("POLICY_ID"));
			PageData pdOut = claimsysService.findStateByPolicyNo(pdIn);	//列出ClaimSys列表
			if(pdOut != null){
				pdOut.put("IsOrNo", "1");
				varList.add(pdOut);
			}
			else{
				pdIn.put("IsOrNo", "0");
				varList.add(pdIn);
			}
			
		}
		mv.setViewName("ins/claimsys/search");
		mv.addObject("varList", varList);
		//mv.addObject("pd", pd);
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
