package com.spring.test.chat.service;

import java.util.Arrays;
import java.util.Comparator;
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
		ChatRoom[] roomsArr = new ChatRoom[rooms.size()];
		if( rooms.size() > 0 ) {
			int i=0;
			for( ChatRoom room : rooms ) {
				ChatMsg lastMsg = chatRoomDao.selectLastMsgs( room.getChatRoomNo() ).get(0);
				int unread = chatRoomDao.selectCountUnread( room.getChatRoomNo() );
				room.setLastMsg( lastMsg.getChatContent() );
				room.setLastChatDate( lastMsg.getChatDate() );
				room.setUnread( unread );
				roomsArr[i] = room;
				i++;
			}
		}
		Arrays.sort(roomsArr, new ChatRoomComparator() );
		return Arrays.asList( roomsArr );
	}

	@Override
	public void updateChatMessagesRead(Integer roomNo, Boolean isAdmin) {
		if( isAdmin )
			chatRoomDao.updateReadForAdmin( roomNo );
		else
			chatRoomDao.updateReadForUser( roomNo );
	}
	
	public class ChatRoomComparator implements Comparator<ChatRoom> {

		@Override
		public int compare(ChatRoom o1, ChatRoom o2) {
			if( o1.getUnread() > o2.getUnread() )
				return -1;
			else if( o1.getUnread() == o2.getUnread() ) {
				if( o1.getLastChatDate().before( o2.getLastChatDate() ) )
					return -1;
				else if( o1.getLastChatDate().after( o2.getLastChatDate() ) )
					return 1;
				else
					return 0;
			} else
				return 1;
		}
		
	}
}

