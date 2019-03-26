package com.spring.test.reward.model.vo;

public class RewardSupportItemInputOption {
	private int rewardSupportNo;
	private int rewardItemNo;
	private int inputOptionNo;
	private String inputContent;
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
	public int getInputOptionNo() {
		return inputOptionNo;
	}
	public void setInputOptionNo(int inputOptionNo) {
		this.inputOptionNo = inputOptionNo;
	}
	public String getInputContent() {
		return inputContent;
	}
	public void setInputContent(String inputContent) {
		this.inputContent = inputContent;
	}
	
	@Override
	public String toString() {
		return "RewardSupportItemInputOption [rewardSupportNo=" + rewardSupportNo + ", rewardItemNo=" + rewardItemNo
				+ ", inputOptionNo=" + inputOptionNo + ", inputContent=" + inputContent + "]";
	}
	
	
}
