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
import com.spring.test.reward.model.vo.RewardReport;
import com.spring.test.reward.model.vo.RewardStoryContent;
import com.spring.test.reward.model.vo.RewardSupport;
import com.spring.test.reward.model.vo.RewardSupportItem;
import com.spring.test.reward.model.vo.RewardSupportItemInputOption;
import com.spring.test.user.model.dao.UserDao;

@Service
public class RewardServiceImpl implements RewardService {
	@Autowired
	RewardDao dao;

	@Autowired
	UserDao userDao;

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

		System.out.println(rewardItem);

		try {

			result = dao.updateRewardItem(rewardItem);

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
	public Reward getRewardStoryInfo(Map<String, Object> param) {
		Reward reward = dao.selectOnlyReward(param);
		
		if (reward == null) {
			return null;
		}

		reward.setGoalAttainmentPer(reward.getGoalAttainmentMoney()/(reward.getGoal()/100));
		if (param.get("userNo") != null) {
			reward.setIslike(dao.selectRewardLikeUser(param) == 1);
		}

		reward.setStoryContentList(dao.selectRewardContentList(Integer.parseInt(param.get("rewardNo").toString())));
		reward.setItemList(dao.selectRewardItemList(Integer.parseInt(param.get("rewardNo").toString())));

		return reward;
	}
	
	@Override
	@Transactional
	public Reward getRewardStoryInfoPreview(Map<String, Object> param) {
		Reward reward = dao.selectOnlyRewardPreview(param);
		System.out.println(reward);
		System.out.println("양심팔음?");
		
		if (reward == null) {
			return null;
		}

		reward.setGoalAttainmentPer(reward.getGoalAttainmentMoney()/(reward.getGoal()/100));
		if (param.get("userNo") != null) {
			reward.setIslike(dao.selectRewardLikeUser(param) == 1);
		}

		reward.setStoryContentList(dao.selectRewardContentList(Integer.parseInt(param.get("rewardNo").toString())));
		reward.setItemList(dao.selectRewardItemList(Integer.parseInt(param.get("rewardNo").toString())));

		return reward;
	}

	@Override
	@Transactional
	public Reward getRewardNoticeInfo(Map<String, Object> param) {
		Reward reward = dao.selectOnlyReward(param);

		if (reward == null) {
			return null;
		}

		reward.setGoalAttainmentPer(reward.getGoalAttainmentMoney()/(reward.getGoal()/100));
		if (param.get("userNo") != null) {
			reward.setIslike(dao.selectRewardLikeUser(param) == 1);
		}

		reward.setItemList(dao.selectRewardItemList(Integer.parseInt(param.get("rewardNo").toString())));

		return reward;
	}

	@Override
	@Transactional
	public Reward getRewardCommentInfo(Map<String, Object> param) {
		Reward reward = dao.selectOnlyReward(param);
		
		if (reward == null) {
			return null;
		}

		reward.setGoalAttainmentPer(reward.getGoalAttainmentMoney()/(reward.getGoal()/100));
		
		if (param.get("userNo") != null) {
			reward.setIslike(dao.selectRewardLikeUser(param) == 1);
		}

		if (reward != null) {
			reward.setItemList(dao.selectRewardItemList(Integer.parseInt(param.get("rewardNo").toString())));

			List<RewardComment> rewardCommentList = dao.selectRewardCommentList(param);

			System.out.println(rewardCommentList);
			

			if (rewardCommentList != null && rewardCommentList.size() != 0) {
				for (RewardComment rc : rewardCommentList) {
					rc.setDateStr(strUtil.parseToDate(rc.getDateStr()));

					List<RewardComment> rewardRecommentList = dao.selectRewardReCommentList(rc.getNo(), 0);
					rc.setContent(strUtil.tagToStr(rc.getContent()));

					for (RewardComment rrc : rewardRecommentList) {
						rrc.setDateStr(strUtil.parseToDate(rrc.getDateStr()));
						rrc.setContent(strUtil.tagToStr(rrc.getContent()));
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
			limit = (int) (Math.ceil((length / 5.0))) * 5;
		}

		RowBounds rowbounds = new RowBounds(0, limit);

		List<Map<String, Object>> recommentList = dao.selectRewardRecommentList(param, rowbounds);

		for (Map<String, Object> recomment : recommentList) {
			String dateStr = recomment.get("dateStr").toString();
			dateStr = strUtil.parseToDate(dateStr);
			recomment.remove("dateStr");
			recomment.put("dateStr", dateStr);
			String recommentContent = recomment.get("content").toString();
			recommentContent = strUtil.tagToStr(recommentContent);
			recomment.remove("content");
			recomment.put("content", recommentContent);

			if (param.get("userNo").toString().equals(recomment.get("userNo").toString())) {
				recomment.put("isMine", true);
			} else {
				recomment.put("isMine", false);
			}
		}

		return recommentList;
	}

	@Override
	@Transactional
	public List<Map<String, Object>> reloadRewardRecomment(Map<String, Object> param) {
		int size = Integer.parseInt(param.get("size").toString());
		int limit = (int) (Math.ceil(size / 5.0)) * 5;

		RowBounds rowbounds = new RowBounds(0, limit);

		List<Map<String, Object>> recommentList = dao.selectRewardRecommentList(param, rowbounds);

		for (Map<String, Object> recomment : recommentList) {
			String dateStr = recomment.get("dateStr").toString();
			dateStr = strUtil.parseToDate(dateStr);
			recomment.remove("dateStr");
			recomment.put("dateStr", dateStr);
			recomment.remove("dateStr");
			recomment.put("dateStr", dateStr);
			String recommentContent = recomment.get("content").toString();
			recommentContent = strUtil.tagToStr(recommentContent);
			recomment.remove("content");
			recomment.put("content", recommentContent);

			if (param.get("userNo") != null) {
				if (param.get("userNo").toString().equals(recomment.get("userNo").toString())) {
					recomment.put("isMine", true);
				} else {
					recomment.put("isMine", false);
				}
			}
		}

		return recommentList;
	}

	@Override
	@Transactional
	public List<Map<String, Object>> reloadRewardComment(Map<String, Object> param) {
		
		System.out.println("정신차려라...제발...");
		int size = Integer.parseInt(param.get("size").toString());
		int limit = (int) (Math.ceil(size + 1 / 5.0)) * 5;
		int userNo = 0;

		if (param.get("userNo") != null) {
			userNo = Integer.parseInt(param.get("userNo").toString());
		}

		System.out.println("11111111111111111111111111111111");
		
		RowBounds rowBounds = new RowBounds(0, 5);
		Map<String, Object> reParam = new HashMap();
		reParam.put("rewardNo", param.get("rewardNo"));
		reParam.put("rootNo", param.get("commentNo"));

		List<Map<String, Object>> commentList = dao.selectRewardCommentListMap(param, rowBounds);
		
		System.out.println("@222222222222222");

		for (Map<String, Object> comment : commentList) {
			
			if (param.get("userNo") == null) {
				comment.put("isMine", false);
			} else if (param.get("userNo").toString().equals(comment.get("userNo").toString())) {
				comment.put("isMine", true);
			}

			String str = strUtil.parseToDate(comment.get("dateStr").toString());
			comment.remove("dateStr");
			comment.put("dateStr", str);
			String commentContent = comment.get("content").toString();
			commentContent = strUtil.tagToStr(commentContent);
			comment.remove("content");
			comment.put("content", commentContent);

			List<Map<String, Object>> recommentList = dao.selectRewardRecommentList(reParam, new RowBounds(0, 5));
			
			System.out.println("33333333333333333333333333");

			for (Map<String, Object> recomment : recommentList) {
				if (param.get("userNo") == null) {
					recomment.put("isMine", false);
				} else if (param.get("userNo").toString().equals(recomment.get("userNo").toString())) {
					recomment.put("isMine", true);
				}
				
				System.out.println("44444444444444444444444");

				String reStr = strUtil.parseToDate(recomment.get("dateStr").toString());
				recomment.remove("dateStr");
				recomment.put("dateStr", reStr);
				String recommentContent = comment.get("content").toString();
				recommentContent = strUtil.tagToStr(recommentContent);
				recomment.remove("content");
				recomment.put("content", recommentContent);
			}

			comment.put("recommentList", recommentList);
		}

		return commentList;
	}

	@Override
	@Transactional
	public Map<String, Object> clickRewardLike(Map<String, Object> param) {
		Map<String, Object> map = new HashMap();

		int count = dao.selectRewardLikeUser(param);

		if (count == 0) {
			dao.insertRewardLike(param);

			map.put("isLike", true);

		} else {
			dao.deleteRewardLike(param);

			map.put("isLike", false);
		}

		map.put("likeNum", dao.selectRewardLikeNum(param));

		return map;
	}

	@Override
	@Transactional
	public Map<String, Object> selectRewardPaymentInfo(Map<String, Object> param) {

		Map<String, Object> user = userDao.selectUserWithNo(Integer.parseInt(param.get("userNo").toString()));
		Reward reward = dao.selectOnlyReward(param);
		if(reward.getState() != 5) {
			return null;
		}
		
		reward.setItemList(dao.selectRewardItemList(Integer.parseInt(param.get("rewardNo").toString())));
		
		Map<String, Object> data = new HashMap();
		data.put("user", user);
		data.put("reward", reward);
		data.put("userAddress", userDao.selectUserAddressList(Integer.parseInt(param.get("userNo").toString())));


		return data;
	}

	@Override
	@Transactional
	public int insertRewardSupport(RewardSupport rewardSupport) {
		int result = 0;

		try {
			for (RewardSupportItem supportItem : rewardSupport.getItemList()) {
				int num = supportItem.getNum();
				int itemNo = supportItem.getRewardItemNo();

				RewardItem item = dao.selectRewardItemReamin(itemNo);

				if (item.getRemainNum() < num) {
					result = -1;
					throw new Exception();
				}
			}
			
			
			
			dao.insertRewardSupport(rewardSupport);
			
			rewardSupport.getRewardAccount().setRewardSupportNo(rewardSupport.getNo());
			dao.insertRewardAccount(rewardSupport.getRewardAccount());
			rewardSupport.getAddress().setRewardSupportNo(rewardSupport.getNo());
			dao.insertRewardDelivery(rewardSupport.getAddress());
			
			for (RewardSupportItem supportItem : rewardSupport.getItemList()) {
				supportItem.setRewardNo(rewardSupport.getRewardNo());
				supportItem.setRewardSupportNo(rewardSupport.getNo());
				
				dao.insertRewardSupportItem(supportItem);
				
				for (RewardSupportItemInputOption inputOption : supportItem.getInputOptionList()) {
					inputOption.setRewardSupportNo(rewardSupport.getNo());
					dao.insertRewardSupportItemInputOption(inputOption);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}

		return 1;
	}
	
	@Override
	@Transactional
	public Map<String, Object> selectRewardAddress(Map<String, Object> param) {
		return dao.selectRewardAddress(param);
	}
	
	@Override
	@Transactional
	public int updateRewardState(int rewardNo, int rewardState) {
		Map<String, Object> param = new HashMap();
		param.put("rewardNo", rewardNo);
		param.put("rewardState", rewardState);
		
		return dao.updateRewardState(param);
	}
	
	@Override
	@Transactional
	public int deleteComment(Map<String, Object> param) {
		return dao.deleteComment(param);
	}
	
	@Override
	@Transactional
	public int deleteRecomment(Map<String, Object> param) {
		return dao.deleteRecomment(param);
	}

	@Override
	public int insertRewardReport(RewardReport r) {
		// TODO Auto-generated method stub
		return dao.insertRewardReport(r);
	}

	@Override
	public List<Map<String, Object>> selectSupporterBasicInfo(int rewardNo) {
		RowBounds rowBounds = new RowBounds(0, 5);
		
		return dao.selectRewardSupporterBasic(rewardNo, rowBounds);
	}
	
	@Override
	public List<Map<String, Object>> selectSupporterBasicInfo(Map<String, Object> param) {
		int pageNo = Integer.parseInt(param.get("requestPage").toString());
		int maxPage = 5;
		int pageLength = dao.selectRewardSupportNum(Integer.parseInt(param.get("rewardNo").toString()));
		
		int rowBoundsStart = maxPage * (pageNo - 1);
		int rowBoundsOffset = maxPage;
		
		RowBounds rowBounds = new RowBounds(rowBoundsStart, maxPage);
		
		return dao.selectRewardSupporterBasic(Integer.parseInt(param.get("rewardNo").toString()), rowBounds);
	}
	
	@Override
	public int selectSupportNum(int rewardNo) {
		return dao.selectRewardSupportNum(rewardNo);
	}


}
