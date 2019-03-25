package com.spring.test.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.test.common.util.PageFactory;
import com.spring.test.notice.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	NoticeService service;
	
	@RequestMapping("/noticeDetail")
	public ModelAndView noticeDetail(
			@RequestParam(value="idx",required=false,defaultValue="0")int noticeNo) {
		ModelAndView mv=new ModelAndView();
		System.out.println("공지사항 디테일");
		System.out.println("noticeNo:"+noticeNo);
		List noticeContent=service.selectNoticeContent(noticeNo);
		mv.addObject("noticeContent",noticeContent);
		System.out.println(noticeContent);
		mv.addObject("check",1);
		mv.setViewName("/notice");
		return mv;
	}
	@RequestMapping("/notice")
	public ModelAndView noticeList(
			@RequestParam(value="cPage", 
			required=false, defaultValue="1") int cPage){
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		int contentCount=service.selectNoticeCount();
		List noticeList=service.selectNoticeList(cPage,numPerPage); 
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/notice"));
		mv.addObject("noticeList", noticeList);
		System.out.println(noticeList);
		mv.addObject("check",0);
		mv.setViewName("/notice");
	
		return mv;
	}
	
	@RequestMapping("/notice_search")
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
			mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/notice_search?adminSelectNotice_input="+word+"&",word));
			mv.addObject("noticeList",searchNoticeList);
			//System.out.println(searchNoticeList);
			mv.setViewName("/notice");
		}
		else {
			System.out.println("word 널이다");
		}
		mv.addObject("check",0);
		mv.addObject("searchWord",word);
		return mv;
	}

}
