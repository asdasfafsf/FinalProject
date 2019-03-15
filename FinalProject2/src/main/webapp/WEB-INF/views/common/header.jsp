<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

   <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common/header.css">
   

</head>
<body>
	<button class="slide_on_menu_button"></button>
      <div class="slide_menu_background">
      	<div class="slide_menu_main">
      		<div class="slide_menu_main_header">
      			<label>MENU</label>
      		</div>
      		<div class="slide_menu_main_content"><label>공지사항</label></div>
      		<div class="slide_menu_main_content"><label>이벤트</label></div>
      		<div class="slide_menu_main_content"><label>펀딩스토리</label></div>
      		<div class="slide_menu_main_content"><label>리워드</label></div>
      		<div class="slide_menu_main_content"><label>펀딩신청</label></div>
      		<div class="slide_menu_main_content" id="user_session_button"><label>유저</label></div>
      		<div class="slide_menu_main_content" id="admin_session_button"><label>관리자</label></div>
      	</div>
      </div>
   <header class="main_header_wrap">
   		<div class="main_header">
	       <a href="${pageContext.request.contextPath }/mainPage"><div class="main_logo"></div></a>
	   		<div class="main_header_punding_menu_wrap">
	            <label>펀딩오픈 신청하기</label>
	        </div>
	      
	      
	       <div class="main_header_user_menu_wrap">
	         <ul>
	         	<li onclick='location.href="${pageContext.request.contextPath }/logout"'>로그아웃</li>
	            <li onclick='location.href="${pageContext.request.contextPath }/login"'>로그인</li>
	            <li onclick='location.href="${pageContext.request.contextPath }/welcome"'>회원가입</li>
	         </ul>
	       <button class="main_header_alarm"></button>
	       <button id="main_header_user_inform"></button>
	       <button class="main_header_search"></button>
	         
	       </div>
   	    </div>
   </header>
   	  
   <button class="move_top_button"></button>
   
   <div class='header_menu_mypage_content'>
   		<img alt="" src="${pageContext.request.contextPath }/resources/images/common/header/no_profile.png">
   		<label>임태완</label></br>
   		<button id="header_menu_mypage_message_button" onclick="alert('준비중입니다!');">메시지</button>
   		<button id="header_menu_mypage_punding_button" >내펀딩</button>
   		<button id="header_menu_mypage_interest_button">관심</button>
   		<br><hr>
   		<div id="header_menu_mypage_setting_button" ><label>설정</label></div>
   		<div id="header_menu_mypage_logout_button" ><label>로그아웃</label></div>
   </div>	


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

	});
	

   
	//중간쯤 메뉴버튼 클릭시 오른쪽으로 메뉴 펼쳐짐
   $(".slide_on_menu_button,.slide_menu_background").on('click',function(e){
	   e.stopPropagation();

	   if($('.slide_on_menu_button').css('left')=='0px'){
		   $('.slide_on_menu_button').animate({left:'+=372px'},300);
		   $('.slide_on_menu_button').css({'z-index':'1002'});
	   }
	   else{
		   $('.slide_on_menu_button').animate({left:'-=372px'},300);
		   $('.slide_on_menu_button').css({'z-index':'1000'});
	   }
	   
	   $('.slide_menu_background').animate({
		  width:"toggle"
	   },'slow');
	   
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
  
   $('#header_menu_mypage_message_button').on('click',function(e){
	  e.stopPropagation();
	  
	  console.log("메세지");
   });
   $('#header_menu_mypage_punding_button').on('click',function(e){
		  e.stopPropagation();
		  
		  console.log("내펀딩");
		  location.href="${pageContext.request.contextPath }/userPage"
	});
   $('#header_menu_mypage_interest_button').on('click',function(e){
		 e.stopPropagation();
		  
		 console.log("관심");
		 location.href="${pageContext.request.contextPath }/userPage"
	});
   $('#header_menu_mypage_setting_button').on('click',function(e){
		 e.stopPropagation();
		  
		 console.log("설정");
		 location.href="${pageContext.request.contextPath }/myprofile";
	});
   $('#header_menu_mypage_logout_button').on('click',function(e){
		 e.stopPropagation();
		 console.log("로그아웃");
		 location.href="${pageContext.request.contextPath }/logout";
	});
   
   $('.main_header_punding_menu_wrap').on('click', function(e){
	  	e.stopPropagation();
	  	location.href="${pageContext.request.contextPath}/project/reward/rewardopen"
   });
   
</script>


