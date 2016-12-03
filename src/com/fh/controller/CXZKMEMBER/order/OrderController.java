package com.fh.controller.CXZKMEMBER.order;

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
import com.fh.service.CXZKMEMBER.order.OrderManager;

/** 
 * 说明：订单模块
 * 创建人：FH Q313596790
 * 创建时间：2015-07-06
 */
@Controller
@RequestMapping(value="/order")
public class OrderController extends BaseController {
	
	String menuUrl = "order/list.do"; //菜单地址(权限用)
	@Resource(name="orderService")
	private OrderManager orderService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Order");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ORDER_ID", this.get32UUID());	//主键
		orderService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Order");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		orderService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Order");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		orderService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Order");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = orderService.list(page);	//列出Order列表
		mv.setViewName("CXZKMEMBER/order/order_list");
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
		mv.setViewName("CXZKMEMBER/order/order_edit");
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
		pd = orderService.findById(pd);	//根据ID读取
		mv.setViewName("CXZKMEMBER/order/order_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Order");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			orderService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Order到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("订单日期");	//1
		titles.add("订单编号");	//2
		titles.add("组织id");	//3
		titles.add("公司id");	//4
		titles.add("订单类型");	//5
		titles.add("客户");	//6
		titles.add("缴费人");	//7
		titles.add("成交产品");	//8
		titles.add("产品价格");	//9
		titles.add("折扣率");	//10
		titles.add("成交数量");	//11
		titles.add("成交单价(元)");	//12
		titles.add("成交金额");	//13
		titles.add("缴款方式");	//14
		titles.add("缴款日期");	//15
		titles.add("缴款金额");	//16
		titles.add("有效期");	//17
		titles.add("状态");	//18
		titles.add("备注");	//19
		titles.add("创建时间");	//20
		titles.add("创建人");	//21
		titles.add("最后更新时间");	//22
		titles.add("最后更新人");	//23
		titles.add("退款日期");	//24
		titles.add("是否删除");	//25
		titles.add("票据号");	//26
		dataMap.put("titles", titles);
		List<PageData> varOList = orderService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("OFA_DATE"));	//1
			vpd.put("var2", varOList.get(i).getString("OFA_CODE"));	//2
			vpd.put("var3", varOList.get(i).getString("TRX_ORGANIZATION_ID"));	//3
			vpd.put("var4", varOList.get(i).getString("FIN_ORGANIZATION_ID"));	//4
			vpd.put("var5", varOList.get(i).getString("OFT_TYPE_ID"));	//5
			vpd.put("var6", varOList.get(i).getString("OFA_CUSTOMER_ID"));	//6
			vpd.put("var7", varOList.get(i).getString("MONEY_COUSOMER_ID"));	//7
			vpd.put("var8", varOList.get(i).getString("OFA_ITEM_ID"));	//8
			vpd.put("var9", varOList.get(i).getString("ITEM_PRICE"));	//9
			vpd.put("var10", varOList.get(i).getString("FOR_SALE_RATE"));	//10
			vpd.put("var11", varOList.get(i).getString("OFA_QUANTITY"));	//11
			vpd.put("var12", varOList.get(i).getString("OFA_PRICE"));	//12
			vpd.put("var13", varOList.get(i).getString("OFA_SUM_AMOUNT"));	//13
			vpd.put("var14", varOList.get(i).getString("REAL_TYPE"));	//14
			vpd.put("var15", varOList.get(i).getString("REAL_DATE"));	//15
			vpd.put("var16", varOList.get(i).getString("OFA_AMOUNT"));	//16
			vpd.put("var17", varOList.get(i).getString("OFA_USE_PERIOD"));	//17
			vpd.put("var18", varOList.get(i).getString("STATUS"));	//18
			vpd.put("var19", varOList.get(i).getString("NOTE"));	//19
			vpd.put("var20", varOList.get(i).getString("CREATION_DATE"));	//20
			vpd.put("var21", varOList.get(i).getString("CREATED_BY"));	//21
			vpd.put("var22", varOList.get(i).getString("LAST_UPDATED_DATE"));	//22
			vpd.put("var23", varOList.get(i).getString("LAST_UPDATED_BY"));	//23
			vpd.put("var24", varOList.get(i).getString("TK_DATE"));	//24
			vpd.put("var25", varOList.get(i).getString("ISDELETE"));	//25
			vpd.put("var26", varOList.get(i).getString("OFA_POS"));	//26
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
