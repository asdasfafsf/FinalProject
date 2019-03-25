package com.spring.test.admin.model.vo;

public class Event {
	private int eventNo;
	private String eventTitle;
	private String eventContent;
	private String eventOriName;
	private String eventStoredName;
	
	public Event() {
		
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}

	public String getEventOriName() {
		return eventOriName;
	}

	public void setEventOriName(String eventOriName) {
		this.eventOriName = eventOriName;
	}

	public String getEventStoredName() {
		return eventStoredName;
	}

	public void setEventStoredName(String eventStoredName) {
		this.eventStoredName = eventStoredName;
	}

	@Override
	public String toString() {
		return "Event [eventNo=" + eventNo + ", eventTitle=" + eventTitle + ", eventContent=" + eventContent
				+ ", eventOriName=" + eventOriName + ", eventStoredName=" + eventStoredName + "]";
	}
	
}
