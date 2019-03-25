package com.spring.test.chat.dao;

import java.util.List;

import com.spring.test.chat.dto.ChatMsg;
import com.spring.test.chat.dto.ChatRoom;


public interface ChatRoomDao {

	/**
	 * 사용자번호로 채팅방 번호 조회
	 * @param userNo
	 * @return
	 */
	Integer selectChatRoomNo( Integer userNo );
	
	/**
	 * 사용자번호로 채팅방 생성
	 * @param userNo
	 * @return
	 */
	Integer insertChatRoom( Integer roomNo, Integer userNo );
	
	/**
	 * 채팅방 메시지 목록 조회
	 * @param roomNo
	 * @return
	 */
	List<ChatMsg> selectChatMsgs( Integer roomNo );
	
	/**
	 * 채팅방 메시지 등록
	 * @param msg
	 * @return
	 */
	Integer insertChatRoomLog( ChatMsg msg );
	
	/**
	 * 채팅방 메시지 조회
	 * @param logNo
	 * @return
	 */
	ChatMsg selectChatMsg( Integer logNo );
	
	/**
	 * 채팅방 목록 조회 (관리자)
	 * @return
	 */
	List<ChatRoom> selectChatRooms();
	
	/**
	 * 사용자의 메시지 읽음 처리 (관리자 메시지가 업데이트)
	 * @param roomNo
	 * @return
	 */
	Integer updateReadForUser( Integer roomNo );
	
	/**
	 * 관리자의 메시지 읽음 처리 (사용자의 메시지가 업데이트)
	 * @param roomNo
	 * @return
	 */
	Integer updateReadForAdmin( Integer roomNo );
	
	/**
	 * 채팅방의 최근 메시지 조회
	 * @param roomNo
	 * @return
	 */
	List<ChatMsg> selectLastMsgs( Integer roomNo );
	
	/**
	 * 읽지 않은 메시지 수 조회
	 * @param roomNo
	 * @return
	 */
	Integer selectCountUnread( Integer roomNo );
	
	/**
	 * 채팅방 번호 생성 
	 * @return
	 */
	Integer generateChatRoomNo();
	
	/**
	 * 채팅 메시지 번호 생성
	 * @return
	 */
	Integer generateChatLogNo();
}
