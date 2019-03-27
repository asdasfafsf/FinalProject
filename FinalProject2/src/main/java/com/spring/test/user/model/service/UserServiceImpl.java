package com.spring.test.user.model.service;

import java.util.Date;
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
	
	
	@Override
	public Map loginBasicUser(String email, String password) {

		Map temp = dao.selectUserWithEmail(email);
		
		//등록된 이메일인가 확인
		if(temp!=null&&!temp.isEmpty())
		{
			int userLinkType = Integer.parseInt(String.valueOf(temp.get("USER_LINK_TYPE")));
			//홈페이지 회원인지 확인
			if(userLinkType==1)
			{
				String pw = String.valueOf(temp.get("USER_PASSWORD"));
				//비밀번호가 맞는지 확인
				if(pwEncoder.matches(password, pw))
				{
					int state=Integer.parseInt(String.valueOf(temp.get("USER_TYPE")));
					//정지된 회원인가
					if(state==3)
					{
						temp.put("msg", "정지된 회원입니다.");
					}
					else
					{
						int userNo = Integer.parseInt(String.valueOf(temp.get("USER_NO")));
						temp.put("userNo", userNo);
					}
				}
				else
				{
					temp.put("msg", "비밀번호를 다시 확인해 주세요.");
				}
			}
			else
			{
				temp.put("msg", "네이버 아이디로 로그인 버튼을 이용해 주세요.");
			}
		}
		else
		{
			temp=new HashMap();
			temp.put("msg", "등록되지 않은 아이디입니다. 가입 후 이용해 주세요.");
		}
		
		return temp;
	}


	@Override
	public Map loginNaverUser(String email, String unique) {
		
		Map temp = dao.selectUserWithEmail(email);
		
		//등록된 이메일인가 확인
		if(temp!=null&&!temp.isEmpty())
		{
			int userLinkType = Integer.parseInt(String.valueOf(temp.get("USER_LINK_TYPE")));
			//네이버 링크 회원인지 확인
			if(userLinkType==2)
			{
				String uniq = temp.get("USER_NAVER_UNIQ").toString();
				if(uniq.equals(unique))
				{
					//정지 회원인가
					int state = Integer.parseInt(temp.get("USER_TYPE").toString());
					if(state==3)
					{
						temp.put("msg", "정지된 회원입니다.");
					}
					else
					{
						int userNo = Integer.parseInt(temp.get("USER_NO").toString());
						temp.put("userNo",userNo);
					}
				}
				else
				{
					temp.put("msg", "로그인 실패. 다시 시도해 주세요.");
				}
			}
			else
			{
				temp.put("msg", "홈페이지 회원이십니다. 일반 로그인을 이용해주세요.");
			}
		}
		else
		{
			temp = new HashMap();
		}
		
		return temp;
	}
	@Override
	public Map loginKakaoUser(String email, String unique) {
		
		Map temp = dao.selectUserWithEmail(email);
		
		//등록된 이메일인가 확인
		if(temp!=null&&!temp.isEmpty())
		{
			int userLinkType = Integer.parseInt(String.valueOf(temp.get("USER_LINK_TYPE")));
			//네이버 링크 회원인지 확인
			if(userLinkType==3)
			{
				String uniq = temp.get("USER_KAKAO_UNIQ").toString();
				if(uniq.equals(unique))
				{
					//정지 회원인가
					int state = Integer.parseInt(temp.get("USER_TYPE").toString());
					if(state==3)
					{
						temp.put("msg", "정지된 회원입니다.");
					}
					else
					{
						int userNo = Integer.parseInt(temp.get("USER_NO").toString());
						temp.put("userNo",userNo);
					}
				}
				else
				{
					temp.put("msg", "로그인 실패. 다시 시도해 주세요.");
				}
			}
			else
			{
				temp.put("msg", "홈페이지 회원이십니다. 일반 로그인을 이용해주세요.");
			}
		}
		else
		{
			temp = new HashMap();
		}
		
		return temp;
	}


	@Override
	public int registUser(String email, String password, String name, int linkType) {

		Map user = new HashMap();
		user.put("USER_EMAIL", email);
		
		if(linkType == 1)
		{
			String newPassword = pwEncoder.encode(password);
			user.put("USER_PASSWORD", newPassword);
		}
		else
		{
			user.put("USER_PASSWORD", password);
		}
		
		user.put("USER_NAME", name);
		user.put("USER_LINK_TYPE", linkType);
		
		int result = dao.insertUser(user);
		
		return result;
	}

	

	@Override
	public int selectEqualEmail(String email) {

		int result;
		try {
		result = dao.selectEqualEmail(email);
		}catch(NumberFormatException e) {
			result = 0;
		}
		return result;
	}

	

	@Override
	public int findUserTypeWithEmail(String email) {

		int linkType = 0;
		try{
			linkType = dao.selectUserLinkType(email);
		}catch (NumberFormatException e) {
			linkType = 0;
		}
		
		return linkType;
	}

	

	@Override
	public Map userProfile(int userNo) {
		
		Map temp = dao.selectUserWithNo(userNo);
		
		return temp;
	}
	@Override
	public Map userProfile(String email) {
		
		Map temp = dao.selectUserWithEmail(email);
		
		return temp;
	}
	

	@Override
	public int updateUserPhoto(Map user) {
		
		return dao.updateUserPhoto(user);
	}


	@Override
	public int updateUserName(int userNo, String userName) {
		Map temp = new HashMap();
		temp.put("USER_NO", userNo);
		temp.put("USER_NAME", userName);
		
		return dao.updateUserName(temp);
	}


	@Override
	@Transactional
	public int updateUserBasic(int userNo, String email, String password, String newPassword) {
		int result = 0;
		int result1 = 1;
		int result2 = 1;
		
		Map temp = new HashMap();
		temp.put("userNo", userNo);
		
		if(email!=null && password == null)
		{
			temp.put("email", email);
			result1 = dao.updateUserEmail(temp);
		}
		else if(email == null && password !=null)
		{
			Map user = dao.selectUserWithNo(userNo);
			if(pwEncoder.matches(password, user.get("USER_PASSWORD").toString()))
			{
				temp.put("password", pwEncoder.encode(newPassword));
				result2 = dao.updateUserPassword(temp);
			}
			else
			{
				result2 = 0;
			}
		}
		else if(email!=null && password != null)
		{
			temp.put("email", email);
			result1 = dao.updateUserEmail(temp);
			
			Map user = dao.selectUserWithNo(userNo);
			if(pwEncoder.matches(password, user.get("USER_PASSWORD").toString()))
			{
				temp.put("password", pwEncoder.encode(newPassword));
				result2 = dao.updateUserPassword(temp);
			}
			else
			{
				result2 = 0;
			}
		}
		
		if(result1>0 && result2>0)
		{
			result = 1;
		}
		
		return result;
	}


	@Override
	public List<Map> userAddressList(int userNo) {
		
		List<Map> temp = dao.selectUserAddressList(userNo);
		
		return temp;
	}

	@Override
	public int deleteAddress(int addrNo) {
		return dao.deleteAddress(addrNo);
	}


	@Override
	public int addAddress(Map address) {
		return dao.addAddress(address);
	}


	@Override
	public List<Map> userAccountList(int userNo) {
		
		List<Map> temp = dao.selectUserAccountList(userNo);
		
		return temp;
	}

	@Override
	@Transactional
	public int deleteUser(Map user) {
		
		int userNo = Integer.parseInt(user.get("userNo").toString());

		int result = 0;
		
		Map temp = dao.selectUserWithNo(userNo);
		
		int result1 = dao.insertOutUser(user);
		int result2 = dao.deleteOutUserPw(user);
		int result3 = dao.deleteOutUserAllAddress(userNo);
		int result4 = dao.deleteActiveUser(userNo);
		int result5 = dao.updateOutUser(userNo);
		
		if(result1>0&&result2>0&&result3>=0&&result4>0&&result5>0)
		{
			result = 1;
		}
		
		return result;
	}


	@Override
	public boolean userCanOut(int userNo) {
		
		Map request = new HashMap();
		request.put("userNo", userNo);
		request.put("filter", 1);
		
		List<Map> list = dao.selectUserMadeFundingList(request);
		int fundingCount = 0;
		for(Map l : list)
		{
			int state = Integer.parseInt(l.get("REWARD_STATE").toString());
			if(state>1&&state<5)
			{
				fundingCount++;
			}
		}
		
		boolean flag = false;
		if(fundingCount==0)
		{
			flag = true;
		}
		
		return flag;
	}


	@Override
	public List<Map> userFundingList(int userNo, int filter) {
		
		Map request = new HashMap();
		request.put("userNo", userNo);
		request.put("filter", filter);
		
		List<Map> temp = dao.selectUserFundingList(request);
		
		return temp;
	}


	@Override
	public List<Map> userLikeFundingList(int userNo, int filter) {
		
		Map request = new HashMap();
		request.put("userNo", userNo);
		request.put("filter", filter);

		List<Map> temp = dao.selectUserLikeFundingList(request);
		
		return temp;
	}


	@Override
	public List<Map> userMadeFundingList(int userNo, int filter) {
		
		Map request = new HashMap();
		request.put("userNo", userNo);
		request.put("filter", filter);
		
		List<Map> temp = dao.selectUserMadeFundingList(request);
		
		return temp;
	}
	


	@Override
	public Map getSupportDetail(int userNo, int rewardNo) {
		Map request = new HashMap();
		request.put("userNo", userNo);
		request.put("rewardNo", rewardNo);
		
		
		//후원한 아이템, 가격,배송비 필요 여부, 배송비
		
		
		return null;
	}


	@Override
	public void sendEmailKey(String email, String tempKey, String type) {

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
		else if(type.equals("CHANGE"))
		{
			temp.put("FROM", "펀딩스토리  <FundingStory>");
			temp.put("SUBJECT", "이메일 변경 인증번호입니다.");
			temp.put("CONTENT", "이메일 변경");
		}
		final MimeMessagePreparator preparator=new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper=new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom(String.valueOf(temp.get("FROM")));
				helper.setTo(email);
				helper.setSubject(String.valueOf(temp.get("SUBJECT")));
				
				String content="<div style='width:500px; height:400px; text-align:center; padding:5px;'>"
						+ "<img width='150px' height='50px' src='http://localhost:9090/test/resources/images/common/header/main_logo3.png'/>"
						+ "<br/><br/>"
						+ "<p>"
						+ String.valueOf(temp.get("CONTENT"))
						+ "</p>"
						+ "<br/>"
						+ "<p style='font-size:20px;'>인증번호 : "
						+ tempKey
						+ "</p>"
						+ "</div>";
				helper.setText(content,true);
			}
		}; 
		
		mailSender.send(preparator);
		
	}


	@Override
	public void sendEmailLink(String email, String tempKey) {
		final MimeMessagePreparator preparator=new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper=new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("펀딩스토리 <FundingStory>");
				helper.setTo(email);
				helper.setSubject("비밀번호 재설정");
				
				String content="<div style='width:500px; height:400px; text-align:center; padding:5px;'>"
						+ "<img width='150px' height='50px' src='http://localhost:9090/test/resources/images/common/header/main_logo3.png'/>"
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
	public int setUserFindPwLink(int userNo, String tempKey) {
		Map temp = new HashMap();
		temp.put("userNo", userNo);
		temp.put("tempKey", tempKey);
		return dao.insertUserTemp(temp);
	}


	@Override
	public int getUserFindPwLink(String key) {
		//비밀번호 재설정 위한 table에서 key로 Map 받아옴
		Map temp = dao.selectUserTemp(key);
		int userNo = 0;
		
		if(temp!=null&&!temp.isEmpty())
		{
			Date tempdate = (Date)temp.get("TEMP_DATE");
			Date sysdate = new Date();
			long compare = sysdate.getTime()-tempdate.getTime();
			if(compare<86400000&&compare>=0)
			{
				userNo = Integer.parseInt(temp.get("USER_NO").toString());
			}
			else
			{
				userNo=0;
			}
		}
		
		return userNo;
	}


	@Override
	@Transactional
	public int editUserFindPwLink(int userNo, String password) {
		Map temp = new HashMap();
		temp.put("userNo", userNo);
		String newPw = pwEncoder.encode(password);
		temp.put("password", newPw);
		
		//비밀번호 변경+ temp테이블 값 삭제
		int result = 0;
		int result1 = dao.updateUserPassword(temp);
		int result2 = dao.deleteUserTemp(userNo);
		
		if(result1>0 && result2 >0)
		{
			result =1;
		}

		return result;
	}
	
	
	
}
