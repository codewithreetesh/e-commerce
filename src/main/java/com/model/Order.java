package com.model;

public class Order {
	
	private String oId;
	private String name;
	private String address;
	private String email;
	private int uid;
	private int pid;
	
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(String oId, String name, String address, String email, int uid, int pid) {
		super();
		this.oId = oId;
		this.name = name;
		this.address = address;
		this.email = email;
		this.uid = uid;
		this.pid = pid;
	}

	public String getoId() {
		return oId;
	}
	public void setoId(String oId) {
		this.oId = oId;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

		public int getUid() {
		return uid;
	}


	public void setUid(int uid) {
		this.uid = uid;
	}

	
	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	@Override
	public String toString() {
		return "Order [oId=" + oId + ", name=" + name + ", address=" + address + ", email=" + email + ", uid=" + uid
				+ ", pid=" + pid + "]";
	}

	
	
	
	
}
