package com.spring.test.user.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.EncoderException;
import org.apache.commons.codec.net.URLCodec;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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


	

//data 쉽게 얻기
	
	//로그인 체크
	@ResponseBody
	@RequestMapping("/user/loginCheckAjax") 
	public boolean isLogin(HttpServletRequest request) {
		System.out.println("들어옴? <-이거 이제 지워도 되나요?");
		
		return request.getSession().getAttribute("userNo") != null;
	}
	
	
//ajax
	
	//ID 찾기
	@ResponseBody
	@RequestMapping(value = "/user/isOurUserEmail")
	public Map findUserEmail(String email)
	{
		Map mv = new HashMap();
		
		int linkType = 0;
		linkType= service.findUserTypeWithEmail(email);

		mv.put("linkType",linkType);
		mv.put("title","아이디");
		mv.put("explain","아이디를 잊어버리셨나요 ? 가입하신 것 같은 이메일을 입력해 주세요. <br/> 가입 여부를 알려드립니다.");
		
		return mv;
	}
	//PW 찾기
	@ResponseBody
	@RequestMapping("/user/findPassword")
	public Map findUserPw(String email, HttpSession session)
	{
		Map mv = new HashMap();
		
		String tempKey = stringUtil.getRandomPassword(15);
		
		Map tempUser = service.userProfile(email);
		int userLinkType = 0;
		try{
			userLinkType = Integer.parseInt(tempUser.get("USER_LINK_TYPE").toString());
		}catch(NumberFormatException e)
		{
			userLinkType = 0;
		}
		
		
		if(userLinkType == 1)
		{
			int userNo = Integer.parseInt(tempUser.get("USER_NO").toString());
			int result = service.setUserFindPwLink(userNo,tempKey);
			
			if(result>0)
			{
				session.setAttribute("tempKey", tempKey);

				URLCodec codec=new URLCodec();
				try {
					tempKey = codec.encode(tempKey);
				} catch (EncoderException e) {

				}

				service.sendEmailLink(email, tempKey);
				
				mv.put("result_msg","이메일을 전송하였습니다. 링크로 접속해주세요.");
			}
			else
			{
				mv.put("result_msg","이메일 전송에 실패하였습니다. 다시 시도해주세요.");
			}
			
		}
		else if(userLinkType == 2)
		{
			mv.put("result_msg","네이버 연계 회원이십니다. 네이버 아이디로 로그인해주세요.");
		}
		else
		{
			mv.put("result_msg","등록되지 않은 이메일입니다.");
		}
		
		mv.put("title","비밀번호");
		mv.put("explain", "비밀번호를 잊어버리셨나요 ? 인증하신 이메일을 입력해 주세요. <br/> 비밀번호를 재설정하는 링크를 보내드립니다.");
		
		return mv;
	}
	//패스워드 변경 링크
	@RequestMapping(value="/resetPw/{key}") 
	public String goResetPw(@PathVariable("key") String key, HttpSession session, Model model)
	{
		String loc = "";
		if(session.getAttribute("userNo")==null)
		{
			String tempKey="";
			//링크확인
			try {
					URLCodec codec=new URLCodec();
					tempKey=codec.decode(key);
				}
			catch(Exception e){e.printStackTrace();}
			//table 에서 userNo, 기한 안지난건지 확인한 결과 가져옴
			//tempUser 세션값에 넣고 pw변경 페이지로 이동
			
			int tempUserNo = service.getUserFindPwLink(tempKey);
			
			if(tempUserNo == 0)
			{
				model.addAttribute("loginMsg", "만료된 링크입니다. 다시 신청해주세요");
			}
			else
			{
				session.setAttribute("tempUserNo", tempUserNo);
				session.setAttribute("title", "비밀번호 재설정");
			}
			loc = "user/user_edit_basic";
		}
		else
		{
			loc="redirect:/mainPage";
		}
		return loc;
	}
	//link로 pw변경
	@ResponseBody
	@RequestMapping(value = "/goResetPw", method=RequestMethod.POST)
	public int resetPw(String password, HttpSession session,Model model)
	{
		int userNo = Integer.parseInt(session.getAttribute("tempUserNo").toString());

		//비밀번호 변경+temp 테이블 값 삭제
		int result = service.editUserFindPwLink(userNo, password);
		
		if(result>0)
		{
			session.removeAttribute("tempUserNo");
		}
		
		return result;
	}
	
	//회원가입 저장 (홈페이지 회원)
	@ResponseBody
	@RequestMapping(value = "/regist/user/basic.do")
	public int registUserBasic(String email, String password, String name)
	{
		int result = service.registUser(email, password, name, 1);
		//아이디, 이름, 비밀번호 받아서 db에 insert. 
		return result;
	}
	//이메일 중복 확인
	@ResponseBody
	@RequestMapping(value = "/regist/user/emailCheckUp")
	public int emailCheckUp(String email)
	{
		return service.selectEqualEmail(email);
	}
	//타이머 
		//타이머 오버
	@ResponseBody
	@RequestMapping(value = "/user/enroll/timeUp")
	public void stopTimer(HttpSession session)
	{
		if(session.getAttribute("tempKey")!=null)
		{
			session.removeAttribute("tempKey");
		}
	}
	
	//로그인 (홈페이지 회원)
	@ResponseBody
	@RequestMapping(value = "/login.do", method=RequestMethod.POST)
	public Map doLogin(String email, String password, HttpSession session)
	{
		Map temp = service.loginBasicUser(email, password);
		if(temp.containsKey("userNo"))
		{
			int userNo = Integer.parseInt(String.valueOf(temp.get("userNo")));
			session.setAttribute("userNo", userNo);
			session.setAttribute("loginUserEmail", email);
			String userName = String.valueOf(temp.get("USER_NAME"));
			session.setAttribute("loginUserName", userName);
			if(temp.get("USER_PROFILEPHOTO")!=null) {
			session.setAttribute("loginUserProfilePhoto", temp.get("USER_PROFILEPHOTO").toString());}
			System.out.println(userNo);
			if(userNo<0) {
				temp.put("loc", "/test/admin/main");
			}
			//원래 있던 곳으로 돌아가기
			else if(session.getAttribute("destination") != null) {
				temp.put("destination", session.getAttribute("destination").toString());
				session.removeAttribute("destination");
			}
			else
			{
				temp.put("loc","/test/mainPage");
			}
		}
		else
		{
			String msg = String.valueOf(temp.get("msg"));
			temp.put("msg", msg);
		}
		
		return temp;
	}
	
	//소셜 받아오는 창으로 넘어감
	@RequestMapping(value="/user/naver.do")
	public String registUserNaver()
	{
		return "user/naver_callback";
	}
	//소셜 로그인 
	@ResponseBody
	@RequestMapping(value = "/user/naverlogin", method=RequestMethod.POST)
	public Map loginUserNaver(String email, String name, String unique, HttpSession session)
	{
		//로그인 시도
		Map temp = service.loginNaverUser(email, unique);
		if(temp!=null&&!temp.isEmpty())
		{	
			if(temp.containsKey("userNo"))
			{
				int userNo = Integer.parseInt(temp.get("userNo").toString());
				session.setAttribute("userNo", userNo);
				session.setAttribute("loginUserProfilePhoto", temp.get("USER_PROFILEPHOTO").toString());
				session.setAttribute("loginUserName", temp.get("USER_NAME").toString());
			}
		}
		
		return temp;
	}
	//등록 안되어 있으면 회원가입 저장 (네이버 콜백)
	@ResponseBody
	@RequestMapping(value = "/user/naver_regist", method=RequestMethod.POST)
	public int registUserNaver(String email, String name, String unique)
	{
		int result = service.registUser(email, unique, name, 2);
		
		return result;
	}
	
	//로그아웃
	@RequestMapping("/logout")
	public String doLogout(HttpSession session)
	{
		//세션에 userNo, loginUserName 찾아 없애기
		if(session.getAttribute("userNo")!=null)
		{
			session.removeAttribute("userNo");
			session.removeAttribute("loginUserName");
			session.removeAttribute("loginUserEmail");
		}
		
		return "redirect:/mainPage";
	}
		
	//회원탈퇴
	@ResponseBody
	@RequestMapping(value = "/user/delete.do", method=RequestMethod.POST)
	public int deleteUser(String reason, HttpSession session)
	{
		int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
		//유저 넘버, 나간 이유 받아서 저장 + 유저 tb_user_out에 넣기

		Map user = service.userProfile(userNo);
		user.put("userNo", userNo);
		user.put("outReason", reason);
		
		int result = service.deleteUser(user);
		
		return result;
	}
		//탈퇴 가능한가 확인
	@ResponseBody
	@RequestMapping(value = "/user/canOut.do", method=RequestMethod.POST)
	public boolean userCanOut(HttpSession session)
	{

		int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
		boolean flag = service.userCanOut(userNo);
		
		return flag;
	}
	
	//정보수정
	@RequestMapping("/myprofile")
	public ModelAndView editProfilePage(HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		
		int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
		//유저 넘버로 정보 받아와서 정보수정 페이지에 옮김
		Map user = service.userProfile(userNo);
		mv.addObject("user", user);
		
		mv.setViewName("/user/user_edit");
		return mv;
	}
	
		//이름
		@ResponseBody
		@RequestMapping(value = "/myprofile/edit/name.do", method=RequestMethod.POST)
		public int editName(String editUserName, HttpSession session)
		{
			int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
			//유저 넘버, 이름 받아서 db에 넣고, 정보수정 페이지로.
			int result = 0;
			result = service.updateUserName(userNo,editUserName);
			
			if(result>0)
			{
				session.setAttribute("loginUserName", editUserName);
			}
			
			return result;
		}
		
		//사진
		@ResponseBody
		@RequestMapping(value = "/myprofile/edit/photo.do" , method=RequestMethod.POST)
		public int editPhoto(@RequestParam MultipartFile selectedPhoto, HttpSession session)
		{
			int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
			Map user = new HashMap();
			
			int result = 0;
			//파일 받고, 타입(기본으로 가는건지, 새로운 사진 올린건지) 구분해서 업데이트
			if (!selectedPhoto.isEmpty()) 
			{
				String rootDir = session.getServletContext().getRealPath("/");
				String saveDir = "resources/upload/userProfilePhoto";
				String renamedFileName = fileUtil.getRenamedFileName(selectedPhoto);
				fileUtil.saveFile(selectedPhoto, rootDir, saveDir, renamedFileName);
				String saveAllDir = "/" + saveDir + "/" + renamedFileName;
				
				user.put("USER_NO", userNo);
				user.put("USER_PROFILEPHOTO", saveAllDir);
				
				result = service.updateUserPhoto(user);
			}
			else
			{
				user.put("USER_NO", userNo);
				user.put("USER_PROFILEPHOTO", "/resources/images/common/header/user_Inform.png");
				result = service.updateUserPhoto(user);
			}
			
			if(result>0)
			{
				session.setAttribute("loginUserProfilePhoto", user.get("USER_PROFILEPHOTO").toString());
			}
			
			return result;
		}
		
	
		//비밀번호&이메일
		@RequestMapping(value = "/myprofile/edit/basic")
		public ModelAndView editBasicPage(HttpSession session)
		{
			ModelAndView mv = new ModelAndView();
			
			int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
			
			//넘버로 받아서 가져감
			Map temp = service.userProfile(userNo);
			
			mv.addObject("user", temp);
			mv.setViewName("/user/user_edit_basic");
			
			return mv;
		}
		
		@ResponseBody
		@RequestMapping(value = "/myprofile/edit/basic.do" , method=RequestMethod.POST)
		public int editBasic(@RequestParam(name="email", required = false ) String email, 
				@RequestParam(name="password", required = false ) String password, 
				@RequestParam(name="newPassword", required = false ) String newPassword, 
				HttpSession session)
		{
			int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
			int result = service.updateUserBasic(userNo,email,password,newPassword);
			
			return result;
		}
		
		//주소록
		@RequestMapping(value = "/myprofile/edit/address")
		public ModelAndView editAddressPage(HttpSession session)
		{
			ModelAndView mv = new ModelAndView();
			
			int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
			
			//주소록 받아서 보냄
			List<Map> temp = service.userAddressList(userNo); 
			
			mv.addObject("userAddress", temp);
			mv.setViewName("/user/user_address");
			return mv;
		}
		
		@ResponseBody
		@RequestMapping(value = "/myprofile/edit/add/address" , method=RequestMethod.POST)
		public int addAddress(@RequestParam(name="addrName") String addrName,
				@RequestParam(name="receiver") String receiver,@RequestParam(name="phone") String phone,
				@RequestParam(name="zipNo") String zipNo,@RequestParam(name="addrWhole") String addrWhole,
				@RequestParam(name="extraAddr",defaultValue="",required=false) String extraAddr,
				@RequestParam(name="addrDetail",defaultValue="",required=false) String addrDetail,
				HttpSession session)
		{

			int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
			int result = -1;
			
			List<Map> temp = service.userAddressList(userNo);

			
			if(temp.size()<3)
			{
				Map address = new HashMap();
				address.put("userNo", userNo);
				address.put("addrName", addrName);
				address.put("receiver", receiver);
				address.put("phone", phone);
				address.put("zipNo", zipNo);
				address.put("addrWhole", addrWhole);
				address.put("addrDetail", addrDetail+" "+extraAddr);

				result = service.addAddress(address);
			}
			
			return result;
		}
		
		@ResponseBody
		@RequestMapping(value = "/myprofile/edit/del/address" , method=RequestMethod.POST)
		public int delAddress(int addrNo,HttpSession session)
		{
			int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
			List<Map> temp = service.userAddressList(userNo);
			
			int result = -1;
			
			for(Map addr : temp)
			{
				if(Integer.parseInt(addr.get("ADDRESS_NO").toString())==addrNo)
				{
					result = service.deleteAddress(addrNo);
				}
			}
			
			return result;
		}
		
		//계좌
		@RequestMapping(value = "/myprofile/edit/account")
		public ModelAndView editAccountPage(HttpSession session)
		{
			ModelAndView mv = new ModelAndView();
			
			int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
			
			//계좌 받아서 보냄
			List<Map> temp = service.userAccountList(userNo);
			
			mv.addObject("account", temp);
			mv.setViewName("/user/user_account");
			return mv;
		}
		
		@RequestMapping(value= "/myprofile/edit/account.do" , method=RequestMethod.POST)
		public ModelAndView editAccount()
		{
			ModelAndView mv = new ModelAndView();
			
			//삭제...는 여기서 할 수 있어야 하나?
			
			mv.setViewName("/user/user_account");
			return mv;
		}
	
	//본인의 펀딩 목록
		@RequestMapping("/userPage")
		public ModelAndView userSupportRewardList(@RequestParam(name="filter", required = false, defaultValue = "0") String filter, HttpSession session)
		{
			ModelAndView mv = new ModelAndView();
			List<Map> temp = new ArrayList();
			
			int selectUserNo = Integer.parseInt(session.getAttribute("userNo").toString());
			int filterInt = Integer.parseInt(filter);
			
			temp = service.userFundingList(selectUserNo, filterInt);
		
			mv.addObject("userName",session.getAttribute("loginUserName").toString());
			mv.addObject("myList",temp);
			mv.addObject("title", "후원한 리워드");
			mv.addObject("filter",filter);
			mv.setViewName("/user/user_funding_list");
			
			return mv;
		}
		@RequestMapping("/userPage/like")
		public ModelAndView userLikeRewardList(@RequestParam(name="filter", required = false, defaultValue = "0") String filter, HttpSession session)
		{
			ModelAndView mv = new ModelAndView();
			List<Map> temp = new ArrayList();
			
			int selectUserNo = Integer.parseInt(session.getAttribute("userNo").toString());
			int filterInt = Integer.parseInt(filter);
			
			temp = service.userLikeFundingList(selectUserNo, filterInt);
		
			mv.addObject("userName",session.getAttribute("loginUserName").toString());
			mv.addObject("myList",temp);
			mv.addObject("title", "좋아한 리워드");
			mv.addObject("filter",filter);
			mv.setViewName("/user/user_funding_list");
			
			return mv;
		}
		@RequestMapping("/userPage/made")
		public ModelAndView userMadeRewardList(@RequestParam(name="filter", required = false, defaultValue = "0") String filter, HttpSession session)
		{
			ModelAndView mv = new ModelAndView();
			List<Map> temp = new ArrayList();
			
			int selectUserNo = Integer.parseInt(session.getAttribute("userNo").toString());
			int filterInt = Integer.parseInt(filter);
			
			temp = service.userMadeFundingList(selectUserNo, filterInt);
		
			mv.addObject("userName",session.getAttribute("loginUserName").toString());
			mv.addObject("myList",temp);
			mv.addObject("filter",filter);
			mv.addObject("title", "만든 리워드");
			mv.setViewName("/user/user_funding_list");
			
			return mv;
		}
		
	//다른 유저 펀딩 목록
		@RequestMapping("/userPage/{selectUserNo}")
		public ModelAndView userSupportRewardList(@PathVariable("selectUserNo") String selectUserNoObj, @RequestParam(name="filter", required = false, defaultValue = "0") String filter, HttpSession session)
		{
			ModelAndView mv = new ModelAndView();
			List<Map> temp = new ArrayList();
			String view = "/user/user_funding_list";
			
			int selectUserNo = Integer.parseInt(selectUserNoObj);
			
			int userNo = 0;
			if(session.getAttribute("userNo")!=null)
			{
				userNo = Integer.parseInt(session.getAttribute("userNo").toString());
			}
			if(selectUserNo == 0 || selectUserNo == userNo)
			{
				view = "redirect:/userPage";
			}
			else 
			{
				if(service.userProfile(selectUserNo)!=null)
				{
					String userName = service.userProfile(selectUserNo).get("USER_NAME").toString();
					int filterInt = Integer.parseInt(filter);
					
					temp = service.userFundingList(selectUserNo, filterInt);
					mv.addObject("myList",temp);
					mv.addObject("userName",userName);
				}
				else 
				{
					mv.addObject("emptyUser","없는 회원");
				}
			}
			
			mv.addObject("title", "후원한 리워드");
			mv.addObject("filter",filter);
			mv.setViewName(view);
			
			return mv;
		}
		@RequestMapping("/userPage/like/{selectUserNo}")
		public ModelAndView userLikeRewardList(@PathVariable("selectUserNo") String selectUserNoObj, @RequestParam(name="filter", required = false, defaultValue = "0") String filter, HttpSession session)
		{
			ModelAndView mv = new ModelAndView();
			List<Map> temp = new ArrayList();
			String view = "/user/user_funding_list";
			
			int selectUserNo = Integer.parseInt(selectUserNoObj);
			
			int userNo = 0;
			if(session.getAttribute("userNo")!=null)
			{
				userNo = Integer.parseInt(session.getAttribute("userNo").toString());
			}
			if(selectUserNo == 0 || selectUserNo == userNo)
			{
				view = "redirect:/userPage";
			}
			else 
			{
				if(service.userProfile(selectUserNo)!=null)
				{
					String userName = service.userProfile(selectUserNo).get("USER_NAME").toString();
					int filterInt = Integer.parseInt(filter);
					
					temp = service.userLikeFundingList(selectUserNo, filterInt);
					mv.addObject("myList",temp);
					mv.addObject("userName",userName);
				}
				else 
				{
					mv.addObject("emptyUser","없는 회원");
				}
			}
			
			mv.addObject("title", "좋아한 리워드");
			mv.addObject("filter",filter);
			mv.setViewName(view);
			
			return mv;
		}
		@RequestMapping("/userPage/made/{selectUserNo}")
		public ModelAndView userMadeRewardList(@PathVariable("selectUserNo") String selectUserNoObj, @RequestParam(name="filter", required = false, defaultValue = "0") String filter, HttpSession session)
		{
			ModelAndView mv = new ModelAndView();
			List<Map> temp = new ArrayList();
			String view = "/user/user_funding_list";
			
			int selectUserNo = Integer.parseInt(selectUserNoObj);
			
			int userNo = 0;
			if(session.getAttribute("userNo")!=null)
			{
				userNo = Integer.parseInt(session.getAttribute("userNo").toString());
			}
			if(selectUserNo == 0 || selectUserNo == userNo)
			{
				view = "redirect:/userPage";
			}
			else 
			{
				if(service.userProfile(selectUserNo)!=null)
				{
					String userName = service.userProfile(selectUserNo).get("USER_NAME").toString();
					int filterInt = Integer.parseInt(filter);
					
					temp = service.userMadeFundingList(selectUserNo, filterInt);
					mv.addObject("myList",temp);
					mv.addObject("userName",userName);
				}
				else 
				{
					mv.addObject("emptyUser","없는 회원");
				}
			}
			
			mv.addObject("title", "만든 리워드");
			mv.addObject("filter",filter);
			mv.setViewName(view);
			
			return mv;
		}
		
	
		//유저 본인의 펀딩 상태
		@ResponseBody
		@RequestMapping("/myreward/list/made")
		public ModelAndView myRewardListPage(@RequestParam(name="filter", defaultValue="3", required=false) String filter, HttpSession session)
		{
			ModelAndView mv = new ModelAndView();
			
			int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
			int filterInt = Integer.parseInt(filter); //1-6 전체. 필터 넣을때 대비해서
			
			List<Map> temp = service.userMadeFundingList(userNo, filterInt);
			
			for(Map map : temp)
			{
				if(map.get("REWARD_REPRESENT_IMAGE") == null)
				{
					map.put("REWARD_REPRESENT_IMAGE", "/resources/images/common/header/main_logo3.png");
				}
				if(map.get("REWARD_SHORT_NAME") == null )
				{
					map.put("REWARD_SHORT_NAME", " ");
				}
			}
			
			mv.addObject("myList",temp);
			mv.addObject("pageTitle","나의 리워드");
			mv.addObject("type",2);
			mv.addObject("filter",filterInt);
			
			mv.setViewName("/user/user_funding_state");
			return mv;
		}
		
		@RequestMapping("/myreward/list/support")
		public ModelAndView myRewardListSupport(HttpSession session)
		{
			ModelAndView mv = new ModelAndView();
			
			int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
			int filterInt = 3; //1-6 전체. 필터 넣을때 대비해서
			
			List<Map> temp = service.userFundingList(userNo, filterInt);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			for(Map map : temp)
			{
				Date d = (Date)map.get("REWARD_DEADLINE");
				String newDate = sdf.format(d);
				map.put("REWARD_DEADLINE", newDate);
			}
			
			mv.addObject("myList",temp);
			mv.addObject("pageTitle","펀딩 내역");
			mv.addObject("type",1);
			mv.setViewName("/user/user_funding_state");
			return mv;
		}
		
		@ResponseBody
		@RequestMapping("/myreward/list/support/detail/{rewardNo}")
		public Map myRewardSupportDetail(@PathVariable int rewardNo, HttpSession session)
		{
			int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
			//여기서 rewardNo와 userNo로 support 찾기
			Map detail = new HashMap();
			
			return detail;
		}
	
	
//페이지 이동 (로그인없이 가능)

	//로그인
	@RequestMapping("/login")
	public String loginPage(HttpSession session)
	{
		String location = "redirect:/mainPage";
		
		//로그인 안되어있으면 로그인페이지로, 되어있으면 메인페이지로
		if(session.getAttribute("userNo")==null)
		{
			location = "user/login";
		}
		return location;
	}
	
	//이용 약관
	@RequestMapping("/fundingstory/terms")
	public String termsPage()
	{
		return "user/terms";
	}
	
	//회원가입
	@RequestMapping("/welcome")
	public String enrollPage()
	{
		return "user/user_enroll";
	}
		
		//회원가입 폼
		@RequestMapping("/welcome/basic")
		public String enrollBasicPage()
		{
			return "user/user_enroll_form";
		}
	
	//PW찾기
	@ResponseBody
	@RequestMapping("/forget_my_pw")
	public ModelAndView findUserPasswordPage()
	{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("type", "비밀번호");
		mv.addObject("explain", "비밀번호를 잊어버리셨나요 ? 인증하신 이메일을 입력해 주세요. <br/> 비밀번호를 재설정하는 링크를 보내드립니다.");
		
		mv.setViewName("/user/user_find_info");
		
		return mv;
	}
	//ID찾기
	@ResponseBody
	@RequestMapping("/forget_my_id")
	public ModelAndView findUserIdPage()
	{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("type", "아이디");
		mv.addObject("explain", "아이디를 잊어버리셨나요 ? 가입하신 것 같은 이메일을 입력해 주세요. <br/> 가입 여부를 알려드립니다.");
		
		mv.setViewName("/user/user_find_info");
		
		return mv;
	}
	
	//PW재설정
	@RequestMapping(value="/reset_password/{tempKey}", method=RequestMethod.GET) 
	public ModelAndView resePasswordtPage(@PathVariable String tempKey)
	{
		ModelAndView mv= new ModelAndView();
		
		//
		
		mv.setViewName("/user/user_edit_basic");
		return mv;
	}
	
//페이지 이동 (로그인 필요)
	
	//탈퇴 신청
	@RequestMapping("/leave")
	public ModelAndView leaveServicePage(HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
		String email = service.userProfile(userNo).get("USER_EMAIL").toString();
		
		mv.addObject("email",email);
		mv.setViewName("user/user_out");
		return mv;
	}
	
	
//인증 관련
	//키값 담아 이메일 보내기 (session으로 tempKey유지)
	@ResponseBody
	@RequestMapping(value="/sendEmail", method=RequestMethod.POST)
	public void sendEmail(String email, String type, HttpSession session)
	{
		//랜덤키(인증번호) 만들어서 세션에 넣음
		String tempKey = stringUtil.getRandomPassword(5)+(int)(Math.random()*1000+1);
		session.setAttribute("tempKey", tempKey);
		
		//랜덤키 담은 email 넣음
		service.sendEmailKey(email, tempKey, type);
	}
		//인증키 확인
	@ResponseBody
	@RequestMapping(value = "/user/checkTempKey")
	public boolean checkTempKey(String key, HttpSession session)
	{
		String tempKey = session.getAttribute("tempKey").toString();
		
		boolean check = false;
		if(key.equals(tempKey))
		{
			check = true;
			session.removeAttribute("tempKey");
		}
		
		return check;
	}
	//링크 담아 이메일 보내기(table에 tempKey유지)
}
