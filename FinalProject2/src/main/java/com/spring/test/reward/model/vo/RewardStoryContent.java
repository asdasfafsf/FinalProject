package com.spring.test.reward.model.vo;

public class RewardStoryContent {
	private int rewardNo;
	private int index;
	private String tag;
	
	public int getRewardNo() {
		return rewardNo;
	}
	public void setRewardNo(int rewardNo) {
		this.rewardNo = rewardNo;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	@Override
	public String toString() {
		return "RewardStoryContent [rewardNo=" + rewardNo + ", index=" + index + ", tag=" + tag + ", getRewardNo()="
				+ getRewardNo() + ", getIndex()=" + getIndex() + ", getTag()=" + getTag() + "]";
	}
}
