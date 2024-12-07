package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.Addcart;

public class AddCartDao {
	
	private Connection connection;
	private String query;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	public AddCartDao(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public String addCart(Addcart cart) {
		String message="";
	
		try {
			query="Insert into addcart(pid,pname,pdesc,photo,pprice,disount,c_id) values(?,?,?,?,?,?,?)";
			
			ps=this.connection.prepareStatement(query);
			ps.setInt(1, cart.getPid());
			ps.setString(2, cart.getPname());
			ps.setString(3, cart.getPdesc());
			ps.setString(4, cart.getPphoto());
			ps.setDouble(5, cart.getPprice());
			ps.setDouble(6, cart.getPdisount());
			ps.setInt(7, cart.getCid());

			int result = ps.executeUpdate();
		
			if(result>1) {
				message="success";
			}
			else {
				message="failure";
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	
		return message;
	}
	
}
