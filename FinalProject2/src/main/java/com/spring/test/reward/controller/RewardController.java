package com.spring.test.reward.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.test.account.service.AccountService;
import com.spring.test.common.util.FileUtil;
import com.spring.test.common.util.NumberUtil;
import com.spring.test.reward.model.service.RewardService;
import com.spring.test.reward.model.vo.Reward;
import com.spring.test.reward.model.vo.RewardItem;
import com.spring.test.reward.model.vo.RewardStoryContent;
import com.spring.test.reward.model.vo.RewardSupport;

import net.sf.json.JSONObject;

@Controller
public class RewardController {
	@Autowired
	RewardService service;
	
	@Autowired
	FileUtil fileUtil;
	
	@Autowired
	NumberUtil numberUtil;
	
	@Autowired
	AccountService accountService;
	
	
	@RequestMapping("/project/reward/rewardopen")
	public ModelAndView createReward() {
		ModelAndView mv = new ModelAndView("/reward/rewardopen");
		
		mv.addObject("category", service.selectRewardCategoryList());
		
		return mv;
		
	}
	
	@RequestMapping(value="/project/reward/rewardwrite", method=RequestMethod.POST)
	public ModelAndView writeReward(@RequestParam Map<String, Object> param, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
	
		int rewardNo = service.selectNextRewardNo();
		param.put("userNo", request.getSession().getAttribute("userNo"));
		param.put("rewardNo", rewardNo);
		param.put("categoryNo", param.get("rewardCategory"));
		
		
		int result = service.createProjectReward(param);
		
		mv.setViewName("redirect:/project/reward/update/" + rewardNo);
		

		return mv;
	}
	
	@RequestMapping("/project/reward/update/{rewardNo}")
	public ModelAndView updateReward(@PathVariable("rewardNo") int rewardNo, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();


		Reward reward = service.selectReward(rewardNo);
		
		int userNo = Integer.parseInt(request.getSession().getAttribute("userNo").toString());
		
		if (userNo != reward.getUserNo() || reward.getState() != 1) {
			System.out.println(userNo);
			System.out.println(reward.getState());
			
			mv.setViewName("/mainPage");
			
			return mv;
		}
		
		mv.addObject("rewardAccount",accountService.selectRewardAccount(rewardNo));
		mv.addObject("rewardNo", rewardNo);
		mv.addObject("category", service.selectRewardCategoryList());
		mv.setViewName("/reward/rewardwrite");
		
		mv.addObject("reward", reward);
		return mv;
	}
	
	@RequestMapping("/project/reward/{rewardNo}")
	public ModelAndView showRewardStory(@PathVariable("rewardNo") int rewardNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> param = new HashMap();
		
		param.put("rewardNo", rewardNo);
		
		if (request.getSession().getAttribute("userNo") != null) {
			param.put("userNo", request.getSession().getAttribute("userNo"));
		}
		
		Reward reward = service.getRewardStoryInfo(param);
		
		if (reward == null) {
			return new ModelAndView("dassadad/asdsadsa");
		} else {
			mv.setViewName("/reward/rewardstory");
			mv.addObject("reward", reward);
		}
		
		
		
		return mv;
	}
	
	@RequestMapping("/project/reward/notice/{rewardNo}")
	public ModelAndView showRewardNotice(@PathVariable("rewardNo") int rewardNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> param = new HashMap();
		
		param.put("rewardNo", rewardNo);
		
		if (request.getSession().getAttribute("userNo") != null) {
			param.put("userNo", Integer.parseInt(request.getSession().getAttribute("userNo").toString()));
		}
		
		Reward reward = service.getRewardCommentInfo(param);
		
		if (reward != null) {
			mv.setViewName("/reward/rewardnotice");
			mv.addObject("reward", reward);
		} else {
			return new ModelAndView("dassadad/asdsadsa");
		}
		
		return mv;
	}
	
	@RequestMapping("/project/reward/comment/{rewardNo}")
	public ModelAndView showRewardComment(@PathVariable("rewardNo") int rewardNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> param = new HashMap();
		
		param.put("rewardNo", rewardNo);
		
		if (request.getSession().getAttribute("userNo") != null) {
			param.put("userNo", Integer.parseInt(request.getSession().getAttribute("userNo").toString()));
		}
	
		
		Reward reward = service.getRewardCommentInfo(param);
		
		System.out.println(reward);
		System.out.println("안녕?");
		if (reward != null) {
			mv.setViewName("/reward/rewardcomment");
			mv.addObject("reward", reward);
		} else {
			mv.setViewName("/mainPage");
		}
		
	
		
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
	@RequestMapping(value="/project/reward/preOpen")
	public boolean updateRewardPreOpen(@RequestParam Map<String, Object> param) {
		System.out.println("신난다!");
		System.out.println(param);
		
		service.updateRewardBasicInfo(param);
		
		return true;
	}
	
	@ResponseBody
	@RequestMapping(value="/project/reward/account")
	public boolean updateRewardAccount(@RequestParam Map<String, Object> param, @RequestParam MultipartFile file, HttpServletRequest request) {
		if (file != null && !file.isEmpty()) {
			String rootDir = request.getSession().getServletContext().getRealPath("/");
			String saveDir = "resources/upload/rewardAccount";
			String renamedFileName = fileUtil.getRenamedFileName(file);
			fileUtil.saveFile(file, rootDir, saveDir, renamedFileName);
			String saveAllDir = "/" + saveDir + "/" + renamedFileName;
			param.put("rewardBankBookPhoto", saveAllDir);
			
			System.out.println(rootDir);
		}
		
		System.out.println(param);
		if(param.get("fintech_use_num").equals("")||param.get("user_seq_no").equals("")) {}
		else{
			accountService.updateRewardAccount(param);
		}
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
		System.out.println(rewardItem);
		System.out.println("너는또 왜지랄이냐");
		
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
	
	@ResponseBody
	@RequestMapping("/project/reward/savestoryimage")
	public String saveStoryImage(@RequestParam MultipartFile file, HttpServletRequest request) {
		System.out.println(file);
		System.out.println("이미지를 저장해요!");
		
		if (file != null && !file.isEmpty()) {
			String rootDir = request.getSession().getServletContext().getRealPath("/");
			String saveDir = "resources/upload/rewardStoryContent";
			String renamedFileName = fileUtil.getRenamedFileName(file);
			fileUtil.saveFile(file, rootDir, saveDir, renamedFileName);
			String saveAllDir = "/" + saveDir + "/" + renamedFileName;
			
			return saveAllDir;
		}
		return "fail";
	}
	
	@ResponseBody
	@RequestMapping("/project/reward/updateStory")
	public String saveStoryContent(@RequestParam MultipartFile file,@RequestParam Map<String, Object> map, HttpServletRequest request) {
		System.out.println("이미지를 저장해요!");
		if (file != null && !file.isEmpty()) {
			String rootDir = request.getSession().getServletContext().getRealPath("/");
			String saveDir = "resources/upload/rewardStoryRepresent";
			String renamedFileName = fileUtil.getRenamedFileName(file);
			fileUtil.saveFile(file, rootDir, saveDir, renamedFileName);
			String saveAllDir = "/" + saveDir + "/" + renamedFileName;
			
			int type = 0;
			
			if (renamedFileName.endsWith(".mp4")) {
				type = 1;
			}
			
			map.put("rewardStoryMedia", saveAllDir);
			map.put("rewardStoryType", type);
			service.updateRewardBasicInfo(map);
		}
		
		System.out.println("양심팔았음????");
		
		return "success";
	}
	
	
	@ResponseBody
	@RequestMapping("/project/reward/updateStoryContent")
	public Map<String, Object> saveStoryContents(@RequestBody Reward reward) {
		System.out.println("아니 왜 못쳐받음??");
		
		service.updateRewardStoryContentList(reward);
		
		return new HashMap();
	}
	
	
	@RequestMapping("/project/reward/writecomment")
	public String writeComment(@RequestParam Map<String, Object> param, HttpServletRequest request) {
		int userNo = (int) request.getSession().getAttribute("userNo");
		
		param.put("userNo", userNo);
		
		System.out.println(param);
		
		int result = service.insertRewardComment(param);
		
		if (result > 0) {
			return "redirect:/project/reward/comment/" + param.get("rewardNo");
		}
		
		
		return "redirect:/";
	}
	
	@RequestMapping("/project/reward/recommentwrite")
	@ResponseBody
	public List<Map<String, Object>> writeRecomment(@RequestParam Map<String, Object> param, HttpServletRequest request) {
		
		System.out.println(param);
		
		param.put("userNo", request.getSession().getAttribute("userNo"));
		
	    List<Map<String, Object>> recommentList = service.insertRewardRecomment(param);
		
		return recommentList;
	}
	
	@RequestMapping("/project/reward/rewardrecommentload")
	@ResponseBody
	public List<Map<String, Object>> reloadRecomment(@RequestParam Map<String, Object> param, HttpServletRequest request) {
		
		int size = Integer.parseInt(param.get("size").toString());
		if(request.getSession().getAttribute("userNo") != null) {
			param.put("userNo", request.getSession().getAttribute("userNo"));
		}
		
	    List<Map<String, Object>> recommentList = service.reloadRewardRecomment(param);
		
		return recommentList;
	}
	
	@RequestMapping("/project/reward/rewardcommentload")
	@ResponseBody
	public List<Map<String, Object>> reloadComment(@RequestParam Map<String, Object> param, HttpServletRequest request) {
		
		int size = Integer.parseInt(param.get("size").toString());
		if(request.getSession().getAttribute("userNo") != null) {
			param.put("userNo", request.getSession().getAttribute("userNo"));
		}
		
		if (param.get("rewardNo") == null) {
			return new ArrayList();
		}
		
		System.out.println(param);
		
	    List<Map<String, Object>> commentList = service.reloadRewardComment(param);
	    
	    if (commentList == null) {
	    	commentList = new ArrayList();
	    }
		
		return commentList;
	}
	
	@RequestMapping("/project/reward/rewardlike")
	@ResponseBody
	public Map<String, Object> rewardlike(@RequestParam Map<String, Object> param, HttpServletRequest request) {
		System.out.println("반가워!!!");
		System.out.println(param);
		
		int userNo = Integer.parseInt(request.getSession().getAttribute("userNo").toString());
		param.put("userNo", userNo);
		
		return service.clickRewardLike(param);
	}
	
	@RequestMapping("/project/reward/rewardpayment/{rewardNo}")
	public ModelAndView rewardPayment(@PathVariable int rewardNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Map<String, Object> param = new HashMap();
		param.put("rewardNo", rewardNo);
		param.put("userNo", Integer.parseInt(request.getSession().getAttribute("userNo").toString()));
		Map<String, Object> data = service.selectRewardPaymentInfo(param);
		
		if (data == null) {
			mv.setViewName("/mainPage");
			return mv;
		}
		mv.setViewName("/reward/rewardpayment");
		
		if (request.getParameter("itemIndex") != null) {
			mv.addObject("itemIndex",request.getParameter("itemIndex"));
		}
		
		
		
		mv.addObject("user",data.get("user"));
		mv.addObject("reward", data.get("reward"));
		mv.addObject("userAddress", data.get("userAddress"));
		
		

		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/project/reward/requestsupport")
	public Map<String, Object> rewardPayment(@RequestBody RewardSupport rewardSupport, HttpServletRequest request) {
		System.out.println(rewardSupport);
		System.out.println("gdgd");
		
		rewardSupport.setUserNo(Integer.parseInt(request.getSession().getAttribute("userNo").toString()));
		
		int result = service.insertRewardSupport(rewardSupport);
	
		Map<String, Object> map = new HashMap();
		
		map.put("result", result);
		
		return map;
	}
	
	
	@ResponseBody
	@RequestMapping("/project/reward/requestaddress")
	public Map<String, Object> rewardAddress(@RequestBody Map<String, Object> param, HttpServletRequest request){
		System.out.println(param.get("addressNo"));
		
		
		
		param.put("userNo", Integer.parseInt(request.getSession().getAttribute("userNo").toString()));
		
		System.out.println(param);
		
		Map<String, Object> map = service.selectRewardAddress(param);
		
		if (map == null) {
			map = new HashMap();
			map.put("result", "fail");
		} else {
			map.put("result", "success");
		}
		return map;
	}
	
	@RequestMapping("/project/reward/rewardcheck")
	public String requestRewardCheck(@RequestParam int rewardNo) {
		System.out.println(rewardNo);
		
		service.updateRewardState(rewardNo, 2);
		
		return "/mainPage";
	}
	
	@ResponseBody
	@RequestMapping("/project/reward/deletecomment")
	public Map<String, Object> deleteComment(@RequestBody Map<String, Object> param, HttpServletRequest request) {
		System.out.println(param);
		System.out.println("댓글을 지우자!");
		
		if(request.getSession().getAttribute("userNo") == null) {
			Map<String, Object> error = new HashMap();
			error.put("result", "noLogin");
			
			return error;
		}
		
		param.put("userNo", Integer.parseInt(request.getSession().getAttribute("userNo").toString()));
		
		int result = service.deleteComment(param);
		
		Map<String,Object> success = new HashMap();
		
		if (result > 0) {
			success.put("result", "success");
		}
		
		
		
		return success;
	}
	
	@ResponseBody
	@RequestMapping("/project/reward/deleterecomment")
	public Map<String, Object> deleteRecomment(@RequestBody Map<String, Object> param, HttpServletRequest request) {
		System.out.println(param);
		System.out.println("댓글을 지우자!");
		
		if(request.getSession().getAttribute("userNo") == null) {
			Map<String, Object> error = new HashMap();
			error.put("result", "noLogin");
			
			return error;
		}
		Map<String,Object> success = new HashMap();
		param.put("userNo", Integer.parseInt(request.getSession().getAttribute("userNo").toString()));
		int result = service.deleteRecomment(param);
		
		if (result < 1) {
			success.put("result", "fail");
			return success;
		}
		
		System.out.println("설마 못지우는거임? 근데 없어지던데?");
		
		param.remove("commentNo");
		param.put("rootNo", param.get("rootCommentNo"));
		
		
		success.put("recommentList", service.reloadRewardRecomment(param));
		success.put("result", "success");
			
		return success;
	}
	
	@RequestMapping("/project/reward/evaluate/{rewardNo}")
	public ModelAndView evaluateReward(@PathVariable int rewardNo) {
		ModelAndView mv = new ModelAndView();


		Reward reward = service.selectReward(rewardNo);
		
		mv.addObject("rewardAccount",accountService.selectRewardAccount(rewardNo));
		mv.addObject("rewardNo", rewardNo);
		mv.addObject("category", service.selectRewardCategoryList());
		mv.setViewName("/reward/rewardwriteview");
		
		mv.addObject("reward", reward);
		return mv;
	}
	
	@RequestMapping("/project/reward/preview/{rewardNo}")
	public ModelAndView previewReward(@PathVariable int rewardNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		if (request.getSession().getAttribute("userNo") == null) {
			mv.setViewName("/asd'asdsadasd/sadad/asda/asd/");
			return mv;
		}
		
		int userNo = Integer.parseInt(request.getSession().getAttribute("userNo").toString());
		Map<String, Object> param = new HashMap();
		param.put("userNo", userNo);
		param.put("rewardNo", "rewardNo");
		Reward reward = service.getRewardStoryInfo(param);
		
		if(reward.getState() != 1) {
			return mv;
		}
		
		mv.addObject("reward", reward);
		mv.setViewName("/project/reward/preview");
		
		return mv;
	}


}
