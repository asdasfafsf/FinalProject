package com.spring.test.admin.model.vo;

public class RewardAd {
	private int rewardNo;
	private String startDate;
	private String endDate;
	
	public RewardAd() {
		
	}

	public RewardAd(int rewardNo, String startDate, String endDate) {
		super();
		this.rewardNo = rewardNo;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public int getRewardNo() {
		return rewardNo;
	}

	public void setRewardNo(int rewardNo) {
		this.rewardNo = rewardNo;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "rewardAd [rewardNo=" + rewardNo + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
	
}
