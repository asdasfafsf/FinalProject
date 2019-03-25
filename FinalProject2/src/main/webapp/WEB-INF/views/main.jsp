<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">
   <script src="//code.jquery.com/jquery-3.3.1.min.js"></script> 
   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/main.js"></script><!-- 사용자정의 js --> 
	<script src="/test/resources/js/common/context.js"></script>
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextPath","${pageContext.request.contextPath}");
	</script>

<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>

	<div class="main_full_screen_background">
		<div class="main_full_screen">
			<div class="main_notice_wrap">
				<h4>공지사항</h4>
				<ul class="main_notice">
					<c:forEach var="notice" items="${noticeList}">
						<li id="${notice.NOTICE_NO }" onclick="clickNotice(this);">${notice.NOTICE_TITLE }</li>
					</c:forEach>		
				</ul>
			</div>
			
			<div class="main_advertisement_wrap">
				<img class="slide_back_button" id="main_advertisement_wrap_back" src="${pageContext.request.contextPath}/resources/images/icon/slide_back2.png" onclick="slideBack(this,650);"/>
		  		<ul value="advertisement">
		  			<c:forEach var="ad" items="${advertisementList}">
		  				<li id="${ad.REWARD_NO }" onclick="clickReward(this);">
		  					<div>
		  						<em>리워드</em>
		  						<h3>${ad.REWARD_SHORT_NAME }</h3>
		  						<p>${ad.REWARD_SYNOPSIS }</p>
		  					</div>
		  					<img alt="" src="${pageContext.request.contextPath}${ad.REWARD_REPRESENT_IMAGE}">
		  				</li>
		  			</c:forEach>
		  		</ul>
		  		<img class="slide_next_button" id="main_advertisement_wrap_next" src="${pageContext.request.contextPath}/resources/images/icon/slide_next2.png" onclick="slideNext(this,650);"/>
		  		<div class='main_advertisement_border_bottom'></div>
			</div>

			<div class="main_rank_wrap">
				<div class="main_rank_menu">
					<ul>
						<li><button onclick="rankMenuClick(this);">리워드</button></li>
						<li><button onclick="rankMenuClick(this);">오픈예정</button></li>
					</ul>
				</div>
				

				<div class="main_rank_content_wrap">
					<div class="main_rank_content_img_wrap">
						<c:forEach var="rewardRankList" items="${ongoing_rewardRankList }">
							<img alt="" id='${rewardRankList.REWARD_NO }'  onclick="clickReward(this);" src="${pageContext.request.contextPath}${rewardRankList.REWARD_REPRESENT_IMAGE }" >
						</c:forEach>
					</div>
					<div class="main_rank_content">
						<c:forEach var="rewardRankList" items="${ongoing_rewardRankList }" varStatus="vs">
							<div class='main_rank_content_text' id='${rewardRankList.REWARD_NO }' onclick="clickReward(this);">
								<em>${vs.count }</em>	
								<label>${rewardRankList.REWARD_SHORT_NAME }</label>
							</div>
						</c:forEach>
					</div>
				</div>

				<div class="main_rank_content2_wrap">
					<div class="main_rank_content2_img_wrap">
						<c:forEach var="rewardRankList2" items="${open_schedule_rewardRankList }">
							<img alt="" id='${rewardRankList2.REWARD_NO }' onclick="clickReward(this);" src="${pageContext.request.contextPath}${rewardRankList2.REWARD_REPRESENT_IMAGE}" >
						</c:forEach>
					</div>
					<div class="main_rank_content2">
						<c:forEach var="rewardRankList2" items="${open_schedule_rewardRankList }" varStatus="vs">
							<div class='main_rank_content_text' id='${rewardRankList2.REWARD_NO }' onclick="clickReward(this);">
								<em>${vs.count }</em>	
								<label>${rewardRankList2.REWARD_SHORT_NAME }</label>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

			<div class="main_open_schedule_wrap">
				<h3><em>오픈예정</em> 곧 다가올 리워드</h3>
				<ul value="schedule">
					<c:forEach var="list" items="${newest_open_schedule_rewardList }">
						<li id="${list.REWARD_NO }" onclick="clickReward(this);">
							<div class="main_open_schedule_body_img_wrap">
								<img alt="" src="${pageContext.request.contextPath}${list.REWARD_REPRESENT_IMAGE}">
								
							</div>
							<div class="main_open_schedule_body_content_wrap">
								<h3>${list.REWARD_SHORT_NAME }</h3>
								<h5>${list.REWARD_MC_NAME }</h5>
							</div>
						</li>
					</c:forEach>
				</ul>
	
				<img class="slide2_back_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_back2.png" onclick="slideBack(this,317);" onmouseover="slideBackButtonHover(this);"/>
				<img class="slide2_next_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_next2.png" onclick="slideNext(this,317);" onmouseover="slideNextButtonHover(this);"/>
				<div class="main_open_schedule_body_slideControll_wrap">
					<c:forEach var="list" items="${newest_open_schedule_rewardList }" varStatus="vs">
						<c:choose>
							<c:when test="${vs.index==0}">
								<img alt="" value=${vs.count } onclick="clickSlideCircleButton(this,317);" src="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png">
							</c:when>
							<c:when test="${vs.index!=0}">
								<img alt="" value=${vs.count } onclick="clickSlideCircleButton(this,317);" src="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png">
							</c:when>
						</c:choose>
					</c:forEach>
				</div>
			</div>

		
			<div class="main_deadline_approaching_wrap">
				<h3><em>마감임박</em> 시간이 얼마 안남았다!</h3>
				<ul value="deadline_approaching">
					<c:forEach var="list" items="${deadline_approaching_rewardList }">
						<li id="${list.REWARD_NO }" onclick="clickReward(this);">
							<div class="main_deadline_approaching_body_img_wrap">
								<img alt="" src="${pageContext.request.contextPath}${list.REWARD_REPRESENT_IMAGE}">
								<div class="main_deadline_approaching_persentBar_Background">
									<div class="main_deadline_approaching_persentBar" style="width:${list.REWARD_ACHIEVEMENT_PERSENT*3}px"></div>
								</div>
								<div class="main_deadline_approaching_body_information_wrap">
									<label>${list.REWARD_ACHIEVEMENT_PERSENT }%</label>
									<label>${list.REWARD_PRESENT_COLLECTION }원</label>
									<label>${list.REWARD_REMAIN_DATE }일 남음</label>
								</div>
							</div>
							<div class="main_deadline_approaching_body_content_wrap">
								<h3>${list.REWARD_SHORT_NAME }</h3>
								<h5>${list.REWARD_MC_NAME }</h5>
							</div>
						</li>
					</c:forEach>
				</ul>
				<img class="slide2_back_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_back2.png" onclick="slideBack(this,317);" onmouseover="slideBackButtonHover(this);"/>
				<img class="slide2_next_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_next2.png" onclick="slideNext(this,317);" onmouseover="slideNextButtonHover(this);"/>
				<div class="main_deadline_approaching_body_slideControll_wrap">
					<c:forEach var="list" items="${deadline_approaching_rewardList }" varStatus="vs">
						<c:choose>
							<c:when test="${vs.index==0}">
								<img alt="" value=${vs.count } onclick="clickSlideCircleButton(this,317);" src="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png">
							</c:when>
							<c:when test="${vs.index!=0}">
								<img alt="" value=${vs.count } onclick="clickSlideCircleButton(this,317);" src="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png">
							</c:when>
						</c:choose>
					</c:forEach>			
				</div>
			</div>
	
			<div class="main_invention_wrap">
				<h3><em>신규상품</em> 지금부터 시작이다!</h3>
				<ul value="invention">
					<c:forEach var="list" items="${new_rewardList }">
						<li id="${list.REWARD_NO }" onclick="clickReward(this);">
							<div class="main_invention_body_img_wrap">
								<img alt="" src="${pageContext.request.contextPath}${list.REWARD_REPRESENT_IMAGE}">
								<div class="main_invention_persentBar_Background">
									<div class="main_invention_persentBar" style="width:${list.REWARD_ACHIEVEMENT_PERSENT*3}px"></div>
								</div>
								<div class="main_invention_body_information_wrap">
									<label>${list.REWARD_ACHIEVEMENT_PERSENT }%</label>
									<label>${list.REWARD_PRESENT_COLLECTION }원</label>
									<label>${list.REWARD_REMAIN_DATE }일 남음</label>
								</div>
							</div>
							<div class="main_invention_body_content_wrap">
								<h3>${list.REWARD_SHORT_NAME }</h3>
								<h5>${list.REWARD_MC_NAME }</h5>
							</div>
						</li>
					</c:forEach>
				</ul>
				<img class="slide2_back_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_back2.png" onclick="slideBack(this,317);" onmouseover="slideBackButtonHover(this);"/>
				<img class="slide2_next_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_next2.png" onclick="slideNext(this,317);" onmouseover="slideNextButtonHover(this);"/>
				<div class="main_invention_body_slideControll_wrap">
					<c:forEach var="list" items="${new_rewardList }" varStatus="vs">
						<c:choose>
							<c:when test="${vs.index==0}">
								<img alt="" value=${vs.count } onclick="clickSlideCircleButton(this,317);" src="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png">
							</c:when>
							<c:when test="${vs.index!=0}">
								<img alt="" value=${vs.count } onclick="clickSlideCircleButton(this,317);" src="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png">
							</c:when>
						</c:choose>
					</c:forEach>		
				</div>
			</div>
			
			 
			<a href="${pageContext.request.contextPath }/fundingStory"><img class="main_brand_story" alt="" src="${pageContext.request.contextPath}/resources/images/main/main_funding_story.jpg"></a>
			
			<div class="main_event_wrap">
				<img class="slide_back_button" id="main_event_slide_back_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_back2.png" onclick="slideBack(this,700);"/>
		  		<ul value="main_event_ul">
		  			<c:forEach var="list" items="${main_slide_eventList }">
		  				<li id="${list.EVENT_NO }" onclick="clickEvent(this);">
		  					<div>
		  						<em>이벤트</em>
		  						<h3>${list.EVENT_TITLE }</h3>
		  						<p>${list.EVENT_CONTENT }</p>
		  					</div>
		  					<img alt="" src="${pageContext.request.contextPath}${list.EVENT_IMAGE_STORED_PATH}">
		  				</li>
		  			</c:forEach>
		  		</ul>
		  		<img class="slide_next_button" id="main_event_slide_next_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_next2.png" onclick="slideNext(this,700);"/>
			</div> 
			
		</div>
	</div>
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>




	
