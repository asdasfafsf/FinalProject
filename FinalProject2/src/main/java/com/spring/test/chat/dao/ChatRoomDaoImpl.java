package com.spring.test.chat.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.test.chat.dto.ChatMsg;
import com.spring.test.chat.dto.ChatRoom;


@Repository
public class ChatRoomDaoImpl implements ChatRoomDao {

	@Autowired
	SqlSessionTemplate session;

	@Override
	public Integer selectChatRoomNo(Integer userNo) {
		return session.selectOne("chatRoom.select_chatroom", userNo);
	}

	@Override
	public Integer insertChatRoom(Integer roomNo, Integer userNo) {
		ChatRoom room = new ChatRoom();
		room.setChatRoomNo( roomNo );
		room.setUserNo( userNo );
		return session.insert("chatRoom.insert_chatroom", room);
	}

	@Override
	public List<ChatMsg> selectChatMsgs(Integer roomNo) {
		return session.selectList("chatRoom.select_msgs", roomNo);
	}

	@Override
	public Integer insertChatRoomLog(ChatMsg msg) {
		return session.insert("chatRoom.insert_chat_log", msg);
	}

	@Override
	public ChatMsg selectChatMsg(Integer logNo) {
		return session.selectOne("chatRoom.select_msg", logNo);
	}

	@Override
	public List<ChatRoom> selectChatRooms() {
		return session.selectList( "chatRoom.select_chatrooms" );
	}

	@Override
	public Integer updateReadForUser(Integer roomNo) {
		return session.update("chatRoom.update_read_for_user", roomNo);
	}

	@Override
	public Integer updateReadForAdmin(Integer roomNo) {
		return session.update("chatRoom.update_read_for_admin", roomNo);
	}

	@Override
	public List<ChatMsg> selectLastMsgs(Integer roomNo) {
		return session.selectList("chatRoom.select_last_msg", roomNo);
	}

	@Override
	public Integer selectCountUnread(Integer roomNo) {
		return session.selectOne("chatRoom.count_unread", roomNo);
	}

	@Override
	public Integer generateChatRoomNo() {
		return session.selectOne( "chatRoom.generate_chatroom_no" );
	}

	@Override
	public Integer generateChatLogNo() {
		return session.selectOne( "chatRoom.generate_chat_log_no" );
	}
}
