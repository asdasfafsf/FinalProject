package com.spring.test.message.model.service;

import java.util.List;
import java.util.Map;

public interface MessageService {
	//메시지 불러오기
		//리스트 불러오기
	List<Map> selectMessageList(int userNo);
		//메시지 로그 불러오기
		/*Map messageRequest에 들어가는 것 : 
		 *USER_NO, USER_MESSAGE_NO 
		 */
	List<Map> selectMessageLog(Map messageRequest);
	//메시지 전송하기
		//메시지 입력하기+//메시지 다시 보이게 하기
		/*Map message에 들어가는 것:
		 *TARGET_USER_NO,USER_NO,USER_MESSAGE_CONTENT
		 */
	int insertMessage(Map message);
		//메시지 삭제하기
		/*Map message에 들어가는 것:
		 *USER_NO,USER_MESSAGE_NO
		 */
	int hideMessage(Map message);
}
