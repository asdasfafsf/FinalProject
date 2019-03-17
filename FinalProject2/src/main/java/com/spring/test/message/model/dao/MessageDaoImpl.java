package com.spring.test.message.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDaoImpl implements MessageDao {
	
	@Autowired
	SqlSessionTemplate session;

//메시지 불러오기
	//리스트 불러오기
	@Override
	public List<Map> selectMessageList(int userNo) {
		return session.selectList("message.selectMessage",userNo);
	}
	//메시지 로그 불러오기
	@Override
	public List<Map> selectMessageLog(Map messageRequest) {
		return session.selectList("message.selectMessageLog",messageRequest);
	}
//메시지 전송하기
	//메시지 입력하기
	@Override
	public int insertMessage(Map message) {
		return session.insert("message.insertMessage",message);
	}
	//메시지 다시 보이게 하기
	@Override
	public int reShowMessage(int userMessageNo) {
		return session.update("message.reShowMessage",userMessageNo);
	}
	//메시지 삭제하기
	@Override
	public int updateMessage(Map message) {
		return session.update("message.updateMessage",message);
	}

}
