package com.model;

import java.util.ArrayList;
import java.util.List;

public class Category {
	
	private int category_id;
	private String category_title;
	private String category_discription;
	
	private List<Product> product=new ArrayList<>();
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(int category_id, String category_title, String category_discription) {
		super();
		this.category_id = category_id;
		this.category_title = category_title;
		this.category_discription = category_discription;
	}

	public Category(String category_title, String category_discription) {
		super();
		this.category_title = category_title;
		this.category_discription = category_discription;
	}

	
	public Category( String category_title, String category_discription, List<Product> product) {
		super();
		this.category_title = category_title;
		this.category_discription = category_discription;
		this.product = product;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getCategory_title() {
		return category_title;
	}

	public void setCategory_title(String category_title) {
		this.category_title = category_title;
	}

	public String getCategory_discription() {
		return category_discription;
	}

	public void setCategory_discription(String category_discription) {
		this.category_discription = category_discription;
	}

	
	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Category [category_id=" + category_id + ", category_title=" + category_title + ", category_discription="
				+ category_discription + ", product=" + product + "]";
	}

	
	
}
