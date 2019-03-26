<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="session" value="${sessionScope}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

   <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common/header.css">
   <link href="https://fonts.googleapis.com/css?family=Fjalla+One" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common/chat.css">
   <script>
   // Context Path
   var ctx = '${pageContext.request.contextPath}';
   </script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/sockjs-client/sockjs.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/stomp/stomp.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/chat/userChat.js"></script>
   
</head>
<body>
   <button class="slide_on_menu_button"></button>
       <div class="slide_menu_background">
         <div class="slide_menu_main">
            <div class="slide_menu_main_header">
               <img alt="" src="${pageContext.request.contextPath }/resources/images/common/header/location.png"/><label>pundingStory</label>
            </div>
            <div class="slide_menu_main_content" id="notice_menu_button"><img alt="" src="${pageContext.request.contextPath }/resources/images/common/header/menu_notice.png"/><label>공지사항</label></div>
            <div class="slide_menu_main_content" id="event_menu_button"><img alt="" src="${pageContext.request.contextPath }/resources/images/common/header/menu_event.png"/><label>이벤트</label></div>
            <div class="slide_menu_main_content" id="funding_story_menu_button"><img alt="" src="${pageContext.request.contextPath }/resources/images/common/header/menu_story.png"/><label>펀딩스토리</label></div>
            <div class="slide_menu_main_content" id="reward_list_menu_button"><img alt="" src="${pageContext.request.contextPath }/resources/images/common/header/menu_reward.png"/><label>리워드</label></div>
            <div class="slide_menu_main_content"><img alt="" src="${pageContext.request.contextPath }/resources/images/common/header/menu_write.png"/><label>펀딩신청</label></div>
         </div>
      </div>
   <header class="main_header_wrap">
         <div class="main_header">
            <div id="main_header_searchbar_wrap">
               <form action="${pageContext.request.contextPath }/searchRewardList" method="get" id="main_header_searchbar_form">
                   <button class="main_header_search"></button>
                  <input type="search" name="main_header_searchbar" placeholder="찾으시는 프로젝트가 있으신가요?"/>
               </form>
               <button id="main_header_search_close"></button>
            </div>
          <a href="${pageContext.request.contextPath }/mainPage"><div class="main_logo"></div></a>
            <div class="main_header_punding_menu_wrap">
               <label>펀딩오픈 신청하기</label>
           </div>
         
         
          <div class="main_header_user_menu_wrap">
            <ul>
               <c:if test='${userNo !=null}'><li onclick='location.href="${pageContext.request.contextPath }/logout"'>로그아웃</li></c:if>
               <c:if test='${empty userNo }'><li onclick='location.href="${pageContext.request.contextPath }/login"'>로그인</li>
               <li onclick='location.href="${pageContext.request.contextPath }/welcome"'>회원가입</li></c:if>
            </ul>
            <c:if test='${userNo !=null}'>
               <button class="main_header_alarm"></button>
                <button id="main_header_user_inform"></button>
            </c:if>
           <button class="main_header_search" id="main_header_search"></button>
          </div>
          </div>
   </header>
        
   <button class="move_top_button"></button>
   <c:if test="${session.userNo !=null}">
   <button class="chat_button"></button>
</c:if>
   
   <div class='header_menu_mypage_content'>
         <img alt="" src="${pageContext.request.contextPath }${loginUserProfilePhoto}">
         <label id="header_menu_mypage_userName">${loginUserName }</label></br>
         <button id="header_menu_mypage_message_button" onclick="alert('준비중입니다!');">메시지</button>
         <button id="header_menu_mypage_punding_button" >내펀딩</button>
         <button id="header_menu_mypage_interest_button">관심</button>
         <br><hr>
         <div id="header_menu_mypage_setting_button" ><label>설정</label></div>
         <div id="header_menu_mypage_logout_button" ><label>로그아웃</label></div>
   </div>   
<c:if test="${session.userNo !=null}">
   <input type="hidden" id="chatUserNo" value="${session.userNo}"/>
   <div class="modal-chat" style="display:none;">
      <div class="title">무엇이 궁금하신가요?<span> (실시간상담 10:00 ~ 18:00)</span> <button class="close"></button></div>
      <div class="chat-room">
         <ul id="chat-messages"></ul>
      </div>
      <div class="form">
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
</c:if>

<script>
   //시작시 스크롤500이상가면 맨위로가는버튼 생성, 클릭시 맨위로 가기
   $(document).ready(function(){
           $(window).scroll(function() {
               if ($(this).scrollTop() > 500) {
                   $('.move_top_button').fadeIn();
               } else {
                   $('.move_top_button').fadeOut();
               }
           }); 
           
           $(".move_top_button").click(function() {
               $('html, body').animate({
                   scrollTop : 0
               }, 400);
               return false;
           });
           
           $('#main_header_search_close').on('click',function(){
              $('#main_header_searchbar_wrap').fadeOut();
           });
           $('#main_header_search').on('click',function(){
              $('#main_header_searchbar_wrap').fadeIn();
           });

   });
   

   
   //중간쯤 메뉴버튼 클릭시 오른쪽으로 메뉴 펼쳐짐
   $(".slide_on_menu_button,.slide_menu_background").on('click',function(e){
      e.stopPropagation();
      
      if($('.slide_on_menu_button').css('left')=='0px'){
         $('.slide_on_menu_button').css('background','url("${pageContext.request.contextPath }/resources/images/common/header/menu_open2_close.png") no-repeat');
         $('.slide_on_menu_button').animate({left:'+=300px'},200);
         $('.slide_on_menu_button').css({'z-index':'1002'});
      }
      else{
         $('.slide_on_menu_button').css('background','url("${pageContext.request.contextPath }/resources/images/common/header/menu_open2.png") no-repeat');
         $('.slide_on_menu_button').animate({left:'-=300px'},400);
         $('.slide_on_menu_button').css({'z-index':'1000'});
      }
      
      $('.slide_menu_background').animate({
        width:"toggle"
      });
      
   });
   
   $('.slide_menu_main').on('click',function(e){
     e.stopPropagation(); 
   });
   
   //내정보관련 스크립트
   $('#main_header_user_inform').on('click',function(e){
      e.stopPropagation();
      
      $('.header_menu_mypage_content').animate({
         height:"toggle"
      },'slow');
   });
   
   $('#header_menu_mypage_userName').on('click',function(e){
      e.stopPropagation();
  
      location.href="${pageContext.request.contextPath }/userPage"
   });
   
   $('#header_menu_mypage_message_button').on('click',function(e){
     e.stopPropagation();
     
     console.log("메세지");
   });
   $('#header_menu_mypage_punding_button').on('click',function(e){
        e.stopPropagation();
        
        console.log("내펀딩");
        location.href="${pageContext.request.contextPath }/myreward/list/made"
   });
   $('#header_menu_mypage_interest_button').on('click',function(e){
       e.stopPropagation();
        
       location.href="${pageContext.request.contextPath }/userPage/like"
   });
   $('#header_menu_mypage_setting_button').on('click',function(e){
       e.stopPropagation();
        
       location.href="${pageContext.request.contextPath }/myprofile";
   });
   $('#header_menu_mypage_logout_button').on('click',function(e){
       e.stopPropagation();
       location.href="${pageContext.request.contextPath }/logout";
   });
   
   $('#notice_menu_button').on('click',function(){
	      location.href="${pageContext.request.contextPath }/notice"
	   });
	 $('#event_menu_button').on('click',function(){
	      location.href="${pageContext.request.contextPath }/event"
	   });
   $('#funding_story_menu_button').on('click',function(){
      location.href="${pageContext.request.contextPath }/fundingStory"
   });
   $('#reward_list_menu_button').on('click',function(){
      location.href="${pageContext.request.contextPath }/rewardpage"
   });

   $('.main_header_punding_menu_wrap').on('click', function(e){
        e.stopPropagation();
        location.href="${pageContext.request.contextPath}/project/reward/rewardopen"
   });
   
</script>

