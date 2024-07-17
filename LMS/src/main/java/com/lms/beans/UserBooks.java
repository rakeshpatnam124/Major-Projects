package com.lms.beans;

import java.util.List;

public class UserBooks {
	private int rid;
	private List<Integer> bidList;
	
	public UserBooks(int rid) {
		super();
		this.rid = rid;
	}

	public UserBooks(int rid, List<Integer> bidList) {
		super();
		this.rid = rid;
		this.bidList = bidList;
	}
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public List<Integer> getBidList() {
		return bidList;
	}
	public void setBidList(List<Integer> bidList) {
		this.bidList = bidList;
	}
	
	public void addBookId(Integer bid) {
		this.bidList.add(bid);
	}

}
