package com.spring.test.user.model.service;

import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.spring.test.user.model.dao.UserDao;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	//로그인
	
	@Override
	public Map<String, String> login(String email) {
		//아이디로 유저번호, 비밀번호 받아오기
		return dao.login(email);
	}

	
	//로그아웃
	
	//회원가입
	
		//이메일 인증
			//이메일 보내기
	@Override
	public void sendEmail(String email, int random) {
		System.out.println("이메일 보내기 - 인증버튼은 하는중");
		final MimeMessagePreparator preparator=new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper=new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("펀딩스토리 가입 <FundingStory>");
				helper.setTo(email);
				helper.setSubject("회원가입 인증번호입니다.");
				/*helper.setText("보내짐");*/
				
				System.out.println();
				String content="<div style='background-color:gray; width:500px; height:400px; text-align:center; padding:5px;'>"
						+ "<img width='300px' height='300px'/>"
						+ "<br/><br/>"
						+ "<p style='color:white; font-size:20px;'>인증번호 : "
						+random
						+ "</p>"
						+ "</div>";
				helper.setText(content,true);
			}
		}; 
		
		mailSender.send(preparator);
	}
			//인증번호 생성
	@Override
	public int getTempKey() {
		int random=(int)(Math.random()*999999)+100000;
		return random;
	}
	
		
	//회원탈퇴
	
	//아이디 찾기
	
	//비밀번호 찾기
	
}
