package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Category;

public class CategoryDao {
	private String query;
	private PreparedStatement ps;
	private ResultSet rs;
	private Connection connection;

	public CategoryDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public int addCategory(Category cate) {
		System.out.println(cate);
		int cid = 0;
		try {
			
			String query1="select * from category where c_title=?";
			ps=this.connection.prepareStatement(query1);
			ps.setString(1, cate.getCategory_title());
			ResultSet	rs1=ps.executeQuery();
			
		 System.out.println(rs1);
			if(rs1.next()) {
				System.out.println("Title already available");
			}
			else {
				query="Insert into category(c_title,c_discription) values(?,?)";
				
				ps=this.connection.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, cate.getCategory_title());
				ps.setString(2, cate.getCategory_discription());
				int affectedRows = ps.executeUpdate();
				
				if(affectedRows>0) {
					// Retrieve the generated ID
		               
					rs = ps.getGeneratedKeys();
	                
					if(rs.next()) {
						System.out.println("category success");
						cid=rs.getInt(affectedRows);
						 
					}
				}
				else {
					System.out.println("category not added");
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cid;

	}
	
	public List<Category> getAllCategory(){
		List<Category> list = new ArrayList<>();
		
		try {
			query="Select * from category ";
			
			Statement statement = connection.createStatement();
			ResultSet rs= statement.executeQuery(query);
			
			while(rs.next()) {
				Category cate=new Category();
				cate.setCategory_id(Integer.parseInt(rs.getString("c_id")));
				cate.setCategory_title(rs.getString("c_title"));
				cate.setCategory_discription(rs.getString("c_discription"));
				
				list.add(cate);
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		
		return list;
		
	}
	
	public Category getCategoryById(int cid) {
		Category cate=new Category();
		try{
			query="select * from category where c_id = ?";
			
			ps=this.connection.prepareStatement(query);
			ps.setInt(1, cid);
			rs = ps.executeQuery();
			
			if(rs.next()) { 
		
				
				cate.setCategory_id(rs.getInt("c_id"));
				cate.setCategory_title(rs.getString("c_title"));
				cate.setCategory_discription(rs.getString("c_discription"));
				
			}
			else {
				System.out.println("id not found");
				
			}	
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cate;
		
	}
}
