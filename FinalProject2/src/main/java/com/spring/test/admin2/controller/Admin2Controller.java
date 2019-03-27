package com.spring.test.admin2.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.test.admin.model.service.AdminService;
import com.spring.test.admin2.model.service.Admin2Service;
import com.spring.test.admin2.model.vo.AdminUser;
import com.spring.test.admin2.model.vo.ReportNo;
import com.spring.test.admin2.model.vo.RewardSort;
import com.spring.test.common.util.PageFactory;
@Controller
public class Admin2Controller {
	@Autowired
	Admin2Service service;
	@Autowired
	AdminService service1;
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	@RequestMapping("/admin/main")
	public ModelAndView adminMain(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		/*List noticeList=service.selectMainNoticeList();
		List rewardList=service.selectMainRewardList();*/
		/*String email=(String)session.getAttribute("loginUserEmail");*/
		/*System.out.println(email);*/
		List list= new ArrayList();
		list.add("1");
		List reportList=service.selectReportList(1, 5, list);
		List noticeList=service1.selectNoticeList(1, 5);
		List rewardList=service1.selectRewardAppList(1, 5);
		mv.addObject("noticeList",noticeList);
		mv.addObject("rewardList",rewardList);
		mv.addObject("reportList",reportList);
		mv.setViewName("/admin/admin_main");
		
		return mv;
	}
	@RequestMapping("/admin/admin")
	public ModelAndView adminList(
			@RequestParam(value="cPage", required=false, defaultValue="1")int cPage, HttpSession session ) {
		ModelAndView mv=new ModelAndView();
		int numPerPage=10;
		int contentCount=service.selectAdminCount();
		List adminList=service.selectAdminList(cPage,numPerPage);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/admin"));
		mv.addObject("adminList",adminList);
		mv.setViewName("admin/admin_admin");
		int userNo=(int)session.getAttribute("userNo");
		if(userNo==-1) {
			mv.addObject("adminCheck",-1);
		}else {
			mv.addObject("adminCheck",1);
		}
		return mv;
	}
	
	@RequestMapping("/admin/admin_delete")
	@ResponseBody
	public Map<String, Object> deleteAdmin(
			@RequestParam(value="userNo", required=false, defaultValue="0")int userNo){
		int result=service.deleteAdmin(userNo);
		return new HashMap<>();
	}
	
	@RequestMapping("/admin/admin_registration")
	public String insertAdmin(
			String userName, String userEmail, String userPW) {
		System.out.println(userName+" "+userEmail+" "+userPW);
		AdminUser au=new AdminUser();
		userPW=pwEncoder.encode(userPW);
		au.setUserName(userName);
		au.setUserEmail(userEmail);
		au.setUserPW(userPW);
		int result=service.insertAdmin(au);
		return "redirect:/admin/admin";
	}
	
	
	@RequestMapping("/admin/admin_checkEmail")
	@ResponseBody
	public int checkId(
			@RequestParam (value="email", required=false, defaultValue="0") String email) {
		int result=service.checkId(email);
		return result;
	}
	
	@RequestMapping("/admin/admin_search")
	public ModelAndView searchAdminList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam(value="adminSelectAdmin_input", required=false,defaultValue="0" )String word){
		
		//String word=request.getParameter("adminSelectNotice_input");
		int numPerPage=10;
		System.out.println(",,ㅏ,ㅏ,ㅏ,  "+word);
		System.out.println("page"+cPage);
		ModelAndView mv=new ModelAndView();
		if(word!=null) {
			int contentCount=service.selectSearchAdminCount(word);
			List searchAdminList=service.selectSearchAdminList(cPage, numPerPage, word);
			mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/admin_search?adminSelectAdmin_input="+word+"&",word));
			mv.addObject("adminList",searchAdminList);
			System.out.println(searchAdminList);
			mv.setViewName("/admin/admin_admin");
		}
		else {
			System.out.println("word 널이다");
		}
		mv.addObject("check",0);
		mv.addObject("searchWord",word);
		return mv;
	}
	
	@RequestMapping("/admin/rewardContinue_sort")
	public ModelAndView sortRewardContinue(
			@RequestParam(value="sort1", required=false, defaultValue="0")int sort1,
			@RequestParam(value="sort2", required=false, defaultValue="0")int sort2,
			@RequestParam(value="search", required=false, defaultValue="")String search,
			@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		ModelAndView mv=new ModelAndView();
		int numPerPage=10;
		RewardSort rs=new RewardSort();
		rs.setSort1(sort1);
		rs.setSort2(sort2);
		rs.setSearch(search);
		int contentCount=service.selectRewardContinueSortCount(rs);
		System.out.println(sort1+""+sort2+search);
		List rewardContinueList=service.selectRewardContinueSortList(cPage,numPerPage,rs);
		if(sort1==0) {
			mv.addObject("sort1Check",0);
		}else if(sort1==1) {
			mv.addObject("sort1Check",1);
		}else if(sort1==2) {
			mv.addObject("sort1Check",2);
		}else if(sort1==3) {
			mv.addObject("sort1Check",3);
		}else if(sort1==4) {
			mv.addObject("sort1Check",4);
		}else if(sort1==5) {
			mv.addObject("sort1Check",5);
		}else if(sort1==6) {
			mv.addObject("sort1Check",6);
		}else if(sort1==7) {
			mv.addObject("sort1Check",7);
		}else if(sort1==8) {
			mv.addObject("sort1Check",8);
		}else if(sort1==9) {
			mv.addObject("sort1Check",9);
		}else if(sort1==10) {
			mv.addObject("sort1Check",10);
		}else if(sort1==11) {
			mv.addObject("sort1Check",11);
		}else if(sort1==12) {
			mv.addObject("sort1Check",12);
		}else if(sort1==13) {
			mv.addObject("sort1Check",13);
		}else if(sort1==14) {
			mv.addObject("sort1Check",14);
		}
		if(sort2==15) {
			mv.addObject("sort2Check",15);
		}else if(sort2==16) {
			mv.addObject("sort2Check",16);
		}else if(sort2==17) {
			mv.addObject("sort2Check",17);
		}
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/rewardContinue_sort?sort1="+sort1+"&sort2="+sort2+"&search="+search+"&",search));
		mv.addObject("rewardIndexList",rewardContinueList);
		mv.addObject("searchWord",search);
		int check=0;
		mv.addObject("check",check);
		mv.addObject("pageNo",cPage);
		mv.setViewName("/admin/admin_reward_index");
		return mv;
	}
	@RequestMapping("/admin/rewardStop_sort")
	public ModelAndView sortRewardContinue(
			@RequestParam(value="sort2", required=false, defaultValue="0")int sort2,
			@RequestParam(value="search", required=false, defaultValue="")String search,
			@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		System.out.println(sort2+search);
		ModelAndView mv=new ModelAndView();
		if(sort2==15) {
			mv.addObject("sort2Check",15);
		}else if(sort2==16) {
			mv.addObject("sort2Check",16);
		}else if(sort2==17) {
			mv.addObject("sort2Check",17);
		}
		int numPerPage=10;
		RewardSort rs=new RewardSort();
		rs.setSort2(sort2);
		rs.setSearch(search);
		int contentCount=service.selectRewardStopSortCount(rs);
		List rewardStopList=service.selectRewardStopSortList(cPage,numPerPage,rs);
		System.out.println(rewardStopList);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/rewardStop_sort?sort2="+sort2+"&search="+search+"&",search));
		mv.addObject("rewardIndexList",rewardStopList);
		mv.addObject("searchWord",search);
		int check=1;
		mv.addObject("check",check);
		mv.addObject("pageNo",cPage);
		mv.setViewName("/admin/admin_reward_index");
		return mv;
	}
	@RequestMapping("/admin/rewardApp_sort")
	public ModelAndView sortRewardApp(
			@RequestParam(value="sort1", required=false, defaultValue="0")int sort1,
			@RequestParam(value="sort2", required=false, defaultValue="0")int sort2,
			@RequestParam(value="search", required=false, defaultValue="")String search,
			@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		ModelAndView mv=new ModelAndView();
		int numPerPage=10;
		RewardSort rs=new RewardSort();
		rs.setState(2);
		rs.setSort1(sort1);
		rs.setSort2(sort2);
		rs.setSearch(search);
		int contentCount=service.selectRewardAppSortCount(rs);
		System.out.println(sort1+""+sort2+search);
		List rewardAppList=service.selectRewardAppSortList(cPage,numPerPage,rs);
		System.out.println(rewardAppList);
		if(sort1==0) {
			mv.addObject("sort1Check",0);
		}else if(sort1==1) {
			mv.addObject("sort1Check",1);
		}else if(sort1==2) {
			mv.addObject("sort1Check",2);
		}else if(sort1==3) {
			mv.addObject("sort1Check",3);
		}else if(sort1==4) {
			mv.addObject("sort1Check",4);
		}else if(sort1==5) {
			mv.addObject("sort1Check",5);
		}else if(sort1==6) {
			mv.addObject("sort1Check",6);
		}else if(sort1==7) {
			mv.addObject("sort1Check",7);
		}else if(sort1==8) {
			mv.addObject("sort1Check",8);
		}else if(sort1==9) {
			mv.addObject("sort1Check",9);
		}else if(sort1==10) {
			mv.addObject("sort1Check",10);
		}else if(sort1==11) {
			mv.addObject("sort1Check",11);
		}else if(sort1==12) {
			mv.addObject("sort1Check",12);
		}else if(sort1==13) {
			mv.addObject("sort1Check",13);
		}else if(sort1==14) {
			mv.addObject("sort1Check",14);
		}
		if(sort2==15) {
			mv.addObject("sort2Check",15);
		}else if(sort2==16) {
			mv.addObject("sort2Check",16);
		}else if(sort2==17) {
			mv.addObject("sort2Check",17);
		}
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/rewardApp_sort?sort1="+sort1+"&sort2="+sort2+"&search="+search+"&",search));
		mv.addObject("rewardAppList",rewardAppList);
		mv.addObject("searchWord",search);
		int check=0;
		mv.addObject("check",check);
		mv.addObject("pageNo",cPage);
		mv.setViewName("/admin/admin_reward_application");
		return mv;
	}
	
	@RequestMapping("/admin/rewardOpen_sort")
	public ModelAndView sortRewardOpen(
			@RequestParam(value="sort1", required=false, defaultValue="0")int sort1,
			@RequestParam(value="sort2", required=false, defaultValue="0")int sort2,
			@RequestParam(value="search", required=false, defaultValue="")String search,
			@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		ModelAndView mv=new ModelAndView();
		int numPerPage=10;
		RewardSort rs=new RewardSort();
		rs.setState(3);
		rs.setSort1(sort1);
		rs.setSort2(sort2);
		rs.setSearch(search);
		int contentCount=service.selectRewardAppSortCount(rs);
		System.out.println(sort1+""+sort2+search);
		List rewardAppList=service.selectRewardAppSortList(cPage,numPerPage,rs);
		System.out.println(rewardAppList);
		if(sort1==0) {
			mv.addObject("sort1Check",0);
		}else if(sort1==1) {
			mv.addObject("sort1Check",1);
		}else if(sort1==2) {
			mv.addObject("sort1Check",2);
		}else if(sort1==3) {
			mv.addObject("sort1Check",3);
		}else if(sort1==4) {
			mv.addObject("sort1Check",4);
		}else if(sort1==5) {
			mv.addObject("sort1Check",5);
		}else if(sort1==6) {
			mv.addObject("sort1Check",6);
		}else if(sort1==7) {
			mv.addObject("sort1Check",7);
		}else if(sort1==8) {
			mv.addObject("sort1Check",8);
		}else if(sort1==9) {
			mv.addObject("sort1Check",9);
		}else if(sort1==10) {
			mv.addObject("sort1Check",10);
		}else if(sort1==11) {
			mv.addObject("sort1Check",11);
		}else if(sort1==12) {
			mv.addObject("sort1Check",12);
		}else if(sort1==13) {
			mv.addObject("sort1Check",13);
		}else if(sort1==14) {
			mv.addObject("sort1Check",14);
		}
		if(sort2==15) {
			mv.addObject("sort2Check",15);
		}else if(sort2==16) {
			mv.addObject("sort2Check",16);
		}else if(sort2==17) {
			mv.addObject("sort2Check",17);
		}
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/rewardOpen_sort?sort1="+sort1+"&sort2="+sort2+"&search="+search+"&",search));
		mv.addObject("rewardAppList",rewardAppList);
		mv.addObject("searchWord",search);
		int check=1;
		mv.addObject("check",check);
		mv.addObject("pageNo",cPage);
		mv.setViewName("/admin/admin_reward_application");
		return mv;
	}
	
	@RequestMapping("/admin/report")
	public ModelAndView adminReport(
			@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		int numPerPage=10;
		List list= new ArrayList();
		list.add("1");
		System.out.println(list);
		int contentCount=service.selectReportCount(list);
		List reportList=service.selectReportList(cPage, numPerPage, list);
		ModelAndView mv=new ModelAndView();
		mv.addObject("check",0);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/report"));
		mv.addObject("reportList",reportList);
		System.out.println(reportList);
		mv.setViewName("/admin/admin_report");
		mv.addObject("check",0);
		mv.addObject("status",0);

		return mv;
	}
	
	@RequestMapping("/admin/report_complete")
	public ModelAndView adminReport_complete(
			@RequestParam(value="cPage", required=false, defaultValue="1")int cPage) {
		int numPerPage=10;
		List list= new ArrayList();
		list.add("2");
		list.add("3");
		System.out.println(list);
		int contentCount=service.selectReportCount(list);
		List reportList=service.selectReportList(cPage, numPerPage, list);
		ModelAndView mv=new ModelAndView();
		mv.addObject("check",1);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/admin/report_complete"));
		mv.addObject("reportList",reportList);
		System.out.println(reportList);
		mv.addObject("check",0);
		mv.addObject("status",1);
		mv.setViewName("/admin/admin_report");
		return mv;
	}
	@RequestMapping("/admin/reportDetail")
	public ModelAndView reportDetail(
			@RequestParam(value="idx",required=false,defaultValue="0")int reportNo) {
		ModelAndView mv=new ModelAndView();
		//System.out.println("신고 디테일");
		//System.out.println("reportNo:"+reportNo);
		List reportContent=service.selectReportContent(reportNo);
		mv.addObject("reportList",reportContent);
		
		//System.out.println(reportContent);
		mv.addObject("check",1);
		mv.setViewName("/admin/admin_report");
		return mv;
	}
	@RequestMapping("/admin/report_ignore")
	public String ignoreReport(
			@RequestParam(value="idx", required=false, defaultValue="0") int reportNo) {
		System.out.println(reportNo);
		int result=service.ignoreReport(reportNo);
		return "redirect:/admin/report_complete";
	}
	@RequestMapping("/admin/report_delete")
	public String deleteReport(
			@RequestParam(value="idx", required=false, defaultValue="0") int reportNo) {
		System.out.println(reportNo);
		int result=service.deleteReport(reportNo);
		return "redirect:/admin/report_complete";
	}
	
	@RequestMapping("/admin/report_confirm")
	public String confirmReport(
			@RequestParam(value="idx", required=false, defaultValue="0") int reportNo) {
		System.out.println(reportNo);
		ReportNo r=new ReportNo();
		r.setReportNo(reportNo);
		int result=service.confirmReport(r);
		return "redirect:/admin/report_complete";
	}
}
