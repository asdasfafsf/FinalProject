<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="/test/resources/js/user/regist.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userCommon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/regist.css">
	<section>
        <div id='regist-container'>
            <h2>회원가입</h2>
            <div id='logo-container'>너나들이 로고</div>
            <div id='registBtn-container'>
                <div id="naver_id_login"></div>
                <div id='kakaoRegist' class='registBtn'>카카오로 가입</div>
                <small>또는</small>
                <div id='emailRegist' class='registBtn' onclick='goEmailRegist();'><a href='${path}/regist/basic'>이메일로 가입</a></div>
            </div>
            <div>
                <small>이미 계정이 있으시다면 <a href='${path }/login'>로그인</a></small>
            </div>
        </div>
        <input type='hidden' id='email2'/>
       	<input type='hidden' id='id2'/>
    </section>
    <footer></footer>
    
    <script>
    var naver_id_login = new naver_id_login("tDmQ7T1QG8MxBJ32rVwy", "http://localhost:9090/test/naverCallback");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 3,40);
	naver_id_login.setDomain("http://localhost:9090/test");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
    </script>
</body>
</html>