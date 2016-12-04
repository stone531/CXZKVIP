package com.fh.controller.CXZKMEMBER.activity_all;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.service.CXZKMEMBER.activity_all.Activity_AllManager;
import com.fh.service.system.department.DepartmentManager;
import com.fh.service.system.user.impl.UserService;

/** 
 * 说明：活动模块
 * 创建人：FH Q313596790
 * 创建时间：2015-07-07
 */
@Controller
@RequestMapping(value="/activity_all")
public class Activity_AllController extends BaseController {
	
	String menuUrl = "activity_all/list.do"; //菜单地址(权限用)
	@Resource(name="activity_allService")
	private Activity_AllManager activity_allService;
	@Resource(name="departmentService")
	private DepartmentManager departmentService;
	@Resource
	private UserService userService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Activity_All");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ACTIVITY_ALL_ID", this.get32UUID());	//主键
		activity_allService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Activity_All");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		activity_allService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Activity_All");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		activity_allService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Activity_All");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String lastLoginStart = pd.getString("lastLoginStart");				//关键词检索条件
		if(null != lastLoginStart && !"".equals(lastLoginStart)){
			pd.put("lastLoginStart", lastLoginStart.trim());
		}
		String lastLoginEnd = pd.getString("lastLoginEnd");				//关键词检索条件
		if(null != lastLoginEnd && !"".equals(lastLoginEnd)){
			pd.put("lastLoginEnd", lastLoginEnd.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = activity_allService.list(page);	//列出Activity_All列表
		mv.setViewName("CXZKMEMBER/activity_all/activity_all_list");
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
		Page page=new Page();
		pd.put("PARENT_ID", "1");
		page.setPd(pd);
		List<PageData>	depList = departmentService.list(page);	//列出所属公司列表
		List<PageData> userList = userService.listUsers(page);//列出所有用户
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		//取得当前的用户
		User user = (User)session.getAttribute(Const.SESSION_USER);
		pd.put("USER_ID",user.getUSER_ID());
		pd.put("USERNAME",user.getUSERNAME());
		mv.setViewName("CXZKMEMBER/activity_all/activity_all_edit");
		mv.addObject("msg", "save");
		mv.addObject("userList",userList);
		mv.addObject("depList",depList);
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = activity_allService.findById(pd);	//根据ID读取
		Page page=new Page();
		pd.put("PARENT_ID", "1");
		page.setPd(pd);
		List<PageData>	depList = departmentService.list(page);	//列出所属公司列表
		List<PageData> userList = userService.listUsers(page);//列出所有用户
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		//取得当前的用户
		User user = (User)session.getAttribute(Const.SESSION_USER);
		pd.put("USER_ID",user.getUSER_ID());
		pd.put("USERNAME",user.getUSERNAME());
		mv.setViewName("CXZKMEMBER/activity_all/activity_all_edit");
		mv.addObject("userList",userList);
		mv.addObject("msg", "edit");
		mv.addObject("depList",depList);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Activity_All");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			activity_allService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Activity_All到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("市场活动主题");	//1
		titles.add("市场活动类型ID(产品ID)");	//2
		titles.add("开始日期");	//3
		titles.add("结束日期");	//4
		titles.add("负责人id");	//5
		titles.add("预计客户数");	//6
		titles.add("预计成本");	//7
		titles.add("实际成本");	//8
		titles.add("活动地点");	//9
		titles.add("活动描述");	//10
		titles.add("状态(N新建，R反馈中，E已启用，P已完成，C已取消)");	//11
		titles.add("创建公司");	//12
		titles.add("创建时间");	//13
		titles.add("创建人");	//14
		titles.add("最后更新时间");	//15
		titles.add("最后更新人");	//16
		titles.add("组织id");	//17
		titles.add("举办公司");	//18
		titles.add("报名截止日期");	//19
		titles.add("个数");	//20
		titles.add("市场活动编码");	//21
		titles.add("讲师id");	//22
		titles.add("套餐id");	//23
		titles.add("活动方式标示：P代表产品、C代表套餐");	//24
		dataMap.put("titles", titles);
		List<PageData> varOList = activity_allService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("MAA_NAME"));	//1
			vpd.put("var2", varOList.get(i).getString("MAA_TYPE_ID"));	//2
			vpd.put("var3", varOList.get(i).getString("MAA_BEGINNING_DATE"));	//3
			vpd.put("var4", varOList.get(i).getString("MAA_END_DATE"));	//4
			vpd.put("var5", varOList.get(i).getString("MAA_CHARGE_ID"));	//5
			vpd.put("var6", varOList.get(i).getString("HOPE_CUSTOMERS_COUNT"));	//6
			vpd.put("var7", varOList.get(i).getString("HOPE_COST_AMOUNT"));	//7
			vpd.put("var8", varOList.get(i).getString("ACTUAL_COST_AMOUNT"));	//8
			vpd.put("var9", varOList.get(i).getString("MAA_ADDRESS"));	//9
			vpd.put("var10", varOList.get(i).getString("MAA_DESC"));	//10
			vpd.put("var11", varOList.get(i).getString("MAA_STATUS"));	//11
			vpd.put("var12", varOList.get(i).getString("COA_ORG_ID"));	//12
			vpd.put("var13", varOList.get(i).getString("CREATION_DATE"));	//13
			vpd.put("var14", varOList.get(i).getString("CREATED_BY"));	//14
			vpd.put("var15", varOList.get(i).getString("LAST_UPDATE_DATE"));	//15
			vpd.put("var16", varOList.get(i).getString("LAST_UPDATED_BY"));	//16
			vpd.put("var17", varOList.get(i).getString("EXECUTE_ORG_ID"));	//17
			vpd.put("var18", varOList.get(i).getString("EXECUTE_DEPT_ID"));	//18
			vpd.put("var19", varOList.get(i).getString("SIGN_UP_DATE"));	//19
			vpd.put("var20", varOList.get(i).getString("REC_AMOUNT"));	//20
			vpd.put("var21", varOList.get(i).getString("MAA_CODE"));	//21
			vpd.put("var22", varOList.get(i).getString("TEACHER_ID"));	//22
			vpd.put("var23", varOList.get(i).getString("COMBO_ID"));	//23
			vpd.put("var24", varOList.get(i).getString("MAA_TYPE_FLAG"));	//24
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
