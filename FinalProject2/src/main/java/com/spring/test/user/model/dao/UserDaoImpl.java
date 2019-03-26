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

	
	@Override
	public Map selectUserWithEmail(String email) {
		return session.selectOne("user.selectUserWithEmail",email);
	}


	@Override
	public Map selectUserWithNo(int userNo) {
		return session.selectOne("user.selectUserWithNo",userNo);
	}


	@Override
	public List<Map> selectUserAddressList(int userNo) {
		return session.selectList("user.selectUserAddressList",userNo);
	}

	

	@Override
	public int deleteAddress(int addrNo) {
		return session.delete("user.deleteUserAddress",addrNo);
	}


	@Override
	public int addAddress(Map address) {
		return session.insert("user.addAddress",address);
	}


	@Override
	public List<Map> selectUserAccountList(int userNo) {
		return session.selectList("user.selectUserAccountList",userNo);
	}


	@Override
	public List<Map> selectUserFundingList(Map request) {
		return session.selectList("user.selectUserFundingList",request);
	}


	@Override
	public List<Map> selectUserLikeFundingList(Map request) {
		return session.selectList("user.selectUserLikeFundingList",request);
	}


	@Override
	public List<Map> selectUserMadeFundingList(Map request) {
		return session.selectList("user.selectUserMadeFundingList",request);
	}


	@Override
	public int selectEqualEmail(String email) {
		return session.selectOne("user.selectEqualEmail",email);
	}


	@Override
	public int selectUserLinkType(String email) {
		return session.selectOne("user.selectUserLinkType",email);
	}


	@Override
	public int insertUser(Map user) {
		return session.insert("user.insertUser", user);
	}


	@Override
	public int updateUserPhoto(Map user) {
		return session.update("user.updateUserPhoto",user);
	}


	@Override
	public int updateUserName(Map user) {
		return session.update("user.updateUserName",user);
	}


	@Override
	public int updateUserPassword(Map user) {
		return session.update("user.updateUserPassword",user);
	}


	@Override
	public int updateUserEmail(Map user) {
		return session.update("user.updateUserEmail",user);
	}


	@Override
	public int insertOutUser(Map user) {
		return session.insert("user.insertOutUser",user);
	}


	@Override
	public int deleteOutUserPw(Map user) {
		return session.delete("user.deleteUserPw",user);
	}


	@Override
	public int deleteOutUserAllAddress(int userNo) {
		return session.delete("user.deleteUserAllAddress",userNo);
	}

	@Override
	public int deleteActiveUser(int userNo) {
		return session.delete("user.deleteActiveUser",userNo);
	}


	@Override
	public int updateOutUser(int userNo) {
		return session.update("user.updateOutUser",userNo);
	}


	@Override
	public int insertUserTemp(Map user) {
		return session.insert("user.insertUserTemp",user);
	}


	@Override
	public Map selectUserTemp(String key) {
		return session.selectOne("user.selectUserTemp",key);
	}


	@Override
	public int deleteUserTemp(int userNo) {
		return session.delete("user.deleteUserTemp",userNo);
	}
	
	
}
