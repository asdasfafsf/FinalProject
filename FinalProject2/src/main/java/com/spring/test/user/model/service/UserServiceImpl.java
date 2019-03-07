package com.spring.test.user.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.test.user.model.dao.UserDao;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;
	
	//로그인
	
	@Override
	public Map<String, String> login(String email) {
		//아이디로 유저번호, 비밀번호 받아오기
		return dao.login(email);
	}
	
	//로그아웃
	
	//회원가입
	
		//이메일 인증
		
	//회원탈퇴
	
	//아이디 찾기
	
	//비밀번호 찾기
	
}
