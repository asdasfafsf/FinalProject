package com.spring.test.reward.model.service;

import java.util.*;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.test.common.util.StringUtil;
import com.spring.test.reward.model.dao.RewardDao;
import com.spring.test.reward.model.vo.Reward;
import com.spring.test.reward.model.vo.RewardComment;
import com.spring.test.reward.model.vo.RewardItem;
import com.spring.test.reward.model.vo.RewardItemInputOption;
import com.spring.test.reward.model.vo.RewardItemSelectOption;
import com.spring.test.reward.model.vo.RewardStoryContent;

@Service
public class RewardServiceImpl implements RewardService {
	@Autowired
	RewardDao dao;
	
	@Autowired
	StringUtil strUtil;

	@Override
	@Transactional
	public int selectNextRewardNo() {

		return dao.selectNextRewardNo();
	}

	@Override
	@Transactional
	public List<Map<String, Object>> selectRewardCategoryList() {
		return dao.selectRewardCategory();
	}

	@Override
	@Transactional
	public int createProjectReward(Map<String, Object> basicInfo) {
		int result = dao.createProjectReward(basicInfo);

		return result;
	}

	@Override
	@Transactional
	public int selectCurRewardNo() {
		return dao.selectCurRewardNo();
	}

	@Override
	@Transactional
	public int updateRewardBasicInfo(Map<String, Object> param) {
		return dao.updateRewardBasicInfo(param);
	}

	@Override
	@Transactional
	public int insertRewardItem(RewardItem rewardItem) {
		dao.insertRewardItem(rewardItem);
		rewardItem.setSelectOptionList(rewardItem.getSelectOptionList());
		rewardItem.setInputOptionList(rewardItem.getInputOptionList());

		if (rewardItem.getSelectOptionList().size() > 0) {
			for (RewardItemSelectOption selectOption : rewardItem.getSelectOptionList()) {
				dao.insertRewardSelectOption(selectOption);
			}
		}

		if (rewardItem.getInputOptionList().size() > 0) {
			for (RewardItemInputOption inputOption : rewardItem.getInputOptionList()) {
				dao.insertRewardInputOption(inputOption);
			}
		}

		return rewardItem.getNo();
	}

	@Override
	@Transactional
	public int updateRewardItem(RewardItem rewardItem) {
		List<RewardItemSelectOption> selectOptionList = rewardItem.getSelectOptionList();
		List<RewardItemInputOption> inputOptionList = rewardItem.getInputOptionList();
		int result = 0;

		try {

			for (RewardItemSelectOption selectOption : selectOptionList) {
				if (selectOption.getNo() == 0) {
					result = dao.insertRewardSelectOption(selectOption);
				} else {
					result = dao.updateRewardSelectOption(selectOption);
				}
			}

			for (RewardItemInputOption inputOption : inputOptionList) {
				if (inputOption.getNo() == 0) {
					dao.insertRewardInputOption(inputOption);
				} else {
					dao.updateRewardInputOption(inputOption);
				}
			}

			if (selectOptionList != null && selectOptionList.size() > 0) {
				dao.deleteRewardSelectOption(selectOptionList);
			}

			if (inputOptionList != null && inputOptionList.size() > 0) {
				dao.deleteRewardInputOption(inputOptionList);
			}
		} catch (Exception e) {
			return 0;
		}

		return 1;
	}

	@Override
	@Transactional
	public Reward selectReward(int rewardNo) {
		return dao.selectReward(rewardNo);
	}

	@Override
	@Transactional
	public int deleteRewardItem(int itemNo) {
		return dao.deleteRewardItem(itemNo);
	}

	@Override
	@Transactional
	public Reward getRewardStoryInfo(int rewardNo) {
		Reward reward = dao.selectOnlyReward(rewardNo);
		reward.setStoryContentList(dao.selectRewardContentList(rewardNo));
		reward.setItemList(dao.selectRewardItemList(rewardNo));

		return reward;
	}

	@Override
	@Transactional
	public Reward getRewardNoticeInfo(int rewardNo) {
		Reward reward = dao.selectOnlyReward(rewardNo);
		reward.setItemList(dao.selectRewardItemList(rewardNo));

		return reward;
	}

	@Override
	@Transactional
	public Reward getRewardCommentInfo(Map<String, Object> param) {
		Reward reward = dao.selectOnlyReward(Integer.parseInt(param.get("rewardNo").toString()));
		
		if (reward != null) {
			reward.setItemList(dao.selectRewardItemList(Integer.parseInt(param.get("rewardNo").toString())));
			
			List<RewardComment> rewardCommentList = dao.selectRewardCommentList(param);
			
			System.out.println(rewardCommentList);
			
			if (rewardCommentList != null && rewardCommentList.size() != 0) {
				for (RewardComment rc : rewardCommentList) {
					rc.setDateStr(strUtil.parseToDate(rc.getDateStr()));
					
					List<RewardComment> rewardRecommentList = dao.selectRewardReCommentList(rc.getNo(), 0);
					System.out.println(rc.getNo());
					
					for(RewardComment rrc : rewardRecommentList) {
						rrc.setDateStr(strUtil.parseToDate(rrc.getDateStr()));
					}
					
					rc.setRecommentList(rewardRecommentList);
				}
				
				reward.setCommentList(rewardCommentList);
			}
			
		}
		return reward;
	}
	
	
	
	@Override
	@Transactional
	public int updateRewardStoryContentList(Reward reward) {
	
		int result = dao.deleteRewardStoryContent(reward.getNo());
		
		for (RewardStoryContent rewardStoryContent : reward.getStoryContentList()) {
			result = dao.insertRewardStoryContent(rewardStoryContent);
		}
		
		return result;
	}
	
	@Override
	@Transactional
	public int insertRewardComment(Map<String, Object> param) {
		return dao.insertRewardComment(param);
	}
	
	@Override
	@Transactional
	public List<Map<String, Object>> insertRewardRecomment(Map<String, Object> param) {
		int result = dao.insertRewardRecomment(param);
		
		int length = Integer.parseInt(param.get("size").toString());
		int limit = 0;
		
		if (length < 6) {
			limit = 5;
		} else {
			limit = (int)(Math.ceil((length / 5.0))) * 5;
		}
		
		RowBounds rowbounds = new RowBounds(0, limit);
		
		List<Map<String, Object>> recommentList = dao.selectRewardRecommentList(param, rowbounds);
		
		for (Map<String, Object> recomment : recommentList) {
			String dateStr = recomment.get("dateStr").toString();
			dateStr = strUtil.parseToDate(dateStr);
			recomment.remove("dateStr");
			recomment.put("dateStr", dateStr);
			
			if(param.get("userNo").toString().equals(recomment.get("userNo").toString())) {
				recomment.put("isMine", true);
			} else {
				recomment.put("isMine", false);
			}
		}
		
		return recommentList;
	}
	
	@Override
	@Transactional
	public List<Map<String, Object>> reloadRewardRecomment(Map<String, Object> param){
		int size = Integer.parseInt(param.get("size").toString());
		int limit = (int)(Math.ceil(size / 5.0)) * 5;
		
		
		RowBounds rowbounds = new RowBounds(0, limit);
		
		List<Map<String, Object>> recommentList = dao.selectRewardRecommentList(param, rowbounds);
		
		for (Map<String, Object> recomment : recommentList) {
			String dateStr = recomment.get("dateStr").toString();
			dateStr = strUtil.parseToDate(dateStr);
			recomment.remove("dateStr");
			recomment.put("dateStr", dateStr);
			
			if (param.get("userNo") != null) {
				if (param.get("userNo").toString().equals(recomment.get("userNo").toString())) {
					recomment.put("isMine", true);
				} 	else {
					recomment.put("isMine", false);
				}
			}
		}
		
		return recommentList;
	}

}
