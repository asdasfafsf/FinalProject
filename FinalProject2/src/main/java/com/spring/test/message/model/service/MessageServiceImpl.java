package com.spring.test.message.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.test.message.model.dao.MessageDao;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	MessageDao dao;
	
//메시지 불러오기
	//리스트 불러오기
	@Override
	public List<Map> selectMessageList(int userNo) {
		return dao.selectMessageList(userNo);
	}
	//메시지 로그 불러오기
	@Override
	public List<Map> selectMessageLog(Map messageRequest) {
		return dao.selectMessageLog(messageRequest);
	}
//메시지 전송하기
	//메시지 입력하기 +//새 메시지가 입력되었을 때 메시지 다시 보이게 하기
	@Transactional
	@Override
	public int insertMessage(Map message) {
		
		int result1 = dao.insertMessage(message);
		
		int result2 = 1;
		if(message.get("USER_MESSAGE_NO")!=null)
		{
			result2 = dao.reShowMessage((Integer)message.get("USER_MESSAGE_NO"));
		}
		
		int result=0;
		if(result1==1&&result2==1)
		{
			result=1;
		}
		return result;
	}
	//메시지(를 삭제한) 유저에게 안보이게 하기
	@Override
	public int hideMessage(Map message) {
		return dao.updateMessage(message);
	}

}
