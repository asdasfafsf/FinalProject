<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_enroll.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="/test/resources/js/user/user_enroll.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div class='user_full_screen_background_min'>
	<div class='user_full_screen'>
		<div class='user_contents_big'>
			<div class='enroll_container'>
				<img class='main_brand_story' src="${pageContext.request.contextPath}/resources/images/main/main_funding_story.jpg"/>
				<div class='enroll_menu'>
					<h2>Funding Story</h2>
					<h3>라이프스타일 투자 플랫폼</h3>
					<p class='story'>세상에 당신의 아이디어를 펼쳐 보세요</p>
					<div>
						<button class='submitBtn'>이메일로 회원가입</button>
						<div id="naver_id_login"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	var naver_id_login = new naver_id_login("tDmQ7T1QG8MxBJ32rVwy", "http://localhost:9090/test/user/naver.do");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 3 ,45);
	naver_id_login.setDomain("http://localhost:9090/test");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>
</body>
</html>