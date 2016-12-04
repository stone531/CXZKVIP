package com.fh.controller.CXZKMEMBER.sign;

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
import com.fh.util.ObjectExcelView;
import com.fh.util.Const;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.Jurisdiction;
import com.fh.service.CXZKMEMBER.sign.impl.SignService;

/** 
 * 类名称：SignController
 * 创建人：FH 
 * 创建时间：2016-08-20
 */
@Controller
@RequestMapping(value="/sign")
public class SignController extends BaseController {
	
	String menuUrl = "sign/list.do"; //菜单地址(权限用)
	@Resource(name="signService")
	private  SignService signService;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, "新增Sign");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SIGN_ID", this.get32UUID());	//主键
		signService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger, "删除Sign");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			signService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	//返回1 选择男生
		 //返回2 选择女生
		public static	int GetSEXRandom(int totalManNum,int totalWomanNum){
					//参考 GetStudentRandom
			float rate=(float)totalManNum/((float)totalManNum+(float)totalWomanNum);
			
			//分割值
			int splitVal=(int) (100*rate);
			
			//获取一个【1-100】的随机数
			final double d = Math.random();
			final int i = (int)(d*100);
			//随机出现的值在老生的值范围内
			if (i<=splitVal){
				return 1;
			}
			
			//不是老生就是新生
			return 2;
		}
		
		//返回1 选择老生
		//返回2 选择新生
		public static	int GetStudentRandom(int totalOldNum,int totalRookieNum){
					float rate=(float)totalOldNum/((float)totalOldNum+(float)totalRookieNum);
					
					//分割值
					int splitVal=(int) (100*rate);
					
					//获取一个【1-100】的随机数
					final double d = Math.random();
					
					final int i = (int)(d*100);
					//随机出现的值在老生的值范围内
					if (i<=splitVal){
						return 1;
					}
					
					//不是老生就是新生
					return 2;
					
		}
		/*
		public  void main(String[] args) throws Exception {
	    	
	    	for (int i = 0; i < lists.size(); i++) {
	    		List<PageData> listUser=lists.get(i);
				for (int j = 0; j < listUser.size(); j++) {
					PageData userlist=listUser.get(j);
					System.out.println(userlist.getString("SEX")+"--------------"+userlist.getString("OTHER")+"--------------"+userlist.getString("USERNAME"));
				}
			}
	    }
	    */
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, "修改Sign");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		signService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "列表Sign");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			page.setShowCount(1000);
			int fenzu=8;
			List<PageData> aa=signService.list(page);
			
			
	    	//List<List<User>> list=new ArrayList<List<User>>();
	    	List<PageData>  man_old=new ArrayList<PageData>();
	    	List<PageData> man_rookie=new ArrayList<PageData>();
	    	List<PageData> woman_old=new ArrayList<PageData>();
	    	List<PageData> woman_rookie=new ArrayList<PageData>();
			//man 存放男人
			Map<String, List<PageData>> man=new HashMap<String, List<PageData>>();
			//男人堆里的新生
			man.put("新会员",man_old);
			//男人堆里的老生
			man.put("老会员",man_rookie);
			
			
			//man 存放女人
			Map<String, List<PageData>> woman=new HashMap<String, List<PageData>>();
			
			//女人堆里的新生
			woman.put("新会员",woman_old);
			//女人堆里的老生;
			woman.put("老会员",woman_rookie);
			
			
			//print list info
			
			
			
			//分数据
	    	for (int i = 0; i < aa.size(); i++) {
				PageData user=aa.get(i);
				if(user.getString("SEX").equals("男")){

					if(user.getString("OTHER").equals("新会员")){
						
						man_rookie.add(user);

					}else{
						
						man_old.add(user);

					}
				}else{	
					if(user.getString("OTHER").equals("新会员")){
						
						woman_rookie.add(user);
					}else{
						
						woman_old.add(user);
					}
				}
			}
			
			
	    	//System.out.println("一共"+aa.size()+"人，其中男生:"+man-old.size()+man-rookie.size()+"，男生中新生："+man-rookie.size()+",老生:"+man-old.size()+",女生:"+woman-old.size()+woman-rookie.size()+",女生中新生:"+woman-rookie.size()+",老生:"woman-old.size());

			
			
			
			//假设总人数为8人
			int Total=aa.size();
			//平均每组人数 2  人
			int average=Total/fenzu;
			int woman_old_size=woman_old.size();
			int man_old_size= man_old.size();
			int woman_rookie_size =woman_rookie.size();
			int man_rookie_size= man_rookie.size();
			//1老2新，1男2女
	    	List<List<PageData>> lists=new ArrayList<List<PageData>>();
	    	for (int i = 0; i < fenzu; i++) {
	    		List<PageData> list=new ArrayList<PageData>();
				for (int j=0;j<average;j++){
					int stu=GetStudentRandom(woman_old_size+man_old_size,woman_rookie_size+man_rookie_size);
					int SEX=GetSEXRandom(man_old_size+man_rookie_size,woman_old_size+woman_rookie_size);
					PageData user=new PageData();
					//按照产生的随机值，选择人
					switch (stu){
						case 1:
							
							if (SEX==1){
								if(man_old.size()>0){
								user=man_old.get(0);
								list.add(user);
								//...
								//将user加入地i个分组
								//...
								man_old.remove(user);
								}else{
								 user=aa.get(0);
								 if(user.getString("SEX").equals("男")){
										if(user.getString("OTHER").equals("新会员")){
											man_rookie.remove(user);
										}else{
											man_old.remove(user);

										}
									}else{	
										if(user.getString("OTHER").equals("新会员")){
											woman_rookie.remove(user);
										}else{
											woman_old.remove(user);
										}
									}
								list.add(user);
								}
							}else if(SEX==2) {
								if(woman_old.size()>0){
									 user=woman_old.get(0);
									list.add(user);
									//...
									//将user加入地i个分组
									//...
									woman_old.remove(user);
									}else{
										user=aa.get(0);
										 if(user.getString("SEX").equals("男")){
												if(user.getString("OTHER").equals("新会员")){
													man_rookie.remove(user);
												}else{
													man_old.remove(user);

												}
											}else{	
												if(user.getString("OTHER").equals("新会员")){
													woman_rookie.remove(user);
												}else{
													woman_old.remove(user);
												}
											}
										list.add(user);
									}
							}else{
								
							}
							
							break;
						case 2:
							//处理方式同上
						
							if (SEX==1){
								if(man_rookie.size()>0){
									user=man_rookie.get(0);
									list.add(user);
									//...
									//将user加入地i个分组
									//...
									man_rookie.remove(user);
									}else{
										user=aa.get(0);
										 if(user.getString("SEX").equals("男")){
												if(user.getString("OTHER").equals("新会员")){
													man_rookie.remove(user);
												}else{
													man_old.remove(user);

												}
											}else{	
												if(user.getString("OTHER").equals("新会员")){
													woman_rookie.remove(user);
												}else{
													woman_old.remove(user);
												}
											}
										list.add(user);
									}
							}else if(SEX==2) {
								if(woman_rookie.size()>0){
								user=woman_rookie.get(0);
								list.add(user);
								//...
								//将user加入地i个分组
								//...
								woman_rookie.remove(user);
								}else{
									user=aa.get(0);
									 if(user.getString("SEX").equals("男")){
											if(user.getString("OTHER").equals("新会员")){
												man_rookie.remove(user);
											}else{
												man_old.remove(user);

											}
										}else{	
											if(user.getString("OTHER").equals("新会员")){
												woman_rookie.remove(user);
											}else{
												woman_old.remove(user);
											}
										}
									list.add(user);
								}
							}else{
								
							}
							break;
						default:
							
					} 
					aa.remove(user);
				}
	    		lists.add(list);
	    	}
	    	int yushu=Total%fenzu;
	    	
	    	for (int i = 0; i < yushu; i++) {
				List<PageData> pageDataslist=lists.get(i);
				PageData p=aa.get(i);
				pageDataslist.add(p);
			}
	    	String phones="";
	    	for (int i = 0; i < lists.size(); i++) {
	    		List<PageData> listUser=lists.get(i);
				for (int j = 0; j < listUser.size(); j++) {
					PageData userlist=listUser.get(j);
					if(userlist.getString("USERPHONE") !=null &&userlist.getString("USERPHONE") != ""){
					phones=phones+userlist.getString("USERPHONE")+";";
					}
					System.out.println(userlist.getString("SEX")+"--------------"+userlist.getString("OTHER")+"--------------"+userlist.getString("USERNAME")+"------------"+(i+1));
				}
				System.out.println();
			}
	    	System.out.println(phones);
			mv.setViewName("member/sign/sign_list");
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		logBefore(logger, "去新增Sign页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("member/sign/sign_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		logBefore(logger, "去修改Sign页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = signService.findById(pd);	//根据ID读取
			mv.setViewName("member/sign/sign_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, "批量删除Sign");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "dell")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				signService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/*
	 * 导出到excel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, "导出Sign到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("姓名");	//1
			titles.add("性别");	//2
			titles.add("学员类别");	//3
			dataMap.put("titles", titles);
			List<PageData> varOList = signService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("USERNAME"));	//1
				vpd.put("var2", varOList.get(i).getString("SEX"));	//2
				vpd.put("var3", varOList.get(i).getString("OTHER"));	//3
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/* ===============================权限================================== */
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================权限================================== */
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
