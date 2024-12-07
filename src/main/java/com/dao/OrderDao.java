package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Order;

public class OrderDao {
	
	private Connection connection;
	private String query;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public OrderDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public Order giveOrder(Order order) {
		System.out.println("dao++++"+order);
		Order obj=new Order();
		try {
			query = "INSERT INTO orders (oid, name, email, address, uid) VALUES (?, ?, ?, ?, ?)";
			
			ps = this.connection.prepareStatement(query);		
			ps.setString(1, order.getoId());
			ps.setString(2, order.getName());
			ps.setString(3, order.getEmail());
			ps.setString(4, order.getAddress());
			ps.setInt(5, order.getUid());
			
			int result= ps.executeUpdate();		
			
			System.out.println("result"+result);
			if(result>0) {
				System.out.println("order done");
				obj.setoId(order.getoId());
				obj.setName(order.getName());
				obj.setEmail(order.getEmail());
				obj.setAddress(order.getAddress());
				obj.setUid(order.getUid());
				
			}
			else {
				System.out.println("order not done");
				
			}
			
		}
		catch(Exception e  ) {
			e.printStackTrace();
		}
		return obj;
	}
	
	public List<Order> getAllOrder(){

		List<Order> orders=new ArrayList();
		
		try{
			query="select * from orders";
			
			Statement statement = this.connection.createStatement();
			rs = statement.executeQuery(query);
			
			System.out.println(rs);
			while(rs.next()) {
				Order order=new Order();
		
				order.setoId(rs.getString(1));
				order.setName(rs.getString(2));
				order.setEmail(rs.getString(3));
				order.setAddress(rs.getString(4));
				order.setUid(rs.getInt(5));
				
				orders.add(order);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return orders;
		
	}
	
}
