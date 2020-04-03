package com.ck.po;

import java.util.Date;
import java.util.List;

/**
 * 用户持久类
 * 
 * @author ALI
 *
 */
public class User {
	private Integer id;
	
	private String name; // 用户名
	
	private String pwd; // 密码
	
	private Integer gender; // 性别 0女 1男
	
	private Integer year; // 出生年
	
	private String phone;// 电话
	
	private String headurl;// 头像
	
	private Date addtime;// 电话
	
	private Integer isLock;// 是否锁定0否 1是 默认0
	
	private Date locktime; // 锁定时间
	
	private Integer locknum;// 错误输入次数
	
	private String question; // 密码找回问题
	
	private String answer; // 密码找回答案
	
	private String nickName;// 昵称
	
	private Integer isadmin;// 是否管理员
	
	private Integer isfabu;// 是否可以发布
	
	private List<Post> post; // 发布的投票
	
	private List<Record> record; // 投票的记录

	private String certCode;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public List<Post> getPost() {
		return post;
	}

	public void setPost(List<Post> post) {
		this.post = post;
	}

	public List<Record> getRecord() {
		return record;
	}

	public void setRecord(List<Record> record) {
		this.record = record;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", pwd=" + pwd + ", gender=" + gender + ", year=" + year
				+ ", post=" + post + ", record=" + record + "]";
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getHeadurl() {
		return headurl;
	}

	public void setHeadurl(String headurl) {
		this.headurl = headurl;
	}

	public Date getAddtime() {
		return addtime;
	}

	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	public Integer getIsLock() {
		return isLock;
	}

	public void setIsLock(Integer isLock) {
		this.isLock = isLock;
	}

	public Date getLocktime() {
		return locktime;
	}

	public void setLocktime(Date locktime) {
		this.locktime = locktime;
	}

	public Integer getLocknum() {
		return locknum;
	}

	public void setLocknum(Integer locknum) {
		this.locknum = locknum;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Integer getIsadmin() {
		return isadmin;
	}

	public void setIsadmin(Integer isadmin) {
		this.isadmin = isadmin;
	}

	public Integer getIsfabu() {
		return isfabu;
	}

	public void setIsfabu(Integer isfabu) {
		this.isfabu = isfabu;
	}

	public String getCertCode() {
		return certCode;
	}

	public void setCertCode(String certCode) {
		this.certCode = certCode;
	}
	
}
