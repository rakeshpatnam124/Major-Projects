package com.lms.beans;

public class IssuedBook {
	private int bid;
	private String bname;
	private int rid;
	private String reservedDate;
	private String issueDate;
	private String returnedDate;
	private String renewalDate;
	private String status;
	
	public IssuedBook(String bname, String reservedDate) {
		super();
		this.bname = bname;
		this.reservedDate = reservedDate;
	}
	public IssuedBook(int bid, String bname, String reservedDate) {
		super();
		this.bid = bid;
		this.bname = bname;
		this.reservedDate = reservedDate;
	}
	public IssuedBook(int bid, String bname, int rid, String reservedDate) {
		super();
		this.bid = bid;
		this.bname = bname;
		this.rid = rid;
		this.reservedDate = reservedDate;
	}
	public IssuedBook(int bid, String bname, int rid, String reservedDate, String issueDate, String returnedDate,
			String renewalDate, String status) {
		super();
		this.bid = bid;
		this.bname = bname;
		this.rid = rid;
		this.reservedDate = reservedDate;
		this.issueDate = issueDate;
		this.returnedDate = returnedDate;
		this.renewalDate = renewalDate;
		this.status = status;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getReservedDate() {
		return reservedDate;
	}
	public void setReservedDate(String reservedDate) {
		this.reservedDate = reservedDate;
	}
	public String getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}
	public String getReturnedDate() {
		return returnedDate;
	}
	public void setReturnedDate(String returnedDate) {
		this.returnedDate = returnedDate;
	}
	public String getRenewalDate() {
		return renewalDate;
	}
	public void setRenewalDate(String renewalDate) {
		this.renewalDate = renewalDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
