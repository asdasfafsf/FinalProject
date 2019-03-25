package com.spring.test.reward.model.vo;

import java.util.List;

public class RewardSupport {
	private int rewardNo;
	private int no;
	private int userNo;
	private int addDonation;
	private int state;
	
	List<RewardSupportItem> itemList;

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

	public int getAddDonation() {
		return addDonation;
	}

	public void setAddDonation(int addDonation) {
		this.addDonation = addDonation;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public List<RewardSupportItem> getItemList() {
		return itemList;
	}

	public void setItemList(List<RewardSupportItem> itemList) {
		this.itemList = itemList;
	}

	@Override
	public String toString() {
		return "RewardSupport [rewardNo=" + rewardNo + ", no=" + no + ", userNo=" + userNo + ", addDonation="
				+ addDonation + ", state=" + state + ", itemList=" + itemList + "]";
	}

	
	
}
