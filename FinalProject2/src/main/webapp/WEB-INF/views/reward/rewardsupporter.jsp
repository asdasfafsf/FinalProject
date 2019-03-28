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
				<input type="hidden" id="rewardNo" value="${rewardNo}">
				<input type="hidden" id="supportLength" value="${supportLength }"/>
                
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
            <div class='reward-supporter reward-supporter-basic' style='margin: 5px 5px 5px 5px;'>
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
            	<div id="left-page"class='reward-supporter-page-btn reward-page-left-non-active'></div>
            	<c:forEach items="${pageBar }" var="page" varStatus="status">
            	
            	<div style='display:inline-block; font-family:NanumSquareRound; vertical-align:middle;' class='page<c:if test="${status.count eq 1}"> curpage</c:if>'>${page }</div>
            	</c:forEach>
            	<div id="right-page"class='reward-supporter-page-btn<c:if test="${supportLength > 5}"> reward-page-right</c:if><c:if test="${supportLength < 6 }"> reward-page-right-non-active</c:if>'></div>
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
    
    <script type="text/javascript">
    	$(function(){
    		onClickPage();
    		onClickPreBtn();
    		onClickNextBtn();
    		onClickSupporterBasic();
    	});
    	
    	function onClickSupporterBasic() {
    		$('.reward-supporter-basic').on('click', function(e){
    			var supportNo = $(this).children().children('rewardSupportNo').val();
    			
    			
    			$.ajax({
    				type:'post',
    				url:getContextPath() + '/project/reward/supportdetail',
    				data:supportNo,
    				dataType:'json',
    				success:function(data){
    					console.log('성공');
    					console.log(data);
    				}, error:function(error) {
    					console.log(error);
    				}
    			});
    			
    		});
    	}
    	
    
    	
    	function onClickPage() {
    		$('.page').off('click').on('click', function(e){
    			if($(this).attr('class').indexOf('curpage') != -1) {
    				console.log('자기 페이지는 요청안보낼꺼에요 ㅎㅎ');
    				return;
    			}
    		
    			
    			requestNextPageSupporterList(parseData($(this).text()));
    			
    			$('.page').removeClass('curpage');
    			$(this).addClass('curpage');
    			
    			if ($(this).prevAll().length == 1 && $(this).text() == 1) {
    				$('#left-page').addClass('reward-page-left-non-active');
    				$('#left-page').removeClass('reward-page-left');			
    			} else if ($(this).prevAll().length > 1) {
    				$('#left-page').removeClass('reward-page-left-non-active');
    				$('#left-page').addClass('reward-page-left');
    			}
    			if ($(this).nextAll().length == 1 && Number($('#supporterLength').val()) > (5 * Number($(this).text().trim()))) {
    				$('#right-page').addClass('reward-page-right-non-active');
    				$('#right-page').removeClass('reward-page-right');
    			} else if ($(this).nextAll().length > 1) {
    				$('#right-page').removeClass('reward-page-right-non-active');
    				$('#right-page').addClass('reward-page-right');
    			}
    			
    			var supportLength = Number($('#supportLength').val());
    			var curPageValue = Number($(this).text()) * 5;
    			
    			console.log(curPageValue);
    			console.log(supportLength);
    			console.log('머하세요??');
    			
    			if((curPageValue) >= supportLength) {
     				$('#right-page').addClass('reward-page-right-non-active');
    				$('#right-page').removeClass('reward-page-right');
    			} else {
    				$('#right-page').removeClass('reward-page-right-non-active');
    				$('#right-page').addClass('reward-page-right');	
    			}
    		});
    	}
    	
    	function onClickPreBtn() {
    		$('#left-page').off('click').on('click', function(e){
    			if($(this).attr('class').indexOf('non-active') != -1) {
    				console.log('ㅇ전페이지가 없어요!');
    				return;
    			}
    			
     			if ($('.curpage').prevAll().length != 1) {
    				$('.curpage').prev().trigger('click');
    			} else {
    				var curPage = $('.curpage').text().trim();
    				var pageNum = $('#supportLength').val() - (5 * Number(curPage));
    				var willMakePageNum = 5
    				var startPageNum = Number(curPage) - 5;
    				
    				reloadPageBar(startPageNum, willMakePageNum);
    				$('.page:eq(' + ($('.page').length - 1) + ')').trigger('click');
    			}
    		});
    	}
    	
    	function onClickNextBtn() {
    		$('#right-page').off('click').on('click', function(e){
    			if($(this).attr('class').indexOf('non-active') != -1) {
    				console.log('ㅇ전페이지가 없어요!');
    				return;
    			}
    			
    			
    			if ($('.curpage').nextAll().length != 1) {
    				$('.curpage').next().trigger('click');
    			} else {
    				var curPage = $('.curpage').text().trim();
    				var pageNum = $('#supportLength').val() - (5 * Number(curPage));
    				var willMakePageNum = Math.ceil(Number(pageNum) / 5);
    				var startPageNum = Number(curPage) + 1;
    				
    				console.log(curPage);
    				console.log(pageNum);
    				console.log(willMakePageNum);
    				console.log(startPageNum);
    				
    				reloadPageBar(startPageNum, willMakePageNum);
    				$('.page:eq(0)').trigger('click');
    			}
    		});
    	}
    	
    	function reloadPageBar(startPageNum, willMakePageNum) {
    		
    		var page = $('.page').removeClass('curpage');
    		$(page).hide();
    		
    		for (var i = 0; i < 5; i++) {
    			$('.page:eq(' + i + ')').text((Number(startPageNum) + Number(i)));
    		}
    		
    		for (var i = 0; i < willMakePageNum; i++) {
    			$('.page:eq(' + i + ')').show();
    		}
    	}
    	
    	
    	function requestNextPageSupporterList(data) {
    		$.ajax({
    			type :'post',
    			url : getContextPath() + '/project/reward/supporter/nextpage',
    			data : JSON.stringify(data),
    			dataType : 'json',
    			contentType : 'application/json',
    			success : function(data){
    				console.log(data);
    				console.log('성공');
    				
    				setRewardSupporterBasicInfo(data);
    				
    			}, error : function(error) {
    				console.log('dpfj');
    				console.log(error);
    			}
    		});
    	}
    	
    	function parseData(pageNo) {
    		var rewardNo = $('#rewardNo').val();
    		
    		var param= {};
    		param.rewardNo = rewardNo.trim();
    		param.requestPage = pageNo;
    		
    		console.log(param);
    		
    		return param;
    	}
    	
    	function setRewardSupporterBasicInfo(datas) {
    		for (var i = 0; i < datas.length; i++) {
    			var data = datas[i];
    			
    			if($('.reward-supporter-basic:eq(' + i +')').css('display') == 'none'){
    				$('.reward-supporter-basic:eq(' + i +')').slideToggle(250);
    				$('.reward-supporter-basic:eq(' + i +')').css('display','inline-block');
    			};
    			$('.reward-supporter-basic:eq(' + i +') .rewardSupportNo').val(data.SUPPORTNO);
    			$('.reward-supporter-basic:eq(' + i +') .supporter-name').text(data.USERNAME);
    			$('.reward-supporter-basic:eq(' + i +') .supporter-profilephoto').css('background-image','url("' + getContextPath() + data.USERPROFILEPHOTO +'")');
 
    			
    		}
    		
    		for (var i = datas.length; i < 5; i++) {
    			$('.reward-supporter-basic:eq(' + i +')').slideToggle(250);
    			$('.reward-supporter-basic:eq(' + i +') .rewardSupportNo').val('');
    			$('.reward-supporter-basic:eq(' + i +') .supporter-name').text('');
    			$('.reward-supporter-basic:eq(' + i +') .supporter-profilephoto').css('background-image','');
    		}
    	}
    	
    	
    
    </script>

    
	<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>
</div>



