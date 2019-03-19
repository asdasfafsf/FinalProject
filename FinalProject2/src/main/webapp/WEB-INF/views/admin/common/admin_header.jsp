<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_header.css">

</head>
<body>
<header id="adminHeader">
        <div id="adminMenu">
            <ul class="adminMainMenu">
                <li><button id="adminMainBtn" onclick="location='${pageContext.request.contextPath }/admin'"></button></li>
                <li class="menuItems"><label for="noticeMenuBtn">NOTICE<input id="noticeMenuBtn" type="radio" name="menu">
                    <ul class="adminSubMenu" id="adminSubMenu1">
                        <li><a href="${pageContext.request.contextPath }/admin/notice">공지사항</a></li>
                        <li><a href="${pageContext.request.contextPath }/admin/event">이벤트</a></li>
                    </ul></label></li>
                <li class="menuItems"><label for="memberMenuBtn">MEMBER<input id="memberMenuBtn" type="radio" name="menu"></label></li>
                <li class="menuItems"><label for="rewardMenuBtn">REWARD<input id="rewardMenuBtn" type="radio" name="menu">
                    <ul class="adminSubMenu" id="adminSubMenu2">
                        <li><a href="${pageContext.request.contextPath }/admin/rewardList">리워드목록</a></li>
                        <li><a href="${pageContext.request.contextPath }/admin_reward_application">리워드신청</a></li>
                        <li><a href="${pageContext.request.contextPath }/admin_reward_advertisement">리워드광고</a></li>
                        <li><a href="#">리워드결제</a></li>
                        
                    </ul>
                </label></li>
                <li class="menuItems"><label for="reportMenuBtn">REPORT<input id="reportMenuBtn" type="radio" name="menu"></label></li>
                <li class="menuItems"><label for="adminMenuBtn">ADMIN<input id="adminMenuBtn" type="radio" name="menu"></label></li>
                <button id="adminMessageBtn"></button>
            </ul>
        </div>
        <div id="hearderTop">
            <button id="adminLogOut">Logout</button>
        </div>
    </header>
    <script>
    	$("#memberMenuBtn").click(function(){
    		location='${pageContext.request.contextPath }/admin_member';
    	});
    	$("#reportMenuBtn").click(function(){
    		location='${pageContext.request.contextPath }/admin_report';
    	});
    	$("#adminMenuBtn").click(function(){
    		location='${pageContext.request.contextPath }/admin_admin';
    	});
    </script>