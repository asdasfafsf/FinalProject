<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_funding_list.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reward_list.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/test/resources/js/user/user_funding_list.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div class='user_full_screen_background'>
	<div class='user_full_screen'>
		<div class='user_contents_big'>
			<c:if test="${empty emptyUser }">
				<div id='mypage-container'>
		            <div id='myInfo-container'>
		                <h1><span id='userName'>${userName }</span>님이 ${title }</h1>
		            </div>
		            <div class='sub-menu'>
		                <div class='btn-for-menu' id='join'>참여한 펀딩</div>
		                <div class='btn-for-menu' id='made'>만든 펀딩</div>
		                <div class='btn-for-menu' id='like'>관심 펀딩</div>
		            </div>
		            <div id="funding-filter">
		                <label>
		                    <small>분류</small>
		                    <small>
		                    	<form id='filterFrm'>
			                        <select id='filter' name='filter'>
			                            <option value='0' ${filter == '0' ? 'selected' : '' }>전체</option>
			                        	<c:choose>
			                        		<c:when test="${title eq '후원한 리워드'}">
					                            <option value='1' ${filter == '1' ? 'selected' : '' } >진행중인 펀딩</option>
					                            <option value='2' ${filter == '2' ? 'selected' : '' } >종료된 펀딩</option>
			                        		</c:when>
			                        		<c:when test="${title eq '만든 리워드'}">
			                        			<option value='1' ${filter == '1' ? 'selected' : '' } >진행중인 펀딩</option>
					                            <option value='2' ${filter == '2' ? 'selected' : '' } >종료된 펀딩</option>
			                        		</c:when>
			                        		<c:when test="${title eq '좋아한 리워드'}">
			                        			<option value='1' ${filter == '1' ? 'selected' : '' } >진행중인 펀딩</option>
			                        		</c:when>
			                        		<c:otherwise>
			                        			<option value='1' ${filter == '1' ? 'selected' : '' } >진행중인 펀딩</option>
					                            <option value='2' ${filter == '2' ? 'selected' : '' } >종료된 펀딩</option>
			                        		</c:otherwise>
			                        	</c:choose>
			                        </select>
		                    	</form>
		                    </small>
		                </label>
		            </div>
		            <div id='funding-container'>
		           		<div class="reward_category_content">
				            <c:forEach var="l" items="${myList}">
								<div class="reward_category_content_item" id="${l.REWARD_NO}" onclick="clickReward(this);">
									<img src="${pageContext.request.contextPath}${l.REWARD_REPRESENT_IMAGE}"/>
									<div class="reward_category_content_item_inform1">
										<h3 class="category_item_punding_title">${l.REWARD_SHORT_NAME }</h3>
										<h5 class="category_item_category_name">${l.REWARD_CATEGORY_NAME }</h5>
										<h5>|</h5>
										<h5 class="category_item_company_name">${l.REWARD_MC_NAME }</h5>
									</div>
									<div class="reward_category_persentBar_background">
										<div class="reward_category_persentBar" style="width:${l.REWARD_ACHIEVEMENT_PERSENT*3 }px"></div>
									</div>
									<div class="reward_category_content_item_inform2">
										<h3 class="category_item_punding_achievement_quotient"> ${l.REWARD_ACHIEVEMENT_PERSENT }%</h3>
										<h4 class="category_item_punding_sum"><fmt:formatNumber type="number"> ${l.REWARD_PRESENT_COLLECTION }</fmt:formatNumber>원</h4>
										<h4 class="category_item_punding_remain_date">${l.REWARD_REMAIN_DATE }일 남음</h4>
									</div>
								</div>
							</c:forEach>
						<c:if test='${empty myList || myList.size()<=0}'>
							<div id='nothingInHere'>
								<h3>${title }가 없습니다.</h3>
								<c:if test='${!empty userNo }'>
									<h5>FundingStroy에는 당신을 기다리는 매력적인 리워드들이 있습니다. <a href="${path }/main">당신의 리워드를 찾아보세요 !</a> </h5>
								</c:if>
							</div>
						</c:if>
						</div>			
		            </div>
		        </div>
			</c:if>
			<c:if test="${!empty emptyUser }">
				<h1 id='error'>없는 회원의 리스트 입니다.</h1>
				<c:if test="${empty userNo }">
					<button class='submitBtn' onclick='location.href="/test/mainPage"'>돌아가기</button>
				</c:if>
				<c:if test="${!empty userNo }">
					<button class='submitBtn' onclick='location.href="/test/userPage"'>돌아가기</button>
				</c:if>
			</c:if>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>