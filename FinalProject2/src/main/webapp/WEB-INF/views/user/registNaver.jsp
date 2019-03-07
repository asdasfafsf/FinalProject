<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
</head>
<body>
	<header></header>
	<nav></nav>
	<section>
		<div>
			<a></a>
		</div>
	</section>
	<footer></footer>
	
	<script>
		var naverLogin=new naver.LoginWithNaverId(
				{
					clientId:'tDmQ7T1QG8MxBJ32rVwy',
					callbackUrl:'http://${path}/',
					isPopup:false,
					loginButton:{color:'green', type:3, height:60}
				});
		naverLogin.init();
		window.addEventListener('load',function(){
			naverLogin.getLoginStatus(function(status){
				if(status){
					setLoginStatus();
				}
			});
		});
		
		function setLoginStatus(){
			var nickName=naverLogin.user.getNickName();
		}
	</script> 
</body>
</html>