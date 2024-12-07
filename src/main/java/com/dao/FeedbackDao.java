package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.Feedback;

public class FeedbackDao {
	
	private Connection connection;
	private ResultSet rs;
	private String query;
	private PreparedStatement ps;
	
	public FeedbackDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public String addFeedback(Feedback feed) {
		String message="";
		
		try {
			query="Insert into Feedback(pid,uid,rating,review) values(?,?,?)";
			ps=this.connection.prepareStatement(query);
			ps.setInt(1, feed.getUid());
			ps.setString(2, feed.getTextfeed());
			ps.setInt(3, feed.getRating());
			
			 int a= ps.executeUpdate();
			 
			 if(a>0) {
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
