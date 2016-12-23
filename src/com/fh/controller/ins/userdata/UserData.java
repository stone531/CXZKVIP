package com.fh.controller.ins.userdata;

public class UserData {
	private String USERMANAGE_ID;
	private String MOBILE;
	private String PASSWORD;
	private int SCORE;
	private String USERTYPE;
	private String NICKNAME;
	private String EMAIL;
	private String CARDID;
	private String BANKCARD;
	private String WECHAT;
	private String PICWECHAT;
	private String COMPNAME;
	private String COMPNUM;
	private String ADDRESS;
	private String PHONE;
	private String REMARK;
	private String LASTLOGINTIME;
	private String CREATETIME;
	private String UPDATETIME;
	private String REALNAME;
	private String PIC1;
	private String PIC2;
	private String PIC3;
	private String ISADD;
	
	public void setId(String id){
		this.USERMANAGE_ID = id;
	}
	public String getId(){
		return this.USERMANAGE_ID;
	}
	public void setUpdateTime(String time){
		this.UPDATETIME = time;
	}
	public String getUpdateTime(){
		return this.UPDATETIME;
	}
	public void setCreatTime(String time){
		this.CREATETIME = time;
	}
	public String getCreatTime(){
		return this.CREATETIME;
	}
	public void setLastTime(String time){
		this.LASTLOGINTIME = time;
	}
	public String getLastTime(){
		return this.LASTLOGINTIME;
	}
	public void setRemark(String remark){
		this.REMARK = remark;
	}
	public String getRemark(){
		return this.REMARK;
	}
	public void setPhone(String phone){
		this.PHONE = phone;
	}
	public String getPhone(){
		return this.PHONE;
	}
	public void setAddress(String addr){
		this.ADDRESS = addr;
	}
	public String getAddress(){
		return this.ADDRESS;
	}
	public void setCompNum(String num){
		this.COMPNUM = num;
	}
	public String getCompNum(){
		return this.COMPNUM;
	}
	public void setCompName(String compname){
		this.COMPNAME = compname;
	}
	public String getCompName(){
		return this.COMPNAME;
	}
	public void setPicWechat(String pic){
		this.PICWECHAT = pic;
	}
	public String getPicWechat (){
		return this.PICWECHAT;
	}
	public void setWechat(String wechat){
		this.WECHAT = wechat;
	}
	public String getWechat(){
		return this.WECHAT;
	}
	public void setBankCard(String bankcard){
		this.BANKCARD = bankcard;
	}
	public String getBankCard(){
		return this.BANKCARD;
	}
	public void setCardId(String cardId){
		this.CARDID = cardId;
	}
	public String getCardId(){
		return this.CARDID;
	}
	public void setEmail(String Email){
		this.EMAIL = Email;
	}
	public String getEMail(){
		return this.EMAIL;
	}
	public void setNickName(String nickname){
		this.NICKNAME = nickname;
	}
	public String getNickName() {
		return this.NICKNAME;
	}
	public String getMobile(){
		return this.MOBILE;
	}
	public void setMobile(String mobile){
		this.MOBILE = mobile;
	}
	public String getPass(){
		return this.PASSWORD;
	}
	public void setPass(String pass){
		this.PASSWORD = pass;
	}
	public int getScore(){
		return this.SCORE;
	}
	public void setScore(int score){
		this.SCORE = score;
	}
	public String getUsertype(){
		return this.USERTYPE;
	}
	public void setUsertype(String usertype){
		this.USERTYPE = usertype;
	}
	public String getRealName(){
		return this.REALNAME;
	}
	public void setRealName(String realname){
		this.REALNAME = realname;
	}
	public String getPic1(){
		return this.PIC1;
	}
	public void setPic1(String pic1){
		this.PIC1 = pic1;
	}
	public String getPic2(){
		return this.PIC2;
	}
	public void setPic2(String pic1){
		this.PIC2 = pic1;
	}
	public String getPic3(){
		return this.PIC3;
	}
	public void setPic3(String pic1){
		this.PIC3 = pic1;
	}
	public String getIsAdd(){
		return this.ISADD;
	}
	public void setIsAdd(String isadd){
		this.ISADD = isadd;
	}
};