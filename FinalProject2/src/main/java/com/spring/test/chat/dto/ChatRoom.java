package com.spring.test.chat.dto;

import java.util.Date;

public class ChatRoom {

	private Integer chatRoomNo;
	private Integer userNo;
	private String userPhoto;
	private String userName;
	private String userEmail;
	private String lastMsg;
	private Date lastChatDate;
	private Integer unread;

	/**
	 * @return the userPhoto
	 */
	public String getUserPhoto() {
		return userPhoto;
	}

	/**
	 * @param userPhoto
	 *            the userPhoto to set
	 */
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName
	 *            the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the userEmail
	 */
	public String getUserEmail() {
		return userEmail;
	}

	/**
	 * @param userEmail
	 *            the userEmail to set
	 */
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	/**
	 * @return the lastMsg
	 */
	public String getLastMsg() {
		return lastMsg;
	}

	/**
	 * @param lastMsg
	 *            the lastMsg to set
	 */
	public void setLastMsg(String lastMsg) {
		this.lastMsg = lastMsg;
	}

	/**
	 * @return the lastChatDate
	 */
	public Date getLastChatDate() {
		return lastChatDate;
	}

	/**
	 * @param lastChatDate
	 *            the lastChatDate to set
	 */
	public void setLastChatDate(Date lastChatDate) {
		this.lastChatDate = lastChatDate;
	}

	/**
	 * @return the unread
	 */
	public Integer getUnread() {
		return unread;
	}

	/**
	 * @param unread
	 *            the unread to set
	 */
	public void setUnread(Integer unread) {
		this.unread = unread;
	}

	/**
	 * @return the chatRoomNo
	 */
	public Integer getChatRoomNo() {
		return chatRoomNo;
	}

	/**
	 * @param chatRoomNo the chatRoomNo to set
	 */
	public void setChatRoomNo(Integer chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}

	/**
	 * @return the userNo
	 */
	public Integer getUserNo() {
		return userNo;
	}

	/**
	 * @param userNo the userNo to set
	 */
	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}

	
}
