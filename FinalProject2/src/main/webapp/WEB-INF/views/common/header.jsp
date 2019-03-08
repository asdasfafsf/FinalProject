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
      			<label>로그인이 필요합니다</label>
      		</div>
      		<div class="slide_menu_main_content"><label>공지사항</label></div>
      		<div class="slide_menu_main_content"><label>이벤트</label></div>
      		<div class="slide_menu_main_content"><label>리워드</label></div>
      		<div class="slide_menu_main_content"><label>리워드</label></div>
      		<div class="slide_menu_main_content"><label>리워드</label></div>
      		<div class="slide_menu_main_content" id="user_session_button"><label>유저</label></div>
      		<div class="slide_menu_main_content" id="admin_session_button"><label>관리자</label></div>
      	</div>
      </div>
   <header class="main_header">
      <div class="main_logo"></div>
      <div>
         <ul>
            <li>투자</li>
            <li>리워드</li>
            <li>캐스트</li>
            <li>커넥터</li>
         </ul>
      </div>
      <div>
         <button class="header_search"></button>
         <form action="" method="post">
            <input type="text">
         </form>
      </div>
      <div>
         <ul>
            <li>로그인</li>
            <li>회원가입</li>
            <li>내정보</li>
         </ul>
         <div>
            <label>펀딩오픈 신청하기</label>
         </div>
      </div>
   </header>
   	  
   <button class="move_top_button"></button>
   
   <div class='header_menu_mypage_content'>
   		<img alt="" src="${pageContext.request.contextPath }/resources/images/common/header/no_profile.png">
   		<label>임태완</label></br>
   		<button id="header_menu_mypage_message_button">메시지</button>
   		<button id="header_menu_mypage_punding_button">내펀딩</button>
   		<button id="header_menu_mypage_interest_button">관심</button>
   		<br><hr>
   		<div id="header_menu_mypage_setting_button"><label>설정</label></div>
   		<div id="header_menu_mypage_logout_button"><label>로그아웃</label></div>
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
	
	//검색이미지 클릭시 검색창 나오게하기
   $('.header_search').on('click',function(e){
	   e.stopPropagation();
	   
      $('body>header>div:nth-child(3)>form').animate({
         width:"toggle"
      },'slow');
   });
   
	//중간쯤 메뉴버튼 클릭시 오른쪽으로 메뉴 펼쳐짐
   $(".slide_on_menu_button,.slide_menu_background").on('click',function(e){
	   e.stopPropagation();

	   if($('.slide_on_menu_button').css('left')=='0px'){
		   $('.slide_on_menu_button').css({'left':'372px','z-index':'1002'});
	   }
	   else{
		   $('.slide_on_menu_button').css({'left':'0px','z-index':'1000'});
	   }
	   
	   $('.slide_menu_background').animate({
		  width:"toggle"
	   },'slow');
	   
   });
   
   $('.slide_menu_main').on('click',function(e){
	  e.stopPropagation(); 
   });
   
   //내정보관련 스크립트
   $('body>header>div:nth-child(4)>ul>li:nth-child(3)').on('click',function(e){
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
	});
   $('#header_menu_mypage_interest_button').on('click',function(e){
		 e.stopPropagation();
		  
		 console.log("관심");
	});
   $('#header_menu_mypage_setting_button').on('click',function(e){
		 e.stopPropagation();
		  
		 console.log("설정");
	});
   $('#header_menu_mypage_logout_button').on('click',function(e){
		 e.stopPropagation();
		  
		 console.log("로그아웃");
	});
   
</script>


