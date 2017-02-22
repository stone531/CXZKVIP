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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.fh.service.ins.business.BusinessManager;
import com.fh.controller.ins.usermanage.UserManageController;

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
	@Resource(name="businessService")
	private BusinessManager businessService;

	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/fg/save")
	public ModelAndView save(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//logBefore(logger, Jurisdiction.getUsername()+"新增ClaimSys");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
        response.setContentType("text/html");  
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CLAIMSYS_ID", this.get32UUID());	//主键
		//判断此保单号是否存在，外界提供接口
		pd.put("CLAIMSSTATES", "0");
		pd.put("LASTUPDATE", DateUtil.getTime());
		pd.put("ISREMIND", "0");
		pd.put("UPDATEFLAG", "0");
		PageData pdRet = new PageData();

		//很据保单号查询是否已经报案
		if(null == claimsysService.findByPolicyNo(pd)){
			claimsysService.save(pd); 					//执行保存
			//查询保险公司
			PageData pdTemp = new PageData();
			//根据保单查卡号
			pdTemp.put("POLICY_ID", pd.getString("POLICYNO"));
			pdTemp = policyService.findById(pdTemp);
			
			//根据报险公司查电话
			pdRet.put("BUSINESS_ID", pdTemp.getString("BUSINESSID"));
			pdRet = businessService.findById(pdRet);

			pdRet.put("IsSuccess", true);
		}else{
			pdRet.put("IsSuccess", false);
		}
		JSONObject js = JSONObject.fromObject(pdRet);
		out.write(js.toString());
		out.close();

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
		int update = 0;
		//查看状态表单理赔状态与数据库中是否一致，一致则标记未更新
		PageData pdNew = claimsysService.findStateByPolicyNo(pd);
		if(null != pdNew){
			String stateForm = pd.getString("CLAIMSSTATES");
			String stateSql = pdNew.getString("CLAIMSSTATES");
			if(null != stateSql && !"".equals(stateSql) && !stateForm.equals(stateSql)){
				update = 1;//更新
			}
		}
		if(update == 1){
			pd.put("LASTUPDATE",DateUtil.getTime());
			pd.put("ISREMIND", "0");
			pd.put("UPDATEFLAG", "1");
		}
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
		//UserManageController.SetQX(mv);
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/fg/goAdd")
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
	
	/**搜索
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/fg/searchResult")
	@ResponseBody
	public Object searchResult() throws Exception{	
		//查询卡号密码
		PageData pdmysql = new PageData();
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
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
			List<PageData>	varListPN = new ArrayList<PageData>();
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
					//根据报险公司查电话
					pdIn.put("BUSINESS_ID", varListPN.get(i).getString("BUSINESSID"));
					PageData pdBuss = businessService.findById(pdIn);
					pdIn.put("CARDNO", varListPN.get(i).getString("CARDNO"));
					pdIn.put("POLICYNO", varListPN.get(i).getString("POLICYNO"));
					pdIn.put("UPDATEFLAG", "0");
					
					PageData pdOut = claimsysService.findStateByPolicyNo(pdIn);	//列出ClaimSys列表
					if(pdOut != null){
						claimsysService.changeUpdateFlag(pdIn);
						pdOut.put("IsOrNo", "1");
						pdOut.put("CARDNO", varListPN.get(i).getString("CARDNO"));
						pdOut.put("COMPANYTEL", pdBuss.getString("COMPANYTEL"));
						varList.add(pdOut);
					}else{
						pdIn.put("IsOrNo", "0");
						pdIn.put("COMPANYTEL", pdBuss.getString("COMPANYTEL"));
						varList.add(pdIn);
					}			
				}				
				map.put("varList", varList);
			}			
		}
		map.put("result", result);
		return AppUtil.returnObject(pd, map);
	}
	
	/**去搜索页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/fg/goSearch")
	public ModelAndView goSearch()throws Exception{	
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("searchtype", "1");
		//mv.setViewName("ins/claimsys/myclaim");
		mv.setViewName("ins/claimsys/search");
		//mv.addObject("msg", "search");
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
	@RequestMapping(value="/fg/addCourier")
	public void addCourier(PrintWriter out) throws Exception{
		//logBefore(logger, Jurisdiction.getUsername()+"更新ClaimSys");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return;} //校验权限

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
	
	/**提示用户理赔状态是否有更新
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/fg/promptUpdate")
	public void promptUpdate(PrintWriter out) throws Exception{
		//logBefore(logger, Jurisdiction.getUsername()+"查询ClaimSys");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return;} //校验权限
		
		PageData pdRet = new PageData();
		//获取用户登录session
		PageData pdSession = UserManageController.GetUserData();
		
		if(null != pdSession){
			//用户登录，则查询该用户的保单
			PageData param = new PageData();
			param.put("USERID", pdSession.getString("USERMANAGE_ID"));
			List<PageData>	varListPN = policyService.findByUserID(param);			
			if(varListPN.size() == 0){
				pdRet.put("IsPrompt", false);//该卡还没有投保
			}else{
				int nUpdate = 0;
				for(int i=0;i<varListPN.size();i++){
					PageData pdIn = new PageData();
					pdIn.put("POLICYNO", varListPN.get(i).getString("POLICY_ID"));
					pdIn.put("UPDATEFLAG", 1);
					PageData pdOut = claimsysService.findUpdateFlag(pdIn);	//查询是否更新
					if(pdOut != null){
						nUpdate += 1;
					}		
				}
				if(0 == nUpdate){//没有更新
					pdRet.put("IsPrompt", false);
				}else{//有更新
					pdRet.put("IsPrompt", true);
					pdRet.put("nUpdate", nUpdate);
				}								
			}
		}else{
			pdRet.put("IsPrompt", false);			
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
