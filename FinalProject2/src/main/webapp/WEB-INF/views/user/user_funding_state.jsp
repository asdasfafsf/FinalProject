<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_funding_state.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div class='user_full_screen_background'>
        <div class='user_full_screen'>
            <div class='user_contents_big'>
                <h2>나의 리워드</h2>
                <div class='sub-menu'>
                    <div class='btn-for-menu'>펀딩 내역</div>
                    <div class='btn-for-menu'>나의 리워드</div>
                </div>
                
                <div class='reward-container'>
                	<c:if test='${type eq 1 }'>
	                	<div class='reward-list-support'>
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
								</div>			
		            		</div>
	                	</div>
                	</c:if>
                	<c:if test='${type eq 2 }'>
	                	<div class='reward-list-made'>
	                	</div>
                	</c:if>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>