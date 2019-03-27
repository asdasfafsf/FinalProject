<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>  -->
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reward_list.css"> 
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script> 
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/reward_list.js"></script><!-- 사용자정의 js --> 
	<script src="/test/resources/js/common/context.js"></script>
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextPath","${pageContext.request.contextPath}");
	</script>


<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>

	<div class="reward_list_full_screen_background">
		<div class="reward_list_full_screen">
		
			<div class="reward_category_list_wrap" >
				<img class="reward_category_list_back_button" id="reward_category_list_back_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_back2.png" onmouseover="hoverCategoryListBack(this);" onclick="clickCategoryListBack();"/>
				<img class="reward_category_list_next_button" id="reward_category_list_next_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_next2.png" onmouseover="hoverCategoryListNext(this);" onclick="clickCategoryListNext();"/>
				<div class="reward_category_list" id="reward_category_list">
					<ul>
						<li onclick="clickCategory(this);" value="0">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/category/category1.jpg">
							<p>전체보기<p>
						</li>
						<li onclick="clickCategory(this);" value="1">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/category/category2.jpg">
							<p>테크·가전<p>
						</li>
						<li onclick="clickCategory(this);" value="2">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/category/category3.jpg">
							<p>패션·잡화<p>
						</li>
						<li onclick="clickCategory(this);" value="3">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/category/category4.jpg">
							<p>뷰티<p>
						</li>
						<li onclick="clickCategory(this);" value="4">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/category/category5.jpg">
							<p>푸드<p>
						</li>
						<li onclick="clickCategory(this);" value="5">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/category/category6.jpg">
							<p>홈리빙<p>
						</li>
						<li onclick="clickCategory(this);" value="6">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/category/category7.jpg">
							<p>디자인소품<p>
						</li>
						<li onclick="clickCategory(this);" value="7">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/category/category8.jpg">
							<p>여행·레저<p>
						</li>
						<li onclick="clickCategory(this);" value="8">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/category/category9.jpg">
							<p>스포츠·모빌리티<p>
						</li>
						<li onclick="clickCategory(this);" value="9">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/category/category10.jpg">
							<p>반려동물<p>
						</li>
						<li onclick="clickCategory(this);" value="10">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/category/category11.jpg">
							<p>공연·컬쳐<p>
						</li>
						<li onclick="clickCategory(this);" value="11">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/category/category12.jpg">
							<p>소셜·캠페인<p>
						</li>
						<li onclick="clickCategory(this);" value="12">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/category/category13.jpg">
							<p>교육·키즈<p>
						</li>
						<li onclick="clickCategory(this);" value="13">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/category/category14.jpg">
							<p>게임·취미<p>
						</li>
						<li onclick="clickCategory(this);" value="14">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/category/category15.jpg">
							<p>출판<p>
						</li>
						
					</ul>
				</div>
			</div>
			
			<div class="reward_list_wrap">
				<div class="reward_category_head">
					<h2 id="reward_category_title" value="0">전체보기</h2>
					<select id="reward_watch_filter" onchange="clickCategory('option')">
						<option value="1">최신순</option>
						<option value="2">마감일순</option>
						<option value="3">목표액순</option>
						<option value="4">인기순</option>
						<option value="5">펀딩액순</option>
					</select>
					<select id="reward_state_filter" onchange="clickCategory('option')">
						<option value="5">펀딩중</option>
						<option value="4">오픈예정</option>
						<option value="7">종료</option>
					</select>
				</div>

				<div class="reward_category_content">
					<c:forEach var="l" items="${rewardList}">
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
	</div>
	
</body>
</html>

