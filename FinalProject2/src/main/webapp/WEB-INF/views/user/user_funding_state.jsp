<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_funding_state.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common/Alert.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reward_list.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/test/resources/js/user/user_funding_state.js"></script>
<script src="/test/resources/js/common/Alert.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div class='user_full_screen_background'>
        <div class='user_full_screen'>
            <div class='user_contents_big'>
                <h2 id='pageTitle'>${pageTitle }</h2>
                <div class='sub-menu'>
                    <div class='btn-for-menu' id = 'support'>펀딩 내역</div>
                    <div class='btn-for-menu' id = 'made' >나의 리워드</div>
                </div>
                <div class='reward-container'>
                	<c:if test='${type eq 1 }'>
	                	<div class='reward-list-support'>
	                		<div id='funding-list-container' class='col'>
					            <c:forEach var="l" items="${myList}">
					            	<div class='reward-short-info' id="${l.REWARD_SUPPORT_NO}" onclick = 'checkDetail(this);'>
					            		<input type='hidden' class='rewardNo' id='${l.REWARD_NO }'/>
					            		<img class='reward-photo' src="${pageContext.request.contextPath}${l.REWARD_REPRESENT_IMAGE}"/>
					            		<div class='reward-name'>${l.REWARD_SHORT_NAME }</div>
					            		<br/>
					            		<div class='reward-mc'>${l.REWARD_CATEGORY_NAME } | ${l.REWARD_MC_NAME }</div>
					            		<br/>
					            		<div class='reward-end'>${l.REWARD_DEADLINE }</div>
					            		<div class='reward-state'>
					            			<c:if test="${l.REWARD_STATE == 5 }">
					            			<div class='state-light green'></div>진행중
					            			</c:if>
					            			<c:if test='${l.REWARD_STATE == 6 }'>
					            			<div class='state-light green'></div>성공
					            			</c:if>
					            			<c:if test='${l.REWARD_STATE == 7 }'>
					            			<div class='state-light red'></div>실패
					            			</c:if>
					            			<c:if test='${l.REWARD_STATE == 8 }'>
					            			완료
					            			</c:if>
				            			</div>
					            	</div>
								</c:forEach>
								<c:if test='${empty myList }'>
									<h3>펀딩 내역이 없습니다.</h3>
									<h5>FundingStroy에는 당신을 기다리는 매력적인 리워드들이 있습니다. <br/> <a href="${path }/mainPage">당신의 리워드를 찾아보세요 !</a> </h5>
								</c:if>
		            		</div>
		            		<div id='funding-detail-container' class='col'>
		            			<div id='funding-detail'>
		            				<div id='detail_state'></div>
		            				<div id='detail_deadline'></div>
		            				<br/>
		            				<div id='detail_title'></div>
		            				<br/>
		            				<img id='detail_photo'/>
		            				<br/>
		            				<div id='detail_mc_name'></div>
		            				<br/>
		            				<div id='detail_support'>
		            				</div>
		            				<div id='detail_support_add'>
		            				</div>
		            				<div id='cost_all'></div>
		            				<div id='detail_address'>
		            					<div id='addressZip'></div>
		            					<div id='addressWhole'></div>
		            					<div id='addressDetail'></div>
		            					<br/>
		            					<div id='addressReceiver'></div>
		            					<div id='phone'></div>
		            				</div>
		            				<div id='detail_account'>
		            					계좌번호<div id='account-no'></div>
		            					<div id='bank-name'></div>
		            					<br/>
		            					예금주 <div id='account-user-name'></div>
		            				</div>
		            				<br/><br/>
	            					<button id='reset'>주문 취소</button>
		            			</div>
		            		</div>
	                	</div>
                	</c:if>
                	<c:if test='${type eq 2 }'>
	                	<div class='reward-list-made'>
	                		<form id='funding-made-filter'>
	                			<label><input type="radio" name='filter' value='3' ${filter == '3' ? 'checked' : '' }/>전체</label>
	                			<label><input type="radio" name='filter' value='4' ${filter == '4' ? "checked" : "" }/>준비중</label>
	                			<label><input type="radio" name='filter' value='1' ${filter == '1' ? "checked" : "" }/>진행중</label>
	                			<label><input type="radio" name='filter' value='2' ${filter == '2' ? "checked" : "" }/>완료</label> 
	                		</form>
	                		<div id='funding-made-container'>
					           <c:forEach var="l" items="${myList}">
			           				<c:if test="${l.REWARD_STATE == 1 }">
										<div class="reward_category_content_item" id="${l.REWARD_NO}" onclick="editReward(this);">
											<img src="${pageContext.request.contextPath}${l.REWARD_REPRESENT_IMAGE}"/>
											<div class="reward_category_content_item_inform1">
												<h3 class="category_item_punding_title">${l.REWARD_SHORT_NAME }</h3>
												<h5 class="category_item_category_name">${l.REWARD_CATEGORY_NAME }</h5>
											</div>
											<div class='reward_state'>
												<div class='state-light red'></div>&nbsp;<label>작성중</label>
											</div>
										</div>
									</c:if>
									<c:if test="${l.REWARD_STATE == 2 }">
										<div class="reward_category_content_item" id="${l.REWARD_NO}" onclick="showReward(this);">
											<img src="${pageContext.request.contextPath}${l.REWARD_REPRESENT_IMAGE}"/>
											<div class="reward_category_content_item_inform1">
												<h3 class="category_item_punding_title">${l.REWARD_SHORT_NAME }</h3>
												<h5 class="category_item_category_name">${l.REWARD_CATEGORY_NAME }</h5>
											</div>
											<div class='reward_state'>
												<div class='state-light yellow'></div>&nbsp;<label>심사중</label>
											</div>
										</div>
									</c:if>
									<c:if test="${l.REWARD_STATE == 3 }">
										<div class="reward_category_content_item" id="${l.REWARD_NO}" onclick="showReward(this);">
											<img src="${pageContext.request.contextPath}${l.REWARD_REPRESENT_IMAGE}"/>
											<div class="reward_category_content_item_inform1">
												<h3 class="category_item_punding_title">${l.REWARD_SHORT_NAME }</h3>
												<h5 class="category_item_category_name">${l.REWARD_CATEGORY_NAME }</h5>
											</div>
											<div class='reward_state'>
												<div class='state-light yellow'></div>&nbsp;<label>심사완료</label>
											</div>
										</div>
									</c:if>
									<c:if test="${l.REWARD_STATE == 4 }">
										<div class="reward_category_content_item" id="${l.REWARD_NO}" onclick="clickReward(this);">
											<img src="${pageContext.request.contextPath}${l.REWARD_REPRESENT_IMAGE}"/>
											<div class="reward_category_content_item_inform1">
												<h3 class="category_item_punding_title">${l.REWARD_SHORT_NAME }</h3>
												<h5 class="category_item_category_name">${l.REWARD_CATEGORY_NAME }</h5>
											</div>
											<div class='reward_state'>
												<div class='state-light green'></div>&nbsp;<label>오픈예정</label>
											</div>
										</div>
									</c:if>
									<c:if test="${l.REWARD_STATE == 5 }">
										<div class="reward_category_content_item" id="${l.REWARD_NO}" onclick="clickReward(this);">
											<img src="${pageContext.request.contextPath}${l.REWARD_REPRESENT_IMAGE}"/>
											<div class="reward_category_content_item_inform1">
												<h3 class="category_item_punding_title">${l.REWARD_SHORT_NAME }</h3>
												<h5 class="category_item_category_name">${l.REWARD_CATEGORY_NAME }</h5>
											</div>
											<div class='reward_state'>
												<div class='state-light green'></div>&nbsp;<label>진행중</label>
											</div>
										</div>
									</c:if>
									<c:if test="${l.REWARD_STATE == 6 }">
										<div class="reward_category_content_item" id="${l.REWARD_NO}" onclick="clickReward(this);">
											<img src="${pageContext.request.contextPath}${l.REWARD_REPRESENT_IMAGE}"/>
											<div class="reward_category_content_item_inform1">
												<h3 class="category_item_punding_title">${l.REWARD_SHORT_NAME }</h3>
												<h5 class="category_item_category_name">${l.REWARD_CATEGORY_NAME }</h5>
											</div>
											<div class='reward_state'>
												<label>성공</label>
											</div>
										</div>
									</c:if>
									<c:if test="${l.REWARD_STATE == 7 }">
										<div class="reward_category_content_item" id="${l.REWARD_NO}" onclick="clickReward(this);">
											<img src="${pageContext.request.contextPath}${l.REWARD_REPRESENT_IMAGE}"/>
											<div class="reward_category_content_item_inform1">
												<h3 class="category_item_punding_title">${l.REWARD_SHORT_NAME }</h3>
												<h5 class="category_item_category_name">${l.REWARD_CATEGORY_NAME }</h5>
											</div>
											<div class='reward_state'>
												<label>실패</label>
											</div>
										</div>
									</c:if>
									<c:if test="${l.REWARD_STATE == 8 }">
										<div class="reward_category_content_item" id="${l.REWARD_NO}" onclick="clickReward(this);">
											<img src="${pageContext.request.contextPath}${l.REWARD_REPRESENT_IMAGE}"/>
											<div class="reward_category_content_item_inform1">
												<h3 class="category_item_punding_title">${l.REWARD_SHORT_NAME }</h3>
												<h5 class="category_item_category_name">${l.REWARD_CATEGORY_NAME }</h5>
											</div>
											<div class='reward_state'>
												<label>성공</label>
											</div>
										</div>
									</c:if>
								</c:forEach>
								<c:if test='${empty myList || myList.size() == 0}'>
									<h4>해당되는 리워드가 없습니다.</h4>
								</c:if>
							</div>
	                	</div>
								 ${pageBar }
                	</c:if>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>