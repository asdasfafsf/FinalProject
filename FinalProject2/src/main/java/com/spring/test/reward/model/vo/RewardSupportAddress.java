package com.spring.test.reward.model.vo;

public class RewardSupportAddress {
	private int rewardSupportNo;
	private int zipNo;
	private String address;
	private String addressDetail;
	private String phone;
	private String name;
	private String request;
	
	public int getRewardSupportNo() {
		return rewardSupportNo;
	}
	public void setRewardSupportNo(int rewardSupportNo) {
		this.rewardSupportNo = rewardSupportNo;
	}
	public int getZipNo() {
		return zipNo;
	}
	public void setZipNo(int zipNo) {
		this.zipNo = zipNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "RewardSupportAddress [rewardSupportNo=" + rewardSupportNo + ", zipNo=" + zipNo + ", address=" + address
				+ ", addressDetail=" + addressDetail + ", phone=" + phone + ", name=" + name + "]";
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	
	
}
