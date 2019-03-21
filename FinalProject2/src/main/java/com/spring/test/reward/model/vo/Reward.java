package com.spring.test.reward.model.vo;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

public class Reward {
	private int no;
	private int userNo;
	private int categoryNo;
	private int goal;
	private Date deadline;
	private String name;
	private String shortName;
	private String synopsis;
	private String representImage;
	private String mcName;
	private String mcIntroduce;
	private String mcProfilePhoto;
	private String mcURL1;
	private String mcURL2;
	private String mcURL3;
	private String storyMedia;
	private Date enrollDate;
	private int storyMediaType;
	private String storyIntroduce;
	private String bankbookPhoto;
	private int preOpen;
	private int goalAttainmentMoney;
	private int goalAttainmentPer;
	private int likeNum;
	private int remainDay;
	private int supporterNum;
	private int supportMoney;
	private boolean islike;

	private List<RewardItem> itemList;
	private List<RewardComment> commentList;
	private List<RewardStoryContent> storyContentList;
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
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public int getGoal() {
		return goal;
	}
	public void setGoal(int goal) {
		this.goal = goal;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}
	public String getRepresentImage() {
		return representImage;
	}
	public void setRepresentImage(String representImage) {
		this.representImage = representImage;
	}
	public String getMcName() {
		return mcName;
	}
	public void setMcName(String mcName) {
		this.mcName = mcName;
	}
	public String getMcIntroduce() {
		return mcIntroduce;
	}
	public void setMcIntroduce(String mcIntroduce) {
		this.mcIntroduce = mcIntroduce;
	}
	public String getMcProfilePhoto() {
		return mcProfilePhoto;
	}
	public void setMcProfilePhoto(String mcProfilePhoto) {
		this.mcProfilePhoto = mcProfilePhoto;
	}
	public String getMcURL1() {
		return mcURL1;
	}
	public void setMcURL1(String mcURL1) {
		this.mcURL1 = mcURL1;
	}
	public String getMcURL2() {
		return mcURL2;
	}
	public void setMcURL2(String mcURL2) {
		this.mcURL2 = mcURL2;
	}
	public String getMcURL3() {
		return mcURL3;
	}
	public void setMcURL3(String mcURL3) {
		this.mcURL3 = mcURL3;
	}
	public String getStoryMedia() {
		return storyMedia;
	}
	public void setStoryMedia(String storyMedia) {
		this.storyMedia = storyMedia;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public int getStoryMediaType() {
		return storyMediaType;
	}
	public void setStoryMediaType(int storyMediaType) {
		this.storyMediaType = storyMediaType;
	}
	public String getStoryIntroduce() {
		return storyIntroduce;
	}
	public void setStoryIntroduce(String storyIntroduce) {
		this.storyIntroduce = storyIntroduce;
	}
	public String getBankbookPhoto() {
		return bankbookPhoto;
	}
	public void setBankbookPhoto(String bankbookPhoto) {
		this.bankbookPhoto = bankbookPhoto;
	}
	public int getPreOpen() {
		return preOpen;
	}
	public void setPreOpen(int preOpen) {
		this.preOpen = preOpen;
	}
	public int getGoalAttainmentMoney() {
		return goalAttainmentMoney;
	}
	public void setGoalAttainmentMoney(int goalAttainmentMoney) {
		this.goalAttainmentMoney = goalAttainmentMoney;
	}
	public int getGoalAttainmentPer() {
		return goalAttainmentPer;
	}
	public void setGoalAttainmentPer(int goalAttainmentPer) {
		this.goalAttainmentPer = goalAttainmentPer;
	}
	public int getLikeNum() {
		return likeNum;
	}
	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}
	public int getRemainDay() {
		return remainDay;
	}
	public void setRemainDay(int remainDay) {
		this.remainDay = remainDay;
	}
	public int getSupporterNum() {
		return supporterNum;
	}
	public void setSupporterNum(int supporterNum) {
		this.supporterNum = supporterNum;
	}
	public List<RewardItem> getItemList() {
		return itemList;
	}
	public void setItemList(List<RewardItem> itemList) {
		this.itemList = itemList;
	}
	public List<RewardComment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<RewardComment> commentList) {
		this.commentList = commentList;
	}

	public List<RewardStoryContent> getStoryContentList() {
		return storyContentList;
	}
	public void setStoryContentList(List<RewardStoryContent> storyContentList) {
		this.storyContentList = storyContentList;
	}
	@Override
	public String toString() {
		return "Reward [no=" + no + ", userNo=" + userNo + ", categoryNo=" + categoryNo + ", goal=" + goal
				+ ", deadline=" + deadline + ", name=" + name + ", shortName=" + shortName + ", synopsis=" + synopsis
				+ ", representImage=" + representImage + ", mcName=" + mcName + ", mcIntroduce=" + mcIntroduce
				+ ", mcProfilePhoto=" + mcProfilePhoto + ", mcURL1=" + mcURL1 + ", mcURL2=" + mcURL2 + ", mcURL3="
				+ mcURL3 + ", storyMedia=" + storyMedia + ", enrollDate=" + enrollDate + ", storyMediaType="
				+ storyMediaType + ", storyIntroduce=" + storyIntroduce + ", bankbookPhoto=" + bankbookPhoto
				+ ", preOpen=" + preOpen + ", goalAttainmentMoney=" + goalAttainmentMoney + ", goalAttainmentPer="
				+ goalAttainmentPer + ", likeNum=" + likeNum + ", remainDay=" + remainDay + ", supporterNum="
				+ supporterNum + ", itemList=" + itemList + ", commentList=" + commentList + ", storyContentList="
				+ storyContentList + "]";
	}
	public int getSupportMoney() {
		return supportMoney;
	}
	public void setSupportMoney(int supportMoney) {
		this.supportMoney = supportMoney;
	}
	public boolean isIslike() {
		return islike;
	}
	public void setIslike(boolean islike) {
		this.islike = islike;
	}
	
	
	
	
	
	
	
}
