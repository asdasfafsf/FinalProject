package com.spring.test.message.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.test.message.model.service.MessageService;

@Controller
public class MessageController {
	
	@Autowired
	MessageService service;
	@Autowired
	private Logger logger=LoggerFactory.getLogger(MessageController.class);
	
	//메시지 불러오기
		//리스트 불러오기+이동
	@RequestMapping("/message")
	public String getMessageList(HttpServletRequest request)
	{
		int userNo=(Integer)request.getSession(false).getAttribute("userNo");
		
		List<Map> messageList=service.selectMessageList(userNo);
		request.setAttribute("messageList", messageList);
		
		return "user/messageList";
	}
		//메시지 로그 불러오기
	@RequestMapping("/message/log")
	public String getMessage(int userMessageNo,HttpServletRequest request)
	{
		int userNo=(Integer)request.getSession(false).getAttribute("userNo");
		
		Map messageRequest=new HashMap();
		messageRequest.put("USER_NO", userNo);
		messageRequest.put("USER_MESSAGE_NO", userMessageNo);
		
		List<Map> message = service.selectMessageLog(messageRequest);
		request.setAttribute("messageLog",message);
		
		return "message/message";
	}
	
	//메시지 전송하기
		//메시지 입력하기+메시지 다시 보이게 하기
	@RequestMapping("/message/send")
	public String sendMessage(int targetUserNo, String userMessageContent, HttpServletRequest request)
	{
		int userNo=(Integer)request.getSession(false).getAttribute("userNo");
		
		Map message=new HashMap();
		message.put("USER_NO", userNo);
		message.put("TARGET_USER_NO", targetUserNo);
		message.put("USER_MESSAGE_CONTENT", userMessageContent);
		
		String msg="";
		String loc="";
		
		int result=service.insertMessage(message);
		if(result>0)
		{
			msg="메시지 전송 성공";
			loc="redirect:/message/log";
		}
		else
		{
			msg="메시지 전송 실패";
			loc="message/message";
		}
		
		return loc;
	}
	//메시지 삭제하기
	@RequestMapping("/message/delete")
	public String hideMessage(int userMessageNo, HttpServletRequest request)
	{
		int userNo=(Integer)request.getSession(false).getAttribute("userNo");
		
		Map message = new HashMap();
		message.put("USER_NO", userNo);
		message.put("USER_MESSAGE_NO", userMessageNo);
		
		String msg="";
		int result=service.hideMessage(message);
		if(result>0)
		{
			msg="메시지를 삭제했습니다.";
		}
		else
		{
			msg="메시지 삭제 실패";
		}
		
		request.setAttribute("msg", msg);
		
		return "redirct:/message";
	}
}
