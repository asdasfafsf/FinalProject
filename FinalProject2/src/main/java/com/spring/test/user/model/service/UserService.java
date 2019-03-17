package com.spring.test.user.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface UserService {

/*회원가입*/
	/*회원정보등록*/ 
	/*
	 * Map user에 들어가야 하는 것 : 
	 * USER_EMAIL, USER_NAME, USER_PROFILEPHOTO, USER_LINK_TYPE, 
	 * [USER_PASSWORD OR UNIQKEY]
	 */
	int insertUser(Map user);
	/*이메일 중복 확인*/
	int selectUserEmailCount(String email);
	
/*회원탈퇴*/
	/*
	 * Map user에 들어가야 하는 것 : 
	 * USER_NO, OUT_REASON
	 */
	int outUser(Map user);

/*회원정보수정*/
	/*불러오기*/
		/*기본회원정보*/
	Map selectUserBasic(int userNo);
		/*주소록*/
	List<Map> selectUserAddress(int userNo);
		/*결제정보*/
	Map selectUserAccount(int userNo);
	/*업데이트*/
		/*기본회원정보*/
			/*
			 * Map user에 들어가야 하는 것 : 
			 * USER_EMAIL,USER_NAME,USER_ENROLLDATE,USER_NO
			 */
	int updateUser(Map user);
		/*비밀번호*/
			/*
			 * Map user에 들어가야 하는 것 : 
			 * USER_PASSWORD,USER_NO
			 */
	int updatePassword(Map user);
		/*프로필 사진*/
			/*
			 * Map user에 들어가야 하는 것 : 
			 * USER_PROFILEPHOTO, USER_NO
			 */
	int updateUserPhoto(Map user);
	
/*로그인*/
	Map selectUser(String email);
		
/*ID/PW찾기*/
	/*ID찾기*/
	Map findId(String email);
	/*PW찾기*/
		/*user_no와 랜덤키 저장*/
			/*
			 * Map tempKeyMap에 들어가야 하는 것 : 
			 * TEMP_KEY,USER_NO
			 */
	int requestFindPw(Map tempKeyMap);		
		/*랜덤키로 user_no찾기*/
	Map findPwLink(String tempKey);
		/*사용한 링크 삭제*/
	int deleteFindPwLink(String tempKey);

/*메일 인증*/
	/*인증 메일(링크)*/
	void sendEmailLink(String email,String tempKey);
	/*인증메일(숫자 입력)*/
	void sendEmailKey(String email,int tempKey);
	/*인증번호 생성*/
	int getTempKey();
	
/*임시 : 어디다 뒀는지 못찾아서 여기다 넣음*/
	/*주소록*/
		/*추가*/
			/*
			 * Map userAddress에 들어가야 하는 것 : 
			 * USER_NO,ADDRESS_NAME,ADDRESS_ZIP_NO,ADRESS_WHOLE,
			 * ADDRESS_DETAIL,ADDRESS_PHONE,ADDRESS_RECEIVER_NAME
			 */
	int insertUserAddress(Map userAddress);
		/*업데이트*/
			/*
			 * Map userAddress에 들어가야 하는 것 : 
			 * ADDRESS_NO,ADDRESS_NAME,ADDRESS_ZIP_NO,ADRESS_WHOLE,
			 * ADDRESS_DETAIL,ADDRESS_PHONE,ADDRESS_RECEIVER_NAME
			 */
	int updateUserAddress(Map userAddress);
		/*삭제*/
	int deleteUserAddress(int addressNo);
}
