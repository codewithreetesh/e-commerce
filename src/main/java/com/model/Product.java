package com.model;

public class Product {
	
	private int pid;
	private String pname;
	private String pdesc;
	private String pphoto;
	private Double pprice;
	private Double pdiscount;
	private int pquantity;
	
	private Category category;
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(int pid, String pname, String pdesc, String pphoto, Double pprice, Double pdiscount, int pquantity) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pdesc = pdesc;
		this.pphoto = pphoto;
		this.pprice = pprice;
		this.pdiscount = pdiscount;
		this.pquantity = pquantity;
	}

	
	public Product(int pid, String pname, String pdesc, String pphoto, Double pprice, Double pdiscount, int pquantity,
			Category category) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pdesc = pdesc;
		this.pphoto = pphoto;
		this.pprice = pprice;
		this.pdiscount = pdiscount;
		this.pquantity = pquantity;
		this.category = category;
	}

	
	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPdesc() {
		return pdesc;
	}

	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}

	public String getPphoto() {
		return pphoto;
	}

	public void setPphoto(String pphoto) {
		this.pphoto = pphoto;
	}

	public Double getPprice() {
		return pprice;
	}

	public void setPprice(Double pprice) {
		this.pprice = pprice;
	}

	public Double getPdiscount() {
		return pdiscount;
	}

	public void setPdiscount(Double pdiscount) {
		this.pdiscount = pdiscount;
	}

	public int getPquantity() {
		return pquantity;
	}

	public void setPquantity(int pquantity) {
		this.pquantity = pquantity;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}


	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pname=" + pname + ", pdesc=" + pdesc + ", pphoto=" + pphoto + ", pprice="
				+ pprice + ", pdiscount=" + pdiscount + ", pquantity=" + pquantity + ", category=" + category + "]";
	}

	
	
	public int getPriceAfterDiscount() {
		
		int d= (int) ((this.getPdiscount()/100.0)*this.getPprice());
		
		return (int) (this.getPprice()-d);
	}
	
}
