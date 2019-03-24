<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="/test/resources/js/user/naver_callback.js"></script>
<style type="text/css">
	#background-full{
		width : 100%;
		height : 100%;
		text-align : center;
		padding : auto;
		padding-top : 100px;
	}
</style>
</head>
<body>
<div id = 'background-full'>
	<img src="${path }/resources/images/user/waiting.gif" width="200px" height='200px'/>
	<p>로그인 중입니다. 잠시만 기다려 주세요.</p>
</div>
</body>
</html>