package com.fh.controller.ins.worksubdata;

import java.util.ArrayList;

import com.fh.controller.ins.workssubdata.WorkSSubData;

public class WorkSubData {
	private String N;
	private ArrayList<WorkSSubData> S;
	
	public WorkSubData(){
		this.S = new ArrayList<WorkSSubData>();
	}
	
	public void setN(String n){
		this.N = n;
	}
	
	public String getN(){
		return this.N;
	}
	
	public void setS(WorkSSubData s){
		this.S.add(s);
	}
	
	public ArrayList<WorkSSubData> getS(){
		return S;
	}
};