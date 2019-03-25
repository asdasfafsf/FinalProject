package com.spring.test.admin2.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.test.admin2.model.vo.AdminUser;
import com.spring.test.admin2.model.vo.RewardSort;
@Repository
public class Admin2DaoImpl implements Admin2Dao {
	@Autowired
	SqlSessionTemplate session;
	@Override
	public List<Map<String, String>> selectAdminList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("admin.selectAdminList",null,rb);
	}

	@Override
	public int selectAdminCount() {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectAdminCount");
	}

	@Override
	public int deleteAdmin(int userNo) {
		// TODO Auto-generated method stub
		return session.delete("admin.deleteAdmin",userNo);
	}

	@Override
	public int checkId(String email) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.checkId",email);
	}

	@Override
	public int insertAdmin(AdminUser au) {
		// TODO Auto-generated method stub
		return session.insert("admin.insertAdmin",au);
	}

	@Override
	public int selectSearchAdminCount(String word) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectSearchAdminCount",word);
	}

	@Override
	public List<Map<String, String>> selectSearchAdminList(int cPage, int numPerPage, String word) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("admin.selectSearchAdminList",word,rb);
	}

	@Override
	public int selectRewardContinueSortCount(RewardSort rs) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectRewardContinueSortCount", rs);
	}

	@Override
	public List<Map<String, String>> selectRewardContinueSortList(int cPage, int numPerPage, RewardSort rs) {
		// TODO Auto-generated method stub
		RowBounds rb= new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("admin.selectRewardContinueSortList",rs,rb);
	}

	@Override
	public int selectRewardStopSortCount(RewardSort rs) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectRewardStopSortCount",rs);
	}

	@Override
	public List<Map<String, String>> selectRewardStopSortList(int cPage, int numPerPage, RewardSort rs) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("admin.selectRewardStopSortList",rs,rb);
	}

	@Override
	public int selectRewardAppSortCount(RewardSort rs) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectRewardAppSortCount",rs);
	}

	@Override
	public List<Map<String, String>> selectRewardAppSortList(int cPage, int numPerPage, RewardSort rs) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("admin.selectRewardAppSortList",rs,rb);
	}

}
