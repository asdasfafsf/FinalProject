package com.spring.test.reward.model.vo;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

public class RewardItemSelectOption implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1788422499926716424L;
	private int no;
	private String content;
	private int rewardNo;
	private int rewardItemNo;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRewardNo() {
		return rewardNo;
	}

	public void setRewardNo(int rewardNo) {
		this.rewardNo = rewardNo;
	}

	public int getRewardItemNo() {
		return rewardItemNo;
	}

	public void setRewardItemNo(int rewardItemNo) {
		this.rewardItemNo = rewardItemNo;
	}

	@Override
	public String toString() {
		return "RewardItemSelectOption [no=" + no + ", content=" + content + ", rewardNo=" + rewardNo
				+ ", rewardItemNo=" + rewardItemNo + "]";
	}
	
	

}
