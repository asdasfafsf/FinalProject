package com.spring.test.reward.controller;

import java.io.IOException;
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
import com.spring.test.reward.model.service.RewardService;
import com.spring.test.reward.model.vo.RewardItem;

import net.sf.json.JSONObject;

@Controller
public class RewardController {
	@Autowired
	RewardService service;
	
	@Autowired
	FileUtil fileUtil;
	
	
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

	
	@ResponseBody
	@RequestMapping("/project/reward/iteminsert")
	public String insert(@RequestBody RewardItem rewardItem) {
		System.out.println("반가워");
	System.out.println(rewardItem);
	 
	  return "success";
	}


	
	
}
