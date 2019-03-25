package com.spring.test.reward.model.vo;

public class RewardAccount {
	private int finNo;
	private int rewardSupportNo;
	private int accountNo;
	private int bankNo;
	private String bankName;
	private String accessToken;
	private String refreshToken;
	private int userSerialNo;
	private String accountUserName;
	private String accountName;
	
	
	public int getFinNo() {
		return finNo;
	}


	public void setFinNo(int finNo) {
		this.finNo = finNo;
	}


	public int getRewardSupportNo() {
		return rewardSupportNo;
	}


	public void setRewardSupportNo(int rewardSupportNo) {
		this.rewardSupportNo = rewardSupportNo;
	}


	public int getAccountNo() {
		return accountNo;
	}


	public void setAccountNo(int accountNo) {
		this.accountNo = accountNo;
	}


	public int getBankNo() {
		return bankNo;
	}


	public void setBankNo(int bankNo) {
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
