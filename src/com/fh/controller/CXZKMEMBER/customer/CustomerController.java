package com.fh.controller.CXZKMEMBER.customer;

import java.io.File;
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
import com.fh.entity.system.Dictionaries;
import com.fh.entity.system.User;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.PropertiesUtil;
import com.fh.service.CXZKMEMBER.customer.CustomerManager;
import com.fh.service.system.dictionaries.DictionariesManager;


/** 
 * 说明：会员管理
 * 创建人：FH Q313596790
 * 创建时间：2015-07-06
 */
@Controller
@RequestMapping(value="/customer")
public class CustomerController extends BaseController {
	
	String menuUrl = "customer/list.do"; //菜单地址(权限用)
	@Resource(name="customerService")
	private CustomerManager customerService;
	@Resource
	private DictionariesManager dictionariesManager;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Customer");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CUSTOMER_ID", this.get32UUID());	//主键
		pd.put("CUS_STATUS",1);
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user=(User)session.getAttribute(Const.SESSION_USER);
		pd.put("CUS_COMPANY_SS",user.getDepartment_id());
		customerService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Customer");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		customerService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Customer");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();	
		pd.put("CUS_COMPANY_SS",session.getAttribute(Const.SESSION_allDepList).toString());
		customerService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Customer");
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
		
		//教育程度
		pd.put("PARENT_ID",PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "jycd_ID"));
		List<PageData> jycd = dictionariesManager.dictlistPd(pd);
		//行业
		pd.put("PARENT_ID",PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "hy_ID"));
		List<PageData> hy = dictionariesManager.dictlistPd(pd);
		//职务
		pd.put("PARENT_ID",PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "zw_ID"));
		List<PageData> ZW = dictionariesManager.dictlistPd(pd);
		mv.addObject("jycd", jycd);
		mv.addObject("hy", hy);
		mv.addObject("ZW", ZW);
		List<PageData>	varList = customerService.list(page);	//列出Customer列表
		mv.setViewName("CXZKMEMBER/customer/customer_list");
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
		pd.put("OFA_CODE",getCode());
		//地区
		pd.put("PARENT_ID", PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "dq_id"));
		List<PageData> Province = dictionariesManager.dictlistPd(pd);
		//市
		pd.put("PARENT_ID",pd.getString("CUS_PROVINCE_ID"));
		List<PageData> CityList = dictionariesManager.dictlistPd(pd);
		//区
		pd.put("PARENT_ID", pd.getString("CUS_CITY"));
		List<PageData> COUNTYList = dictionariesManager.dictlistPd(pd);
		//教育程度
		pd.put("PARENT_ID",PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "jycd_ID"));
		List<PageData> jycd = dictionariesManager.dictlistPd(pd);
		//行业
		pd.put("PARENT_ID",PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "hy_ID"));
		List<PageData> hy = dictionariesManager.dictlistPd(pd);
		//职务
		pd.put("PARENT_ID",PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "zw_ID"));
		List<PageData> ZW = dictionariesManager.dictlistPd(pd);
		//会员等级
		pd.put("PARENT_ID",PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "CUSTOMER_LEVEL"));
		List<PageData> LEVEL = dictionariesManager.dictlistPd(pd);
		mv.addObject("Province",Province);
		mv.addObject("jycd",jycd);
		mv.addObject("hy",hy);
		mv.addObject("ZW",ZW);
		mv.addObject("level",LEVEL);
		mv.addObject("CityList",CityList);
		mv.addObject("COUNTYList",COUNTYList);
		mv.setViewName("CXZKMEMBER/customer/customer_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	/**去详细页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goDetail")
	public ModelAndView goDetail()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = customerService.findById(pd);	//根据ID读取
		//地区
		pd.put("PARENT_ID", PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "dq_id"));
		List<PageData> Province = dictionariesManager.dictlistPd(pd);
		pd.put("PARENT_ID",pd.getString("CUS_PROVINCE_ID"));
		List<PageData> CityList = dictionariesManager.dictlistPd(pd);
		//区
		pd.put("PARENT_ID", pd.getString("CUS_CITY"));
		List<PageData> COUNTYList = dictionariesManager.dictlistPd(pd);
		//教育程度
		pd.put("PARENT_ID",PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "jycd_ID"));
		List<PageData> jycd = dictionariesManager.dictlistPd(pd);
		//行业
		pd.put("PARENT_ID",PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "hy_ID"));
		List<PageData> hy = dictionariesManager.dictlistPd(pd);
		//职务
		pd.put("PARENT_ID",PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "zw_ID"));
		List<PageData> ZW = dictionariesManager.dictlistPd(pd);
		//会员等级
		pd.put("PARENT_ID",PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "CUSTOMER_LEVEL"));
		List<PageData> LEVEL = dictionariesManager.dictlistPd(pd);
		mv.addObject("Province",Province);
		mv.addObject("CityList",CityList);
		mv.addObject("COUNTYList",COUNTYList);
		mv.addObject("jycd",jycd);
		mv.addObject("hy",hy);
		mv.addObject("ZW",ZW);
		mv.addObject("level",LEVEL);
		mv.setViewName("CXZKMEMBER/customer/customer_detail");
		//图片路径
		String rootPath=this.getClass().getResource("/").getFile().toString();
		String imageSrc=PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "image_route")+pd.getString("CUS_ID_CARD")+".bmp";
		  //windows下
		  if("\\".equals(File.separator)){   
		   rootPath  = rootPath.substring(1,rootPath.indexOf("/WEB-INF/classes"))+"/"+imageSrc;
		   rootPath = rootPath.replace("/", "\\");
		  }
		  //linux下
		  if("/".equals(File.separator)){   
		   rootPath  = rootPath.substring(0,rootPath.indexOf("/WEB-INF/classes"))+"/"+imageSrc;
		   rootPath = rootPath.replace("\\", "/");
		  }
		
		File file = new File(rootPath);
		if(file.exists()){
			pd.put("imagesrc",imageSrc);
		}else{
			pd.put("imagesrc", PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "image_route")+"32jpg.jpg");
		}
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	private String getCode() throws NumberFormatException, Exception{
		String code=DateUtil.getDays()+"-"+new Date().getTime()+"-"+((int)((Math.random()*9+1)*100));
		PageData pd = new PageData();
		pd.put("OFA_CODE", code);
		return code;
	}
	private synchronized int getQiHao(){
		int qihao=Integer.parseInt(PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "qihao"));
		int qihao1=qihao+1;
		PropertiesUtil.setValue(Const.SYSTEMPROPERTIES, "qihao",qihao1+"");
		return qihao;
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
		pd = customerService.findById(pd);	//根据ID读取
		//地区
		pd.put("PARENT_ID", PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "dq_id"));
		List<PageData> Province = dictionariesManager.dictlistPd(pd);
		pd.put("PARENT_ID",pd.getString("CUS_PROVINCE_ID"));
		List<PageData> CityList = dictionariesManager.dictlistPd(pd);
		//区
		pd.put("PARENT_ID", pd.getString("CUS_CITY"));
		List<PageData> COUNTYList = dictionariesManager.dictlistPd(pd);
		//教育程度
		pd.put("PARENT_ID",PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "jycd_ID"));
		List<PageData> jycd = dictionariesManager.dictlistPd(pd);
		//行业
		pd.put("PARENT_ID",PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "hy_ID"));
		List<PageData> hy = dictionariesManager.dictlistPd(pd);
		//职务
		pd.put("PARENT_ID",PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "zw_ID"));
		List<PageData> ZW = dictionariesManager.dictlistPd(pd);
		//会员等级
		pd.put("PARENT_ID",PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "CUSTOMER_LEVEL"));
		List<PageData> LEVEL = dictionariesManager.dictlistPd(pd);
		mv.addObject("Province",Province);
		mv.addObject("CityList",CityList);
		mv.addObject("COUNTYList",COUNTYList);
		mv.addObject("jycd",jycd);
		mv.addObject("hy",hy);
		mv.addObject("ZW",ZW);
		mv.addObject("level",LEVEL);
		mv.setViewName("CXZKMEMBER/customer/customer_edit");
		//图片路径
		String rootPath=this.getClass().getResource("/").getFile().toString();
		String imageSrc=PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "image_route")+pd.getString("CUS_ID_CARD")+".bmp";
		String imageSrcly=(rootPath.substring(0,rootPath.lastIndexOf("/WEB-INF"))+"\\"+PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "image_route")+pd.getString("CUS_ID_CARD")+".bmp").replace("/", "\\");
		File file = new File(imageSrcly);
		if(file.exists()){
			pd.put("imagesrc",imageSrc);
		}else{
			pd.put("imagesrc", PropertiesUtil.getValue(Const.SYSTEMPROPERTIES, "image_route")+"32jpg.jpg");
		}
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Customer");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			customerService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	@RequestMapping("/getCityByProvince")  
    public void getCityByProvince(HttpServletRequest request, HttpServletResponse response)  
	 {  
        PrintWriter out = null;  
        try  
        {  
            String provinceId = request.getParameter("provinceId");  
              
            // 设置输出格式  
            response.setContentType("text/html");  
            response.setCharacterEncoding("UTF-8");
            // 页面输出对象  
            out = response.getWriter();
            PageData pd = new PageData();
            pd.put("PARENT_ID", provinceId);
            List<PageData> cityList = dictionariesManager.dictlistPd(pd);
            StringBuffer sb = new StringBuffer();  
            if (null != cityList)  
	        {  
	            
	            sb.append("[");  
	              
	            //得到集合的长度  
	            int size = cityList.size();  
	            int i = 0;  
	              
	            for (PageData p : cityList)  
	            {  
	                i++;  
	                  
	                String cityId = p.getString("DICTIONARIES_ID"); 
	                String cityName = p.getString("NAME"); 
	                sb.append("{\"cityId\":\"");  
	                sb.append(cityId);  
	                sb.append("\",\"cityName\":\"");  
	                sb.append(cityName);  
	                sb.append("\"}");  
	                //如果i小于size字符串sb中加","  
	                if (i < size)  
	                {  
	                    sb.append(",");  
	                }  
	            }  
	              
	            sb.append("]");  
	              
	            //拼好的字符串赋值给变量  
	            //return sb.toString();  
	        }  
	        else  
	        {  
	             
	        }  
            out.write(sb.toString());  
            out.flush();  
            out.close();  
              
        }  
        catch (Exception e)  
        {  
            if (null != out)  
            {  
                out.write("[]");  
                out.flush();  
                out.close();  
            }  
        }  
}
	@RequestMapping("/getAreaByCity")  
    public void getAreaByCity(HttpServletRequest request, HttpServletResponse response)  
	 {  
        PrintWriter out = null;  
        try  
        {  
            String cityId = request.getParameter("cityId");  
              
            // 设置输出格式  
            response.setContentType("text/html");  
            response.setCharacterEncoding("UTF-8");
            PageData pd=new PageData();
            //查询区县
            pd.put("PARENT_ID", cityId);
            List<PageData> cityList = dictionariesManager.dictlistPd(pd);
            StringBuffer sb = new StringBuffer();  
            if (null != cityList)
	        {  
	            sb.append("[");  
	              
	            //得到集合的长度  
	            int size = cityList.size();  
	            int i = 0;  
	              
	            for (PageData p : cityList)  
	            {  
	                i++;  
	                String areaId = p.getString("DICTIONARIES_ID"); 
	                String areaName = p.getString("NAME"); 
	                sb.append("{\"areaId\":\"");  
	                sb.append(areaId);  
	                sb.append("\",\"areaName\":\"");  
	                sb.append(areaName);
	                sb.append("\"}");  
	                //如果i小于size字符串sb中加","  
	                if (i < size)
	                {
	                    sb.append(",");  
	                }
	            }  
	              
	            sb.append("]");
	        }
	        else  
	        {  
	        }  
            // 页面输出对象  
            out = response.getWriter();  
            out.write(sb.toString());  
            out.flush();  
            out.close();  
              
        }  
        catch (Exception e)  
        {  
            if (null != out)  
            {  
                out.write("[]");  
                out.flush();  
                out.close();  
            }  
        }  
}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Customer到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("会员id");	//1
		titles.add("客户编号");	//2
		titles.add("客户姓名");	//3
		titles.add("客户类型");	//4
		titles.add("状态");	//5
		titles.add("公司名称");	//6
		titles.add("职务");	//7
		titles.add("公司简介");	//8
		titles.add("证件号码");	//9
		titles.add("性别");	//10
		titles.add("国家");	//11
		titles.add("省份");	//12
		titles.add("城市");	//13
		titles.add("区县");	//14
		titles.add("办公地址");	//15
		titles.add("传真");	//16
		titles.add("网址");	//17
		titles.add("电话");	//18
		titles.add("家庭地址");	//19
		titles.add("备注");	//20
		titles.add("创建时间");	//21
		titles.add("创建人");	//22
		titles.add("最后更新时间");	//23
		titles.add("最后更新人");	//24
		titles.add("教育程度");	//25
		titles.add("会员上课期号");	//26
		titles.add("会员等级");	//27
		dataMap.put("titles", titles);
		List<PageData> varOList = customerService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("CUSTOMER_ID"));	//1
			vpd.put("var2", varOList.get(i).getString("CUSTOMER_CODE"));	//2
			vpd.put("var3", varOList.get(i).getString("CUSTOMER_NAME"));	//3
			vpd.put("var4", varOList.get(i).getString("CUS_TYPE"));	//4
			vpd.put("var5", varOList.get(i).getString("CUS_STATUS"));	//5
			vpd.put("var6", varOList.get(i).getString("CUS_COMPANY"));	//6
			vpd.put("var7", varOList.get(i).getString("CUS_DUTY"));	//7
			vpd.put("var8", varOList.get(i).getString("CUS_INTRODUCTION"));	//8
			vpd.put("var9", varOList.get(i).getString("CERTIFICATE_NUMBER"));	//9
			vpd.put("var10", varOList.get(i).getString("CUS_SEX"));	//10
			vpd.put("var11", varOList.get(i).getString("CUS_COUNTRY_ID"));	//11
			vpd.put("var12", varOList.get(i).getString("CUS_PROVINCE_ID"));	//12
			vpd.put("var13", varOList.get(i).getString("CUS_CITY"));	//13
			vpd.put("var14", varOList.get(i).getString("CUS_COUNTY"));	//14
			vpd.put("var15", varOList.get(i).getString("CUS_BUSINESS_ADDRESS"));	//15
			vpd.put("var16", varOList.get(i).getString("CUS_FAX"));	//16
			vpd.put("var17", varOList.get(i).getString("CUS_WEB_SITE"));	//17
			vpd.put("var18", varOList.get(i).getString("CUS_MOBILE_TEL"));	//18
			vpd.put("var19", varOList.get(i).getString("CUS_HOME_ADDRESS"));	//19
			vpd.put("var20", varOList.get(i).getString("CUS_NOTE"));	//20
			vpd.put("var21", varOList.get(i).getString("CREATION_DATE"));	//21
			vpd.put("var22", varOList.get(i).getString("CREATED_BY"));	//22
			vpd.put("var23", varOList.get(i).getString("LAST_UPDATE_DATE"));	//23
			vpd.put("var24", varOList.get(i).getString("LAST_UPDATED_BY"));	//24
			vpd.put("var25", varOList.get(i).getString("EDUCATION_ID"));	//25
			vpd.put("var26", varOList.get(i).getString("CUSTOMER_NUMBER"));	//26
			vpd.put("var27", varOList.get(i).getString("CUSTOMER_LEVEL"));	//27
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
