package com.spring.test.chat.dto;

import java.util.Date;

public class ChatResMsg {

	private Integer userNo;
	private String userName;
	private Boolean isAdmin;
	private String msg;
	private Date chatDate;
	
	public ChatResMsg( ChatMsg chatMsg ) {
		this.userNo = chatMsg.getUserNo();
		this.isAdmin = chatMsg.getIsAdmin().equals( "Y" ) ? true : false;
		this.msg = chatMsg.getChatContent();
		this.chatDate = chatMsg.getChatDate();
		this.userName = chatMsg.getUserName();
	}

	/**
	 * @return the userNo
	 */
	public Integer getUserNo() {
		return userNo;
	}

	/**
	 * @param userNo
	 *            the userNo to set
	 */
	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}

	/**
	 * @return the isAdmin
	 */
	public Boolean getIsAdmin() {
		return isAdmin;
	}

	/**
	 * @param isAdmin
	 *            the isAdmin to set
	 */
	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	/**
	 * @return the msg
	 */
	public String getMsg() {
		return msg;
	}

	/**
	 * @param msg
	 *            the msg to set
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}

	/**
	 * @return the chatDate
	 */
	public Date getChatDate() {
		return chatDate;
	}

	/**
	 * @param chatDate
	 *            the chatDate to set
	 */
	public void setChatDate(Date chatDate) {
		this.chatDate = chatDate;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	
}
