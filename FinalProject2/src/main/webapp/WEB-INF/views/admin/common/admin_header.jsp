<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_header.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common/chat.css">
	<script>
   // Context Path
   var ctx = '${pageContext.request.contextPath}';
   </script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/sockjs-client/sockjs.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/stomp/stomp.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/chat/adminChat.js"></script>
   
</head>
<body>
<header id="adminHeader">
        <div id="adminMenu">
            <ul class="adminMainMenu">
                <li><button id="adminMainBtn" onclick="location='${pageContext.request.contextPath }/admin/main'"></button></li>
                <li class="menuItems"><label for="noticeMenuBtn">NOTICE<input id="noticeMenuBtn" type="radio" name="menu">
                    <ul class="adminSubMenu" id="adminSubMenu1">
                        <li><a href="${pageContext.request.contextPath }/admin/notice">공지사항</a></li>
                        <li><a href="${pageContext.request.contextPath }/admin/event">이벤트</a></li>
                    </ul></label></li>
                <li class="menuItems"><label for="memberMenuBtn">MEMBER<input id="memberMenuBtn" type="radio" name="menu"></label></li>
                <li class="menuItems"><label for="rewardMenuBtn">REWARD<input id="rewardMenuBtn" type="radio" name="menu">
                    <ul class="adminSubMenu" id="adminSubMenu2">
                        <li><a href="${pageContext.request.contextPath }/admin/rewardList">리워드목록</a></li>
                        <li><a href="${pageContext.request.contextPath }/admin/rewardAppList">리워드신청</a></li>
                        <li><a href="${pageContext.request.contextPath }/admin/rewardAdList">리워드광고</a></li>
                        <li><a href="${pageContext.request.contextPath }/admin/rewardPayList">리워드결제</a></li>
                        
                    </ul>
                </label></li>
                <li class="menuItems"><label for="reportMenuBtn">REPORT<input id="reportMenuBtn" type="radio" name="menu"></label></li>
                <li class="menuItems"><label for="adminMenuBtn">ADMIN<input id="adminMenuBtn" type="radio" name="menu"></label></li>
             
            </ul>
        </div>
        <div id="hearderTop">
            <button id="adminLogOut">Logout</button>
        </div>
    </header>
    <button class="chat_button"></button>

	<div class="modal-chat is-admin" style="display:none;">
		<div class="title">고객센터 <button class="close"></button></div>
		<div class="chat-rooms">
			<ul id="chat-rooms"></ul>
		</div>
		<div class="chat-room-title" style="display:none;"><span class="chat-user"></span>님의 채팅방 <a href="javascript:returnRooms();">닫기</a></div>
		<div class="chat-room" style="display:none;">
			<ul id="chat-messages"></ul>
		</div>
		<div class="form" style="display:none;">
			<span class="attach"><button type="button" onclick="showFileUpload();"></button></span>
			<span class="text">
				<span>
					<input id="chat-message" type="text"/>
				</span>
			</span>
			<span class="send"><button type="button" onclick="sendMessage();"></button></span>
		</div>
		<form id="uploadForm" enctype="multipart/form-data" method="POST" action="${ctx}/chat/uploadChatFile">
			<input id="chatFile" name="chatFile" type="file" style="display:none;">
		</form>
	</div>
    
    <script>
    	$("#memberMenuBtn").click(function(){
    		location='${pageContext.request.contextPath }/admin/member';
    	});
    	$("#reportMenuBtn").click(function(){
    		location='${pageContext.request.contextPath }/admin/report';
    	});
    	$("#adminMenuBtn").click(function(){
    		location='${pageContext.request.contextPath }/admin/admin';
    	});
    </script>