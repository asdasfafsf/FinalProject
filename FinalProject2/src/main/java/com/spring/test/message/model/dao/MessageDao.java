package com.spring.test.message.model.dao;

import java.util.List;
import java.util.Map;

public interface MessageDao {
	//메시지 불러오기
		//리스트 불러오기
	List<Map> selectMessageList(int userNo);
		//로그 불러오기
	List<Map> selectMessageLog(Map messageRequest);
	//메시지 전송하기
		//메시지 입력하기
	int insertMessage(Map message);
		//메시지 다시 보이게 하기(새 입력 있었을 경우)
	int reShowMessage(int userMessageNo);
	//메시지 삭제하기
	int updateMessage(Map message);

}
