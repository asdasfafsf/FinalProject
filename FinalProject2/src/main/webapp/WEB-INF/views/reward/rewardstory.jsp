<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>

    <script src="/test/resources/js/common/jquery-3.3.1.js"></script>
    <script src="/test/resources/js/reward/RewardHeader.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1|Jua|Nanum+Gothic|Open+Sans|Roboto|Sunflower:300" rel="stylesheet">
    <link rel="stylesheet" href="/test/resources/css/reward/RewardHeader.css"></link>
    <link rel="stylesheet" href="/test/resources/css/reward/RewardRight.css"></link>
    <link rel="stylesheet" href="/test/resources/css/reward/RewardLeftProduct.css"></link>
    <link rel="stylesheet" href="/test/resources/css/reward/RewardComment.css"></link>
    <link rel="stylesheet" href="/test/resources/css/reward/RewardFont.css"></link>
    <script src="/test/resources/js/common/context.js"></script>
     <script src="/test/resources/js/reward/RewardComment.js"></script>
    <script src="/test/resources/js/common/LoginCheck.js"></script>
    <script src="/test/resources/js/reward/RewardRight.js"></script>
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextPath","${pageContext.request.contextPath}");
</script>
    
    <jsp:include page="/WEB-INF/views/common/util.jsp" flush="true">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>
<div class='reward-report-background' style="display: none;">
        <div class='reward-report-wrapper2'>
            <div style="text-align: center; font-size: 20px; font-weight: bold; padding-top: 20px;">
                신고하기
            </div>
            <div class="reward-report-title-area" style="text-align: center; padding-top: 15px;">
                <span style="font-weight: bold; font-size: 14px;">제목 </span><input class="reward-report-title" type="text" style=" width: 300px;"/>
            </div>

            <div class='reward-report-content-area' style="text-align: center;padding-top: 5px;">
                <span style="position: relative;bottom: 160px; font-weight: bold; font-size: 14px;">내용 </span><textarea class="reward-report-content" style="resize:none; width: 300px; height: 320px;"></textarea>

            </div>

            <div class='reward-report-btn-area' style="text-align: right; padding-right: 10px; padding-top: 5px;">
                <button class="reward-report-submit" style="border: none; background-color: red; color: white; opacity: 0.4; width: 70px; height: 30px;">전송</button>
                <button class="reward-report-cancel" style="border: none; background-color: gray; color: white; opacity: 0.4; width: 70px; height: 30px;">취소</button>
            </div>

        </div>

    </div>
  <div class="reward-all-wrapper" style='position:relative; width:100%;'>  
	<div class="reward-header-img-wrapper">
        <div class="reward-header-img" style='background-image:url("${pageContext.request.contextPath}${reward.representImage }")'></div>
        <div class="reward-header-text-wrapper">
            <p class="reward-header-text">

                
            </p>
        </div>
    </div>
    

    <header class="reward-header">
        <ul class="reward-ul">
            <li class="reward-li-selected"><div class="reward-li-text-wrapper"><p>스토리</p></div></li>
            <li class="reward-li" style='display:none;'><div class="reward-li-text-wrapper"><p>공지사항</p></div></li>
            <li class="reward-li"><div class="reward-li-text-wrapper"><p>댓글</p></div></li>
             <c:if test="${reward.state == 8 }">
            	<li class="reward-li"><div class="reward-li-text-wrapper"><p>서포터</p></div></li>
            </c:if>
    </header>
    <section class="reward-section">
        <div class="reward-section-left">
            <div class="reward-story-media-wrapper">
                <div class="reward-story-media-img" style='background-image:url("${pageContext.request.contextPath }${reward.storyMedia }")'>
 
                </div>

                <div class="reward-story-text-wrapper">
                    <p class="reward-story-text">
                   		${reward.storyIntroduce }
                    </p>

                </div>
            </div>

            <div class="reward-content-area">
                  <c:forEach items="${reward.storyContentList }" var="item">
					<div>${item.tag }</div>
				</c:forEach>

            </div>
        </div>

    <div class="reward-section-right">
        <div class="reward-status-wrapper">
            <p class="reward-status-title">모인금액</p>
            <p class="reward-money">
				<fmt:formatNumber value="${ reward.goalAttainmentMoney}" type="currency" />
            </p>
            <p class="reward-money-unit"> 원&nbsp;</p>
            <p class="reward-money-percentage">${reward.goalAttainmentPer }%</p>

            <br>

            <p class="reward-status-title">남은기간</p>
            <p class="reward-remainingday-day">
            
                <c:if test="${reward.state > 5}">
                	종료된 프로젝트입니다.
                </c:if>
                
                <c:if test="${reward.state == 5 }">
					${reward.remainDay+1 }
				</c:if>
				
				<c:if test="${reward.state == 4 }">
					${reward.preOpenDay + 1 }
				</c:if>
					
			</p>
			<c:if test="${reward.state <= 5 }">
            <p class="reward-remainingday-unit">일</p>
            </c:if>

            <br>


            <p class="reward-status-title">후원자 수</p>
            <p class="reward-funding-num">${reward.supporterNum }</p>
            <p class="reward-funding-unit">명</p>

            <br>

            <div class="reward-funding-btn-area">
                <div class="reward-funding-btn">
                		<p>
                			<c:if test="${reward.state == 4}">
                				오픈예정
                			</c:if>
                			
                			<c:if test="${reward.state == 5}">
                				펀딩하기
                			</c:if>
                			
                			<c:if test="${reward.state == 6}">
                				성공	
                			</c:if>
                			
                			<c:if test="${reward.state == 7}">
                				실패	
                			</c:if>
                		</p>
                </div>
                 <div id="reward-like-btn" class='<c:if test="${reward.islike }">reward-funding-like</c:if><c:if test="${!reward.islike }">reward-funding-unlike</c:if>'><p>
                	<c:if test="${reward.likeNum > 999 }">
                		999+
                	</c:if>
                	<c:if test="${reward.likeNum <= 999 }">
                		${reward.likeNum }
                	</c:if>
                </p></div>
                <div class="reward-funding-inquiry"><p>문의</p></div>
            </div>
        </div>

        <div class="reward-makerInfo-wrapper">
            <div class="reward-maker-profilephoto-area">
                <div class="reward-maker-profilephoto-wrapper">
                    <div class="reward-maker-profilephoto" style='background-image:url("${pageContext.request.contextPath}${reward.mcProfilePhoto }")'>

                    </div>
                </div>
            </div>
            <div class="reward-maker-info-area">
                <p class="reward-maker-name">${ reward.mcName}</p>

                <p class="reward-maker-url">${reward.mcURL1 }</p>
                <p class="reward-maker-url">${reward.mcURL2 }</p>
                <p class="reward-maker-url">${reward.mcURL3 }</p>
            </div>

            <div class="reward-maker-introduce">
                <p class="reward-maker-introduce-content">${reward.mcIntroduce }</p>

            </div>

        </div>

        <p class="reward-product-list-title">리워드 목록</p>

        <div class="reward-product-list-wrapper">
            <div class="reward-product-list">
            	<c:forEach items="${reward.itemList }" var="item" step="1" varStatus="status">
                <div class="reward-product">
                    <div class="reward-product-hover">

                    </div>
                    <p class="reward-product-price">
                    	<fmt:formatNumber value="${item.price }" type="currency" />
                    	 원</p>
                    <p class="reward-product-name">${status.count}. ${item.name }</p>
                    <p class="reward-product-content">
                    	${item.introduce }
                    </p>

                    <p class="reward-product-delivery-price-title">배송비</p>
                    <p class="reward-product-delivery-price">
                    	<fmt:formatNumber value="${item.deliveryPrice }" type="currency" />
                    	 원</p>

                    <p class="reward-product-delivery-date-title">배송날짜</p>
                    <p class="reward-product-delivery-date">
                    
                    	<fmt:formatDate value="${item.deliveryStartDate }" pattern="yyyy-MM-dd"/>
                    	~
                    	<fmt:formatDate value="${item.deliveryEndDate }" pattern="yyyy-MM-dd"/>
                    </p>
                    	
	
                    <p class="reward-product-stock-title">남은 수량</p>
                    <p class="reward-product-stock">${item.remainNum }개</p>
                    
                    
                </div>
                </c:forEach>

            </div>
            
        </div>

        <div class="reward-report-wrapper">
            <p class="reward-report-title">신고하기?</p>
            <p class="reward-report-content">만약 이 프로젝트에 지적재산권 침해 등의 법적인 문제가 있다면 이 프로젝트를 신고해주세요.</p>

            <div class="reward-report-btn"><p>프로젝트 신고하기</p></div>
        </div>
    </div>
    
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>
    </div>

