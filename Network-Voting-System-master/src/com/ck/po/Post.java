package com.ck.po;

import java.util.Date;
import java.util.List;

/**
 * 发布的投票持久类
 * 
 * @author ALI
 *
 */
public class Post {
	private Integer id;
	private Integer userId; // 用户id
	private String title; // 标题
	private String introduce; // 内容
	private Integer pollType; // 投票类型 0单选 1多选 2多次
	private Integer openShow; // 是否可以搜索到 0公开显示 1不公开显示
	private Integer openPoll; // 是否可以不登录投票 0都可投票 1登录后可投票
	private Integer openResult; // 是否公开投票结果 0公开投票结果 1不公开投票结果
	private Integer maxPoll; // 最多投票数量
	private Integer postState; //  0待审核 1审核通过 2审核失败 3删除
	private Date postDate; // 发布时间
	
	private List<Option> option; // 发布的投票选项

	private Integer ztId; // 主题id
	
	private String userName; // 用户姓名
	
	private Integer deluid; //删除人
	
	private Date deltime;  //删除时间
	
	private String ztname;
	
	public String getZtname() {
		return ztname;
	}

	public void setZtname(String ztname) {
		this.ztname = ztname;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public Integer getPollType() {
		return pollType;
	}

	public void setPollType(Integer pollType) {
		this.pollType = pollType;
	}

	public Integer getOpenShow() {
		return openShow;
	}

	public void setOpenShow(Integer openShow) {
		this.openShow = openShow;
	}

	public Integer getOpenPoll() {
		return openPoll;
	}

	public void setOpenPoll(Integer openPoll) {
		this.openPoll = openPoll;
	}

	public Integer getOpenResult() {
		return openResult;
	}

	public void setOpenResult(Integer openResult) {
		this.openResult = openResult;
	}

	public Integer getMaxPoll() {
		return maxPoll;
	}

	public void setMaxPoll(Integer maxPoll) {
		this.maxPoll = maxPoll;
	}

	public Integer getPostState() {
		return postState;
	}

	public void setPostState(Integer postState) {
		this.postState = postState;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public List<Option> getOption() {
		return option;
	}

	public void setOption(List<Option> option) {
		this.option = option;
	}

	public Integer getZtId() {
		return ztId;
	}

	public void setZtId(Integer ztId) {
		this.ztId = ztId;
	}
	
	public Integer getDeluid() {
		return deluid;
	}

	public void setDeluid(Integer deluid) {
		this.deluid = deluid;
	}

	public Date getDeltime() {
		return deltime;
	}

	public void setDeltime(Date deltime) {
		this.deltime = deltime;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", userId=" + userId + ", title=" + title + ", introduce=" + introduce + ", pollType="
				+ pollType + ", openShow=" + openShow + ", openPoll=" + openPoll + ", openResult=" + openResult
				+ ", max_poll=" + maxPoll + ", postState=" + postState + ", postDate=" + postDate + "]";
	}

}
