<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">


<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>


    <script src="/test/resources/js/common/jquery-3.3.1.js"></script>
    <script src="/test/resources/js/reward/RewardHeader.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1|Jua|Nanum+Gothic|Open+Sans|Roboto|Sunflower:300" rel="stylesheet">
    <link rel="stylesheet" href="/test/resources/css/reward/RewardHeader.css"></link>
    <link rel="stylesheet" href="/test/resources/css/reward/RewardRight.css"></link>
    <link rel="stylesheet" href="/test/resources/css/reward/RewardComment.css"></link>
    <link rel="stylesheet" href="/test/resources/css/reward/RewardFont.css"></link>
    
    <jsp:include page="/WEB-INF/views/common/util.jsp" flush="true">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>
   
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
                    <div class="reward-comment-wrapper">
                        <div class="reward-comment-writer-info-area">
                            <div class="reward-comment-writer-profilephoto-wrapper">
                                <div class="reward-comment-writer-profilephoto">

                                </div>
                            </div>
                            <div class="reward-comment-writer-name-wrapper">
                                <p class="reward-comment-writer-name">한원근</p>
                                <p class="reward-comment-write-date">7분전</p>
                            </div>
                        </div>

                        <div class="reward-comment-content-area">
                            안녕하세요 반갑습니다!

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
                </div>

                <div class="reward-comment-wrapper">
                        <div class="reward-comment-writer-info-area">
                            <div class="reward-comment-writer-profilephoto-wrapper">
                                <div class="reward-comment-writer-profilephoto">

                                </div>
                            </div>
                            <div class="reward-comment-writer-name-wrapper">
                                <p class="reward-comment-writer-name">한원근</p>
                                <p class="reward-comment-write-date">7분전</p>
                            </div>
                        </div>

                        <div class="reward-comment-content-area">
                            안녕하세요 반갑습니다!

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
                </div>

            </div>
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
                <div class="reward-funding-like"><p>999+</p></div>
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