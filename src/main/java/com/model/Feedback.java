package com.model;

public class Feedback {
	
	private int feedId;
	private String  textfeed;
	private int rating;
	private int uid;

	
	
	public Feedback() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Feedback(int feedId, String textfeed, int rating, int uid) {
		super();
		this.feedId = feedId;
		this.textfeed = textfeed;
		this.rating = rating;
		this.uid = uid;
	}


	public int getFeedId() {
		return feedId;
	}


	public void setFeedId(int feedId) {
		this.feedId = feedId;
	}


	public String getTextfeed() {
		return textfeed;
	}


	public void setTextfeed(String textfeed) {
		this.textfeed = textfeed;
	}


	public int getRating() {
		return rating;
	}


	public void setRating(int rating) {
		this.rating = rating;
	}


	public int getUid() {
		return uid;
	}


	public void setUid(int uid) {
		this.uid = uid;
	}


	@Override
	public String toString() {
		return "Feedback [feedId=" + feedId + ", textfeed=" + textfeed + ", rating=" + rating + ", uid=" + uid + "]";
	}


	
	 
}
