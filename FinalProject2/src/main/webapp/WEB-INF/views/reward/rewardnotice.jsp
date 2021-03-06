<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
	${reward }

    <script src="/test/resources/js/common/jquery-3.3.1.js"></script>
    <script src="/test/resources/js/reward/RewardHeader.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1|Jua|Nanum+Gothic|Open+Sans|Roboto|Sunflower:300" rel="stylesheet">
    <link rel="stylesheet" href="/test/resources/css/reward/RewardHeader.css"></link>
    <link rel="stylesheet" href="/test/resources/css/reward/RewardRight.css"></link>
    <link rel="stylesheet" href="/test/resources/css/reward/RewardLeftProduct.css"></link>
    <link rel="stylesheet" href="/test/resources/css/reward/RewardFont.css"></link>
    <script src="/test/resources/js/common/context.js"></script>
    <script src="/test/resources/js/common/LoginCheck.js"></script>
    <script src="/test/resources/js/reward/RewardRight.js"></script>
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextPath","${pageContext.request.contextPath}");
</script>
    
    <jsp:include page="/WEB-INF/views/common/util.jsp" flush="true">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>
   <div class="reward-all-wrapper" style='position:relative; width:100%;'>  
    <div class="reward-header-img-wrapper">
        <div class="reward-header-img"></div>
        <div class="reward-header-text-wrapper">
            <p class="reward-header-text">

                
            </p>
        </div>
    </div>

    <header class="reward-header">
        <ul class="reward-ul">
            <li class="reward-li"><div class="reward-li-text-wrapper"><p>스토리</p></div></li>
            <li class="reward-li-selected"><div class="reward-li-text-wrapper"><p>공지사항</p></div></li>
            <li class="reward-li"><div class="reward-li-text-wrapper"><p>댓글</p></div></li>
    </header>
    <section class="reward-section">
        <div class="reward-section-left">
           	공지사항이 없습니다.
        </div>

    <div class="reward-section-right">
        <div class="reward-status-wrapper">
            <p class="reward-status-title">모인금액</p>
            <p class="reward-money">199,000</p>
            <p class="reward-money-unit"> 원&nbsp;</p>
            <p class="reward-money-percentage">95%</p>

            <br>

            <p class="reward-status-title">남은기간</p>
            <p class="reward-remainingday-day">49</p>
            <p class="reward-remainingday-unit">일</p>

            <br>


            <p class="reward-status-title">후원자 수</p>
            <p class="reward-funding-num">192</p>
            <p class="reward-funding-unit">명</p>

            <br>

            <div class="reward-funding-btn-area">
                <div class="reward-funding-btn"><p>펀딩하기</p></div>
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
                    <div class="reward-maker-profilephoto">

                    </div>
                </div>
            </div>
            <div class="reward-maker-info-area">
                <p class="reward-maker-name">팥빙수</p>

                <p class="reward-maker-url">http://www.naver.com</p>
                <p class="reward-maker-url">http://www.google.com</p>
                <p class="reward-maker-url">http://www.google.com</p>
                <p class="reward-maker-url">http://www.google.com</p>
            </div>

            <div class="reward-maker-introduce">
                <p class="reward-maker-introduce-content">와디즈는 크라우드 펀딩 사이트입니다! 와디즈는 크라우드 펀딩 사이트입니다!와디즈는 크라우드 펀딩 사이트입니다!</p>

            </div>

        </div>

        <p class="reward-product-list-title">리워드 목록</p>

        <div class="reward-product-list-wrapper">
            <div class="reward-product-list">
                <div class="reward-product">
                    <div class="reward-product-hover">

                    </div>
                    <p class="reward-product-price">12,000 원</p>
                    <p class="reward-product-name">1. MEIZU POPS</p>
                    <p class="reward-product-content">블루투스 이어폰!
                        <br>
                        이어폰 본품과 함께 충전기까지! 12000원!
                        <br>
                        무선충전 지원! c타입 충전 지원!
                    </p>

                    <p class="reward-product-delivery-price-title">배송비</p>
                    <p class="reward-product-delivery-price">2,500 원</p>

                    <p class="reward-product-delivery-date-title">배송날짜</p>
                    <p class="reward-product-delivery-date">2019-09-28 ~ 2019-10-29</p>

                    <p class="reward-product-stock-title">남은 수량</p>
                    <p class="reward-product-stock">20개</p>
                    
                    
                </div>

                <div class="reward-product">
                        <div class="reward-product-hover">
    
                        </div>
                        <p class="reward-product-price">12,000 원</p>
                        <p class="reward-product-name">1. MEIZU POPS</p>
                        <p class="reward-product-content">블루투스 이어폰!
                            <br>
                            이어폰 본품과 함께 충전기까지! 12000원!
                            <br>
                            무선충전 지원! c타입 충전 지원!
                        </p>
    
                        <p class="reward-product-delivery-price-title">배송비</p>
                        <p class="reward-product-delivery-price">2,500 원</p>
    
                        <p class="reward-product-delivery-date-title">배송날짜</p>
                        <p class="reward-product-delivery-date">2019-09-28 ~ 2019-10-29</p>
    
                        <p class="reward-product-stock-title">남은 수량</p>
                        <p class="reward-product-stock">20개</p>
                        
                        
                    </div>
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

