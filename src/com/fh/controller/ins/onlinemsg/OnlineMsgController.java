package com.fh.controller.ins.onlinemsg;

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
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.service.ins.onlinemsg.OnlineMsgManager;
import com.fh.util.DateUtil;
import com.fh.controller.ins.userdata.UserData;

/** 
 * 说明：在线留言1
 * 创建人：FH Q313596790
 * 创建时间：2016-11-26
 */
@Controller
@RequestMapping(value="/onlinemsg")
public class OnlineMsgController extends BaseController {
	
	String menuUrl = "onlinemsg/list.do"; //菜单地址(权限用)
	@Resource(name="onlinemsgService")
	private OnlineMsgManager onlinemsgService;
	
	/**留言首页
	 * @param
	 * @throws Exception
	 */
	
	@RequestMapping(value="/index")
	public ModelAndView index() throws Exception{
		System.out.println("onlinemsg index");
		logBefore(logger, Jurisdiction.getUsername()+"列表OnlineMsg");
		ModelAndView mv = this.getModelAndView();
		UserData data = this.GetUser();
		mv.addObject("cUser", data.getMobile());//session 提供的
		//mv.addObject("cMsg", "clientMsg");
		
//-------------------------------------start-------
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ONLINEMSG_ID", this.get32UUID());	//主键		
		PageData pdResult=new PageData();				
		//pd.put("ONLINEMSG_ID", "cf9161e7712942d2ace087a4e406cf89");//test
		pdResult = onlinemsgService.findById(pd);
		if(pdResult == null)
		{
			mv.addObject("msg","error");
			//mv.setViewName("Ins/onlinemsg/liuyan");
			return mv;
		}
		if(!pdResult.getString("CLIENTMSG").isEmpty())
		{
			mv.addObject("cMsg", "clientMsg");	
			mv.addObject("cState", "1");
			System.out.println("########cState  1");
		}
		else
		{
			mv.addObject("########cState", "0");	
			System.out.println("cState  0");
		}		
		
		if(!pdResult.getString("CLIENTMSG").isEmpty() && !pdResult.getString("REPLYMSG").isEmpty())
		{		
			mv.addObject("sUser", data.getMobile());
			mv.addObject("sMsg", "ok123");
			mv.addObject("sState", "1");
			System.out.println("########sState  1");
		}
		else
		{
			mv.addObject("sState", "0");
			System.out.println("########sState  0");
		}
		mv.addObject("msg","success");
//-------------------------------------end---------
		mv.setViewName("ins/onlinemsg/liuyan");
		return mv;
	}
	
	
	public UserData GetUser(){
		Subject currentUser = SecurityUtils.getSubject(); 
		Session session = currentUser.getSession();	
		UserData user = (UserData)session.getAttribute(Const.SESSION_USERDATA);
		return user;
	}
	
	/**留言首页
	 * @param
	 * @throws Exception
	 */
	
	@RequestMapping(value="/sendmsg")
	public ModelAndView sendmsg() throws Exception{
		System.out.println("sendmsg index");
		logBefore(logger, Jurisdiction.getUsername()+"列表OnlineMsg");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd=this.getPageData();
		System.out.println("textarea:"+pd.getString("LIUYAN"));
		mv.addObject("msg","success");

//---------------------------start
		pd.put("ONLINEMSG_ID", this.get32UUID());	//主键		
		PageData pdResult=new PageData();	
		//pd.put("ONLINEMSG_ID", "cf9161e7712942d2ace087a4e406cf89");//test
		//pdResult = onlinemsgService.findById(pd);
		
		if(!pd.getString("LIUYAN").isEmpty())
		{
			pd.put("ONLINEMSG_ID", this.get32UUID());	//主键
			pd.put("USERNAME", "haozi88");	//主键
			pd.put("CLIENTMSG", pd.getString("LIUYAN"));	//主键
			pd.put("CLIENTWRITETIME", DateUtil.getTime());	//主键
		}		
		
		/*if(!pdResult.getString("REPLYMSG").isEmpty())
		{
			pd.put("OPERATIONADMIN", "tiandiao");	//主键
			pd.put("REPLYMSG", pd.getString("LIUYAN"));	//主键
			pd.put("REPLYTIEM", DateUtil.getTime());	//主键
		}*/
//---------------------------end
		onlinemsgService.save(pd);
		
		//mv.setViewName("save_result");
		return mv;
	}
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增OnlineMsg");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ONLINEMSG_ID", this.get32UUID());	//主键
		
		PageData pdResult=new PageData();
		//Page page = new Page();
		//List<PageData>	varList = onlinemsgService.list(page);	//列出OnlineMsg列表
		//onlinemsgService.save(pd);
		
		pd.put("ONLINEMSG_ID", "cf9161e7712942d2ace087a4e406cf89");
		//onlinemsgService.list(page);
		pdResult = onlinemsgService.findById(pd);
		System.out.println("select on mysql user >>:"+pdResult.getString("USERNAME"));
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
		logBefore(logger, Jurisdiction.getUsername()+"删除OnlineMsg");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		onlinemsgService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改OnlineMsg");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		onlinemsgService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表OnlineMsg");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = onlinemsgService.list(page);	//列出OnlineMsg列表
		mv.setViewName("ins/onlinemsg/onlinemsg_list");
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
		mv.setViewName("ins/onlinemsg/onlinemsg_edit");
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
		pd = onlinemsgService.findById(pd);	//根据ID读取
		mv.setViewName("ins/onlinemsg/onlinemsg_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除OnlineMsg");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			onlinemsgService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出OnlineMsg到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("用户名");	//1
		titles.add("客户端发送的消息");	//2
		titles.add("客户发送消息时间");	//3
		titles.add("操作管理员名称");	//4
		titles.add("管理员回复消息");	//5
		titles.add("管理员回复时间");	//6
		dataMap.put("titles", titles);
		List<PageData> varOList = onlinemsgService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("USERNAME"));	//1
			vpd.put("var2", varOList.get(i).getString("CLIENTMSG"));	//2
			vpd.put("var3", varOList.get(i).getString("CLIENTWRITETIME"));	//3
			vpd.put("var4", varOList.get(i).getString("OPERATIONADMIN"));	//4
			vpd.put("var5", varOList.get(i).getString("REPLYMSG"));	//5
			vpd.put("var6", varOList.get(i).getString("REPLYTIEM"));	//6
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
