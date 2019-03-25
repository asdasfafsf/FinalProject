package com.spring.test.chat.dto;

import java.util.Date;


public class ChatMsg {

	private Integer logNo;
	private Integer chatRoomNo;
	private String isAdmin;
	private Integer userNo;
	private String chatContent;
	private String isRead;
	private Date chatDate;
	private String userEmail;
	private String userName;
	private String profilePhoto;

	/**
	 * @return the logNo
	 */
	public Integer getLogNo() {
		return logNo;
	}

	/**
	 * @param logNo
	 *            the logNo to set
	 */
	public void setLogNo(Integer logNo) {
		this.logNo = logNo;
	}

	/**
	 * @return the chatRoomNo
	 */
	public Integer getChatRoomNo() {
		return chatRoomNo;
	}

	/**
	 * @param chatRoomNo
	 *            the chatRoomNo to set
	 */
	public void setChatRoomNo(Integer chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}

	/**
	 * @return the isAdmin
	 */
	public String getIsAdmin() {
		return isAdmin;
	}

	/**
	 * @param isAdmin
	 *            the isAdmin to set
	 */
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
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
	 * @return the chatContent
	 */
	public String getChatContent() {
		return chatContent;
	}

	/**
	 * @param chatContent
	 *            the chatContent to set
	 */
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	/**
	 * @return the isRead
	 */
	public String getIsRead() {
		return isRead;
	}

	/**
	 * @param isRead
	 *            the isRead to set
	 */
	public void setIsRead(String isRead) {
		this.isRead = isRead;
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
	 * @return the profilePhoto
	 */
	public String getProfilePhoto() {
		return profilePhoto;
	}

	/**
	 * @param profilePhoto
	 *            the profilePhoto to set
	 */
	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}

}
