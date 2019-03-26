package com.spring.test.user.model.dao;

import java.util.List;
import java.util.Map;

public interface UserDao {

	//유저 정보 가져오기
		//email로
		Map selectUserWithEmail(String email);
		//유저 번호로
		Map selectUserWithNo(int userNo);
			//주소록만
		List<Map> selectUserAddressList(int userNo);
			//계좌만
		List<Map> selectUserAccountList(int userNo);
			//펀딩목록만
				//펀딩한
		List<Map> selectUserFundingList(Map request);
				//좋아한
		List<Map> selectUserLikeFundingList(Map request);
				//만든
		List<Map> selectUserMadeFundingList(Map request);
	//이메일 체크
		int selectEqualEmail(String email);
	//유저 타입 체크
		int selectUserLinkType(String email);
		
	//유저 정보 입력하기
		int insertUser(Map user);
	//유저 정보 수정하기
		//사진
		int updateUserPhoto(Map user);
		//이름
		int updateUserName(Map user);
		//비밀번호&이메일
		int updateUserPassword(Map user);
		int updateUserEmail(Map user);
		//주소록
		int deleteAddress(int addrNo);
		int addAddress(Map address);
		//계좌
	//유저 지우기
		//아웃 유저에 넣기
		int insertOutUser(Map user);
		//각 테이블 지우기
		int deleteOutUserPw(Map user);
		//주소록 지우기
		int deleteOutUserAllAddress(int userNo);
		//액티브 유저 지우기
		int deleteActiveUser(int userNo);
		//유저 테이블 '2'로 업데이트
		int updateOutUser(int userNo);
		
	//비밀번호 찾기 용 링크 저장
		int insertUserTemp(Map user);
		//링크 찾기
		Map selectUserTemp(String key);
		//링크 삭제
		int deleteUserTemp(int userNo);
}
