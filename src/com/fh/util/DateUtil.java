package com.fh.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.fh.entity.system.User;

/** 
 * 说明：日期处理
 * 创建人：FH Q313596790
 * 修改时间：2015年11月24日
 * @version
 */
public class DateUtil {
	
	private final static SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy");
	private final static SimpleDateFormat sdfDay = new SimpleDateFormat("yyyy-MM-dd");
	private final static SimpleDateFormat sdfDays = new SimpleDateFormat("yyyyMMdd");
	private final static SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	/**
	 * 获取YYYY格式
	 * @return
	 */
	public static String getYear() {
		return sdfYear.format(new Date());
	}

	/**
	 * 获取YYYY-MM-DD格式
	 * @return
	 */
	public static String getDay() {
		return sdfDay.format(new Date());
	}
	
	/**
	 * 获取YYYYMMDD格式
	 * @return
	 */
	public static String getDays(){
		return sdfDays.format(new Date());
	}

	/**
	 * 获取YYYY-MM-DD HH:mm:ss格式
	 * @return
	 */
	public static String getTime() {
		return sdfTime.format(new Date());
	}

	/**
	* @Title: compareDate
	* @Description: TODO(日期比较，如果s>=e 返回true 否则返回false)
	* @param s
	* @param e
	* @return boolean  
	* @throws
	* @author fh
	 */
	public static boolean compareDate(String s, String e) {
		if(fomatDate(s)==null||fomatDate(e)==null){
			return false;
		}
		return fomatDate(s).getTime() >=fomatDate(e).getTime();
	}

	/**
	 * 格式化日期
	 * @return
	 */
	public static Date fomatDate(String date) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return fmt.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 校验日期是否合法
	 * @return
	 */
	public static boolean isValidDate(String s) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			fmt.parse(s);
			return true;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return false;
		}
	}
	
	/**
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public static int getDiffYear(String startTime,String endTime) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			//long aa=0;
			int years=(int) (((fmt.parse(endTime).getTime()-fmt.parse(startTime).getTime())/ (1000 * 60 * 60 * 24))/365);
			return years;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return 0;
		}
	}
	 
	/**
     * <li>功能描述：时间相减得到天数
     * @param beginDateStr
     * @param endDateStr
     * @return
     * long 
     * @author Administrator
     */
    public static long getDaySub(String beginDateStr,String endDateStr){
        long day=0;
        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
        java.util.Date beginDate = null;
        java.util.Date endDate = null;
        
            try {
				beginDate = format.parse(beginDateStr);
				endDate= format.parse(endDateStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
            day=(endDate.getTime()-beginDate.getTime())/(24*60*60*1000);
            //System.out.println("相隔的天数="+day);
      
        return day;
    }
    
    /**
     * 得到n天之后的日期
     * @param days
     * @return
     */
    public static String getAfterDayDate(String days) {
    	int daysInt = Integer.parseInt(days);
    	
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        
        SimpleDateFormat sdfd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr = sdfd.format(date);
        
        return dateStr;
    }
    
    /**
     * 得到n天之后是周几
     * @param days
     * @return
     */
    public static String getAfterDayWeek(String days) {
    	int daysInt = Integer.parseInt(days);
        Calendar canlendar = Calendar.getInstance(); // java.util包
        canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
        Date date = canlendar.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("E");
        String dateStr = sdf.format(date);
        return dateStr;
    }
    public static void main(String[] args) {
    	int fenzu=4;
    	List<User> aa=new ArrayList<User>();
    	User u=new User();
    	u.setSex("男");
    	u.setBz("老生");
    	User u1=new User();
    	u1.setSex("男");
    	u1.setBz("老生");
    	User u2=new User();
    	u2.setSex("男");
    	u2.setBz("新生");
    	User u3=new User();
    	u3.setSex("男");
    	u3.setBz("新生");
    	User u4=new User();
    	u4.setSex("男");
    	u4.setBz("新生");
    	User u5=new User();
    	u5.setSex("女");
    	u5.setBz("新生");
    	User u6=new User();
    	u6.setSex("女");
    	u6.setBz("老生");
    	User u7=new User();
    	u7.setSex("男");
    	u7.setBz("新生");
    	aa.add(u);
    	aa.add(u1);
    	aa.add(u2);
    	aa.add(u3);
    	aa.add(u4);
    	aa.add(u5);
    	aa.add(u6);
    	aa.add(u7);
    	List<List<User>> list=new ArrayList<List<User>>();
    	int size=aa.size();
    	int people_man=0;
    	int people_woman=0;
    	int people_man_LS=0;
    	int people_man_XS=0;
    	int people_woman_LS=0;
    	int people_woman_XS=0;
    	for (int i = 0; i < aa.size(); i++) {
			User user=aa.get(i);
			if(user.getSex().equals("男")){
				people_man++;
				if(user.getBz().equals("新生")){
					people_man_XS++;
				}else{
					people_man_LS++;
				}
			}else{
				people_woman++;
				if(user.getBz().equals("新生")){
					people_woman_XS++;
				}else{
					people_woman_LS++;
				}
			}
		}
    	System.out.println("一共"+aa.size()+"人，其中男生:"+people_man+"，男生中新生："+people_man_XS+",老生:"+people_man_LS+",女生:"+people_woman+",女生中新生:"+people_woman_XS+",老生:"+people_woman_LS);
    		for (int i = 0; i < fenzu; i++) {
				
			}
    		/*
    		for (int i = 0; i < fenzu; i++) {
    			List<User> list1=new ArrayList<User>();
    			if(aa.size()>0){
    				for (int j = 0; j < size; j++) {	
    					User user=aa.get(j);
    					if(user.getSex().equals("男")){
    						list1.add(user);
    						aa.remove(user);
    						break;
    					}else{
    						list1.add(user);
    						aa.remove(user);
    						break;
    					}
    				}
    			list.add(list1);
    			}
    			
    		}*/
    }
}
