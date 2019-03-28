<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 



<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
    <script src="/test/resources/js/common/Alert.js"></script>
<script src="/test/resources/js/common/Confirm.js"></script>
<link rel="stylesheet" href="/test/resources/css/common/Alert.css"/>
<link rel="stylesheet" href="/test/resources/css/common/Confirm.css"/>
    <script src="/test/resources/js/common/jquery-3.3.1.js"></script>
    <script src="/test/resources/js/reward/RewardHeader.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1|Jua|Nanum+Gothic|Open+Sans|Roboto|Sunflower:300" rel="stylesheet">
    <link rel="stylesheet" href="/test/resources/css/reward/RewardHeader.css"></link>
	<link rel="stylesheet" href="/test/resources/css/reward/RewardSupporter.css"></link>
    <link rel="stylesheet" href="/test/resources/css/reward/RewardFont.css"></link>
    <script src="/test/resources/js/common/context.js"></script>
    <script src="/test/resources/js/common/LoginCheck.js"></script>
     <script src="/test/resources/js/reward/RewardRight.js"></script>
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextPath","${pageContext.request.contextPath}");
</script>


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
            <li class="reward-li"><div class="reward-li-text-wrapper"><p>스토리</p></div></li>
            <li class="reward-li" style='display:none;'><div class="reward-li-text-wrapper"><p>공지사항</p></div></li>
            <li class="reward-li"><div class="reward-li-text-wrapper"><p>댓글</p></div></li>
            <li class="reward-li selected"><div class="reward-li-text-wrapper"><p>서포터</p></div></li>
    </header>
    
    ${supporterList }

 <div class='reward-supporter-wrapper' >
        <div class="reward-supporter-list-wrapper" style="width:430px">
        	<c:forEach items="${supporterList }" var="supporter">
            <div class='reward-supporter reward-supporter-basic reward-supporter-active' style='margin: 5px 5px 5px 5px;'>
                <div class='reward-supporter-info'>
                    <div class='hidden-area'>
                        <input type="hidden" class="rewardSupportNo" value="${supporter.SUPPORTNO }">
                    </div>
                    <div class='profilephoto-wrapper'>
                        <div class='supporter-profilephoto' style='background-image:url("${pageContext.request.contextPath}${supporter.USERPROFILEPHOTO }")'>

                        </div>
                    </div>

                    <div class="supporter-name">
                        ${supporter.USERNAME }
                    </div>

                    <div class="supporter-tail">
                        님의 후원
                    </div>

                </div>
            </div>
            </c:forEach>
            
            <div class='reward-supporter-pagebar' style='text-align:center;'>
            	<div class='reward-supporter-page-btn reward-page-left-non-active'></div>
            	<div style='display:inline-block; font-family:NanumSquareRound; vertical-align:middle;'class='curpage'>1</div>
            	<div class='reward-supporter-page-btn reward-page-right'></div>
            </div>
        </div>
        <div class="reward-supporter-detail-wrapper">
            <div class='reward-supporter'>
                <div class='reward-supporter-info'>
                    <div class='hidden-area'>
                        <input type="hidden" class="rewardSupportNo">
                    </div>
                    <div class='profilephoto-wrapper'>
                        <div class='supporter-profilephoto' >

                        </div>
                    </div>

                    <div class="supporter-name">
                        한원근
                    </div>

                    <div class="supporter-tail">
                        님의 후원
                    </div>

                </div>

                <div class="reward-support-line" style='height:2px; background-color:black;'></div>
                <div class="reward-support-itemName">후원한 아이템이름1</div>
                <div class="reward-support-itemContent">후원한 아이템설명</div>

                <div class="reward-supporter-selectOptionArea">
                    <div class="supporter-title">선택한 옵션</div>
                    <div class="reward-supporter-selectOption">후원한 아이템 선택옵션</div>
                </div>
                <div class="reward-supporter-inputOptionArea">
                    <div class="supporter-title">입력한 옵션</div>
                    <div class="reward-supporter-inputOptionTitle">입력옵션 1</div>
                    <div class="reward-supporter-inputOptionContent">후원한 아이템 선택옵션</div>

                </div>

                <div class="reward-supporter-itemNumarea">
                    수량 3 개
                </div>

                <div class="reward-support-line"></div>
                <div class="reward-support-itemName">후원한 아이템이름1</div>
                <div class="reward-support-itemContent">후원한 아이템설명</div>

                <div class="reward-supporter-selectOptionArea">
                    <div class="supporter-title">선택한 옵션</div>
                    <div class="reward-supporter-selectOption">후원한 아이템 선택옵션</div>
                </div>
                <div class="reward-supporter-inputOptionArea">
                    <div class="supporter-title">입력한 옵션</div>
                    <div class="reward-supporter-inputOptionTitle">입력옵션 1</div>
                    <div class="reward-supporter-inputOptionContent">후원한 아이템 선택옵션</div>

                </div>

         
                    <div class="reward-supporter-itemNumarea">
                        수량 3 개
                    </div>
                    
                                 <div class="reward-support-line"></div>

                    <div class="reward-support-address">
                        <div class="supporter-title" style='font-size:1em;'>우편번호</div>
                        <div class="reward-support-itemContent">6302</div>

                        <div class="supporter-title" style='font-size:1em;'>주소</div>
                        <div class="reward-support-itemContent">서울시 강남구 논현로</div>

                        <div class="supporter-title" style='font-size:1em;'>상세주소</div>
                        <div class="reward-support-itemContent">집 좋은집</div>

                        <div class="supporter-title" style='font-size:1em;'>연락처</div>
                        <div class="reward-support-itemContent">01041273331</div>
                    </div>


                    <div class="reward-support-line"></div>

                    <div class="reward-support-delivery-set">
                        <div class="delivery-company"
                            style='font-weight:bold; text-align:center; width:80px;display: inline-block; vertical-align: middle; font-family: NanumSquareRound;'>
                            택배사</div>
                        <input type="text" class="delivery-company-name"
                            style="width:90px;vertical-align: middle; display: inline-block;">
                        <br>

                        <div class="delivery-company"
                            style='font-weight:bold; text-align:center; width:80px;display: inline-block; vertical-align: middle; font-family: NanumSquareRound;'>
                            운송장번호</div>
                        <input type="number" class="delivery-company-name"
                            style="width:150px;vertical-align: middle; display: inline-block;">
                        <br>
                        <div class="reward-btn-area" style='text-align: right;'>
                            <div class="reward-delivery-btn">배송 설정</div>
                        </div>

                    </div>
          
            </div>

        </div>



    </div>

    
	<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>
</div>



