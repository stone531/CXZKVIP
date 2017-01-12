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
import com.fh.entity.system.User;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
//import com.fh.service.ins.onlinemsg.OnlineMsgManager;
import com.fh.util.DateUtil;
import com.fh.controller.ins.userdata.UserData;
import com.fh.service.ins.onlinemsg.OnlinemsgManager;
import com.fh.controller.ins.usermanage.UserManageController;

/** 
 * 说明：在线留言
 * 创建人：FH Q313596790
 * 创建时间：2016-12-21
 */
@Controller
@RequestMapping(value="/onlinemsg")
public class OnlinemsgController extends BaseController {
	
	String menuUrl = "onlinemsg/list.do"; //菜单地址(权限用)
	@Resource(name="onlinemsgService")
	private OnlinemsgManager onlinemsgService;
	
	@RequestMapping(value="/index")
	public ModelAndView index() throws Exception{
		System.out.println("onlinemsg index");
		//logBefore(logger, Jurisdiction.getUsername()+"列表OnlineMsg");
		ModelAndView mv = this.getModelAndView();	
//-------------------------------------start-------

		UserData data = this.GetUser();
		if(data== null)
		{
			System.out.println("index  error");
			mv.addObject("IsSuccess",2);
			mv.setViewName("ins/onlinemsg/result");
			return mv;
		}
		System.out.println("onlinemsg index:"+data.getMobile());

		PageData pd = new PageData();
		pd = this.getPageData();	
		PageData pdResult=new PageData();				
		pd.put("CLIENTUSER", data.getMobile());
		System.out.println("aaaa 00 " + pd);
		List<PageData>	varList = onlinemsgService.findByName(pd);	//列出OnlineMsg列表
		if(varList.isEmpty())
		{
			System.out.println("clientuser first in onlinemsg");
			
			mv.addObject("cState", 0);//session 提供的				
			//mv.addObject("msg","success");
			mv.setViewName("ins/onlinemsg/liuyan");
			return mv;
		}
		else
		{
			System.out.println("aaaa 2 :"+varList);
			mv.addObject("varList", varList);
			mv.addObject("cState", "0");
			System.out.println("########cState  1");
			mv.addObject("pd", pd);
			mv.setViewName("ins/onlinemsg/liuyan");
			return mv;
		}
       
		/*System.out.println("aaaa 1 ");
		if(readName == null)
		{
			System.out.println("aaaa 2");
			mv.addObject("cUser", pdResult.getString("CLIENTUSER"));
			//mv.addObject("cMsg", pdResult.getString("CONTENT"));	
			//mv.addObject("cState", "1");
			System.out.println("########cState  1");
		}
		else
		{
			System.out.println("aaaa 3");
			mv.addObject("########cState", "0");	
			System.out.println("cState  0");
		}		*/
		//System.out.println("aaaa 4");
		/*if(!pdResult.getString("CLIENTMSG").isEmpty() && pdResult.getString("REPLYMSG") != null)
		{		
			mv.addObject("sUser", pdResult.getString("OPERATIONADMIN"));
			mv.addObject("sMsg", pdResult.getString("REPLYMSG"));
			mv.addObject("sState", "1");
			System.out.println("########sState  1");
		}
		else
		{
			mv.addObject("sState", "0");
			System.out.println("########sState  0");
		}*/
		//mv.addObject("msg","success");
//-------------------------------------end---------
		//mv.setViewName("ins/onlinemsg/liuyan");
		//return mv;
	}
	
	
	public UserData GetUser(){
		Subject currentUser = SecurityUtils.getSubject(); 
		Session session = currentUser.getSession();	
		UserData user = (UserData)session.getAttribute(Const.SESSION_USERDATA);
		if(user == null)
		{
			System.out.println("client  not login");
			return null;
		}
		return user;
	}
	
	@RequestMapping(value="/sendmsg")
	public ModelAndView sendmsg() throws Exception{
		//System.out.println("sendmsg index");
		//logBefore(logger, Jurisdiction.getUsername()+"列表OnlineMsg");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd=this.getPageData();
		System.out.println("textarea:"+pd.getString("LIUYAN"));
		mv.addObject("msg","success");

//---------------------------start
		String sztest = "182";
		UserData data = this.GetUser();
		if(data== null)
		{
			System.out.println("sendmsg  error");
			mv.addObject("msg","error");
			return mv;
		}

		System.out.println("sendmsg index   1");
		if(!pd.getString("LIUYAN").isEmpty())
		{
			System.out.println("sendmsg index   2");
			pd.put("ONLINEMSG_ID", this.get32UUID());	//主键
			pd.put("CLIENTUSER",  data.getMobile());	//主键
			pd.put("CONTENT", pd.getString("LIUYAN"));	//主键
			pd.put("OPTIME", DateUtil.getTime());	//主键
			pd.put("ISREAD","0");
			
			System.out.println("sendmsg index   3");
			PageData pdResult=new PageData();
			pdResult = onlinemsgService.getMaxMsgId(pd);
			System.out.println("lrl >>>"+pd.getString("CLIENTUSER"));
			if(pdResult == null)
			{
				System.out.println("sendmsg index   4");
				pd.put("REPLYID", "0");	//主键
			}
			else
			{
				System.out.println("end   replay3:"+pdResult.get("MSGID").toString());
				pd.put("REPLYID", pdResult.get("MSGID").toString());	//主键	
			}			
		}		
		
		/*if(!pdResult.getString("REPLYMSG").isEmpty())
		{
			pd.put("OPERATIONADMIN", "tiandiao");	//主键
			pd.put("REPLYMSG", pd.getString("LIUYAN"));	//主键
			pd.put("REPLYTIEM", DateUtil.getTime());	//主键
		}*/
//---------------------------end
		onlinemsgService.save(pd);
		
		mv.addObject("IsSuccess","1");
		mv.setViewName("ins/usermanage/result");
		return mv;
	}
	
	//写入回复消息
	@RequestMapping(value="/adminReplyMsg")
	public ModelAndView adminReplyMsg() throws Exception{
		System.out.println("##########adminReplyMsg index");
		//logBefore(logger, Jurisdiction.getUsername()+"列表OnlineMsg");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		
//---------------------------start		
		pd=this.getPageData();
		System.out.println("adminReplyMsg:"+pd.getString("ADMINRSP"));
		System.out.println("adminReplyMsg1:"+pd.getString("MSGUSERID"));				
		PageData pdMsgid=new PageData();
		pdMsgid.put("ONLINEMSG_ID", pd.getString("MSGUSERID"));
//------------------------start  get admin user
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);				//读取session中的用户信息(单独用户信息)
		
		if (user != null) {
			User userr = (User)session.getAttribute(Const.SESSION_USERROL);		//读取session中的用户信息(含角色信息)
			if(null == userr){
				//user = userService.getUserAndRoleById(user.getUSER_ID());		//通过用户ID读取用户信息和角色信息
				session.setAttribute(Const.SESSION_USERROL, user);				//存入session	
			}else{
				user = userr;
			}
			System.out.println("aaaaaaaaa>>>  get current login id:"+user.getUSERNAME());
		}

		if(!user.getUSERNAME().isEmpty())
		{		
			if(pd.getString("REPLYMSG")== null)
			{//增加当前登录的用户名到数据库
				pd.put("ADMINUSER", user.getUSERNAME());
			}
		}
//------------------------end   get admin user

		String sztest = "182";
		System.out.println("sendmsg index   1:" +pdMsgid);
		if(!pd.getString("ADMINRSP").isEmpty())
		{
			System.out.println("sendmsg index   2");
			pd.put("ONLINEMSG_ID", this.get32UUID());	//主键
			//pd.put("CLIENTUSER", sztest );	//主键
			pd.put("CONTENT", pd.getString("ADMINRSP"));	//主键
			pd.put("OPTIME", DateUtil.getTime());	//主键
			
			PageData pdResult=new PageData();
			pdResult = onlinemsgService.findById(pdMsgid);
			System.out.println("lrl >>>"+pd.getString("MSGID"));
			
			pd.put("REPLYID", pdResult.get("MSGID").toString());	
			pd.put("CLIENTUSER", pdResult.get("CLIENTUSER").toString());	
			pd.put("ISREAD","1");
		}	
		else
		{
			mv.addObject("msg","error");
			mv.setViewName("save_result");
			return mv;
		}
		
//---------------------------end
		onlinemsgService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Onlinemsg");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ONLINEMSG_ID", this.get32UUID());	//主键
		onlinemsgService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Onlinemsg");
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
		logBefore(logger, Jurisdiction.getUsername()+"修改Onlinemsg");
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Onlinemsg");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = onlinemsgService.list(page);	//列出Onlinemsg列表
		mv.setViewName("ins/onlinemsg/onlinemsg_list");
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
	
	/**去回复消息页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goReplyMsg")
	public ModelAndView goReplyMsg()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ISREAD", "1");
		onlinemsgService.editstate(pd);
		pd = onlinemsgService.findById(pd);	//根据ID读取
		mv.setViewName("ins/onlinemsg/adminRsp");
		
		System.out.println("replay    4" + pd.getString("CLIENTUSER"));
		System.out.println("replay    5" + pd.getString("CONTENT"));
		mv.addObject("cUser", pd.getString("CLIENTUSER"));
		mv.addObject("cMsgID", pd.getString("ONLINEMSG_ID"));
		mv.addObject("cMsg", pd.getString("CONTENT"));
		
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Onlinemsg");
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Onlinemsg到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("消息id");	//1
		titles.add("用户id");	//2
		titles.add("管理员id");	//3
		titles.add("聊天内容");	//4
		titles.add("操作时间");	//5
		titles.add("回复msgid");	//6
		dataMap.put("titles", titles);
		List<PageData> varOList = onlinemsgService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("MSGID").toString());	//1
			vpd.put("var2", varOList.get(i).getString("CLIENTUSER"));	//2
			vpd.put("var3", varOList.get(i).getString("ADMINUSER"));	//3
			vpd.put("var4", varOList.get(i).getString("CONTENT"));	//4
			vpd.put("var5", varOList.get(i).getString("OPTIME"));	//5
			vpd.put("var6", varOList.get(i).get("REPLYID").toString());	//6
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
