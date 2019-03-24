package com.spring.test.chat.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.test.chat.dto.ChatMsg;
import com.spring.test.chat.dto.ChatReqMsg;
import com.spring.test.chat.dto.ChatResMsg;
import com.spring.test.chat.dto.ChatRoom;
import com.spring.test.chat.service.ChatService;
import com.spring.test.common.util.FileUtil;


@Controller
@RequestMapping("/chat/*")
public class ChatController {
	
	@Autowired
	private SimpMessagingTemplate messagingTemplate;
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	FileUtil fileUtil;
	
	/**
	 * 고객의 채팅방 정보 조회 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/getChatRoom")
	@ResponseBody
	public Integer getChatRoonNo( HttpServletRequest request ) {
		int userNo = (Integer)request.getSession(false).getAttribute("userNo");
		return chatService.getChatRoomNo( userNo );
	}
	
	/**
	 * 관리자의 채팅방 목록 조회 
	 * @return
	 */
	@RequestMapping(value = "/listChatRooms")
	@ResponseBody
	public List<ChatRoom> listChatRooms() {
		return chatService.getChatRooms();
	}
	
	/**
	 * 최근 채팅 목록 조회 
	 * @param request
	 * @param roomNo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/listChatMsgs")
	@ResponseBody
	public List<ChatMsg> listChatMsgs(HttpServletRequest request,
			@RequestParam(value = "roomNo", required = true) Integer roomNo ) throws Exception {
		boolean isAdmin = false;
		if( request.getSession(false).getAttribute("userNo") == null )
			isAdmin = true;
		List<ChatMsg> msgs = chatService.getChatMessages( roomNo );
		// 읽지않은 메시지 업데이트
		chatService.updateChatMessagesRead( roomNo, isAdmin );
		return msgs;
	}
	
	/**
	 * 채팅방에 첨부할 첨부파일 업로드 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uploadChatFile")
	@ResponseBody
	public Map<String,Object> uploadChatFile(MultipartHttpServletRequest request) throws Exception {
		Map<String,Object> result = new HashMap<String,Object>();
		result.put( "result", false );
		Iterator<String> itr =  request.getFileNames();
		if( itr.hasNext() ) {
			MultipartFile multipartFile = request.getFile( itr.next() );
			if( multipartFile != null ) {
				String rootDir = request.getSession().getServletContext().getRealPath("/");
				String saveDir = "resources/upload/chat";
				String renamedFileName = fileUtil.getRenamedFileName(multipartFile);
				fileUtil.saveFile(multipartFile, rootDir, saveDir, renamedFileName);
				String saveAllDir = "/" + saveDir + "/" + renamedFileName;
				result.put( "result", true );
				result.put( "filePath", saveAllDir );
				return result;
			}
		}
		return result;
	}
	
	/**
	 * WebSocket 메시지 수신
	 * @param roomNo
	 * @param reqMsg
	 * @param messageHeaderAccessor
	 */
	@MessageMapping("/send/message/{roomNo}")
	public void onReceiveMessage( @DestinationVariable Integer roomNo, ChatReqMsg reqMsg, SimpMessageHeaderAccessor messageHeaderAccessor ) {
		ChatMsg chatMsg = chatService.addChatMessage( roomNo, reqMsg );
		messagingTemplate.convertAndSend( "/chat/" + roomNo, new ChatResMsg( chatMsg ) );
	}
	


}
