package com.ck.po;

public class Picture {
	private Integer id;
	private String meg;
	private String bmeg;
	private String picture;
	public String getPicture() {
		return picture;
	}
	
	public Picture(Integer id,String meg,String bmeg,String picture) {
		this.id=id;
		this.meg=meg;
		this.bmeg=bmeg;
		this.picture=picture;
	}
	
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Picture() {
		// TODO Auto-generated constructor stub
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMeg() {
		return meg;
	}
	public void setMeg(String meg) {
		this.meg = meg;
	}
	public String getBmeg() {
		return bmeg;
	}
	public void setBmeg(String bmeg) {
		this.bmeg = bmeg;
	}

}
