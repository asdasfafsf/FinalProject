package com.spring.test.reward.model.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class RewardItem{
	/**
	 * 
	 */
	private static final long serialVersionUID = 9188436064637973124L;
	private int rewardNo;
	private int no;
	private int index;
	private String name;
	private String introduce;
	private int needAddress;
	private int deliveryPrice;
	private int maxNum;
	private int remainNum;
	private Date deliveryStart;
	private Date deliveryEnd;
	
	private List<RewardItemSelectOption> selectOptionList;
	private List<RewardItemInputOption> inputOptionList;




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

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public int getNeedAddress() {
		return needAddress;
	}

	public void setNeedAddress(int needAddress) {
		this.needAddress = needAddress;
	}

	public int getDeliveryPrice() {
		return deliveryPrice;
	}

	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}

	public int getMaxNum() {
		return maxNum;
	}

	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}

	public int getRemainNum() {
		return remainNum;
	}

	public void setRemainNum(int remainNum) {
		this.remainNum = remainNum;
	}

	public Date getDeliveryStart() {
		return deliveryStart;
	}

	public void setDeliveryStart(Date deliveryStart) {
		this.deliveryStart = deliveryStart;
	}

	public Date getDeliveryEnd() {
		return deliveryEnd;
	}

	public void setDeliveryEnd(Date deliveryEnd) {
		this.deliveryEnd = deliveryEnd;
	}

	public List<RewardItemSelectOption> getSelectOptionList() {
		return selectOptionList;
	}

	public void setSelectOptionList(List<RewardItemSelectOption> selectOptionList) {
		this.selectOptionList = selectOptionList;
	}

	public List<RewardItemInputOption> getInputOptionList() {
		return inputOptionList;
	}

	public void setInputOptionList(List<RewardItemInputOption> inputOptionList) {
		this.inputOptionList = inputOptionList;
	}

	@Override
	public String toString() {
		return "RewardItem [rewardNo=" + rewardNo + ", no=" + no + ", index=" + index + ", name=" + name
				+ ", introduce=" + introduce + ", needAddress=" + needAddress + ", deliveryPrice=" + deliveryPrice
				+ ", maxNum=" + maxNum + ", remainNum=" + remainNum + ", deliveryStart=" + deliveryStart
				+ ", deliveryEnd=" + deliveryEnd + ", selectOptionList=" + selectOptionList + ", inputOptionList="
				+ inputOptionList + "]";
	}

}
