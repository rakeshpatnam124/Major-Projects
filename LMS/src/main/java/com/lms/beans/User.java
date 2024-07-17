package com.lms.beans;

public class User {
	private int id;
	private String name;
	private String idNumber;
	private String email;
	private String password;
	private String mobile;
	private String address;
	private String role;
	
	public User(int id, String name,String idNumber, String email, String mobile, String address) {
		super();
		this.id = id;
		this.name = name;
		this.idNumber = idNumber;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
	}
	
	public User(int id, String name,String idNumber, String email, String mobile, String address, String role) {
		super();
		this.id = id;
		this.name = name;
		this.idNumber = idNumber;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
		this.role = role;
	}

	public User(String name, String email, String password, String mobile, String address, String role) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.mobile = mobile;
		this.address = address;
		this.role = role;
	}

	public User(int id, String name, String idNumber, String email, String password, String mobile, String address,
			String role) {
		super();
		this.id = id;
		this.name = name;
		this.idNumber = idNumber;
		this.email = email;
		this.password = password;
		this.mobile = mobile;
		this.address = address;
		this.role = role;
	}

	public User(String name, String idNumber, String email, String password, String mobile, String address,
			String role) {
		super();
		this.name = name;
		this.idNumber = idNumber;
		this.email = email;
		this.password = password;
		this.mobile = mobile;
		this.address = address;
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String rollNumber) {
		this.idNumber = rollNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
}
