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
		
		int userNo=Integer.parseInt(String.valueOf(user.get("USER_NO")));
		
		/*패스워드 or 유니크 키 넣은 테이블의 값 삭제*/
		int result1=dao.deleteUserPassword(user);
		/*유저를 TB_USER_OUT 테이블에 이동*/
		int result2=dao.outUser(user);
		/*유저의 USER_TYPE을 탈퇴회원 (2)로 바꾸기*/
		int result3=dao.setOutUser(userNo);
		/*유저의 TB_USER_ACTIVE 값을 삭제*/
		int result4=dao.deleteUser(userNo);
		/*유저의 주소록 삭제*/
		int result5=dao.deleteUserAddressAll(userNo);
		
		int result=0;
		
		if(result1==1&&result2==1&&result3==1&&result4==1&&result5>0)
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
	public int updateUserName(Map user) {
		user.put("SERVICE", "editName");
		System.out.println("editName"+user);
		return dao.updateUser(user);
	}
	@Override
	public int updateUserPhoto(Map user) {
		user.put("SERVICE", "editPhoto");
		return dao.updateUser(user);
	}
	@Transactional
	@Override
	public int updateUserBasic(Map user) {
		user.put("SERVICE", "editEmail");
		
		int result=0;
		
		int result1=dao.updatePassword(user);
		int result2=dao.updateUser(user);
		
		if(result1>0&&result2>0)
		{
			result=1;
		}
		return result;
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
				helper.setSubject("비밀번호 재설정");
				
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
	public void sendEmailKey(String email, int tempKey, String type) {
		
		Map temp=new HashMap();
		
		if(type.equals("ENROLL"))
		{
			temp.put("FROM", "펀딩스토리 가입 <FundingStory>");
			temp.put("SUBJECT", "회원가입 인증번호입니다.");
			temp.put("CONTENT", "펀딩스토리에 오신 것을 환영합니다!");
		}
		else if(type.equals("OUT"))
		{
			temp.put("FROM", "펀딩스토리 고객센터 <FundingStory>");
			temp.put("SUBJECT", "본인 확인 인증번호입니다.");
			temp.put("CONTENT", "만족하실만한 서비스를 제공하지 못한 것에 대해 사과드립니다.<br/> 앞으로 더 멋진 펀딩스토리로 찾아뵐 수 있도록 노력하겠습니다");
		}
		final MimeMessagePreparator preparator=new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper=new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom(String.valueOf(temp.get("FROM")));
				helper.setTo(email);
				helper.setSubject(String.valueOf(temp.get("SUBJECT")));
				
				System.out.println();
				String content="<div style='background-color:gray; width:500px; height:400px; text-align:center; padding:5px;'>"
						+ "<img width='300px' height='300px'/>"
						+ "<br/><br/>"
						+ "<p>"
						+ String.valueOf(temp.get("CONTENT"))
						+ "</p>"
						+ "<br/>"
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
	
	//리워드 리스트
	@Override
	public List<Map> selectUserRewardSupport(int userNo, String order) {

		Map selectRequest = new HashMap();
		selectRequest.put("USER_NO",userNo);
		selectRequest.put("ORDER", order);
		
		return dao.selectUserRewardSupported(selectRequest);
	}
	@Override
	public List<Map> selectUserRewardMade(int userNo, String order) {
		
		Map selectRequest = new HashMap();
		selectRequest.put("USER_NO",userNo);
		selectRequest.put("ORDER", order);
		
		return dao.selectUserRewardMade(selectRequest);
	}
	@Override
	public List<Map> selectUserRewardLike(int userNo, String order) {

		Map selectRequest = new HashMap();
		selectRequest.put("USER_NO",userNo);
		selectRequest.put("ORDER", order);
		
		return dao.selectUserRewardLike(selectRequest);
	}
}
