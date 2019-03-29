<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/searchRewardList.css"> 
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script> 
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/searchRewardList.js"></script>
	<script src="/test/resources/js/common/context.js"></script>
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextPath","${pageContext.request.contextPath}");
	</script>

<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
	<input type="hidden" id="searchInform" value="${searchInform }">
	<div class="reward_list_wrap">
				<div class="search_reward_head">
					<h2 id="search_reward_title" value="0">검색결과</h2>
					<c:if test="${!empty searchRewardList}">
						<select id="reward_watch_filter" onchange="changeFilter('option')">
							<option value="1">최신순</option>
							<option value="2">마감일순</option>
							<option value="3">목표액순</option>
							<option value="4">인기순</option>
							<option value="5">펀딩액순</option>
						</select>
						<select id="reward_state_filter" onchange="changeFilter('option')">
							<option value="5">펀딩중</option>
							<option value="4">오픈예정</option>
							<option value="7">종료</option>
						</select>
					</c:if>
				</div>

				<div class="search_reward_content">
					<c:if test="${empty searchRewardList}">					
							<h1 class="emptySearchListContent">검색 결과가 없습니다</h1>					
					</c:if>
					<c:forEach var="l" items="${searchRewardList}">
						<div class="search_reward_content_item" id="${l.REWARD_NO }" onclick="clickReward(this);">
							<img src="${pageContext.request.contextPath}${l.REWARD_REPRESENT_IMAGE}"/>
							<div class="search_reward_content_item_inform1">
								<h3 class="search_reward_item_punding_title">${l.REWARD_SHORT_NAME }</h3>
								<h5 class="search_reward_item_category_name">${l.REWARD_CATEGORY_NAME }</h5>
								<h5>|</h5>
								<h5 class="search_reward_item_company_name">${l.REWARD_MC_NAME }</h5>
							</div>
							<div class="search_reward_persentBar_background">
								<div class="search_reward_persentBar" style="width:${l.REWARD_ACHIEVEMENT_PERSENT*3 }px"></div>
							</div>
							<div class="search_reward_content_item_inform2">
								<h3 class="search_reward_item_punding_achievement_quotient"> ${l.REWARD_ACHIEVEMENT_PERSENT }%</h3>
								<h4 class="search_reward_item_punding_sum"><fmt:formatNumber type="number"> ${l.REWARD_PRESENT_COLLECTION }</fmt:formatNumber>원</h4>
								<h4 class="search_reward_item_punding_remain_date">${l.REWARD_REMAIN_DATE }일 남음</h4>
							</div>
						</div>
					</c:forEach>			
				</div>
				
			</div>
			
</body>
	
</html>