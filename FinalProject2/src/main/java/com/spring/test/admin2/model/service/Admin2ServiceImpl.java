package com.spring.test.admin2.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.test.admin2.model.dao.Admin2Dao;
import com.spring.test.admin2.model.vo.AdminUser;
import com.spring.test.admin2.model.vo.ReportNo;
import com.spring.test.admin2.model.vo.RewardSort;

@Service
public class Admin2ServiceImpl implements Admin2Service {
	@Autowired
	Admin2Dao dao;
	@Override
	public List<Map<String, String>> selectAdminList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectAdminList(cPage,numPerPage);
	}

	@Override
	public int selectAdminCount() {
		// TODO Auto-generated method stub
		return dao.selectAdminCount();
	}

	@Override
	public int deleteAdmin(int userNo) {
		// TODO Auto-generated method stub
		return dao.deleteAdmin(userNo);
	}

	@Override
	public int checkId(String email) {
		// TODO Auto-generated method stub
		return dao.checkId(email);
	}

	@Override
	public int insertAdmin(AdminUser au) {
		// TODO Auto-generated method stub
		return dao.insertAdmin(au);
	}

	@Override
	public int selectSearchAdminCount(String word) {
		// TODO Auto-generated method stub
		return dao.selectSearchAdminCount(word);
	}

	@Override
	public List<Map<String, String>> selectSearchAdminList(int cPage, int numPerPage, String word) {
		// TODO Auto-generated method stub
		return dao.selectSearchAdminList(cPage, numPerPage, word);
	}

	@Override
	public List<Map<String, String>> selectRewardContinueSortList(int cPage, int numPerPage, RewardSort rs) {
		// TODO Auto-generated method stub
		return dao.selectRewardContinueSortList(cPage, numPerPage, rs);
	}

	@Override
	public int selectRewardContinueSortCount(RewardSort rs) {
		// TODO Auto-generated method stub
		return dao.selectRewardContinueSortCount(rs);
	}

	@Override
	public List<Map<String, String>> selectRewardStopSortList(int cPage, int numPerPage, RewardSort rs) {
		// TODO Auto-generated method stub
		return dao.selectRewardStopSortList(cPage, numPerPage, rs);
	}

	@Override
	public int selectRewardStopSortCount(RewardSort rs) {
		// TODO Auto-generated method stub
		return dao.selectRewardStopSortCount(rs);
	}

	@Override
	public List<Map<String, String>> selectRewardAppSortList(int cPage, int numPerPage, RewardSort rs) {
		// TODO Auto-generated method stub
		return dao.selectRewardAppSortList(cPage, numPerPage, rs);
	}

	@Override
	public int selectRewardAppSortCount(RewardSort rs) {
		// TODO Auto-generated method stub
		return dao.selectRewardAppSortCount(rs);
	}

	@Override
	public List<Map<String, String>> selectReportList(int cPage, int numPerPage, List list) {
		// TODO Auto-generated method stub
		return dao.selectReportList(cPage, numPerPage, list);
	}

	@Override
	public int selectReportCount(List list) {
		// TODO Auto-generated method stub
		return dao.selectReportCount(list);
	}

	@Override
	public List<Map<String, String>> selectReportContent(int reportNo) {
		// TODO Auto-generated method stub
		return dao.selectReportContent(reportNo);
	}

	@Override
	public int ignoreReport(int reportNo) {
		// TODO Auto-generated method stub
		return dao.ignoreReport(reportNo);
	}
	@Override
	public int deleteReport(int reportNo) {
		// TODO Auto-generated method stub
		return dao.deleteReport(reportNo);
	}
	@Override
	public int confirmReport(ReportNo r) {
		// TODO Auto-generated method stub
		return dao.confirmReport(r);
	}

}
