package com.spring.test.user.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.net.URLCodec;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.spring.test.common.util.FileUtil;
import com.spring.test.common.util.StringUtil;
import com.spring.test.user.model.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService service;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	StringUtil stringUtil;
	
	@Autowired
	FileUtil fileUtil;
	
	
	//회원가입
		//이동
	@RequestMapping("/welcome")
	public String goRegist()
	{
		return "user/regist";
	}
			//베이직 이동
	@RequestMapping("/regist/basic")
	public String goBasicRegist()
	{
		return "user/registFrm";
	}
			//약관페이지로 이동
	@RequestMapping("/terms")
	public String goTerms()
	{
		return "user/terms";
	}
		//기능
			//아이디 중복 확인
	@ResponseBody
	@RequestMapping("/regist/checkEmail")
	public Map checkEmail(String email)
	{
		Map map=new HashMap();
		int check=service.selectUserEmailCount(email);
		
		map.put("check", check);
		
		return map;
	}
			//이메일 인증
				//보내기
	@ResponseBody
	@RequestMapping("/sendEmail")
	public void sendEmail(String email, HttpServletRequest request)
	{
		//랜덤키(인증번호) 만들어서 세션에 넣음
		int tempKey=service.getTempKey();
		request.getSession().setAttribute("tempKey", tempKey);
		
		//랜덤키 담은 email 넣음
		service.sendEmailKey(email, tempKey);
	}
				//시간초과
	@ResponseBody
	@RequestMapping("/confirm/timeUp")
	public void timeUp(HttpServletRequest request)
	{
		request.getSession(false).removeAttribute("tempKey");
	}
				//확인
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
			//가입 콜백 페이지
	@RequestMapping("/enroll/callback")
	public String goCallback()
	{
		return "user/enrollCallback";
	}
			//회원 저장
	@ResponseBody
	@RequestMapping("/registUser")
	public String registUser(String email, String pw, String name, int userType, HttpServletRequest request)
	{
		Map user=new HashMap();
		user.put("USER_EMAIL", email);
		user.put("USER_NAME", name);
		user.put("USER_LINK_TYPE", userType);
		user.put("USER_PROFILEPHOTO", "/resources/images/common/header/user_Inform.png");
		
		if(userType==1)
		{
			String newPw=pwEncoder.encode(pw);
			user.put("USER_PASSWORD", newPw);
		}
		else if(userType==2||userType==3)
		{
			user.put("UNIQKEY", pw);
		}
		
		int result=service.insertUser(user);
		
		String msg="";
		if(result>0)
		{
			msg="회원가입에 성공하였습니다";
		}
		else
		{
			msg="다시 시도해주세요";
		}
		
		return msg;
	}
	
	
	//회원탈퇴
		//이동
	@RequestMapping("/leave")
	public String goLeave()
	{
		return "user/outUser";
	}
		//기능
	@RequestMapping("/leave/outUser")
	public String deleteUser(String outReason, HttpServletRequest request)
	{
		int userNo=(Integer)request.getSession(false).getAttribute("userNo");
		
		Map user=new HashMap();
		user.put("USER_NO", userNo);
		user.put("OUT_REASON", outReason);
		
		
		String msg="";
		
		int result=service.outUser(user);
		if(result>0)
		{
			msg="지금까지 이용해주셔서 감사합니다.";
		}
		else
		{
			msg="다시 시도해 주세요.";
		}
		
		return "main";
	}
	
	
	//로그인
		//이동
	@RequestMapping("/login")
	public String goLogin()
	{
		return "user/login";
	}
		//기능
	@ResponseBody
	@RequestMapping("/login.do")
	public Map login(String email, String password, HttpServletRequest request)
	{
		
		Map user = service.selectUser(email);
		
		String msg="";
		
		if(!user.isEmpty())
		{
			//홈페이지 회원 로그인
			if((Integer)user.get("USER_LINK_TYPE")==1)
			{
				String encodedPassword = (String)user.get("USER_PASSWORD");
				if(pwEncoder.matches(password, encodedPassword))
				{
					msg=null;
					int userNo=(Integer)user.get("USER_NO");
					request.getSession().setAttribute("userNo",userNo);
				}
				else
				{
					msg="비밀번호를 다시 확인해주세요.";
				}
			}
			//소셜 회원 로그인
			else if((Integer)user.get("USER_LINK_TYPE")==2)
			{
				String uniqKey=(String)user.get("USER_NAVER_UNIQ");
				if(password.equals(uniqKey))
				{
					msg=null;
					int userNo=(Integer)user.get("USER_NO");
					request.getSession().setAttribute("userNo",userNo);
				}
				else
				{
					msg="다시 시도해주세요";
				}
			}
			else if((Integer)user.get("USER_LINK_TYPE")==3)
			{
				String uniqKey=(String)user.get("USER_KAKAO_UNIQ");
				if(password.equals(uniqKey))
				{
					msg=null;
					int userNo=(Integer)user.get("USER_NO");
					request.getSession().setAttribute("userNo",userNo);
				}
				else
				{
					msg="다시 시도해주세요";
				}
			}
		}
		else
		{
			msg="등록되지 않은 이메일입니다.";
		}
		
		return user;
	}
	
	//ID/PW찾기
		//이동
			//ID찾기
	@RequestMapping("/find/id")
	public String goFindId()
	{
		return "user/findId";
	}
			//PW찾기(기본)
	@RequestMapping("/find/pw")
	public String goFindPw()
	{
		return "user/findPw";
	}
		//기능
			//ID찾기
	@ResponseBody
	@RequestMapping("/find/id.do")
	public String findId(String email)
	{
		String msg="";
		
		Map user = service.findId(email);
		
		if(user.get("USER_NO")!=null)
		{
			switch((Integer)user.get("USER_LINK_TYPE"))
			{
				case 2 : msg="네이버 연계 회원입니다. 네이버 소셜 로그인을 이용해 주세요.";break;
				case 3 : msg="카카오 연계 회원입니다. 카카오 소셜 로그인을 이용해 주세요."; break;
				default : msg="홈페이지에 가입된 회원입니다."; break;
			}
		}
		else
		{
			msg="등록되지 않은 이메일입니다.";
		}
		
		return msg;
	}
			//PW찾기
				//PW 링크 보내기
	@ResponseBody
	@RequestMapping("/find/pw.do")
	public String findPw(String email, HttpServletRequest request)
	{
		String msg="";
		Map user=service.findId(email);
		
		//만약 홈페이지 회원일 경우
		if((Integer)user.get("USER_LINK_TYPE")==1)
		{
			String tempKey=stringUtil.getRandomPassword(15);
			user.put("TEMP_KEY", tempKey);
			
			int result=service.requestFindPw(user);
			
			if(result>0)
			{
				try {
						URLCodec codec=new URLCodec();
						tempKey = codec.encode(tempKey);
					
					}
				catch(Exception e)
					{
						e.printStackTrace();
					}
				service.sendEmailLink(email, tempKey);
				msg="이메일을 확인해 주세요.";
			}
			else
			{
				msg="다시 시도해 주세요.";
			}
		}
		//홈페이지 회원이 아닌 경우
		else
		{
			msg="해당 소셜 버튼으로 로그인해 주세요.";
		}
		
		return msg;
	}
				//PW 링크 확인하고 PW 변경페이지로
	@RequestMapping(value="/resetPw/{key}", method=RequestMethod.GET) 
	public String goResetPw(@PathVariable("key") String key, HttpServletRequest request)
	{
		String tempKey="";
		
		//링크확인
		try {
				URLCodec codec=new URLCodec();
				tempKey=codec.decode(key);
			}
		catch(Exception e)
			{
				e.printStackTrace();
			}
		
		Map temp=service.findPwLink(tempKey);
		
		//PW변경 페이지로
		String loc="";
		if(temp.get("USER_NO")!=null)
		{
			 Date requestDate=(Date)temp.get("TEMP_DATE");
			 Date sysdate = new Date();
			if(requestDate.compareTo(sysdate)==0)
			{
				int tempUserNo=(Integer)temp.get("USER_NO");
				request.getSession(false).setAttribute("tempUserNo", tempUserNo);
				service.deleteFindPwLink(tempKey);
				loc="/myprofile/modify/password";
			}
			else
			{
				String msg="만료된 링크입니다.";
				loc="/main";
			}
		}
		else
		{
			loc="/main";
		}
			
		return "redirect:"+loc;
	}
	//로그아웃
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpServletRequest request)
	{
		int userNo=(int)request.getSession(false).getAttribute("userNo");
		request.getSession(false).removeAttribute("userNo");

		
		RedirectView rv=new RedirectView(request.getContextPath()+"/main");
		rv.setExposeModelAttributes(false);
		
		return new ModelAndView(rv);
	}
	//회원정보 수정
		//이동 (+ 회원정보 불러오기)
			//수정메뉴 페이지로
	@RequestMapping("/myprofile")
	public String goProfile(HttpServletRequest request)
	{
		int userNo=(Integer)request.getSession(false).getAttribute("userNo");
		Map user=service.selectUserBasic(userNo);
		request.setAttribute("user", user);
		
		return "user/editProfile";
	}
			//기본정보 수정페이지로
	@RequestMapping("/myprofile/modify/basic")
	public String goModifyBasic(HttpServletRequest request)
	{
		int userNo=(Integer)request.getSession(false).getAttribute("userNo");
		Map user=service.selectUserBasic(userNo);
		request.setAttribute("user", user);
		
		return "user/editBasic";
	}
			//주소록 수정페이지로
	@RequestMapping("/myprofile/modify/address")
	public String goModifyAddress(HttpServletRequest request)
	{
		int userNo=(Integer)request.getSession(false).getAttribute("userNo");
		List<Map> userAddress=service.selectUserAddress(userNo);
		request.setAttribute("userAddress", userAddress);
		
		return "user/editAddress";
	}
			//비밀번호 수정페이지로
	@RequestMapping("/myprofile/modify/password")
	public String goModifyPassword()
	{
		return "user/editPassword";
	}
			//계좌 확인페이지로
	@RequestMapping("/myprofile/modify/account")
	public String goModifyAccount(HttpServletRequest request)
	{
		int userNo=(Integer)request.getSession(false).getAttribute("userNo");
		Map userAccount = service.selectUserAccount(userNo);
		request.setAttribute("userAccount", userAccount);
		
		return "user/editAccount";
	}
		//기능
			//회원정보 업데이트
				//프로필사진 업데이트
	@RequestMapping("/myprofile/modify/profilephoto.do")
	public String modifyProfilePhoto(MultipartFile photo, HttpServletRequest request)
	{
		int userNo=(Integer)request.getSession(false).getAttribute("userNo");
		String msg="";
		
		if (!photo.isEmpty()) 
		{
			Map user=new HashMap();
			
			String rootDir = request.getSession().getServletContext().getRealPath("/");
			String saveDir = "resources/upload/profilePhoto";
			String renamedFileName = fileUtil.getRenamedFileName(photo);
			fileUtil.saveFile(photo, rootDir, saveDir, renamedFileName);
			String saveAllDir = "/" + saveDir + "/" + renamedFileName;
			
			user.put("USER_PROFILEPHOTO", saveAllDir);
			user.put("USER_NO", userNo);
			
			int result = service.updateUserPhoto(user);
			if(result>0)
			{
				msg="프로필 사진 변경 성공";
			}
			else
			{
				msg="다시 시도해주세요";
			}
		}
		else
		{
			msg="다시 시도해주세요";
		}
		
		return "redirect:/myprofile";
	}
				//기본정보 업데이트
	@RequestMapping("/myprofile/modify/basic.do")
	public String modifyBasic(String email, String name, HttpServletRequest request)
	{
		
		int userNo=(Integer)request.getSession(false).getAttribute("userNo");
		Map user=(Map)request.getAttribute("user");
		
		//email이 변경되었는지 여부는 js에서 확인 (이메일인증 동일)
		user.put("USER_NO", userNo);
		user.put("USER_NAME", name);
		user.put("USER_EMAIL", email);
		
		String msg="";
		
		int result=service.updateUser(user);
		
		if(result>0)
		{
			msg="회원정보가 업데이트 되었습니다.";
		}
		else
		{
			msg="다시 시도해주세요.";
		}
		
		return "redirect:/myprofile/modify/basic";
	}
				//비밀번호 업데이트
	@RequestMapping("/myprofile/modify/password.do")
	public String modifyPassword(String password, String newPassword, HttpServletRequest request)
	{
		int userNo=0;
		String msg="";
		
		if(request.getSession(false).getAttribute("userNo")!=null)
		{
			Map user=service.selectUserBasic(userNo);
			String encodedPassword = (String)user.get("USER_PASSWORD");
			if(pwEncoder.matches(password, encodedPassword))
			{
				userNo=(Integer)request.getSession(false).getAttribute("userNo");
				String newEncodedPassword = pwEncoder.encode(newPassword);
				user.put("USER_PASSWORD", newEncodedPassword);
				
				int result = service.updatePassword(user);
				if(result>0)
				{
					msg="비밀번호 변경 성공";
				}
				else
				{
					msg="비밀번호 변경 실패";
				}
			}
			else
			{
				msg="비밀번호가 일치하지 않습니다.";
			}
		}
		else if(request.getSession(false).getAttribute("tempUserNo")!=null)
		{
			userNo=(Integer)request.getSession(false).getAttribute("tempUserNo");
			String newEncodedPassword = pwEncoder.encode(newPassword);

			Map user = new HashMap();
			
			user.put("USER_NO", userNo);
			user.put("USER_PASSWORD", newEncodedPassword);
			
			int result = service.updatePassword(user);
			if(result>0)
			{
				msg="비밀번호 변경 성공";
			}
			else
			{
				msg="비밀번호 변경 실패";
			}
		}
		
		return "redirect:/myprofile";
	}
				//주소록 업데이트(수정)
	@RequestMapping("/myprofile/modify/address.do")
	public String modifyAddress(int addressNo, String addressName, int addressZipNo,
			String addressWhole, String addressDetail, String addressPhone, String addressReceiverName)
	{
		Map userAddress = new HashMap();
		userAddress.put("ADDRESS_NO", addressNo);
		userAddress.put("ADDRESS_NAME", addressName);
		userAddress.put("ADDRESS_ZIP_NO", addressZipNo);
		userAddress.put("ADRESS_WHOLE", addressWhole);
		userAddress.put("ADDRESS_DETAIL", addressDetail);
		userAddress.put("ADDRESS_PHONE", addressPhone);
		userAddress.put("ADDRESS_RECEIVER_NAME", addressReceiverName);
		
		service.updateUserAddress(userAddress);
		
		return "redirect:/myprofile/modify/address";
	}
				//주소록 추가
	@RequestMapping("/myprofile/modify/address/add")
	public String addMyAddress(HttpServletRequest request, String addressName,
			int addressZipNo, String addressWhole, String addressDetail, String addressPhone,
			String addressReceiverName)
	{
		int userNo = (Integer)request.getSession(false).getAttribute("userNo");
		Map userAddress = new HashMap();
		userAddress.put("USER_NO",userNo);
		userAddress.put("ADDRESS_NAME", addressName);
		userAddress.put("ADDRESS_ZIP_NO", addressZipNo);
		userAddress.put("ADRESS_WHOLE", addressWhole);
		userAddress.put("ADDRESS_DETAIL", addressDetail);
		userAddress.put("ADDRESS_PHONE", addressPhone);
		userAddress.put("ADDRESS_RECEIVER_NAME", addressReceiverName);
		
		service.insertUserAddress(userAddress);
		
		return "redirect:/myprofile/modify/address";
	}
				//주소록 삭제
	@RequestMapping("/myprofile/modify/address/delete")
	public String deleteMyAddress(int addressNo)
	{
		
		service.deleteUserAddress(addressNo);
		
		return "redirect:/myprofile/modify/address";
	}
	
	//특정 유저의 리워드 리스트 보기
	@RequestMapping("/userPage/{userNo}")
	public String goUserRewordPage(@PathVariable("userNo") int userNo)
	{
		
		return "user/mypage";
	}
		//그 유저가 후원한 reword 가져오기 (기본)
		//그 유저가 진행하는 reword 가져오기
}
