package com.spring.test.user.model.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.test.user.model.dao.UserDao;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;
	@Autowired
	private JavaMailSenderImpl mailSender;
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	//로그인
	
	@Override
	public Map login(String email,String password) {
		//아이디로 유저번호, 비밀번호 받아오기
		
		Map<String,String> user = dao.login(email);
		
		Map map=new HashMap();
		
		String msg="";
		if(user!=null)
		{
			if(user.get("OUTDATE")==null)
			{
				if(pwEncoder.matches(password , user.get("USER_PASSWORD")))
				{
					msg=null;
					System.out.println("맞음");
					int userNo=Integer.valueOf(String.valueOf(user.get("USER_NO")));
					map.put("userNo", userNo);
				}
				else
				{
					msg="비밀번호를 다시 확인해 주세요.";
				}
			}
			else
			{
				msg="탈퇴한 회원입니다.";
			}
		}
		else
		{
			msg="아이디를 다시 확인해 주세요.";
		}
		
		map.put("msg", msg);
		
		return map;
	}

	
	//로그아웃(controller에서 끝남)
	
	//회원가입
	
		//이메일 인증
			//이메일 보내기
	@Override
	public void sendEmail(String email, int random) {
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
	
	//매개변수(email)과 같은 email 있는지 확인
	@Override
	public int checkEmail(String email) {
	
	return dao.checkEmail(email);
	}
	
	//회원가입 - 정보저장
	@Override
	public int enrollUser(Map user) {
		/*
		 * 이거 그거... 파일 저장.... 경로.... 이름....
		 * if(!user.containsKey("USER_PROFILEPHOTO"))
		{
			user.put("USER_PROFILEPHOTO", value)
		}
		*/
		
	return dao.enrollUser(user);
	}
	
	//회원탈퇴
	
	//아이디 찾기 
	
	@Override
	public Map findId(String email) {
		
		String msg = null;
		String channel = null;
		
		System.out.println("들어옴, service");
		
		Map map= dao.findId(email);
		
		System.out.println("dao 나감");
		
		if(map!=null&&!map.isEmpty())
		{
			if(map.get("USER_KAKAO_UNIQ")!=null)
			{
				channel="KAKAO";
			}
			else if(map.get("USER_NAVER_UNIQ")!=null)
			{
				channel="NAVER";
			}
			msg = email+"님은 ";
			
			map.put("msg", msg);
			map.put("channel", channel);
			
			System.out.println(map.get("msg"));
		}
		
		return map;
	}
	
	//비밀번호 찾기
		//링크 담은 이메일 보내기
		@Override
		public void sendEmail2(String email, String key) {
			final MimeMessagePreparator preparator=new MimeMessagePreparator() {
				
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper helper=new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom("펀딩스토리 <FundingStory>");
					helper.setTo(email);
					helper.setSubject("비밀번호 변경 확인");
					/*helper.setText("보내짐");*/
					
					String content="<div style='background-color:gray; width:500px; height:400px; text-align:center; padding:5px;'>"
							+ "<img width='300px' height='300px'/>"
							+ "<br/><br/>"
							+ "<label>비밀번호 변경을 원하시면</label>"
							+ "<a href='http://localhost:9090/test/resetPw/"+key+"' style='font-size:15px;'> click! 비밀번호 변경</a>"
							+ "</div>";
					helper.setText(content,true);
				}
			}; 
			
			mailSender.send(preparator);
		}
}
