package com.spring.test.user.model.dao;

import java.util.List;
import java.util.Map;

public interface UserDao {
/*회원가입*/
	/*회원정보등록*/
	int insertUser(Map user);
	/*이메일 중복 확인*/
	int selectUserEmailCount(String email);
	
/*회원탈퇴*/
	/*유저 링크 타입별 테이블에 있는 값 삭제*/
	int deleteUserPassword(int userNo);
	/*유저 넘버, 이메일  tb_user_active에서 tb_user_out으로 복사 + 나간 이유 저장*/
	int outUser(Map user);
	/*유저 타입 -> 탈퇴회원으로 변경*/
	int setOutUser(int userNo);

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
	int updateUser(Map user);
		/*비밀번호*/
	int updatePassword(Map user);
	
/*로그인*/
	Map selectUser(String email);
		
/*ID/PW찾기*/
	/*ID찾기*/
	Map selectFindLinkType(String email);
	/*PW찾기*/
		/*user_no와 랜덤키 저장*/
	int insertFindPwLink(Map tempKeyMap);		
		/*랜덤키로 user_no찾기*/
	Map selectFindPwLink(String tempKey);
		/*사용한 링크 삭제*/
	int deleteFindPwLink(String tempKey);
	
	
/*임시 : 어디다 뒀는지 못찾아서 여기다 넣음*/
	/*주소록*/
		/*추가*/
	int insertUserAddress(Map userAddress);
		/*업데이트*/
	int updateUserAddress(Map userAddress);
		/*삭제*/
	int deleteUserAddress(int addressNo);
	
	/*특정 유저의 리워드 리스트 불러오기*/
		/*후원한*/
	List<Map> selectUserRewardSupported(Map selectRequest);
		/*진행하는*/
	List<Map> selectUserRewardMade(Map selectRequest);
		/*좋아요*/
	List<Map> selectUserRewardLike(Map selectRequest);
}
