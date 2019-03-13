<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userCommon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/mypage.css">
    <section>
        <div id='mypage-container'>
            <div id='myInfo-container'>
                <h1>id</h1>
            </div>
            <div id='funding-menu'>
                <div class='btn-fund-menu' id='made'>내가 만든 펀딩</div>
                <div class='btn-fund-menu' id='join'>참여한 펀딩</div>
            </div>
            <div id="funding-filter">
                <label>
                    <small>분류</small>
                    <small>
                        <select id='filter'>
                            <option value='all' selected>전체</option>
                            <option value='continue'>진행중인 펀딩</option>
                            <option value='finished'>종료된 펀딩</option>
                        </select>
                    </small>
                </label>
            </div>
            <div id='funding-container'>
                <div class='funding-min'></div>
                <div class='funding-min'></div>
                <div class='funding-min'></div>
                <div class='funding-min'></div>
            </div>
        </div>
    </section>
    <footer></footer>
</body>
</html>