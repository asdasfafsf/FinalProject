package com.spring.test.admin.model.vo;

public class Notice {
	private String noticeTitle;
	private String noticeContent;
	private int noticeNo;
	
	public Notice() {}

	public Notice(String noticeTitle, String noticeContent) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	@Override
	public String toString() {
		return "Notice [noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent + "]";
	}
	
}
