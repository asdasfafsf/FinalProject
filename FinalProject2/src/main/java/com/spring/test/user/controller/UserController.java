package com.spring.test.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.net.URLCodec;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.spring.test.common.util.AES256Util;
import com.spring.test.user.model.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService service;
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	private String aseKey="FOR-EMAIL-LINK-!";
	
	//로그인
		//로그인 페이지로
		@RequestMapping("/login")
		public String goLogin()
		{
			return "user/login";
		}
		
		//일반회원 로그인	
		@ResponseBody
		@RequestMapping("/login/basic")
		public Map login(String email, String password, HttpServletRequest request)
		{
			
			System.out.println(email+" "+password);
			Map map = service.login(email,password);

			if(map.get("userNo")!=null)
			{
				request.getSession().setAttribute("userNo",map.get("userNo"));
			}
			else
			{
				System.out.println("msg : "+map.get("msg"));
			}
			
			return map;
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
		@RequestMapping(value="/logout")
		public ModelAndView logout(HttpServletRequest request)
		{
			int userNo=(int)request.getSession(false).getAttribute("userNo");
			System.out.println(userNo);
			request.getSession(false).removeAttribute("userNo");
			
			RedirectView rv=new RedirectView(request.getContextPath()+"/main");
			rv.setExposeModelAttributes(false);
			return new ModelAndView(rv);
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
		@ResponseBody
		@RequestMapping("/registUser")
		public int registUser(String email, String pw, String name, String userType)
		{
			Map user=new HashMap();
			user.put("email", email);
			
			String newPw=pwEncoder.encode(pw);
			user.put("password", newPw);
			user.put("name", name);
			user.put("userType", userType);
			
			int result=service.enrollUser(user);
			
			return result;
		}
		//아이디 중복여부 확인
		@ResponseBody
		@RequestMapping("/regist/checkEmail")
		public Map checkEmail(String email)
		{
			Map map=new HashMap();
			int check=service.checkEmail(email);
			
			map.put("check", check);
			
			return map;
		}
		//이메일 인증
		@ResponseBody
		@RequestMapping("/sendEmail")
		public void sendEmail(String email, HttpServletRequest request)
		{
			//랜덤키(인증번호) 만들어서 세션에 넣음
			int random=service.getTempKey();
			request.getSession().setAttribute("tempKey", random);
			
			
			//랜덤키 담은 email 넣음
			service.sendEmail(email,random);

		}
		//이메일인증 시간초과
		@ResponseBody
		@RequestMapping("/confirm/timeUp")
		public void timeUp(HttpServletRequest request)
		{
			request.getSession(false).removeAttribute("tempKey");
		}
		//입력한 인증키 확인
		@ResponseBody
		@RequestMapping("/confirm/checkKey")
		public Map checkKey(String tempKey, HttpServletRequest request)
		{
			int key=Integer.parseInt(tempKey);
			Map resultMap=new HashMap();
			
			boolean result=false;
			String msg="인증번호를 다시 확인해 주세요";
			
			if((int)(request.getSession(false).getAttribute("tempKey"))==key)
			{
				request.getSession(false).removeAttribute("tempKey");
				result=true;
				msg="";
			}
			
			resultMap.put("result", result);
			resultMap.put("msg", msg);
			
			return resultMap;
		}
		
		//약관페이지로
		@RequestMapping("/terms")
		public String goTerms()
		{
			return "user/terms";
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
		
	
	//회원정보 변경
		//회원 정보 변경 페이지로 이동
		@RequestMapping("/myprofile")
		public String goProfile(HttpServletRequest request)
		{
			int userNo=(Integer)request.getSession(false).getAttribute("userNo");
			
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
		//기능(업데이트)
			//기본정보 수정
			//비밀번호 수정
			//주소록 수정
			//결제정보 수정
		
	//아이디/비밀번호 찾기
			//비밀번호 찾기(기본)
		@RequestMapping("/find/pw")
		public String goFindPw()
		{
			return "user/findPw";
		}
			//비밀번호 찾기 메일보냄
		@ResponseBody
		@RequestMapping("/find/pw.do")
		public String findPw(String email, HttpServletRequest request)
		{
			String msg="";
			Map map=service.findId(email);
			
			System.out.println("비번 찾기 메일 보내러 옴");
			
			//만약 홈페이지 회원일 경우
			if(map.get("chennel")==null)
			{
				//키(EMAIL/SYSDATE 두개를 암호화 한 키 -> email만 씀) 담은 email 보냄
				String key="";
				
				try {
				
				AES256Util aes256=new AES256Util(aseKey);
				URLCodec codec=new URLCodec();
//				key = codec.encode(aes256.aesEncode(String.valueOf(map.get("USER_NO"))));
				key=aes256.aesEncode(codec.encode(String.valueOf(map.get("USER_NO"))));
				System.out.println("key="+key);
				
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				
				service.sendEmail2(email,key);
				
				msg="이메일을 확인해 주세요.";
			}
			//홈페이지 회원이 아닌 경우
			else
			{
				msg="해당 소셜 버튼으로 로그인해 주세요.";
			}
			
			System.out.println(msg);
			
			return msg;
		}
		
			//비밀번호 변경 링크
		/*@RequestMapping(value="/resetPw/{key}", method=RequestMethod.GET) 
		public String goResetPw(@PathVariable("key") String key, HttpServletRequest request)
		{*/
		@GetMapping("/resetPw/{key}")
		public String goResetPw(@PathVariable("key") String key, HttpServletRequest request)
		{
			String loc="";
			System.out.println("여기까진 오고 오류남");
			
			
			String userNoString="";
			
			try {
			AES256Util aes256=new AES256Util(aseKey);
			URLCodec codec=new URLCodec();
//			userNoString=aes256.aesDecode(codec.decode(key));
			userNoString=codec.decode(aes256.aesDecode(userNoString));
			System.out.println("key2="+userNoString);
			
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			int userNo=Integer.parseInt(userNoString);
			Map user=service.findUser(userNo);
			
			if((Integer)(user.get("USER_NO"))==userNo)
			{
				request.getSession(false).setAttribute("tempUserNo", userNo);
				loc="/myprofile/modify/password";
			}
			else
			{
				loc="/main";
			}
				
			return "redirect:"+loc;
		}
			//아이디 찾기
		@RequestMapping("/find/id")
		public String goFindId()
		{
			return "user/findId";
		}
			//아이디 찾기 실행
		@ResponseBody
		@RequestMapping("/find/id.do")
		public String findId(String email)
		{
			Map map=service.findId(email);
			
			String msg="등록된 회원이 아닙니다.";
			
			if(map!=null&&map.get("msg")!=null)
			{
				msg=(String)map.get("msg");
				if(map.get("channel")!=null)
				{
					msg+=map.get("channel")+"연계 회원입니다.";
				}
				else
				{
					msg+="등록된 회원입니다.";
				}
				
				System.out.println("확인 : "+msg);
			}
			
			return msg;
		}

	//특정 유저의 리워드 리스트 보기
		@RequestMapping("/userPage/{userNo}")
		public String goUserRewordPage(@PathVariable("userNo") int userNo)
		{
			return "user/mypage";
		}
		//userNo로 그 user가 후원한 reword 가져오기
		//userNo로 그 user가 진행하는 reword 가져오기
}
