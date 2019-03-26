package com.spring.test.reward.model.vo;

import java.util.List;

public class RewardSupportItem {
	private int rewardSupportNo;
	private int rewardItemNo;
	private int rewardNo;
	private int rewardItemSelectOptionNo;
	private int num;
	
	List<RewardSupportItemInputOption> inputOptionList;

	@Override
	public String toString() {
		return "RewardSupportItem [rewardSupportNo=" + rewardSupportNo + ", rewardItemNo=" + rewardItemNo
				+ ", rewardNo=" + rewardNo + ", rewardItemSelectOptionNo=" + rewardItemSelectOptionNo + ", num=" + num
				+ ", inputOptionList=" + inputOptionList + "]";
	}

	public int getRewardSupportNo() {
		return rewardSupportNo;
	}

	public void setRewardSupportNo(int rewardSupportNo) {
		this.rewardSupportNo = rewardSupportNo;
	}

	public int getRewardItemNo() {
		return rewardItemNo;
	}

	public void setRewardItemNo(int rewardItemNo) {
		this.rewardItemNo = rewardItemNo;
	}

	public int getRewardNo() {
		return rewardNo;
	}

	public void setRewardNo(int rewardNo) {
		this.rewardNo = rewardNo;
	}

	public int getRewardItemSelectOptionNo() {
		return rewardItemSelectOptionNo;
	}

	public void setRewardItemSelectOptionNo(int rewardItemSelectOptionNo) {
		this.rewardItemSelectOptionNo = rewardItemSelectOptionNo;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public List<RewardSupportItemInputOption> getInputOptionList() {
		return inputOptionList;
	}

	public void setInputOptionList(List<RewardSupportItemInputOption> inputOptionList) {
		this.inputOptionList = inputOptionList;
	}
	
	
}
