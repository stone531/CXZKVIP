package com.fh.controller.ins.usermanage;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;

import org.apache.poi.util.SystemOutLogger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
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
import com.fh.util.FileUpload;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.PathUtil;
import com.fh.service.ins.usermanage.UserManageManager;
import com.fh.controller.ins.userdata.UserData;


import com.fh.controller.ins.workdata.WorkData;
import com.fh.controller.ins.workssubdata.WorkSSubData;
import com.fh.controller.ins.worksubdata.WorkSubData;

import java.security.Security;
import java.util.Properties;
 






import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;



/** 
 * 说明：user system
 * 创建时间：2016-09-24
 */
@Controller
@RequestMapping(value="/usermanage")
public class UserManageController extends BaseController {
	
	String menuUrl = "usermanage/list.do"; //菜单地址(权限用)
	@Resource(name="usermanageService")
	private UserManageManager usermanageService;

	
	public Color getRandColor(int fc,int bc){  
        Random random = new Random();  
        if(fc > 255){  
            fc = 255;  
        }  
        if(bc < 255){  
            bc = 255;  
        }  
        int r = fc +random.nextInt(bc-fc);  
        int g = fc +random.nextInt(bc-fc);  
        int b = fc +random.nextInt(bc-fc);  
        return new Color(r,g,b);  
    }  
	
	@RequestMapping(value="/login/check")
	public void logincheck(PrintWriter out) throws Exception{
		Subject currentUser = SecurityUtils.getSubject(); 
		Session session = currentUser.getSession();
		PageData pd = new PageData();
		
		UserData user = (UserData)session.getAttribute(Const.SESSION_USERDATA);
		if (user == null){
			pd.put("IsSuccess",false);
		}else{
			pd.put("IsSuccess", true);
			pd.put("mobile", user.getMobile());
		}
		Object js = JSONObject.fromObject(pd);
		out.write(js.toString());
		out.close();
		return;
	}
	
	
	@RequestMapping(value="/login/testjson")
	public void testjson(PrintWriter out){
		
		ArrayList<WorkData> array = new ArrayList<WorkData>();
		 
		WorkData wd = new WorkData();
		WorkSubData wsd = new WorkSubData();
		WorkSSubData wssd = new WorkSSubData();
		
		wssd.setN("wssd");
		wsd.setN("wsd");
		wd.setN("wd");
		
		wsd.setS(wssd);
		wd.setS(wsd);
		
		array.add(wd);
		array.add(wd);
		array.add(wd);
		
		JSONArray js  = JSONArray.fromObject(array);
		System.out.println(js);
		out.write(js.toString());
		out.close();
	}
	
	@RequestMapping(value="/login/logout")
	public void logout(PrintWriter out) throws Exception{
		Subject currentUser = SecurityUtils.getSubject(); 
		Session session = currentUser.getSession();
		PageData pd = new PageData();
		
		UserData user = (UserData)session.getAttribute(Const.SESSION_USERDATA);
		if (user!=null){
			session.removeAttribute(Const.SESSION_USERDATA);
		}
		pd.put("IsSuccess",true);
		Object js = JSONObject.fromObject(pd);
		out.write(js.toString());
		out.close();
		return;
	}
	
	@RequestMapping(value="/register/rand")
	public void rand(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 response.setHeader("Pragma","no-cache");  
		    response.setHeader("Cache-Control","no-catch");  
		    response.setDateHeader("Expires",0);
		Subject currentUser = SecurityUtils.getSubject(); 
		Session session = currentUser.getSession();
		      
		    //在内存中创建图象  
		    int width = 60;  
		    int height = 20;  
		    BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);  
		      
		    //创建图象  
		    Graphics g = image.getGraphics();  
		    //生成随机对象  
		    Random random = new Random();  
		    //设置背景色  
		    g.setColor(getRandColor(200,250));  
		    g.fillRect(0,0,width,height);  
		    //设置字体  
		    g.setFont(new Font("Tines Nev Roman",Font.PLAIN,18));  
		    //随机产生干扰线  
		    g.setColor(getRandColor(160,200));  
		    for(int i = 0; i < 5; i++){  
		        int x = random.nextInt(width);  
		        int y = random.nextInt(height);  
		        int xl = random.nextInt(12);  
		        int yl = random.nextInt(12);  
		        g.setColor(new Color(20 + random.nextInt(110),20 + random.nextInt(110),20 + random.nextInt(110)));  
		        g.drawLine(x, y, xl, yl);
		    }  
		    //随机产生认证码,4位数字  
		    String sRand = "";  
		    for(int i = 0; i < 4; i++){  
		        String rand = String.valueOf(random.nextInt(10));  
		        sRand  += rand;  
		        //将认证码显示到图象中  
		        g.setColor(new Color(20 + random.nextInt(110),20 + random.nextInt(110),20 + random.nextInt(110)));  
		        g.drawString(rand,13*i+6,16);  
		    }  
		    session.setAttribute("rCode",sRand);  
		    //图像生效  
		    g.dispose();  
		    //输出图像到页面  
		    ImageIO.write(image,"JPEG",response.getOutputStream());  
		    response.getOutputStream().close();
	}
	
	
	@RequestMapping(value="/index")
	public ModelAndView showmain() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("ins/page/index");
		return mv;
	}
	/**
	 * 显示注册页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/register/show")
	public ModelAndView showregist() throws Exception{
		//logBefore(logger,Jurisdiction.getUsername()+"注册UserManage");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("ins/usermanage/regist_show");
		return mv;
	}
	
	/**
	 * 显示找回密码
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/register/pass/show")
	public ModelAndView showpass() throws Exception{
		//logBefore(logger,Jurisdiction.getUsername()+"注册UserManage");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("ins/usermanage/login_pass");
		return mv;
	}
	/**
	 * 修改手机号
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/personal/mobile/show")
	public ModelAndView showUpMobile() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("ins/usermanage/personal_mobile");
		return mv;
	}
	
	/*验证码判断
	 * 
	 */
	@RequestMapping(value="/register/do_verify")
	public void isRight(PrintWriter out) throws Exception{
		//logBefore(logger,Jurisdiction.getUsername()+"verify rand imag");
		PageData pd = new PageData();
		
		pd = this.getPageData();
		String rand = pd.getString("rand");
		
		if (jadgeRand(rand)) {
			pd.put("IsSuccess", true);
		}else{
			pd.put("IsSuccess", false);
		}
		Object js = JSONObject.fromObject(pd);
		out.write(js.toString());
		out.close();
		return;
	}
	public boolean jadgeRand(String rand) throws Exception{
		Subject currentUser = SecurityUtils.getSubject(); 
		Session session = currentUser.getSession();
		String srand = session.getAttribute("rCode").toString();
		if (rand.equals(srand)){
			return true;
		}else{
			return false;
		}
	}
	/*是否已经注册
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/register/do_isexisted")
	public void isexisted(PrintWriter out) throws Exception{
		//logBefore(logger,Jurisdiction.getUsername()+"是否存在User");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return;} //校验权限
		PageData pd = new PageData();
		PageData jspd = new PageData();
		
		pd = this.getPageData();
		
		PageData rtpd = new PageData();
		
		rtpd = usermanageService.getByName(pd);
		
		if(rtpd == null) {
			jspd.put("IsSuccess", false);

		}else{
			jspd.put("IsSuccess", true);
		}
		Object js = JSONObject.fromObject(jspd);
		out.write(js.toString());
		out.close();
		return ;
	}
	@RequestMapping(value="/register/do_email_isexisted")
	public void email_isexisted(PrintWriter out) throws Exception{
		
		PageData pd = new PageData();
		PageData jspd = new PageData();
		
		pd = this.getPageData();
		
		PageData rtpd = new PageData();
		rtpd = usermanageService.getByEmail(pd);
		if(rtpd == null) {
			jspd.put("IsSuccess", false);

		}else{
			jspd.put("IsSuccess", true);
		}
		Object js = JSONObject.fromObject(jspd);
		out.write(js.toString());
		out.close();
		return ;
	}
	@RequestMapping(value="/register/do_nick_isexisted")
	public void nick_isexisted(PrintWriter out) throws Exception{
		
		PageData pd = new PageData();
		PageData jspd = new PageData();
		
		pd = this.getPageData();
		
		PageData rtpd = new PageData();
		rtpd = usermanageService.getByNick(pd);
		if(rtpd == null) {
			jspd.put("IsSuccess", false);

		}else{
			jspd.put("IsSuccess", true);
		}
		Object js = JSONObject.fromObject(jspd);
		out.write(js.toString());
		out.close();
		return ;
	}
	
	@RequestMapping(value="/register/do_sendEmail")
	public void sendmail(PrintWriter out) throws Exception{
		PageData pd = new PageData();
		Subject currentUser = SecurityUtils.getSubject(); 
		Session session = currentUser.getSession();
		pd = this.getPageData();
		String sMail = pd.getString("EMAIL");
		String isSendMail = pd.getString("SENDMOBILE");
		String sRand = "";
		
		if (isSendMail.equals("1")) {
			pd = usermanageService.getByEmail(pd);
			sRand = sRand + "登陆用户名：" + pd.getString("MOBILE") + "	 邮箱验证码：";
		}
		
		Random random = new Random();  
		
		for(int i = 0; i < 4; i++){  
	        String rand = String.valueOf(random.nextInt(10));  
	        sRand  += rand;  
		}
		 // 创建Properties 类用于记录邮箱的一些属性
        final Properties props = new Properties();
        // 表示SMTP发送邮件，必须进行身份验证
        props.put("mail.smtp.auth", "true");
        //此处填写SMTP服务器
        props.put("mail.smtp.host", "smtp.qq.com");
        //端口号，QQ邮箱给出了两个端口，但是另一个我一直使用不了，所以就给出这一个587
        props.put("mail.smtp.port", "587");
        // 此处填写你的账号
        props.put("mail.user", "1027350999@qq.com");
        // 此处的密码就是前面说的16位STMP口令
        props.put("mail.password", "zshswgbacpiebceh");

        // 构建授权信息，用于进行SMTP进行身份验证
        Authenticator authenticator = new Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {
                // 用户名、密码
                String userName = props.getProperty("mail.user");
                String password = props.getProperty("mail.password");
                return new PasswordAuthentication(userName, password);
            }
        };
        // 使用环境属性和授权信息，创建邮件会话
        javax.mail.Session mailSession = javax.mail.Session.getInstance(props, authenticator);
        // 创建邮件消息
        MimeMessage message = new MimeMessage(mailSession);
        // 设置发件人
        InternetAddress form = new InternetAddress(
                props.getProperty("mail.user"));
        message.setFrom(form);

        // 设置收件人的邮箱
        InternetAddress to = new InternetAddress(sMail);
        message.setRecipient(RecipientType.TO, to);

        // 设置邮件标题
        message.setSubject("邮件验证码");

        // 设置邮件的内容体
        message.setContent(sRand, "text/html;charset=UTF-8");

        // 最后当然就是发送邮件啦
        Transport.send(message);
		
		
		session.setAttribute("smsCode", sRand);
		pd.put("IsSuccess", true);
		
		Object js = JSONObject.fromObject(pd);
		out.write(js.toString());
		out.close();
		return;
	}
	
	@RequestMapping(value="/register/do_sendsms")
	public void sendsms(PrintWriter out) throws Exception{
		//logBefore (logger,Jurisdiction.getUsername()+"sendsms");
		PageData pd = new PageData();
		Subject currentUser = SecurityUtils.getSubject(); 
		Session session = currentUser.getSession();
		pd = this.getPageData();
		String sMobile = pd.getString("MOBILE");
		
		String rand = pd.getString("rand");
		
		if (jadgeRand(rand)) {
			//TODO:send sms interface
			session.setAttribute("smsCode", "1234");
			pd.put("IsSuccess", true);
		}else{
			pd.put("IsSuccess", false);
		}
		
		Object js = JSONObject.fromObject(pd);
		out.write(js.toString());
		out.close();
		return;
	}
	
	/**找回密码
	 * @param
	 * @throws ExceptionsmsCode
	 */
	@RequestMapping(value="/register/pass/do_update")
	public void do_updatepass(HttpServletRequest request,HttpServletResponse response) throws Exception{
		//logBefore(logger,Jurisdiction.getUsername()+"注册UserManage");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return ;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		String psmsCode = pd.getString("smsCode");
		Subject currentUser = SecurityUtils.getSubject(); 
		Session session = currentUser.getSession();
		String smsCode = session.getAttribute("smsCode").toString();
		String newPass = pd.getString("PASSWORD");
		String type = pd.getString("type");
		
		if (smsCode.equals(psmsCode)){
			if (type.equals("1")) {
				pd = usermanageService.getByEmail(pd);	
			}else {
				pd = usermanageService.getByName(pd);
			}
			
			if (pd != null){
				PageData upd = new PageData();
				upd.put("USERMANAGE_ID", pd.getString("USERMANAGE_ID"));
				upd.put("PASSWORD", newPass);
				usermanageService.updatePass(upd);
				pd.put("IsSuccess", 1);	
			}else{
				pd = new PageData();
				pd.put("IsSuccess",0);	
			}
			
		}else{
			pd.put("IsSuccess",0);	
		}
		
		Object js = JSONObject.fromObject(pd);
		response.getWriter().write(js.toString());
		response.getWriter().close();
		return ;
	}
	
	/**修改手机号
	 * @param
	 * @throws ExceptionsmsCode
	 */
	@RequestMapping(value="/register/mobile/do_update")
	public void do_updateMobile(HttpServletRequest request,HttpServletResponse response) throws Exception{
		//logBefore(logger,Jurisdiction.getUsername()+"注册UserManage");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return ;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		String psmsCode = pd.getString("smsCode");
		Subject currentUser = SecurityUtils.getSubject(); 
		Session session = currentUser.getSession();
		String smsCode = session.getAttribute("smsCode").toString();
		
		if (smsCode.equals(psmsCode)){
			PageData upd = new PageData();
			upd.put("USERMANAGE_ID", pd.getString("USERMANAGE_ID"));
			upd.put("MOBILE",  pd.getString("MOBILE"));
			usermanageService.updateMobile(upd);
			pd.put("IsSuccess", 1);	
			
		}else{
			pd.put("IsSuccess",0);	
		}
		
		Object js = JSONObject.fromObject(pd);
		response.getWriter().write(js.toString());
		response.getWriter().close();
		return ;
	}
	
	/**注册
	 * @param
	 * @throws ExceptionsmsCode
	 */
	@RequestMapping(value="/register/do_register")
	public void regist(HttpServletRequest request,HttpServletResponse response) throws Exception{
		//logBefore(logger,Jurisdiction.getUsername()+"注册UserManage");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return ;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		String psmsCode = pd.getString("smsCode");
		Subject currentUser = SecurityUtils.getSubject(); 
		Session session = currentUser.getSession();
		String smsCode = session.getAttribute("smsCode").toString();
		if (smsCode.equals(psmsCode)){
			pd.put("IsSuccess", true);	
			String UserId = this.get32UUID();
			pd.put("USERMANAGE_ID", UserId);	//主键
			pd.put("CREATETIME", new Date());
			pd.put("USERTYPE","0");
			pd.put("SCORE", 0);
			usermanageService.save(pd);	
			UserData user = new UserData();
			user.setMobile(pd.getString("MOBILE"));
			user.setPass(pd.getString("PASSWORD"));
			user.setUsertype(pd.getString("USERTYPE"));
			user.setId(UserId);
			session.setAttribute(Const.SESSION_USERDATA, user);
			this.SetCookie(response, "id", user.getId(), 3600);
			this.SetCookie(response, "type", user.getUsertype(), 3600);
		}else{
			pd.put("IsSuccess", false);	
			pd.put("Message", "smscode not right");
		}
		
		Object js = JSONObject.fromObject(pd);
		response.getWriter().write(js.toString());
		response.getWriter().close();
		return ;
	}
	///================================================================login=============================================================///
	
	/**
	 * update pass
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login/updatepass")
	public void goUpdatePass(PrintWriter out) throws Exception{
		PageData pd = new PageData();
		PageData rtpd = new PageData();
		PageData rspd = new PageData();
		
		pd = this.getPageData();
		String prepass = pd.getString("PREPASS");
		String newpass = pd.getString("PASSWORD");
		
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		UserData ud = (UserData) session.getAttribute(Const.SESSION_USERDATA);
		if (ud.getPass().equals(prepass)){
			rtpd = this.setPDFromUD(ud);
			pd.remove("PASSWORD");
			pd.put("PASSWORD", newpass);
			usermanageService.save(rtpd);
			
			rspd.put("IsSuccess", 1);
		}else {
			rspd.put("IsSuccess", 0);
		}
		Object js = JSONObject.fromObject(rspd);
		out.write(js.toString());
		out.close();
		return;
	}
	
	/**
	 * change password
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login/changepass")
	public void goChangePass(HttpServletRequest request,HttpServletResponse response) throws Exception{
		PageData rspd = new PageData();
		PageData pd = new PageData();
		pd = this.getPageData();
		//验证短信码验证
		String psmsCode = pd.getString("smsCode");
		Subject currentUser = SecurityUtils.getSubject(); 
		Session session = currentUser.getSession();
		String smsCode = session.getAttribute("smsCode").toString();
		
		do {
		if (smsCode.equals(psmsCode)){
			//需要手机号
			PageData rtpd = usermanageService.getByName(pd);
			if (rtpd == null){
				//用户不存在
				rspd.put("IsSuccess", 2);
				break;
			}else{
				rspd.put("IsSuccess",1);
				UserData user = new UserData();
				user = this.setUDFromPD(rtpd);
				session.setAttribute(Const.SESSION_USERDATA, user);
				
				this.SetCookie(response, "id", user.getId(), 3600);
				this.SetCookie(response, "type", user.getUsertype(), 3600);
				break;
			}
		}
		}while(false);
		Object js = JSONObject.fromObject(rspd);
		response.getWriter().write(js.toString());
		response.getWriter().close();
		return;
	}
	/**
	 * 显示登陆页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login/show")
	public ModelAndView showlogin() throws Exception{
		//logBefore(logger,Jurisdiction.getUsername()+"login show");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("ins/usermanage/login_show");
		return mv;
	}
	/**
	 * 使用短信验证码登陆
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/login/do_login_sms")
	public void loginsms(HttpServletRequest request,HttpServletResponse response) throws Exception{
		PageData rspd = new PageData();
		PageData pd = new PageData();
		pd = this.getPageData();
		String psmsCode = pd.getString("smsCode");
		Subject currentUser = SecurityUtils.getSubject(); 
		Session session = currentUser.getSession();
		String smsCode = session.getAttribute("smsCode").toString();
		
		do {
		if (smsCode.equals(psmsCode)){
			PageData rtpd = usermanageService.getByName(pd);
			if (rtpd == null){
				//用户不存在
				rspd.put("IsSuccess", 2);
				break;
			}else{
				rspd.put("IsSuccess",1);
				UserData user = new UserData();
				user = this.setUDFromPD(rtpd);
				session.setAttribute(Const.SESSION_USERDATA, user);
				
				this.SetCookie(response, "id", user.getId(), 3600);
				this.SetCookie(response, "type", user.getUsertype(), 3600);
				break;
			}
		}
		}while(false);
		Object js = JSONObject.fromObject(rspd);
		response.getWriter().write(js.toString());
		response.getWriter().close();
		return;
	}
	/*登陆
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/login/do_login")
	public void login(HttpServletRequest request,HttpServletResponse response) throws Exception{
		//logBefore(logger,Jurisdiction.getUsername()+"登陆UserManage");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return ;} //校验权限
		PageData pd = new PageData();
		PageData rspd = new PageData();
		
		pd = this.getPageData();
		
		String srand = pd.getString("rand");
		do{
		if(!jadgeRand(srand)){
			//验证码不正确
			rspd.put("IsSuccess", 3);
			break;
		}
		
		PageData rtpd = usermanageService.getByName(pd);
		if (rtpd == null){
			//用户不存在
			rspd.put("IsSuccess", 2);
			break;
		}

		if (pd.getString("PASSWORD").equals(rtpd.getString("PASSWORD"))) {
			//登陆成功
			rspd.put("IsSuccess",1);
			Subject currentUser = SecurityUtils.getSubject(); 
			Session session = currentUser.getSession();
			UserData user = new UserData();
			user = this.setUDFromPD(rtpd);
			session.setAttribute(Const.SESSION_USERDATA, user);
			
			this.SetCookie(response, "id", user.getId(), 3600);
			this.SetCookie(response, "type", user.getUsertype(), 3600);
			break;
		}else {
			rspd.put("IsSuccess",0);
			break;
		}
		}while(false);
		Object js = JSONObject.fromObject(rspd);
		response.getWriter().write(js.toString());
		response.getWriter().close();
		return;
		
	}
	
	
//===============================================persional pages========================================//
	
	/**
	 * 结果显示页面
	 */
	@RequestMapping(value="/fg/show/result")
	public ModelAndView result_show() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.addObject("IsSuccess", pd.getString("IsSuccess"));
		mv.setViewName("ins/usermanage/result");
		return mv;
	}
	/**个人页面修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/personal/edit")
	public ModelAndView personal_goedit(
			@RequestParam(value="MOBILE") String Mobile,
			@RequestParam(value="SCORE") String SCORE,
			@RequestParam(value="NICKNAME") String NICKNAME,
			@RequestParam(value="ADDRESS") String ADDRESS,
			@RequestParam(value="REALNAME") String REALNAME,
			@RequestParam(value="USERTYPE") String USERTYPE,
			@RequestParam(value="EMAIL") String EMAIL,
			@RequestParam(value="USERMANAGE_ID") String USERMANAGE_ID,
			@RequestParam(value="CARDID") String CARDID,
			@RequestParam(value="BANKCARD") String BANKCARD,
			@RequestParam(value="WECHAT") String WECHAT
			) throws Exception{
		//logBefore(logger, Jurisdiction.getUsername()+"修改UserManage");
	//	if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		
		pd.put("MOBILE", Mobile);
		pd.put("NICKNAME",NICKNAME);
		pd.put("SCORE", SCORE);
		pd.put("ADDRESS", ADDRESS);
		pd.put("REALNAME", REALNAME);
		pd.put("USERTYPE", USERTYPE);
		pd.put("EMAIL", EMAIL);
		pd.put("USERMANAGE_ID", USERMANAGE_ID);
		pd.put("CARDID", CARDID);
		pd.put("BANKCARD", BANKCARD);
		pd.put("WECHAT", WECHAT);
		
		usermanageService.edit(pd);
		
		ResetSession(pd);
		
		mv.addObject("IsSuccess","1");
		mv.setViewName("ins/usermanage/result");
		return mv;
	}
	
	/**公司页面修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/company/edit")
	public ModelAndView company_goedit(
			@RequestParam(value="PIC",required=true) MultipartFile[] files,
			@RequestParam(value="MOBILE") String Mobile,
			@RequestParam(value="SCORE") String SCORE,
			@RequestParam(value="NICKNAME") String NICKNAME,
			@RequestParam(value="COMPNAME") String COMPNAME,
			@RequestParam(value="COMPNUM") String COMPNUM,
			@RequestParam(value="ADDRESS") String ADDRESS,
			@RequestParam(value="PHONE") String PHONE,
			@RequestParam(value="REALNAME") String REALNAME,
			@RequestParam(value="USERTYPE") String USERTYPE,
			@RequestParam(value="EMAIL") String EMAIL,
			@RequestParam(value="USERMANAGE_ID") String USERMANAGE_ID
			) throws Exception{
		//logBefore(logger, Jurisdiction.getUsername()+"修改UserManage");
	//	if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		String Pic = "PIC";
		String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG;								//文件上传路径
		for (int i = 0; i < files.length; i++) {
			String fileName =  FileUpload.fileUp(files[i], filePath, this.get32UUID());
			String picName = Pic + (1+i);
			pd.put(picName,Const.FILEPATHIMG+fileName);
			System.out.println(filePath);
		}
		pd.put("MOBILE", Mobile);
		pd.put("NICKNAME",NICKNAME);
		pd.put("SCORE", SCORE);
		pd.put("COMPNAME",COMPNAME);
		pd.put("COMPNUM", COMPNUM);
		pd.put("ADDRESS", ADDRESS);
		pd.put("PHONE", PHONE);
		pd.put("REALNAME", REALNAME);
		pd.put("USERTYPE", USERTYPE);
		pd.put("EMAIL", EMAIL);
		pd.put("USERMANAGE_ID", USERMANAGE_ID);
		
		usermanageService.edit(pd);
		
		ResetSession(pd);
		
		mv.addObject("IsSuccess","1");
		mv.setViewName("ins/usermanage/result");
		return mv;
	}
	
	/**show personal page
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/personal/show")
	public ModelAndView persional_show() throws Exception{
		ModelAndView mv = this.getModelAndView();
		Subject currentUser = SecurityUtils.getSubject(); 
		Session session = currentUser.getSession();
		Object obs = session.getAttribute(Const.SESSION_USERDATA);
		if (obs == null) {
			return this.showlogin();
		}
		UserData ud = new UserData();
		ud = (UserData)obs;
		PageData pd = this.setPDFromUD(ud);
		mv.addObject("pd",pd);
		mv.setViewName("ins/usermanage/personal_show");
		return mv;
	}
	
	/**
	 * show company edit information page
	 * @param
	 * @return
	 */
	@RequestMapping(value="/personal/company")
	public ModelAndView company_show() throws Exception{
		ModelAndView mv = this.getModelAndView();
		Subject currentUser = SecurityUtils.getSubject(); 
		Session session = currentUser.getSession();
		Object obs = session.getAttribute(Const.SESSION_USERDATA);
		UserData ud = new UserData();
		ud = (UserData)obs;
		PageData pd = this.setPDFromUD(ud);
		mv.addObject("pd",pd);
		mv.setViewName("ins/usermanage/personal_company");
		return mv;
	}
	
	/**
	 * update pass word
	 * @param
	 * @return
	 */
	@RequestMapping(value="/personal/do_updatepass")
	public void password_update(HttpServletRequest request,HttpServletResponse response) throws Exception{
		PageData rtpd = new PageData();
		PageData pd = this.getPageData();
		Subject currentUser = SecurityUtils.getSubject(); 
		Session session = currentUser.getSession();
		Object obs = session.getAttribute(Const.SESSION_USERDATA);
		UserData ud = new UserData();
		ud = (UserData)obs;
		String pass = ud.getPass();
		System.out.println(ud.getPass()+ud.getMobile());
		System.out.println(pd.getString("PREPASSWORD"));
		do {
			if (!pass.equals(pd.getString("PREPASSWORD"))) {
				rtpd.put("IsSuccess", 2);
				break;
			}else{
				usermanageService.updatePass(pd);
				rtpd.put("IsSuccess", 1);
				break;
			}
		}while(false);
		
		Object js = JSONObject.fromObject(rtpd);
		response.getWriter().write(js.toString());
		response.getWriter().close();
		return;
		
	}
	
//===============================================public interface======================================//
	
	public int VerifySmsCode(){
		return 0;
	}
	
	public void ResetSession(PageData pd) throws Exception{
		PageData rtpd = usermanageService.getByName(pd);
		if (rtpd == null){
			//用户不存在
			return;
		}

			Subject currentUser = SecurityUtils.getSubject(); 
			Session session = currentUser.getSession();
			UserData user = new UserData();
			user = this.setUDFromPD(rtpd);
			session.setAttribute(Const.SESSION_USERDATA, user);
			return;
	}
	
	public UserData setUDFromPD(PageData pd) {
		UserData user = new UserData();
		user.setId(pd.getString("USERMANAGE_ID"));
		user.setAddress(pd.getString("ADDRESS"));
		user.setMobile(pd.getString("MOBILE"));
		user.setPass(pd.getString("PASSWORD"));
		user.setScore(Integer.parseInt(pd.get("SCORE").toString()));
		user.setUsertype(pd.getString("USERTYPE"));
		user.setNickName(pd.getString("NICKNAME"));
		user.setEmail(pd.getString("EMAIL"));
		user.setCardId(pd.getString("CARDID"));
		user.setBankCard(pd.getString("BANKCARD"));
		user.setWechat(pd.getString("WECHAT"));
		user.setPicWechat(pd.getString("PICWECHAT"));
		user.setCompName(pd.getString("COMPNAME"));
		user.setCompNum(pd.getString("COMPNUM"));
		user.setPhone(pd.getString("PHONE"));
		user.setRemark(pd.getString("REMARK"));
		user.setLastTime(pd.getString("LASTLOGINTIME"));
		user.setCreatTime(pd.getString("CREATETIME"));
		user.setUpdateTime(pd.getString("UPDATETIME"));
		user.setRealName(pd.getString("REALNAME"));
		//user.setIsAdd(pd.getString("ISADD"));
		user.setPic1(pd.getString("PIC1"));
		user.setPic2(pd.getString("PIC2"));
		user.setPic3(pd.getString("PIC3"));
		return user;
	}
	
	public static PageData setPDFromUD(UserData ud){
		PageData pd = new PageData();
		pd.put("USERMANAGE_ID", ud.getId());
		pd.put("ADDRESS", ud.getAddress());
		pd.put("MOBILE",ud.getMobile());
		pd.put("PASSWORD",ud.getPass());
		pd.put("SCORE",ud.getScore());
		pd.put("USERTYPE",ud.getUsertype());
		pd.put("NICKNAME",ud.getNickName());
		pd.put("EMAIL",ud.getEMail());
		pd.put("CARDID", ud.getCardId());
		pd.put("BANKCARD",ud.getBankCard());
		pd.put("WECHAT", ud.getWechat());
		pd.put("PICWECHAT",ud.getPicWechat() );
		pd.put("COMPNUM",ud.getCompNum() );
		pd.put("COMPNAME",ud.getCompName());
		pd.put("PHONE",ud.getPhone() );
		pd.put("REMARK",ud.getRemark());
		pd.put("LASTLOGINTIME",ud.getLastTime());
		pd.put("CREATETIME",ud.getCreatTime());
		pd.put("UPDATETIME",ud.getUpdateTime());
		pd.put("REALNAME",ud.getRealName());
		pd.put("PIC1",ud.getPic1());
		pd.put("PIC2",ud.getPic2());
		pd.put("PIC3",ud.getPic3());
		//pd.put("ISADD", ud.getIsAdd());
		return pd;
	}
	
	public void SetCookie(HttpServletResponse response,String key ,String value ,int timeout) throws Exception{
		Cookie cookie = new Cookie(key,value);
		cookie.setPath("/");
		if (timeout>0) cookie.setMaxAge(timeout);
		response.addCookie(cookie);
		return;
	}
	public Cookie getCookie(HttpServletRequest request,String name){
		 Map<String,Cookie> cookieMap = ReadCookieMap(request);
		    if(cookieMap.containsKey(name)){
		        Cookie cookie = (Cookie)cookieMap.get(name);
		        return cookie;
		    }else{
		        return null;
		    }  
	}
	private static Map<String,Cookie> ReadCookieMap(HttpServletRequest request){  
	    Map<String,Cookie> cookieMap = new HashMap<String,Cookie>();
	    Cookie[] cookies = request.getCookies();
	    if(null!=cookies){
	        for(Cookie cookie : cookies){
	            cookieMap.put(cookie.getName(), cookie);
	        }
	    }
	    return cookieMap;
	}
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		//logBefore(logger, Jurisdiction.getUsername()+"新增UserManage");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("USERMANAGE_ID", this.get32UUID());	//主键
		usermanageService.save(pd);
		mv.addObject("result",1);
		mv.setViewName("save_result");
		return mv;
	}
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
	//	logBefore(logger, Jurisdiction.getUsername()+"删除UserManage");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		usermanageService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		//logBefore(logger, Jurisdiction.getUsername()+"修改UserManage");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		usermanageService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/editype")
	public ModelAndView editype() throws Exception{
		//logBefore(logger, Jurisdiction.getUsername()+"修改UserManage");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		usermanageService.editype(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表UserManage");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = usermanageService.list(page);	//列出UserManage列表
		mv.setViewName("ins/usermanage/usermanage_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		//SetQX(mv);
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
		mv.setViewName("ins/usermanage/usermanage_edit");
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
		pd = usermanageService.findById(pd);	//根据ID读取
		mv.setViewName("ins/usermanage/usermanage_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除UserManage");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			usermanageService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出UserManage到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("username");	//1
		titles.add("密码");	//2
		titles.add("积分");	//3
		titles.add("用户类型");	//4
		titles.add("昵称");	//5
		titles.add("邮箱");	//6
		titles.add("身份证信息");	//7
		titles.add("银行卡");	//8
		titles.add("微信号");	//9
		titles.add("微信号二维码");	//10
		titles.add("公司名");	//11
		titles.add("公司执照号码");	//12
		titles.add("公司地址");	//13
		titles.add("电话号码");	//14
		titles.add("备注");	//15
		titles.add("最后登录时间");	//16
		titles.add("创建时间");	//17
		titles.add("更新时间");	//18
		dataMap.put("titles", titles);
		List<PageData> varOList = usermanageService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("MOBILE"));	//1
			vpd.put("var2", varOList.get(i).getString("PASSWORD"));	//2
			vpd.put("var3", varOList.get(i).get("SCORE").toString());	//3
			vpd.put("var4", varOList.get(i).get("USERTYPE").toString());	//4
			vpd.put("var5", varOList.get(i).getString("NICKNAME"));	//5
			vpd.put("var6", varOList.get(i).getString("EMAIL"));	//6
			vpd.put("var7", varOList.get(i).getString("CARDID"));	//7
			vpd.put("var8", varOList.get(i).getString("BANKCARD"));	//8
			vpd.put("var9", varOList.get(i).getString("WECHAT"));	//9
			vpd.put("var10", varOList.get(i).getString("PICWECHAT"));	//10
			vpd.put("var11", varOList.get(i).getString("COMPNAME"));	//11
			vpd.put("var12", varOList.get(i).getString("COMPNUM"));	//12
			vpd.put("var13", varOList.get(i).getString("ADDRESS"));	//13
			vpd.put("var14", varOList.get(i).getString("PHONE"));	//14
			vpd.put("var15", varOList.get(i).getString("REMARK"));	//15
			vpd.put("var16", varOList.get(i).getString("LASTLOGINTIME"));	//16
			vpd.put("var17", varOList.get(i).getString("CREATETIME"));	//17
			vpd.put("var18", varOList.get(i).getString("UPDATETIME"));	//18
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
	
	public static PageData GetUserData(){
		Subject currentUser = SecurityUtils.getSubject(); 
		Session session = currentUser.getSession();	
		UserData user = (UserData)session.getAttribute(Const.SESSION_USERDATA);
		if(user == null)
		{
			System.out.println("client  not login");
			return null;
		}
		return UserManageController.setPDFromUD(user);
	}
	
	public static void SetQX(ModelAndView mv){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cha", "1");
		map.put("add", "1");
		map.put("del", "1");
		map.put("edit", "1");
		mv.addObject("QX",map);
	}
}


