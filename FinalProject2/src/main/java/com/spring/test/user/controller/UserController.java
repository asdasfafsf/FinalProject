package com.spring.test.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.test.user.model.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService service;
	
	//로그인
		//로그인 페이지로
		@RequestMapping("/login")
		public String goLogin()
		{
			return "user/login";
		}
		
		//일반회원 로그인	
		@RequestMapping("/login/basic")
		@ResponseBody
		public void login(String email, String password, Model model)
		{
			System.out.println(email+" "+password);
		}
		//네이버 회원 로그인
		@RequestMapping("/login/naver")
		public void naverLogin()
		{
			
		}
		//카카오톡 회원 로그인
		@RequestMapping("/login/kakao")
		public void kakaoLogin()
		{
			
		}
		
	//로그아웃
		@RequestMapping("/logout")
		public void logout()
		{
			
		}
	
		
	//회원 가입
		//회원가입 페이지로
		@RequestMapping("/welcome")
		public String goRegist()
		{
			return "user/regist";
		}
		//사이트 회원 가입 폼 페이지로
		@RequestMapping("/regist/basic")
		public String goBasicRegist()
		{
			return "user/registFrm";
		}
		//회원 data 저장
		@RequestMapping("/registUser")
		public void registUser()
		{
			
		}
		//아이디 중복여부 확인
		@RequestMapping("/regist/checkEmail")
		public String checkEmail()
		{
			return null;
		}
		//이메일 인증
		@RequestMapping("/sendEmail")
		public ModelAndView sendEmail(String email)
		{
			ModelAndView mv=new ModelAndView();
			
			int random=service.getTempKey();
			service.sendEmail(email,random);

			mv.addObject("tempKey", random);
			mv.addObject("email",email);
			
			mv.setViewName("user/registFrm");
			
			return mv; 
		}
		
	//회원 탈퇴
		//회원 탈퇴 페이지로 이동
		@RequestMapping("/leave")
		public String goLeave()
		{
			return "user/userTemp";
		}
		//회원 탈퇴(data 이동)
		@RequestMapping("/outUser")
		public void deleteUser()
		{
			
		}
	//회원 정보 페이지로 이동(리워드 확인)
		@RequestMapping("/rewardlist/{user}")
		public String goUserPage(@PathVariable("user") int userNo)
		{
			return "user/mypage";
		}
	
	//회원정보 변경
		//회원 정보 변경 페이지로 이동
		@RequestMapping("/myprofile")
		public String goProfile()
		{
			return "user/editProfile";
		}
		//각 회원정보 수정 페이지로
			//기본정보 수정 페이지로
		@RequestMapping("/myprofile/modify/basic")
		public String goModifyBasic()
		{
			return "user/editBasic";
		}
			//비밀번호 수정 페이지로
		@RequestMapping("/myprofile/modify/password")
		public String goModifyPassword()
		{
			return "user/editPassword";
		}
			//주소록 수정 페이지로
		@RequestMapping("/myprofile/modify/address")
		public String goModifyAddress()
		{
			return "user/editAddress";
		}
			//결제정보 변경페이지로
		@RequestMapping("/myprofile/modify/account")
		public String goModifyAccount()
		{
			return "user/editAccount";
		}
	//아이디/비밀번호 찾기
			//비밀번호 찾기(기본)
		@RequestMapping("/findPw")
		public void findPw()
		{
			
		}
			//아이디 찾기
		@RequestMapping("/findId")
		public void findId()
		{
			
		}

}
