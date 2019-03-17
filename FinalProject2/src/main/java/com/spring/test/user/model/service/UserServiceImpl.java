package com.spring.test.user.model.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.test.user.model.dao.UserDao;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;
	@Autowired
	private JavaMailSenderImpl mailSender;
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	
	//회원가입
	@Override
	public int insertUser(Map user) {
		return dao.insertUser(user);
	}
	@Override
	public int selectUserEmailCount(String email) {
		return dao.selectUserEmailCount(email);
	}
	
	//회원탈퇴
	@Transactional
	@Override
	public int outUser(Map user) {
		
		int userNo=(Integer)user.get("USER_NO");
		
		//TB_USER_ACTIVE에 넣을 값
		Map outUser=new HashMap();
		outUser.put("USER_NO", userNo);
		outUser.put("USER_EMAIL", userNo);
		outUser.put("USER_NAME", "null");
		outUser.put("USER_ENROLLDATE", "null");

		
		/*패스워드 or 유니크 키 넣은 테이블의 값 삭제*/
		int result1=dao.deleteUserPassword(userNo);
		/*유저를 TB_USER_OUT 테이블에 이동*/
		int result2=dao.outUser(user);
		/*유저의 USER_TYPE을 탈퇴회원 (2)로 바꾸기*/
		int result3=dao.setOutUser(userNo);
		/*유저의 TB_USER_ACTIVE 값을 NULL로 바꾸기*/
		int result4=dao.updateUser(outUser);
		
		int result=0;
		if(result1==1&&result2==1&&result3==1&&result4==1)
		{
			result=1;
		}
		
		return result;
	}
	
	//회원정보수정
	@Override
	public Map selectUserBasic(int userNo) {
		return dao.selectUserBasic(userNo);
	}
	@Override
	public List<Map> selectUserAddress(int userNo) {
		return dao.selectUserAddress(userNo);
	}
	@Override
	public Map selectUserAccount(int userNo) {
		return dao.selectUserAccount(userNo);
	}
	@Override
	public int updateUser(Map user) {
		return dao.updateUser(user);
	}
	@Override
	public int updatePassword(Map user) {
		return dao.updatePassword(user);
	}
	@Override
	public int updateUserPhoto(Map user) {
		
		return dao.updateUserPhoto(user);
	}
	
	//로그인
	@Override
	public Map selectUser(String email) {
		return dao.selectUser(email);
	}
	
	// ID / PW 찾기
	@Override
	public Map findId(String email) {
		return dao.selectFindLinkType(email);
	}
	@Override
	public int requestFindPw(Map tempKeyMap) {
		return dao.insertFindPwLink(tempKeyMap);
	}
	@Override
	public Map findPwLink(String tempKey) {
		return dao.selectFindPwLink(tempKey);
	}
	@Override
	public int deleteFindPwLink(String tempKey) {
		return dao.deleteFindPwLink(tempKey);
	}
	
	//인증
	@Override
	public void sendEmailLink(String email, String tempKey) {
		final MimeMessagePreparator preparator=new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper=new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("펀딩스토리 <FundingStory>");
				helper.setTo(email);
				helper.setSubject("비밀번호 변경 확인");
				
				String content="<div style='background-color:gray; width:500px; height:400px; text-align:center; padding:5px;'>"
						+ "<img width='300px' height='300px'/>"
						+ "<br/><br/>"
						+ "<label>비밀번호 변경을 원하시면</label>"
						+ "<a href='http://localhost:9090/test/resetPw/"+tempKey+"' style='font-size:15px;'> click! 비밀번호 변경</a>"
						+ "</div>";
				helper.setText(content,true);
			}
		}; 
		
		mailSender.send(preparator);
	}
	@Override
	public void sendEmailKey(String email, int tempKey) {
		
		final MimeMessagePreparator preparator=new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper=new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("펀딩스토리 가입 <FundingStory>");
				helper.setTo(email);
				helper.setSubject("회원가입 인증번호입니다.");
				
				System.out.println();
				String content="<div style='background-color:gray; width:500px; height:400px; text-align:center; padding:5px;'>"
						+ "<img width='300px' height='300px'/>"
						+ "<br/><br/>"
						+ "<p style='color:white; font-size:20px;'>인증번호 : "
						+ tempKey
						+ "</p>"
						+ "</div>";
				helper.setText(content,true);
			}
		}; 
		
		mailSender.send(preparator);
	}
	@Override
	public int getTempKey() {
		int random=(int)(Math.random()*999999)+100000;
		return random;
	}
	
	//주소록
	@Override
	public int insertUserAddress(Map userAddress) {
		return dao.insertUserAddress(userAddress);
	}
	@Override
	public int updateUserAddress(Map userAddress) {
		return dao.updateUserAddress(userAddress);
	}
	@Override
	public int deleteUserAddress(int addressNo) {
		return dao.deleteUserAddress(addressNo);
	}
}
