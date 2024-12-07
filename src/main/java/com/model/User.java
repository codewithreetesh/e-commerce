package com.model;

public class User {
	
	private int user_id;
	private String user_name;
	private String user_email;
	private String user_password;
	private String user_phone;
	private String user_pic;
	private String user_address;
	private String user_type;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int user_id, String user_name, String user_email, String user_password, String user_phone,
			String user_pic, String user_address  , String user_type) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_password = user_password;
		this.user_phone = user_phone;
		this.user_pic = user_pic;
		this.user_address = user_address;
		this.user_type = user_type;
	}

	public User(String user_name, String user_email, String user_password, String user_phone, String user_pic,
			String user_address ,String user_type) {
		super();
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_password = user_password;
		this.user_phone = user_phone;
		this.user_pic = user_pic;
		this.user_address = user_address;
		this.user_type = user_type;
		
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_pic() {
		return user_pic;
	}

	public void setUser_pic(String user_pic) {
		this.user_pic = user_pic;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_name=" + user_name + ", user_email=" + user_email
				+ ", user_password=" + user_password + ", user_phone=" + user_phone + ", user_pic=" + user_pic
				+ ", user_address=" + user_address + ", user_type=" + user_type + "]";
	}

	
	  
}
