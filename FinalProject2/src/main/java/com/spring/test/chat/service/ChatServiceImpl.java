package com.spring.test.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.test.chat.dao.ChatRoomDao;
import com.spring.test.chat.dto.ChatMsg;
import com.spring.test.chat.dto.ChatReqMsg;
import com.spring.test.chat.dto.ChatRoom;


@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatRoomDao chatRoomDao;

	@Override
	public Integer getChatRoomNo(Integer userNo) {
		Integer roomNo = chatRoomDao.selectChatRoomNo( userNo );
		if( roomNo == null ) {
			roomNo = chatRoomDao.generateChatRoomNo();
			chatRoomDao.insertChatRoom( roomNo, userNo );
		}
		return roomNo;
	}

	@Override
	public List<ChatMsg> getChatMessages(Integer roomNo) {
		return chatRoomDao.selectChatMsgs( roomNo );
	}

	@Override
	public ChatMsg addChatMessage(Integer roomNo, ChatReqMsg msg) {
		int logNo = chatRoomDao.generateChatLogNo();
		ChatMsg chatMsg = new ChatMsg();
		chatMsg.setLogNo( logNo );
		chatMsg.setChatRoomNo( roomNo );
		chatMsg.setIsAdmin( msg.getIsAdmin() ? "Y" : "N" );
		if( msg.getUserNo() != null && msg.getUserNo() > 0 )
			chatMsg.setUserNo( msg.getUserNo() );
		chatMsg.setChatContent( msg.getMsg() );
		chatMsg.setIsRead( "N" );
		chatRoomDao.insertChatRoomLog( chatMsg );
		
		ChatMsg returnMsg = chatRoomDao.selectChatMsg( logNo );
		return returnMsg;
	}

	@Override
	public List<ChatRoom> getChatRooms() {
		List<ChatRoom> rooms = chatRoomDao.selectChatRooms();
		if( rooms.size() > 0 ) {
			for( ChatRoom room : rooms ) {
				ChatMsg lastMsg = chatRoomDao.selectLastMsgs( room.getChatRoomNo() ).get(0);
				int unread = chatRoomDao.selectCountUnread( room.getChatRoomNo() );
				room.setLastMsg( lastMsg.getChatContent() );
				room.setLastChatDate( lastMsg.getChatDate() );
				room.setUnread( unread );
			}
		}
		return rooms;
	}

	@Override
	public void updateChatMessagesRead(Integer roomNo, Boolean isAdmin) {
		if( isAdmin )
			chatRoomDao.updateReadForAdmin( roomNo );
		else
			chatRoomDao.updateReadForUser( roomNo );
	}
}
