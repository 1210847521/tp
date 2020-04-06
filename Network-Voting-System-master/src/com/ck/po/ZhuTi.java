package com.ck.po;

import java.util.Date;

/**
 * 主题
 * 
 * @author ALI
 *
 */
public class ZhuTi {
	private Integer id;
	
	private String name; // 名称
	
	private String note; // 描述
	
	private Integer adduid; // 添加人
	
	private Date addtime; // 添加时间
	
	private String adduname; // 添加人姓名

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Integer getAdduid() {
		return adduid;
	}

	public void setAdduid(Integer adduid) {
		this.adduid = adduid;
	}

	public Date getAddtime() {
		return addtime;
	}

	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAdduname() {
		return adduname;
	}

	public void setAdduname(String adduname) {
		this.adduname = adduname;
	}

	
}
