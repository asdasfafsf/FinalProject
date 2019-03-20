<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="/test/resources/js/user/mypage.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/userCommon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/mypage.css">
    <section>
        <div id='mypage-container'>
            <div id='myInfo-container'>
                <h1><span id='userName'>${userName }</span>님이 ${title }</h1>
            </div>
            <div id='funding-menu'>
                <div class='btn-fund-menu' id='join'>참여한 펀딩</div>
                <div class='btn-fund-menu' id='made'>만든 펀딩</div>
                <div class='btn-fund-menu' id='like'>관심 펀딩</div>
            </div>
            <div id="funding-filter">
                <label>
                    <small>분류</small>
                    <small>
                        <select id='order' name='order'>
                            <option selected>전체</option>
                        	<c:choose>
                        		<c:when test="${title eq '후원한 리워드'}">
		                            <option value='REWARD_DEADLINE'>진행중인 펀딩</option>
		                            <option value='REWARD_STATE_END'>종료된 펀딩</option>
                        		</c:when>
                        		<c:when test="${title eq '만든 리워드'}">
                        			<option value='REWARD_DEADLINE'>진행중인 펀딩</option>
		                            <option value='REWARD_STATE_END'>종료된 펀딩</option>
                        		</c:when>
                        		<c:when test="${title eq '좋아한 리워드'}">
                        			<option value='REWARD_DEADLINE'>진행중인 펀딩</option>
                        		</c:when>
                        		<c:otherwise>
                        			<option value='REWARD_DEADLINE'>진행중인 펀딩</option>
		                            <option value='REWARD_STATE_END'>종료된 펀딩</option>
                        		</c:otherwise>
                        	</c:choose>
                        </select>
                    </small>
                </label>
            </div>
            <div id='funding-container'>
				<c:forEach items='${myList }' var="list">
	                <div class='funding-min'>
						<img class = 'funding-fic' src="${path }/${list.REWARD_REPRESENT_IMAGE}"/>
						<p class = 'funding-state'>리워드 현재 상황 : 
						<c:choose>
							<c:when test="${list.REWARD_STATE eq 3}">오픈예정</c:when>
							<c:when test="${list.REWARD_STATE eq 4}">진행중</c:when>
							<c:when test="${list.REWARD_STATE eq 5}">성공</c:when>
							<c:when test="${list.REWARD_STATE eq 6}">실패</c:when>
							<c:when test="${list.REWARD_STATE eq 7}">종료</c:when>
						</c:choose>
						</p>
						<p class = 'funding-name'>리워드이름 : ${list.REWARD_NAME }</p>
						<p class = 'funding-mc-name'>진행자(메이커)이름 : ${list.REWARD_MC_NAME }</p>
	                </div>
				</c:forEach>
				<c:if test='${empty myList }'>
					<div id='nothingInHere'>
						<h3>${title }가 없습니다.</h3>
						<h5>FundingStroy에는 당신을 기다리는 매력적인 리워드들이 있습니다. <a href="${path }/main">당신의 리워드를 찾아보세요 !</a> </h5>
					</div>
				</c:if>
            </div>
        </div>
    </section>
    <footer></footer>
</body>
</html>