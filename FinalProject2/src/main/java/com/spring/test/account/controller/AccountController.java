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
	@ResponseBody
	public int updateUserAccount(@RequestParam Map<String,Object> param,HttpSession session) {
		param.put("userNo", (int)session.getAttribute("userNo"));
		
		System.out.println(param);
		
		int result=0;
		
		if(param.get("fintech_use_num").equals("")||param.get("user_seq_no").equals("")) {
			
		}
		else {
			result=service.updateUserAccount(param);
		}
		
		/*return "redirect:/myprofile/edit/account";*/
		return result;
	}
	
}
