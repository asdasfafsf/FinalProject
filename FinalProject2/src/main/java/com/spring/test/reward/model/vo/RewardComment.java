package com.spring.test.reward.model.vo;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("RewardComment")
public class RewardComment {
	private int rewardNo;
	private int no;
	private int userNo;
	private int rootNo;
	private String content;
	private Date date;
	private int enable;
	
	private String dateStr;
	private String userName;
	private String userProfilePhoto;
	
	private List<RewardComment> recommentList;
	
	public int getRewardNo() {
		return rewardNo;
	}



	public void setRewardNo(int rewardNo) {
		this.rewardNo = rewardNo;
	}



	public int getNo() {
		return no;
	}



	public void setNo(int no) {
		this.no = no;
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public int getRootNo() {
		return rootNo;
	}



	public void setRootNo(int rootNo) {
		this.rootNo = rootNo;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Date getDate() {
		return date;
	}



	public void setDate(Date date) {
		this.date = date;
	}



	public int getEnable() {
		return enable;
	}



	public void setEnable(int enable) {
		this.enable = enable;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getUserProfilePhoto() {
		return userProfilePhoto;
	}



	public void setUserProfilePhoto(String userProfilePhoto) {
		this.userProfilePhoto = userProfilePhoto;
	}


	public List<RewardComment> getRecommentList() {
		return recommentList;
	}



	public void setRecommentList(List<RewardComment> recommentList) {
		this.recommentList = recommentList;
	}



	public String getDateStr() {
		return dateStr;
	}



	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}



	@Override
	public String toString() {
		return "RewardComment [rewardNo=" + rewardNo + ", no=" + no + ", userNo=" + userNo + ", rootNo=" + rootNo
				+ ", content=" + content + ", date=" + date + ", enable=" + enable + ", dateStr=" + dateStr
				+ ", userName=" + userName + ", userProfilePhoto=" + userProfilePhoto + ", recommentList="
				+ recommentList + "]";
	}
	
	
	
	
}
