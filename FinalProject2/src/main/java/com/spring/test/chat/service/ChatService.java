package com.spring.test.chat.service;

import java.util.List;

import com.spring.test.chat.dto.ChatMsg;
import com.spring.test.chat.dto.ChatReqMsg;
import com.spring.test.chat.dto.ChatRoom;


public interface ChatService {

	/**
	 * 회원의 채팅방 번호 조회
	 * @param userNo
	 * @return
	 */
	public Integer getChatRoomNo( Integer userNo );
	
	/**
	 * 채팅 메시지 조회
	 * @param roomNo
	 * @return
	 */
	public List<ChatMsg> getChatMessages( Integer roomNo );
	
	/**
	 * 채팅 메시지 등록
	 * @param roomNo
	 * @param msg
	 * @return
	 */
	public ChatMsg addChatMessage( Integer roomNo, ChatReqMsg msg );
	
	/**
	 * 채팅방 목록 조회 (관리자)
	 * @return
	 */
	public List<ChatRoom> getChatRooms();
	
	/**
	 * 채팅방 읽지 않은 메시지 업데이트
	 * @param roomNo
	 * @param isAdmin
	 */
	public void updateChatMessagesRead( Integer roomNo, Boolean isAdmin );
}
