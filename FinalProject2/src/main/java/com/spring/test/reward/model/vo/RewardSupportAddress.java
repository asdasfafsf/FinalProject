package com.spring.test.reward.model.vo;

public class RewardSupportAddress {
	private int rewardSupportNo;
	private int zipNo;
	private String address;
	private String detail;
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

	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	@Override
	public String toString() {
		return "RewardSupportAddress [rewardSupportNo=" + rewardSupportNo + ", zipNo=" + zipNo + ", address=" + address
				+ ", detail=" + detail + ", phone=" + phone + ", name=" + name + ", request=" + request + "]";
	}
	
	
	
	
}
