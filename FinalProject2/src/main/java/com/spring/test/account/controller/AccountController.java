package com.spring.test.account.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.test.account.service.AccountService;

@Controller
public class AccountController {

	@Autowired
	AccountService service;
	
	@RequestMapping("/loadUserAccount")
	@ResponseBody
	public List loadUserAcctount(HttpSession session) {
		int userNo=(int)session.getAttribute("userNo");
		
		return service.selectLoadUserAccount(userNo);
	}
	
	@RequestMapping("/updateUserAccount")
	public String updateUserAccount(@RequestParam Map<String,Object> param,HttpSession session) {
		param.put("userNo", (int)session.getAttribute("userNo"));
		System.out.println(param);
		if(param.get("fintech_use_num").equals("")||param.get("user_seq_no").equals("")) {
			
		}
		else {
			service.updateUserAccount(param);
		}
		
		return "redirect:/myprofile/edit/account";
	}
	
	@RequestMapping("/selectWithdrawalUser")
	@ResponseBody
	public List selectWithdrawalUser(@RequestParam int rewardNo) {
		return service.selectWithdrawalUser(rewardNo);
	}
	
	@RequestMapping("/updateSuccessWithdrawalUser")
	@ResponseBody
	public boolean updateSuccessWithdrawalUser(@RequestParam int reward_support_no) {
		 service.updateSuccessWithdrawalUser(reward_support_no);
		 return true;
	}
	
	@RequestMapping("/updateFailWithdrawalUser")
	@ResponseBody
	public boolean updateFailWithdrawalUser(@RequestParam int reward_support_no) {
		 service.updateFailWithdrawalUser(reward_support_no);
		 return true;
	}
	
	@RequestMapping("/selectDepositUser")
	@ResponseBody
	public List selectDepositUser(@RequestParam int rewardNo) {
		return service.selectDepositUser(rewardNo);
	}
	
}
