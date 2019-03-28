package com.spring.test.user.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	SqlSessionTemplate session;

	
	
	@Override
	public List<Map> getRewardSupportDetail(Map request) {
		return session.selectList("user.getRewardSupportDetail",request);
	}
	@Override
	public Map getRewardSupport (int reward_support_no) {
		return session.selectOne("user.getRewardSupport",reward_support_no);
	}
	@Override
	public List<Map> getREwardSupportList(int userNo) {
		return session.selectList("user.getREwardSupportList",userNo);
	}
	
	@Override
	public int deleteSupportAddress(int rewardSupportNo) {
		return session.delete("user.deleteSupportAddress",rewardSupportNo);
	}
	@Override
	public int deleteSupportAccount(int rewardSupportNo) {
		return session.delete("user.deleteSupportAccount",rewardSupportNo);
	}
	@Override
	public int deleteSupportInputOption(int rewardSupportNo) {
		return session.delete("user.deleteSupportInputOption",rewardSupportNo);
	}
	@Override
	public int deleteSupportItem(int rewardSupportNo) {
		return session.delete("user.deleteSupportItem",rewardSupportNo);
	}
	@Override
	public int deleteSupport(int rewardSupportNo) {
		return session.delete("user.deleteSupport",rewardSupportNo);
	}
	
	
	
	
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
	public List<Map> selectUserFundingList(Map request,int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("user.selectUserFundingList",request,rb);
	}


	@Override
	public List<Map> selectUserLikeFundingList(Map request,int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("user.selectUserLikeFundingList",request,rb);
	}


	@Override
	public List<Map> selectUserMadeFundingList(Map request,int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("user.selectUserMadeFundingList",request,rb);
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
	public int selectUserMadeNowFundingList(int userNo) {
		return session.selectOne("user.selectUserMadeNowFundingList",userNo);
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
	@Override
	public List<Map> selectSupportRewardListCount(Map request) {
		return session.selectList("user.selectSupportRewardListCount",request);
	}
	@Override
	public List<Map> selectLikeRewardListCount(Map request) {
		return session.selectList("user.selectUserLikeFundingListCount",request);
	}
	@Override
	public List<Map> selectMadeRewardListCount(Map request) {
		return session.selectList("user.selectUserMadeFundingListCount",request);
	}
	
	
	
}
