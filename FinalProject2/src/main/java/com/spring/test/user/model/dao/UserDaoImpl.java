package com.spring.test.user.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	SqlSessionTemplate session;

	//회원 가입
	@Override
	public int insertUser(Map user) {
		return session.insert("user.insertUser",user);
	}

	@Override
	public int selectUserEmailCount(String email) {
		return session.selectOne("user.selectUserEmailCount",email);
	}

	//회원탈퇴
	@Override
	public int deleteUserPassword(Map user) {
		return session.delete("user.deleteUserPassword",user);
	}

	@Override
	public int outUser(Map user) {
		return session.insert("user.outUser",user);
	}
	

	@Override
	public int setOutUser(int userNo) {
		return session.update("user.setTypeOutUser",userNo);
	}

	@Override
	public int deleteUser(int userNo) {
		return session.delete("user.deleteUser",userNo);
	}

	//회원정보 수정
	@Override
	public Map selectUserBasic(int userNo) {
		return session.selectOne("user.selectUserBasic",userNo);
	}

	@Override
	public List<Map> selectUserAddress(int userNo) {
		return session.selectList("user.selectUserAddress",userNo);
	}

	@Override
	public Map selectUserAccount(int userNo) {
		return session.selectOne("user.selectUserAccount",userNo);
	}

	@Override
	public int updateUser(Map user) {
		return session.update("user.updateUser",user);
	}

	@Override
	public int updatePassword(Map user) {
		return session.update("user.updatePassword",user);
	}

	
	//로그인
	@Override
	public Map selectUser(String email) {
		return session.selectOne("user.selectUser",email);
	}

	@Override
	public Map selectFindLinkType(String email) {
		return session.selectOne("user.selectFindLinkType",email);
	}

	@Override
	public int insertFindPwLink(Map tempKeyMap) {
		return session.insert("user.insertFindPwLink",tempKeyMap);
	}

	@Override
	public Map selectFindPwLink(String tempKey) {
		return session.selectOne("user.selectFindPwLink",tempKey);
	}

	@Override
	public int deleteFindPwLink(String tempKey) {
		return session.delete("user.deleteFindPwLink",tempKey);
	}

	//임시 : 주소록 관련
	@Override
	public int insertUserAddress(Map userAddress) {
		return session.insert("user.insertUserAddress",userAddress);
	}

	@Override
	public int updateUserAddress(Map userAddress) {
		return session.update("user.updateUserAddress",userAddress);
	}

	@Override
	public int deleteUserAddress(int addressNo) {
		return session.delete("user.deleteUserAddress",addressNo);
	}

	
	//임시 : 리워드 리스트 관련
	@Override
	public List<Map> selectUserRewardSupported(Map selectRequest) {
		return session.selectList("user.selectUserRewardSupport",selectRequest);
	}

	@Override
	public List<Map> selectUserRewardMade(Map selectRequest) {
		return session.selectList("user.selectUserRewardMade",selectRequest);
	}

	@Override
	public List<Map> selectUserRewardLike(Map selectRequest) {
		return session.selectList("user.selectUserRewardLike",selectRequest);
	}
	
}
