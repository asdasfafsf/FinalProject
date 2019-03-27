package com.spring.test.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.test.admin.model.service.AdminService;
import com.spring.test.admin.model.vo.Event;
import com.spring.test.admin.model.vo.MemberSort;
import com.spring.test.admin.model.vo.Notice;
import com.spring.test.admin.model.vo.RewardAd;
import com.spring.test.admin2.model.service.Admin2Service;
import com.spring.test.admin2.model.vo.RewardSort;
import com.spring.test.common.util.FileUtil;
import com.spring.test.common.util.PageFactory;
@Controller
public class AdminController {
	@Autowired
	AdminService service;
	@Autowired
	Admin2Service service2;
	@Autowired
	FileUtil fileUtil;
	//공지사항 상세보기
	@RequestMapping("/admin/noticeDetail")
	public ModelAndView noticeDetail(
			@RequestParam(value="idx",required=false,defaultValue="0")int noticeNo) {
		ModelAndView mv=new ModelAndView();
		System.out.println("공지사항 디테일");
		System.out.println("noticeNo:"+noticeNo);
		List noticeContent=service.selectNoticeContent(noticeNo);
		mv.addObject("noticeContent",noticeContent);
		System.out.println(noticeContent);
		mv.addObject("check",1);
		mv.setViewName("/admin/admin_notice");
		return mv;
	}
	//공지사항 쓰기
	@RequestMapping("/admin/notice_add")
	public ModelAndView noticeDetail() {
		ModelAndView mv=new ModelAndView();
		mv.addObject("check",2);
		mv.addObject("edit",1);
		mv.setViewName("/admin/admin_notice");
		return mv;
	}
	//공지사항 등록
	@RequestMapping("/admin/notice_registration")
	@ResponseBody
	public Map<String, Object> addNotice(
			@RequestParam(value="noticeTitle", required=false, defaultValue="0") String noticeTitle,
			@RequestParam(value="noticeContent", required=false, defaultValue="0") String noticeContent){
		System.out.println(noticeTitle+" "+noticeContent);
		Notice n=new Notice();
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		int result=service.insertNotice(n);
		return new HashMap<>();
	}
	@RequestMapping("/admin/notice_edit")
	@ResponseBody
	public ModelAndView editNotice(
			@RequestParam(value="idx", required=false, defaultValue="0")int noticeNo){
		System.out.println(noticeNo);
		ModelAndView mv=new ModelAndView();
		List noticeContent=service.selectNoticeContent(noticeNo);
		System.out.println(noticeContent);
		mv.addObject("editNoticeContent",noticeContent);
		mv.addObject("check",2);
		mv.addObject("edit",0);
		mv.setViewName("/admin/admin_notice");
		return mv;
	}
	@RequestMapping("/admin/notice_update")
	@ResponseBody
	public Map<String, Object> updateNotice(
			@RequestParam(value="noticeTitle", required=false, defaultValue="0") String noticeTitle,
			@RequestParam(value="noticeContent", required=false, defaultValue="0") String noticeContent,
			@RequestParam(value="noticeNo", required=false, defaultValue="0") int noticeNo){
		Notice n=new Notice();
		n.setNoticeContent(noticeContent);
		n.setNoticeNo(noticeNo);
		n.setNoticeTitle(noticeTitle);
		int result=service.updateNotice(n);
		return new HashMap<>();
	}
	
	//공지사항
	@RequestMapping("/admin/notice")
	public ModelAndView noticeList(
			@RequestParam(value="cPage", 
			required=false, defaultValue="1") int cPage){
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		int contentCount=service.selectNoticeCount();
		List noticeList=service.selectNoticeList(cPage,numPerPage); 
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/notice"));
		mv.addObject("noticeList", noticeList);
		//System.out.println(noticeList);
		mv.addObject("check",0);
		mv.setViewName("/admin/admin_notice");
	
		return mv;
	}
	
	@RequestMapping("/admin/notice_search")
	public ModelAndView searchNoticeList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="adminSelectNotice_input", required=false,defaultValue="0" )String word){
		
		//String word=request.getParameter("adminSelectNotice_input");
		int numPerPage=10;
		System.out.println(",,ㅏ,ㅏ,ㅏ,  "+word);
		System.out.println("page"+cPage);
		ModelAndView mv=new ModelAndView();
		if(word!=null) {
			int contentCount=service.selectSearchNoticeCount(word);
			String id="searchNotice";
			List searchNoticeList=service.selectSearchNoticeList(cPage, numPerPage, word);
			mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/notice_search?adminSelectNotice_input="+word+"&",word));
			mv.addObject("noticeList",searchNoticeList);
			//System.out.println(searchNoticeList);
			mv.setViewName("/admin/admin_notice");
		}
		else {
			System.out.println("word 널이다");
		}
		mv.addObject("check",0);
		mv.addObject("searchWord",word);
		return mv;
	}
	//공지사항 삭제
	@RequestMapping("/admin/notice_delete")
	@ResponseBody
	public Map<String,Object> deleteNoticeList(
			@RequestParam(value="noList", required=false, defaultValue="0")List list) {
		System.out.println(list);
		service.deleteNoticeList(list);
		return new HashMap<String,Object>();
	}
	
	//이벤트
	//이벤트 상세보기
	@RequestMapping("/admin/eventDetail")
	public ModelAndView eventDetail(
			@RequestParam(value="idx",required=false,defaultValue="0")int eventNo) {
		ModelAndView mv=new ModelAndView();
		System.out.println("이벤트 디테일");
		System.out.println("eventNo:"+eventNo);
		List eventContent=service.selectEventContent(eventNo);
		mv.addObject("eventContent",eventContent);
		System.out.println(eventContent);
		mv.addObject("check",1);
		mv.setViewName("/admin/admin_event");
		return mv;
	}
	//이벤트쓰기
	@RequestMapping("/admin/event_add")
	public ModelAndView eventDetail() {
		ModelAndView mv=new ModelAndView();
		mv.addObject("check",2);
		mv.addObject("edit",1);
		mv.setViewName("/admin/admin_event");
		return mv;
	}
	//이벤트목록
	@RequestMapping("/admin/event")
	public ModelAndView eventList(
			@RequestParam(value="cPage",
			required=false, defaultValue="1") int cPage){
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		int contentCount=service.selectEventCount();
		List eventList=service.selectEventList(cPage, numPerPage);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/event"));
		mv.addObject("eventList",eventList);
		mv.addObject("check",0);
		//System.out.println(eventList);
		mv.setViewName("/admin/admin_event");
		
		
		return mv;
	}
	
	@RequestMapping("/admin/event_search")
	public ModelAndView searchEventList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="adminSelectEvent_input", required=false, defaultValue="1") String word) {
		System.out.println("들어오냐");
		int numPerPage=10;
		ModelAndView mv= new ModelAndView();
		System.out.println(word);
		int contentCount=service.selectSearchEventListCount(word);
		List searchEventList=service.selectSearchEventList(cPage, numPerPage, word);
		System.out.println(searchEventList);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/event_search?adminSelectEvent_input="+word+"&",word));
		mv.addObject("eventList",searchEventList);
		mv.setViewName("/admin/admin_event");
		mv.addObject("check",0);
		mv.addObject("searchWord",word);
		return mv;
	}
	//이벤트삭제
	@RequestMapping("/admin/event_delete")
	@ResponseBody
	public Map<String,Object> deletEventList(
			@RequestParam(value="noList",required=false,defaultValue="0")List list) {
		System.out.println(list);
		service.deleteEventList(list);
		return new HashMap<String,Object>();
	}
	//이벤트 등록
	@RequestMapping("/admin/event_registration")
	public String addEvent(		
			String eventTitle,
			String eventContent,
			MultipartFile eventFile,
			HttpServletRequest request ){
		System.out.println(eventTitle+eventContent);
		System.out.println(eventFile.getOriginalFilename());
		Map<String, String> event=new HashMap<>();
		eventContent=eventContent.replace("\n", "<br/>");
		System.out.println(eventContent);
		event.put("eventTitle", eventTitle);
		event.put("eventContent", eventContent);
		event.put("eventOriName", eventFile.getOriginalFilename());
		/*String savDir=request.getSession().getServletContext().getRealPath("/resources/upload/event");
		
		String orifileName=eventFile.getOriginalFilename();
		String ext=orifileName.substring(orifileName.lastIndexOf("."));
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rdv=(int)(Math.random()*1000);
		String stofileName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
		
		try {
			eventFile.transferTo(new File(savDir+"/"+stofileName));
		}catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}*/
		if (!eventFile.isEmpty()) {
			String rootDir = request.getSession().getServletContext().getRealPath("/");
			String saveDir = "resources/upload/event";
			String renamedFileName = fileUtil.getRenamedFileName(eventFile);
			fileUtil.saveFile(eventFile, rootDir, saveDir, renamedFileName);
			String saveAllDir = "/" + saveDir + "/" + renamedFileName;
			System.out.println("root"+rootDir);
			System.out.println("renamedFileName"+renamedFileName);
			System.out.println("saveAllDir"+saveAllDir);

			event.put("eventStoredName", saveAllDir);
			
		}
		int result=service.insertEvent(event);
		return "redirect:/admin/event";
	}
	//이벤트수정
	@RequestMapping("/admin/event_edit")
	@ResponseBody
	public ModelAndView editEvent(
			@RequestParam(value="idx", required=false, defaultValue="0")int eventNo){
		System.out.println(eventNo);
		ModelAndView mv=new ModelAndView();
		List eventContent=service.selectEventContent(eventNo);
		System.out.println(eventContent);
		mv.addObject("editEventContent",eventContent);
		mv.addObject("check",2);
		mv.addObject("edit",0);
		mv.setViewName("/admin/admin_event");
		return mv;
	} 
	@RequestMapping("/admin/event_update")
	public String updateEvent(		
			String eventTitle,
			String eventContent,
			int idx,
			MultipartFile eventFile,
			HttpServletRequest request ){
		System.out.println(eventTitle+eventContent+idx);
		System.out.println(eventFile.getOriginalFilename());
		Event e=new Event();
		e.setEventNo(idx);
		e.setEventTitle(eventTitle);
		e.setEventContent(eventContent);
		e.setEventOriName(eventFile.getOriginalFilename());
/*		Map<String, String> event=new HashMap<>();
*/		/*event.put("eventTitle", eventTitle);
		event.put("eventContent", eventContent);
		event.put("eventOriName", eventFile.getOriginalFilename());*/
	
		
		if (!eventFile.isEmpty()) {
			String rootDir = request.getSession().getServletContext().getRealPath("/");
			String saveDir = "resources/upload/event";
			String renamedFileName = fileUtil.getRenamedFileName(eventFile);
			fileUtil.saveFile(eventFile, rootDir, saveDir, renamedFileName);
			String saveAllDir = "/" + saveDir + "/" + renamedFileName;
			/*System.out.println("root"+rootDir);
			System.out.println("renamedFileName"+renamedFileName);
			System.out.println("saveAllDir"+saveAllDir);*/
/*			event.put("eventStoredName", saveAllDir);
*/
			e.setEventStoredName(saveAllDir);
			
		}
		System.out.println(e);
		int result=service.updateEvent(e);
		return "redirect:/admin/eventDetail?idx="+idx;
	}
	//리워드
	//리워드 진행목록
	@RequestMapping("/admin/rewardList")
	public ModelAndView rewardIndexList(
			@RequestParam(value="cPage",
			required=false, defaultValue="1") int cPage) {
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		int contentCount=service.selectRewardIndexCount();
		List rewardIndexList=service.selectRewardIndexList(cPage, numPerPage);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/rewardList"));
		mv.addObject("rewardIndexList",rewardIndexList);
		int check=0;
		mv.addObject("check",check);
		mv.addObject("sort1Check",0);
		mv.addObject("sort2Check",15);
		System.out.println(rewardIndexList);
		mv.addObject("pageNo",cPage);
		mv.setViewName("/admin/admin_reward_index");
		return mv;
	}
	//리워드 종료목록
	@RequestMapping("/admin/rewardStopList")	
	public ModelAndView rewardStopList(
			@RequestParam(value="cPage",
			required=false, defaultValue="1") int cPage) {
		ModelAndView mv=new ModelAndView();
		int numPerPage=10;
		int contentCount=service.selectRewardStopCount();
		List rewardStopList=service.selectRewardStopList(cPage, numPerPage);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/rewardStopList"));
		mv.addObject("rewardIndexList",rewardStopList);
		int check=1;
		mv.addObject("check",check);
		mv.setViewName("/admin/admin_reward_index");
		mv.addObject("sort2Check",15);
		System.out.println(rewardStopList);

		return mv;
	}
	//리워드 목록 종료
	@RequestMapping("/admin/reward_stop")
	@ResponseBody
	public Map<String, Object> stopRewardList(
			@RequestParam(value="noList", required=false, defaultValue="0")List list
			){
		System.out.println(list);
		int result= service.stopRewardList(list);
		return new HashMap<>();
	}
	@RequestMapping("/admin/reward_open")
	@ResponseBody
	public Map<String, Object> openRewardList(
			@RequestParam(value="noList", required=false, defaultValue="0")List list
			){
		System.out.println(list);
		int result= service.openRewardList(list);
		return new HashMap<>();
	}
	//리워드 목록 삭제
		@RequestMapping("/admin/reward_delete")
		@ResponseBody
		public Map<String, Object> deleteRewardList(
				@RequestParam(value="noList", required=false, defaultValue="0")List list
				){
			System.out.println(list);
			int result= service.deleteRewardList(list);
			return new HashMap<>();
		}
	//리워드 광고 목록
	@RequestMapping("/admin/rewardAdList")
	public ModelAndView rewardADList(
			@RequestParam(value="cPage",
			required=false, defaultValue="1") int cPage) {
		ModelAndView mv=new ModelAndView();
		int numPerPage=10;
		int contentCount=service.selectRewardAdCount();
		List rewardAdList=service.selectRewardAdList(cPage, numPerPage);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/rewardAdList"));
		mv.addObject("rewardAdList",rewardAdList);
		mv.addObject("pageNo",cPage);
		mv.setViewName("/admin/admin_reward_advertisement");
		System.out.println(rewardAdList);
			
		return mv;
	}
	//리워드 광고 추가
	@RequestMapping("/admin/rewardAd_add")
	@ResponseBody
	public Map<String,Object> addRewardAd(
			@RequestParam(value="rewardNo", required=false, defaultValue="0") int rewardNo,
			@RequestParam(value="startDate", required=false, defaultValue="0") String startDate,
			@RequestParam(value="endDate", required=false, defaultValue="0") String endDate){
		System.out.println(rewardNo+startDate+endDate);
		RewardAd ra=new RewardAd();
		ra.setRewardNo(rewardNo);
		ra.setStartDate(startDate);
		ra.setEndDate(endDate);
		int result=service.insertRewardAd(ra);
		return new HashMap<>();
	}
	//리워드 광고 삭제
	@RequestMapping("/admin/rewardAd_delete")
	@ResponseBody
	public Map<String, Object> deleteRewardAdList(
			@RequestParam(value="noList", required=false,defaultValue="0") List list){
		System.out.println(list);
		int result=service.deleteRewardAdList(list);
		return new HashMap<>();
	}
	//리워드 신청 목록
	@RequestMapping("/admin/rewardAppList")
	public ModelAndView rewardAppList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage) {
		ModelAndView mv=new ModelAndView();
		int numPerPage=10;
		int contentCount=service.selectRewardAppCount();
		List rewardAppList=service.selectRewardAppList(cPage,numPerPage);
		System.out.println(rewardAppList);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/rewardAppList"));
		mv.addObject("rewardAppList",rewardAppList);
		mv.addObject("check",0);
		mv.addObject("sort1Check",0);
		mv.addObject("sort2Check",15);
		mv.setViewName("/admin/admin_reward_application");
		return mv;
		
	}
	//리워드 오픈예정 목록
	@RequestMapping("/admin/rewardOpenSchedule")
	public ModelAndView rewardOpenScheduleList(
			@RequestParam(value="cPage",required=false,defaultValue="1") int cPage) {
		ModelAndView mv=new ModelAndView();
		int numPerPage=10;
		int contentCount=service.selectRewardOpenScheduleCount();
		List rewardOpenSchList=service.selectRewardOpenScheduleList(cPage, numPerPage);
		System.out.println(rewardOpenSchList);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/rewardOpenSchedule"));
		mv.addObject("rewardAppList",rewardOpenSchList);
		mv.addObject("check",1); 
		mv.addObject("sort1Check",0);
		mv.addObject("sort2Check",15);
		mv.setViewName("/admin/admin_reward_application");
		
		return mv;
		
	}
	
	//멤버
	//멤버리스트
	@RequestMapping("/admin/member")
	public ModelAndView memberList(
			@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		ModelAndView mv=new ModelAndView();
		int numPerPage=10;
		int contentCount=service.selectMemberCount();
		List memberList=service.selectMemberList(cPage,numPerPage);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/member"));
		mv.addObject("memberList",memberList);
		mv.addObject("pageNo",cPage);
		System.out.println(memberList);
		mv.addObject("sort1Check",1);
		mv.addObject("sort2Check",4);
		mv.setViewName("/admin/admin_member");
		return mv;
	}
	
	//멤버 탈퇴
	@RequestMapping("/admin/member_withdrawal")
	@ResponseBody
	public Map<String, Object> withdrawalMemberList(
			@RequestParam(value="noList", required=false, defaultValue="0") List list){
		System.out.println(list);
		int result=service.withdrawalMemberList(list);
		System.out.println("끝?");
		return new HashMap<>();
	}
	//멤버정지
	@RequestMapping("/admin/member_suspend")
	@ResponseBody
	public Map<String, Object> suspendMemberList(
			@RequestParam(value="noList", required=false, defaultValue="0") List list){
		System.out.println(list);
		int result=service.suspendMemberList(list);
		System.out.println("끝?");
		return new HashMap<>();
	}
	//정지취소
	@RequestMapping("/admin/member_suspendCancel")
	@ResponseBody
	public Map<String, Object> suspendCancelMemberList(
			@RequestParam(value="noList", required=false, defaultValue="0") List list){
		System.out.println(list);
		int result=service.suspendCancelMemberList(list);
		System.out.println("끝?");
		return new HashMap<>();
	}
	@RequestMapping("/admin/member_sort")
	public ModelAndView memberSort(
			@RequestParam(value="sort1", required=false, defaultValue="0")int sort1,
			@RequestParam(value="sort2", required=false, defaultValue="0")int sort2,
			@RequestParam(value="search", required=false, defaultValue="")String search,
			@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		System.out.println(sort1+""+sort2+search);
		MemberSort ms=new MemberSort();
		int numPerPage=10;
		ms.setSort1(sort1);
		ms.setSort2(sort2);
		ms.setSearch(search);
		int contentCount=service.selectMemberSortCount(ms);
		System.out.println(ms);
		List memberSortList=service.selectMemberSortList(cPage, numPerPage, ms);
		ModelAndView mv=new ModelAndView();
		if(sort1==1) {
			mv.addObject("sort1Check",1);
		}
		else if(sort1==2) {
			mv.addObject("sort1Check",2);
		}
		else if(sort1==3){
			mv.addObject("sort1Check",3);
		}
		if(sort2==4) {
			mv.addObject("sort2Check",4);
		}
		else if(sort2==5) {
			mv.addObject("sort2Check",5);
		}
		else if(sort2==6) {
			mv.addObject("sort2Check",6);
		}
		else if(sort2==7) {
			mv.addObject("sort2Check",7);
		}
		else if(sort2==8) {
			mv.addObject("sort2Check",8);
		}
		mv.addObject("memberList",memberSortList);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/member_sort?sort1="+sort1+"&sort2="+sort2+"&search="+search+"&", search));
		mv.addObject("pageNo",cPage);
		mv.addObject("searchWord",search);
		mv.setViewName("/admin/admin_member");
		return mv;
	}
	
	
	@RequestMapping("/admin/rewardPayList")
	public ModelAndView rewardPaymentList(
			@RequestParam(value="cPage", 
			required=false, defaultValue="1") int cPage){
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		int contentCount=service.selectRewardPayCount();
		List rewardPaymentList=service.selectRewardPayList(cPage, numPerPage); 
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/rewardPayList"));
		mv.addObject("rewardPaymentList", rewardPaymentList);
		System.out.println(rewardPaymentList);
		//mv.addObject("check",0);
		mv.addObject("sort1Check",0);
		mv.addObject("sort2Check",15);
		
		mv.setViewName("/admin/admin_reward_payment");
	
		return mv;
	}
	
}
