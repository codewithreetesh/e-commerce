package com.model;

public class Addcart {
	
	private int pid;
	private String pname;
	private String pdesc;
	private String pphoto;
	private double pprice;
	private double pdisount;
	private int cid;
	
	public Addcart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Addcart(int pid, String pname, String pdesc, String pphoto, double pprice, double pdisount, int cid) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pdesc = pdesc;
		this.pphoto = pphoto;
		this.pprice = pprice;
		this.pdisount = pdisount;
		this.cid = cid;
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

	public double getPprice() {
		return pprice;
	}

	public void setPprice(double pprice) {
		this.pprice = pprice;
	}

	public double getPdisount() {
		return pdisount;
	}

	public void setPdisount(double pdisount) {
		this.pdisount = pdisount;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	@Override
	public String toString() {
		return "Addcart [pid=" + pid + ", pname=" + pname + ", pdesc=" + pdesc + ", pphoto=" + pphoto + ", pprice="
				+ pprice + ", pdisount=" + pdisount + ", cid=" + cid + "]";
	}

	
	
}
