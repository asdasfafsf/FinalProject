package com.spring.test.user.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface UserService {

	//로그인
		//홈페이지 유저
	Map loginBasicUser(String email, String password);
		//네이버 유저
	Map loginNaverUser(String email, String unique);
		//카카오 유저
	Map loginKakaoUser(String email, String unique);
	
	//회원가입
	int registUser(String email, String password, String name, int linkType);
	//이메일 중복 확인
	int selectEqualEmail(String eamil);
	//이메일로 가입된 회원인지 알아보기
	int findUserTypeWithEmail(String email);
	
	//회원정보 수정
		//받아오기
	Map userProfile(int userNo);
	Map userProfile(String email);
		//사진
	int updateUserPhoto(Map user);
		//이름
	int updateUserName(int userNo, String userName);
		//비밀번호&이메일
	int updateUserBasic(int userNo, String email, String password, String newPassword);
		//주소록
			//받아오기
	List<Map> userAddressList(int userNo);
			//수정
	int deleteAddress(int addrNo);
	int addAddress(Map address);
		//계좌
			//받아오기
	List<Map> userAccountList(int userNo);
	
	//회원 탈퇴
	int deleteUser(Map user);
		//탈퇴 가능한가
	boolean userCanOut(int userNo);
	
	//펀딩 목록
		//후원한
	List<Map> userFundingList(int userNo, int filter,int cPage,int numPerPage);
	int selectSupportRewardListCount(int userNo, int filter);
		//좋아한
	List<Map> userLikeFundingList(int userNo, int filter,int cPage, int numPerPage);
	int selectLikeRewardListCount(int userNo, int filter);
		//만든
	List<Map> userMadeFundingList(int userNo, int filter,int cPage, int numPerPage);
	int selectMadeRewardListCount(int userNo, int filter);
	//후원한 목록 디테일
	List<Map> getSupportDetail(int userNo, int rewardSupportNo);
	//후원한 (중복 따로)
	List<Map> getSupportList(int userNo);
	//후원 삭제
	int deleteSupport(int rewardSupportNo, int userNo);
	
	//이메일 보내기
		//키값 넣어 보내기
	void sendEmailKey(String email, String tempKey, String type);
		//링크 걸어 보내기
	void sendEmailLink(String email, String tempKey);
	
	//비밀번호 찾기 위한 table 저장
	int setUserFindPwLink(int userNo, String tempKey);
	//비밀번호 찾기 위한 table에서 key와 사용 가능 여부 알기
	int getUserFindPwLink(String key);
	//비밀번호 변경 + temp 테이블 값 삭제
	int editUserFindPwLink(int userNo, String password);
}
