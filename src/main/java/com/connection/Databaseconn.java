package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class Databaseconn {
	
	private static Connection connection;
	
	public static Connection getConnection() {
		
		try {
			if(connection==null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshop","root","1234");
				System.out.println(connection );
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return connection;
	}
}
