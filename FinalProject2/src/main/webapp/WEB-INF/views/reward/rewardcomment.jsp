<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>

	${reward }
    <script src="/test/resources/js/common/jquery-3.3.1.js"></script>
    <script src="/test/resources/js/reward/RewardHeader.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1|Jua|Nanum+Gothic|Open+Sans|Roboto|Sunflower:300" rel="stylesheet">
    <link rel="stylesheet" href="/test/resources/css/reward/RewardHeader.css"></link>
    <link rel="stylesheet" href="/test/resources/css/reward/RewardRight.css"></link>
    <link rel="stylesheet" href="/test/resources/css/reward/RewardComment.css"></link>
    <link rel="stylesheet" href="/test/resources/css/reward/RewardFont.css"></link>
    <script src="/test/resources/js/common/context.js"></script>
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
            <li class="reward-li"><div class="reward-li-text-wrapper"><p>공지사항</p></div></li>
            <li class="reward-li-selected"><div class="reward-li-text-wrapper"><p>댓글</p></div></li>
    </header>
    <section class="reward-section">
        <div class="reward-section-left">
            
            <div class="reward-comment-warning-area">
                <p class="reward-comment-warning-title">주의!</p>
                

                <p class="reward-comment-warning-content">최근 메이커 또는 제3자에 대한 허위사실 유포, 
                    비방 목적의 댓글로 인해 당사자간 법적분쟁이 발생한 사례가 증가하고 있습니다. 
                    악의적 댓글 작성자는 명예훼손, 모욕 등으로 법적 책임을 부담하게 될 수 있다는 점을 유의하여 주시기 바랍니다</p>

            </div>


            <form action="" method="post">
                <textarea class="reward-comment-content" name="content" placeholder="내용을 입력해주세요"></textarea>
                <div class="reward-comment-submit-btn" id="reward-comment-submit">댓글 쓰기</div>
            </form>

            <div class="reward-comment-list-wrapper">
                <div class="reward-comment-list">
                
                	<c:forEach items="${reward.commentList }" var="item">
                    <div class="reward-comment-wrapper">
                        <div class="reward-comment-writer-info-area">
                            <div class="reward-comment-writer-profilephoto-wrapper">
                                <div class="reward-comment-writer-profilephoto" style='background-image:url("${pageContext.request.contextPath}${item.userProfilePhoto }")'>

                                </div>
                            </div>
                            <div class="reward-comment-writer-name-wrapper">
                                <p class="reward-comment-writer-name">${item.userName }</p>
                                <p class="reward-comment-write-date">7분전</p>
                            </div>
                            
                            <div class="reward-comment-delete">안녕</div>
                        </div>

                        <div class="reward-comment-content-area">
                            ${item.content }

                        </div>

                        <div class="reward-comment-recomment-area">
                            <input type="text" class="reward-comment-recomment-content">
                            <div class="reward-recomment-btn"><p>답글</p></div>
                        </div>

                        <div class="reward-recomment-list">
                            <div class="reward-recomment">
                                <div class="reward-recomment-writer-info">
                                    <div class="reward-recomment-writer-profilephoto-wrapper">
                                        <div class="reward-recomment-writer-profilephoto"></div>
                                    </div>
                                    <div class="reward-recomment-writer-name">한원근</div>
                                </div>
                                
                                <div class="reward-recomment-view-content-area">
                                    <div class="reward-recomment-view-content">안녕하세요!안녕하세요!안녕하세요!안녕하세요!안녕하세요!안녕하세요!안녕하세요!안녕하세요!안녕하세요!안녕하세요!안녕하세요!안녕하세요!안녕하세요!안녕하세요!안녕하세요!안녕하세요!안녕하세요!


                                    <div class="reward-recomment-write-time">7분전</div>   
                                    </div>
                                </div>
                            </div>
                        </div>

                        
                    </div>
                    
                    </c:forEach>
                </div>

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
					${reward.remainDay }
			</p>
            <p class="reward-remainingday-unit">일</p>

            <br>


            <p class="reward-status-title">후원자 수</p>
            <p class="reward-funding-num">${reward.supporterNum }</p>
            <p class="reward-funding-unit">명</p>

            <br>

            <div class="reward-funding-btn-area">
                <div class="reward-funding-btn"><p>펀딩하기</p></div>
                <div class="reward-funding-like"><p>
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