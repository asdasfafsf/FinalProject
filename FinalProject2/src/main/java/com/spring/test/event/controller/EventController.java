package com.spring.test.event.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.test.common.util.PageFactory;
import com.spring.test.event.service.EventService;
@Controller
public class EventController {
	@Autowired
	EventService service;
	@RequestMapping("/eventDetail")
	public ModelAndView eventDetail(
			@RequestParam(value="idx",required=false,defaultValue="0")int eventNo) {
		ModelAndView mv=new ModelAndView();
		System.out.println("이벤트 디테일");
		System.out.println("eventNo:"+eventNo);
		List eventContent=service.selectEventContent(eventNo);
		mv.addObject("eventContent",eventContent);
		System.out.println(eventContent);
		mv.addObject("check",1);
		mv.setViewName("/event");
		return mv;
	}
	
	//이벤트목록
	@RequestMapping("/event")
	public ModelAndView eventList(
			@RequestParam(value="cPage",
			required=false, defaultValue="1") int cPage){
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		int contentCount=service.selectEventCount();
		List eventList=service.selectEventList(cPage, numPerPage);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/event"));
		mv.addObject("eventList",eventList);
		mv.addObject("check",0);
		//System.out.println(eventList);
		mv.setViewName("/event");
		
		
		return mv;
	}
	
	@RequestMapping("/event_search")
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
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/test/event_search?adminSelectEvent_input="+word+"&",word));
		mv.addObject("eventList",searchEventList);
		mv.setViewName("/admin/admin_event");
		mv.addObject("check",0);
		mv.addObject("searchWord",word);
		return mv;
	}
}
