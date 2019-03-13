<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userCommon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/terms.css">
<header>[왼쪽 끝에 로고] 약관이니까 메뉴 바꿀게요 </header>
	<section>
        <nav>
            <label><small>이용약관</small></label>
            <div><a href="#go-req">서비스 이용약관</a></div>
            <div><a href="#go-pri">개인정보 이용약관</a></div>
        </nav>
        <div id='terms-container'>

            <h2>이용약관</h2>

            <h4 id='go-req'>너나들이 이용약관</h4>
            <div id='terms-required'>
                <p>
                    너나들이 이용 약관 어쩌고 다 써놔야 하는데 어디꺼 가지고 올까.....
                </p>
            </div>

            <br/>

            <h4 id='go-pri'>개인정보 이용 약관</h4>
            <div id='terms-privacy'>
                <p>
                    개인정보 이용 약관
                </p>
            </div>
        </div>
	</section>
    <footer></footer>
</body>
</html>