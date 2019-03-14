package com.spring.test.reward.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.test.common.util.FileUtil;
import com.spring.test.common.util.NumberUtil;
import com.spring.test.reward.model.service.RewardService;
import com.spring.test.reward.model.vo.Reward;
import com.spring.test.reward.model.vo.RewardItem;

import net.sf.json.JSONObject;

@Controller
public class RewardController {
	@Autowired
	RewardService service;
	
	@Autowired
	FileUtil fileUtil;
	
	@Autowired
	NumberUtil numberUtil;
	
	
	@RequestMapping("project/reward/rewardopen")
	public ModelAndView createReward() {
		ModelAndView mv = new ModelAndView("/reward/rewardopen");
		
		mv.addObject("category", service.selectRewardCategoryList());
		
		return mv;
		
	}
	
	@RequestMapping(value="/project/reward/rewardwrite", method=RequestMethod.POST)
	public ModelAndView writeReward(@RequestParam Map<String, Object> param) {
		ModelAndView mv = new ModelAndView();
		
	
		int rewardNo = service.selectNextRewardNo();
		param.put("userNo", 1);
		param.put("rewardNo", rewardNo);
		param.put("categoryNo", param.get("rewardCategory"));
		
		
		int result = service.createProjectReward(param);
		
		mv.setViewName("redirect:/project/reward/update/" + rewardNo);
		

		return mv;
	}
	
	@RequestMapping("/project/reward/update/{rewardNo}")
	public ModelAndView updateReward(@PathVariable("rewardNo") int rewardNo, Model model){
		ModelAndView mv = new ModelAndView();

		
		mv.addObject("rewardNo", rewardNo);
		mv.addObject("category", service.selectRewardCategoryList());
		mv.setViewName("/reward/rewardwrite");

		Reward reward = service.selectReward(rewardNo);
		mv.addObject("reward", service.selectReward(rewardNo));
		return mv;
	}
	
	@RequestMapping("/project/reward/{rewardNo}")
	public ModelAndView showRewardStory(@PathVariable("rewardNo") int rewardNo) {
		ModelAndView mv = new ModelAndView("/reward/rewardstory");
		
		
		
		return mv;
	}
	
	@RequestMapping("/project/reward/notice/{rewardNo}")
	public ModelAndView showRewardNotice(@PathVariable("rewardNo") int rewardNo) {
		ModelAndView mv = new ModelAndView("/reward/rewardnotice");
		
	
		
		return mv;
	}
	
	@RequestMapping("/project/reward/comment/{rewardNo}")
	public ModelAndView showRewardComment(@PathVariable("rewardNo") int rewardNo) {
		ModelAndView mv = new ModelAndView("/reward/rewardcomment");
		
	
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/project/reward/updateBasicInfo")
	public boolean updateRewardBasicInfo(@RequestParam Map<String, Object> param, @RequestParam MultipartFile file, HttpServletRequest request) {
		if (!file.isEmpty()) {
			String rootDir = request.getSession().getServletContext().getRealPath("/");
			String saveDir = "resources/upload/rewardProjectRepresent";
			String renamedFileName = fileUtil.getRenamedFileName(file);
			fileUtil.saveFile(file, rootDir, saveDir, renamedFileName);
			String saveAllDir = "/" + saveDir + "/" + renamedFileName;
			param.put("rewardRepresentPhoto", saveAllDir);
			
			System.out.println(rootDir);
		}
		
		service.updateRewardBasicInfo(param);
		
		System.out.println(param);
		
		return true;
	}
	
	@ResponseBody
	@RequestMapping(value="/project/reward/updateMCInfo")
	public boolean updateRewardMCInfo(@RequestParam Map<String, Object> param, @RequestParam MultipartFile file, HttpServletRequest request) {
		if (!file.isEmpty()) {
			String rootDir = request.getSession().getServletContext().getRealPath("/");
			String saveDir = "resources/upload/rewardMCRepresent";
			String renamedFileName = fileUtil.getRenamedFileName(file);
			fileUtil.saveFile(file, rootDir, saveDir, renamedFileName);
			String saveAllDir = "/" + saveDir + "/" + renamedFileName;
			param.put("rewardMCPhoto", saveAllDir);
			
			System.out.println(rootDir);
		}
		
		System.out.println(param);
		service.updateRewardBasicInfo(param);
		
		
		
		return true;
	}

	

	@RequestMapping("/project/reward/iteminsert")
	public @ResponseBody Map<String,Object> insertItem(@RequestBody RewardItem rewardItem) {
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("반가워");
		System.out.println(rewardItem);
		int itemNo = service.insertRewardItem(rewardItem);
		
		System.out.println(rewardItem.getSelectOptionList());
		System.out.println(rewardItem.getInputOptionList());
		
		
		if (itemNo < 1) {
			map.put("result", 0);
		} else {
			map.put("result", 1);
			map.put("itemNo", itemNo);
			map.put("inputOptionList", rewardItem.getInputOptionList());
			map.put("selectOptionList", rewardItem.getSelectOptionList());
		}
		
	 
	  return map;
	}
	
	@ResponseBody
	@RequestMapping("/project/reward/itemupdate")
	public Map<String, Object> updateItem(@RequestBody RewardItem rewardItem) {
		Map<String, Object> map = new HashMap<String,Object>();
		
		service.updateRewardItem(rewardItem);
		
		map.put("result", 1);
		map.put("itemNo", rewardItem.getNo());
		map.put("inputOptionList", rewardItem.getInputOptionList());
		map.put("selectOptionList", rewardItem.getSelectOptionList());
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/project/reward/itemdelete")
	public String deleteItem(@RequestBody String itemNo) {
		System.out.println("반가워");
		System.out.println(itemNo);
		
		if (!numberUtil.isInteger(itemNo)) {
			return "fail";
		}
		
		int itemNoInteger = Integer.parseInt(itemNo);
		
		if(itemNoInteger < 1) {
			return "fail";
		}
		
		int result = service.deleteRewardItem(itemNoInteger);
	 
	  return "success";
	}


	
	
}
