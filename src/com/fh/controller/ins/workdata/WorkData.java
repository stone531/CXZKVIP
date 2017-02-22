package com.fh.controller.ins.workdata;

import java.util.ArrayList;

import com.fh.controller.ins.worksubdata.WorkSubData;


public class WorkData {
	private String N;
	private ArrayList<WorkSubData> S;
	
	public WorkData(){
		this.S = new ArrayList<WorkSubData>();
	}
	
	public void setN(String n){
		this.N = n;
	}
	public void setS(WorkSubData s){
		this.S.add(s);
	}
	public String getN(){
		return this.N;
	}
	public ArrayList<WorkSubData> getS(){
		return this.S;
	}

};