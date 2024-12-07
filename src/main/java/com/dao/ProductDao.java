package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.connection.Databaseconn;
import com.model.Product;

public class ProductDao {
	private String query;
	private PreparedStatement ps;
	private ResultSet rs;
	private Connection connection;
	
	public ProductDao(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public String saveProduct(Product product) {
		String message="";
		
		try {
			query="Insert Into Product(pname,pdiscription,pphoto,pprice,pdiscount,pquantity,c_id) VALUES(?,?,?,?,?,?,?)";
			
			ps=this.connection.prepareStatement(query);
			ps.setString(1, product.getPname());
			ps.setString(2, product.getPdesc());
			ps.setString(3, product.getPphoto());
			ps.setDouble(4, product.getPprice());
			ps.setDouble(5, product.getPdiscount());
			ps.setInt(6, product.getPquantity());
			ps.setInt(7, product.getCategory().getCategory_id());
			System.out.println("this is category id to save-------------"+product.getCategory().getCategory_id());
			int update = ps.executeUpdate();
		
			if(update>0) {
				System.out.println("product successfully added");
				message ="Success";
			}
			else {
				System.out.println("product not add");
				message="Failure";
			}
			
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return message;
		
	}
	
	public List<Product> getAllProduct(){
		List<Product> product=new ArrayList<>();
			
		try {
			query="SELECT * FROM product";
;
			
			Statement statement=this.connection.createStatement();
			rs=statement.executeQuery(query);
		
			while(rs.next()) {
				
				Product prod=new Product();
				
				prod.setPid(rs.getInt("p_id")); 
				prod.setPname(rs.getString("pname"));
				prod.setPdesc(rs.getString("pdiscription")); 
				prod.setPphoto(rs.getString("pphoto"));	
				prod.setPprice(rs.getDouble("pprice"));
				prod.setPquantity(rs.getInt("pquantity"));
				prod.setPdiscount(rs.getDouble("pdiscount"));
				prod.setCategory(new CategoryDao(Databaseconn.getConnection()).getCategoryById(rs.getInt("c_id")) );
				product.add(prod);
					
			}	
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return product;
	}
	
	public List<Product> getProductById(int cid){
		List<Product> prod=new ArrayList<>();
		System.out.println("4654....."+cid);
		try {
			query="select * from product where c_id=?";
			
			ps=this.connection.prepareStatement(query);
			ps.setInt(1, cid);
			
			rs=	ps.executeQuery();
			
			
		 while(rs.next()) {
			 Product product=new Product();
			 
			 product.setPid(rs.getInt("p_id"));
			 product.setPname(rs.getString("pname"));
			 product.setPdesc(rs.getString("pdiscription"));
			 product.setPprice(rs.getDouble("pprice"));
			 product.setPquantity(rs.getInt("pquantity"));
			 product.setPphoto(rs.getString("pphoto"));
			 product.setPdiscount(rs.getDouble("pdiscount"));
			 product.setCategory(new CategoryDao(Databaseconn.getConnection()).getCategoryById(rs.getInt("c_id")));
			 
			 prod.add(product);
			 System.out.println("slkdjf///////"+prod);
		 	}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return prod;
		
	}
}
