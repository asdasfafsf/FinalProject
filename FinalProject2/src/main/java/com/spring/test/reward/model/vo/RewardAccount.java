package com.spring.test.reward.model.vo;

public class RewardAccount {
	private String finNo;
	private int rewardSupportNo;
	private String accountNo;
	private String bankNo;
	private String bankName;
	private String accessToken;
	private String refreshToken;
	private int userSerialNo;
	private String accountUserName;
	private String accountName;
	
	
	public String getFinNo() {
		return finNo;
	}


	public void setFinNo(String finNo) {
		this.finNo = finNo;
	}


	public int getRewardSupportNo() {
		return rewardSupportNo;
	}


	public void setRewardSupportNo(int rewardSupportNo) {
		this.rewardSupportNo = rewardSupportNo;
	}


	public String getAccountNo() {
		return accountNo;
	}


	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}


	public String getBankNo() {
		return bankNo;
	}


	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}


	public String getBankName() {
		return bankName;
	}


	public void setBankName(String bankName) {
		this.bankName = bankName;
	}


	public String getAccessToken() {
		return accessToken;
	}


	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}


	public String getRefreshToken() {
		return refreshToken;
	}


	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}


	public int getUserSerialNo() {
		return userSerialNo;
	}


	public void setUserSerialNo(int userSerialNo) {
		this.userSerialNo = userSerialNo;
	}


	public String getAccountUserName() {
		return accountUserName;
	}


	public void setAccountUserName(String accountUserName) {
		this.accountUserName = accountUserName;
	}


	public String getAccountName() {
		return accountName;
	}


	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}


	@Override
	public String toString() {
		return "RewardAccount [finNo=" + finNo + ", rewardSupportNo=" + rewardSupportNo + ", accountNo=" + accountNo
				+ ", bankNo=" + bankNo + ", bankName=" + bankName + ", accessToken=" + accessToken + ", refreshToken="
				+ refreshToken + ", userSerialNo=" + userSerialNo + ", accountUserName=" + accountUserName
				+ ", accountName=" + accountName + ", toString()=" + super.toString() + "]";
	}
	
	
}
