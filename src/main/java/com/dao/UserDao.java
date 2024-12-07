package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.User;

public class UserDao {

	private Connection connection;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public UserDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public String userReg(User user) {
		System.out.println("dao"+user);
		String message = "";
		try {
			String useremail = user.getUser_email();
			String query1 = "select * from user where uemail=?";

			pst = this.connection.prepareStatement(query1);
			pst.setString(1, useremail);

			rs = pst.executeQuery();
			String email="";
			while(rs.next()) {
				 email=	rs.getString("uemail");
				System.out.println(email);
					
			}
			if(email.equals(useremail)) {
				System.out.println("user already registed");
				 message="failure";
			}
			else {
			
					 query = "INSERT INTO user(uname,uemail,upassword,uphone,upic,uaddress,utype) VALUES(?,?,?,?,?,?,?)";

					pst = this.connection.prepareStatement(query);
					pst.setString(1, user.getUser_name());
					pst.setString(2, user.getUser_email());
					pst.setString(3, user.getUser_password());
					pst.setString(4, user.getUser_phone());
					pst.setString(5, user.getUser_pic());
					pst.setString(6, user.getUser_address());
					pst.setString(7, user.getUser_type());
					
					System.out.println(query1);
					
					int b = pst.executeUpdate();
				
					
					if (b != 0) {
						System.out.println("user registed");
						 message = "success";
					} else {
						System.out.println("user not registed");
						message = "failed";
					}

				}
						
		} catch (Exception e) {
			e.printStackTrace();

		}
		return message;

	}
	
	public User loginUser(String email, String password) {
		User user=new User();
		
		try {
			query ="SELECT * FROM user WHERE uemail = ? AND upassword = ?";
					System.out.println("dao"+email);
			pst=this.connection.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
			
			rs=pst.executeQuery();
			
		
			if(rs.next()) {
				System.out.println("dao user login!!");
				user.setUser_email(rs.getString("uemail"));
				user.setUser_password(rs.getString("upassword"));
				user.setUser_name(rs.getString("uname"));
				user.setUser_id(Integer.parseInt(rs.getString("uid")));
				user.setUser_phone(rs.getString("uphone"));
				user.setUser_pic(rs.getString("upic"));
				user.setUser_type(rs.getString("utype"));
			
			}
			else {
				System.out.println("dao user not login");
				return null;
			}
		
		/*
		 
			String uemail="";
			String upassword="";
			
			while(rs.next()) {
				 uemail = rs.getString("uemail");
				upassword =rs.getString("upassword");	 	
			}
			
			if(uemail.equals(email) && upassword.equals(password)) {
				System.out.println("dao user login!!");
				user.setUser_email(uemail);
				user.setUser_password(upassword);
				user.setUser_name(rs.getString("uname"));
				user.setUser_id(Integer.parseInt(rs.getString("uid")));
				user.setUser_phone(rs.getString("uphone"));
				user.setUser_pic(rs.getString("upic"));
				user.setUser_type(rs.getString("utype"));
				
				
			}
			else {
				System.out.println(" dao user not login");
				return null;
			}
			*/
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		
		return user;
		
	
	}
	
	public List<User> getAllUser(){
		
		List<User> user=new ArrayList();
	
		try {
			query="Select * from User";
			
			Statement statement= this.connection.createStatement();
			rs= statement.executeQuery(query);
			
			while(rs.next()) {
				User user1=new User();
				
				user1.setUser_id(rs.getInt("uid"));
				user1.setUser_name(rs.getString("uname"));
				user1.setUser_email(rs.getString("uemail"));
				user1.setUser_password(rs.getString("upassword"));
				user1.setUser_address(rs.getString("uaddress"));
				user1.setUser_phone(rs.getString("uphone"));
				user1.setUser_type(rs.getString("utype"));
				
				user.add(user1);
				
				
			}
		
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return user;
		
		
		
		
	}
}
