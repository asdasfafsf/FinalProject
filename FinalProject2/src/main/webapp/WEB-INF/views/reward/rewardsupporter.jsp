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
        <div class="reward-header-img" style='background-image:url("${pageContext.request.contextPath}${projectProfile }")'></div>
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
            <li class="reward-li-selected"><div class="reward-li-text-wrapper"><p>서포터</p></div></li>
    </header>
    
 <div class='reward-supporter-wrapper' >
 		<div class='reward-supporter-filter' style='padding:10px;'>
 			<select class='reward-supporter-filter2' style='display:inline-block; margin-right:50px; font-family:NanumSquareRound;'>
 				<option value="0">전체</option>
 				<option value="2">결제완료</option>
 				<option value="4">배송중</option>
 			</select>
 			
 			
 			
 			<input type="text"  class='reward-supporter-name-input' style="display:inline-block; width:200px; font-family:NanumSquareRound;">
 		</div>
 
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
                        이름없음
                    </div>

                    <div class="supporter-tail">
                        님의 후원
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
    		onClickSelectOption();
    		onInputSupporterName();
    	});
    	
    	function onClickSelectOption() {
 			$('.reward-supporter-filter2').off('change').on('change', function(e){
 		
 				
 				ajaxSupporterFilter();
 
 			});
 			
 	
    	}

    	function onInputSupporterName() {
    		$('.reward-supporter-name-input').off('input').on('input', function(e){
    	
    			
    			ajaxSupporterFilter();
    			

    	
    		})
    	}
    	
    	function ajaxSupporterFilter() {
    		var data = parseData(1);
    		
    		if ($('.reward-supporter-filter2').val() != 0) {
    			data.supportstate = Number($('.reward-supporter-filter2').val());
    		}
    		
    		if ($('.reward-supporter-name-input').val().trim().length != 0) {
    			
    			data.username = $('.reward-supporter-name-input').val();
    		}
    		
    		$.ajax({
    			type :'post',
    			url : getContextPath() + '/project/reward/supporter/nextpage',
    			data : JSON.stringify(data),
    			dataType : 'json',
    			contentType : 'application/json',
    			success : function(data){
    				
	$('#supportLength').val(data.supportLength);
    				
    				setRewardSupporterBasicInfo(data.data);
    				
    				$('.page').removeClass('curpage');
    				
    				for (var k = 0; k < 5; k++) {
    					var pagee = $('.page:eq(' + k +')');
    					$(pagee[k]).text((k + 1));
    				}
    				
    				$('.page').css('display','none');
    				var pageLength = 0;
    				
    				if (data.supportLength > 25) {
    					pageLength = 25;
    				}
    				
    				pageLength = data.supportLength;
    				
    				pageLength = Math.ceil(pageLength / 5);
    		
    				
    				for (var k = 0; k < pageLength; k++) {
    					var pagee = $('.page:eq(' + k +')');
    					$(pagee).css('display','inline-block');
    				}
    				
    				$('.page:eq(0)').addClass('curpage');
    				setPageBar();
    				
    			}, error : function(error) {
    				
    			}
    		});
    	}

    	
    	function appendSupporterInfo(data) {
    		var removed = $('.reward-supporter-detail-wrapper .reward-supporter-info').nextAll();
    		
    		for (var i = 0; i < removed.length; i++) {
    			$(removed[i]).remove();
    		}
    		
    		if (typeof data == 'undefined') {
    			return;
    		}
    		
    		
    		$('.reward-supporter-detail-wrapper .supporter-name').text(data.USERNAME);
    		$('.reward-supporter-detail-wrapper .reward-supporter').append($('<div/>',{
    			class:'reward-support-line',
    			style:'height:2px; background-color:black;'
    		}));
    		
    		$('.reward-supporter-detail-wrapper .supporter-profilephoto').css('background-image','url(' + getContextPath() + data.USERPROFILEPHOTO +')')
    		
    		
    		var itemList = data.item;
    		var sumOfItemPrice = 0;
    		var sumOfDeliveryPrice = 0;
    		
    		for (var i = 0; i < itemList.length; i++) {
    			var item = itemList[i];
    			
        		$('.reward-supporter-detail-wrapper .reward-supporter').append($('<div/>',{
        			class:'reward-support-itemName',
        			text:item.ITEMNAME
        		}));
        		
        		$('.reward-supporter-detail-wrapper .reward-supporter').append($('<div/>',{
        			class:'reward-support-itemContent',
        			text:item.ITEMINTRODUCE
        		}));
        		
        		if (typeof item.ITEMSELECTOPTIONCONTENT != "undefined") {
            		$('.reward-supporter-detail-wrapper .reward-supporter').append($('<div/>',{
            			class:'reward-supporter-selectOptionArea'
            		}));
            		
            		$('.reward-supporter-detail-wrapper .reward-supporter .reward-supporter-selectOptionArea').append($('<div/>',{
            			class:'supporter-title',
            			text:'선택한 옵션'
            		}));
            		
            		$('.reward-supporter-detail-wrapper .reward-supporter .reward-supporter-selectOptionArea').append($('<div/>',{
            			class:'reward-supporter-selectOption',
            			text:item.ITEMSELECTOPTIONCONTENT
            		}));
        		}
        		
        		if (typeof item.INPUTOPTIONLIST !="undefined") {
            		$('.reward-supporter-detail-wrapper .reward-supporter').append($('<div/>',{
            			class:'reward-supporter-inputOptionArea',
            			
            		}));
            		
            		for(var j = 0; j <item.INPUTOPTIONLIST.length; j++) {
                		$('.reward-supporter-detail-wrapper .reward-supporter .reward-supporter-inputOptionArea').append($('<div/>',{
                			class:'supporter-title',
                			text:'입력한 옵션',
                		}));
                		
                		$('.reward-supporter-detail-wrapper .reward-supporter .reward-supporter-inputOptionArea').append($('<div/>',{
                			class:'reward-supporter-inputOptionTitle',
                			text:item.INPUTOPTIONLIST[i].OPTIONTITLE,
                		}));
                		
                		$('.reward-supporter-detail-wrapper .reward-supporter .reward-supporter-inputOptionArea').append($('<div/>',{
                			class:'reward-supporter-inputOptionContent',
                			text:item.INPUTOPTIONLIST[i].OPTIONCONTENT,
                		}));
            		}
        			
        		}
        		

        		
         		$('.reward-supporter-detail-wrapper .reward-supporter').append($('<div/>',{
        			class:'reward-supporter-itemNumarea',
        			text:'수량 ' + item.SUPPORTNUM + ' 개'
        		}));
         		
        	
    		}
    		
    		$('.reward-supporter-detail-wrapper .reward-supporter').append($('<div/>',{
    			class:'reward-support-line'
    		}));
    		
    		$('.reward-supporter-detail-wrapper .reward-supporter').append($('<div/>',{
    			class:'reward-support-address'
    		}));
    		
    		
    		$('.reward-supporter-detail-wrapper .reward-supporter .reward-support-address').append($('<div/>',{
    			class:'supporter-title',
    			text:'우편번호'
    		}));
    		
    		$('.reward-supporter-detail-wrapper .reward-supporter .reward-support-address').append($('<div/>',{
    			class:'reward-support-itemContent',
    			text:data.ZIPNO
    		}));
    		
    		$('.reward-supporter-detail-wrapper .reward-supporter .reward-support-address').append($('<div/>',{
    			class:'supporter-title',
    			text:'주소'
    		}));
    		
    		$('.reward-supporter-detail-wrapper .reward-supporter .reward-support-address').append($('<div/>',{
    			class:'reward-support-itemContent',
    			text:data.ADDRESS
    		}));
    		
    		$('.reward-supporter-detail-wrapper .reward-supporter .reward-support-address').append($('<div/>',{
    			class:'supporter-title',
    			text:'상세주소'
    		}));
    		
    		$('.reward-supporter-detail-wrapper .reward-supporter .reward-support-address').append($('<div/>',{
    			class:'reward-support-itemContent',
    			text:data.ADDRESSDETAIL
    		}));
    		
    		$('.reward-supporter-detail-wrapper .reward-supporter .reward-support-address').append($('<div/>',{
    			class:'supporter-title',
    			text:'수령인 이름'
    		}));
    		
    		$('.reward-supporter-detail-wrapper .reward-supporter .reward-support-address').append($('<div/>',{
    			class:'reward-support-itemContent',
    			text:data.RECEIVERNAME
    		}));
    		
    		$('.reward-supporter-detail-wrapper .reward-supporter .reward-support-address').append($('<div/>',{
    			class:'supporter-title',
    			text:'연락처'
    		}));
    		
    		$('.reward-supporter-detail-wrapper .reward-supporter .reward-support-address').append($('<div/>',{
    			class:'reward-support-itemContent',
    			text:data.ADDRESSPHONE
    		}));
    		
    		$('.reward-supporter-detail-wrapper .reward-supporter').append($('<div/>',{
    			class:'reward-support-line'
    		}));
    		
    		
    		$('.reward-supporter-detail-wrapper .reward-supporter').append($('<div/>',{
    			class:'reward-support-delivery-set'
    		}));
    		
    		$('.reward-supporter-detail-wrapper .reward-support-delivery-set').append($('<div/>',{
    			class:'delivery-company',
    			style:'font-weight:bold; text-align:center; width:80px;display: inline-block; vertical-align: middle; font-family: NanumSquareRound;',
    			text:'택배사'
    		}));
    		
    		$('.reward-supporter-detail-wrapper .reward-support-delivery-set').append($('<input/>',{
    			class:'delivery-company-name',
    			type:'text',
    			style:"width:90px;vertical-align: middle; display: inline-block;"
    		}));
    		
       		$('.reward-supporter-detail-wrapper .reward-support-delivery-set').append($('<br/>',{
    	
    		}));
       		$('.reward-supporter-detail-wrapper .reward-support-delivery-set').append($('<br/>',{
       	    	
    		}));
    		
    		$('.reward-supporter-detail-wrapper .reward-support-delivery-set').append($('<div/>',{
    			class:'delivery-company',
    			style:'font-weight:bold; text-align:center; width:80px;display: inline-block; vertical-align: middle; font-family: NanumSquareRound;',
    			text:'운송장번호'
    		}));
    		
    		$('.reward-supporter-detail-wrapper .reward-support-delivery-set').append($('<input/>',{
    			class:'delivery-company-number',
    			type:'number',
    			style:"width:150px;vertical-align: middle; display: inline-block;"
    		}));
    		
    		
       		$('.reward-supporter-detail-wrapper .reward-support-delivery-set').append($('<br/>',{
    	
    		}));
       		$('.reward-supporter-detail-wrapper .reward-support-delivery-set').append($('<br/>',{
       	    	
    		}));
       		
       		
       		
       		$('.reward-supporter-detail-wrapper .reward-support-delivery-set').append($('<div/>',{
    			class:'reward-btn-area',
    			style:'text-align:right;',
    			html:'<div class="reward-delivery-btn">배송 설정</div>'
    		}));
       		
       		
       		$('.reward-delivery-btn').on('click', function(e){
       			if($('.delivery-company-name').val().trim().length == 0 || $('.delivery-company-name').val().trim().length > 15) {
       				alertBox(function(){},'택배사 이름을 확인해주세요', '알림','확인');
       				return;
       			} 
       			confirmBox(function(){
       				var supportNo = $('.reward-supporter-active .rewardSupportNo').val();
       				
       				$.ajax({
       					type:'post',
        				url:getContextPath() + '/project/reward/supportdelivery',
        				data:JSON.stringify({'supportNo':supportNo,'PASCAL' :$('.delivery-company-name').val(), 'WAYBILLNO':$('.delivery-company-number').val()}),
        				dataType:'json',
        				contentType:'application/json',
        				success:function(data){
        					
        					
        					if (data.result == 1) {
        						alertBox('','저장 완료!','알림','확인');
        					} else if (data.result == 0) {
        						confirmBox(function(){
        							
        						},'','이미 배송중인 후원입니다. 오배송으로 인한 배송지 수정 등은 관리자에게 문의하세요.','알림','확인','취소');
        					}
        					
        				}, error:function(error) {
        					
        				}
       					
       				})
       				
       			},'','배송 정보를 저장합니다.','알림','확인','취소');
       		})
    		
 
    	}
    	
    	
    	function onClickSupporterBasic() {
    		$('.reward-supporter-basic').on('click', function(e){
    			var supportNo = $(this).children('.reward-supporter-info').children('.hidden-area').children('.rewardSupportNo').val();
    
    			
    			var basic = $(this);
    			
    			
    			$.ajax({
    				type:'post',
    				url:getContextPath() + '/project/reward/supportdetail',
    				data:JSON.stringify({'supportNo':supportNo, 'rewardNo':$('#rewardNo').val()}),
    				dataType:'json',
    				contentType:'application/json',
    				success:function(data){
    					
    					$('.reward-supporter-active').removeClass('reward-supporter-active');
    	    			$(basic).addClass('reward-supporter-active');
    					appendSupporterInfo(data);
    				}, error:function(error) {
    					
    				}
    			});
    			
    		});
    	}
    	
    
    	
    	function onClickPage() {
    		$('.page').off('click').on('click', function(e){
    			if($(this).attr('class').indexOf('curpage') != -1) {
    			
    				return;
    			}
    		
    			
    			requestNextPageSupporterList(parseData($(this).text()));
    			
    			$('.page').removeClass('curpage');
    			$(this).addClass('curpage');
    			$('.reward-supporter-active').removeClass('reward-supporter-active');
    			
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
    			
    
    			if((curPageValue) >= supportLength) {
     				$('#right-page').addClass('reward-page-right-non-active');
    				$('#right-page').removeClass('reward-page-right');
    			} else {
    				$('#right-page').removeClass('reward-page-right-non-active');
    				$('#right-page').addClass('reward-page-right');	
    			}
    		});
    	}
    	
    	function setPageBar() {
    		$('.page').removeClass('curpage');
			$('.page:eq(0)').addClass('curpage');
			$('.reward-supporter-active').removeClass('reward-supporter-active');
			
			if ($('.page:eq(0)').prevAll().length == 1 && $('.page:eq(0)').text() == 1) {
				$('#left-page').addClass('reward-page-left-non-active');
				$('#left-page').removeClass('reward-page-left');			
			} else if ($('.page:eq(0)').prevAll().length > 1) {
				$('#left-page').removeClass('reward-page-left-non-active');
				$('#left-page').addClass('reward-page-left');
			}
			if ($('.page:eq(0)').nextAll().length == 1 && Number($('#supporterLength').val()) > (5 * Number($(this).text().trim()))) {
				$('#right-page').addClass('reward-page-right-non-active');
				$('#right-page').removeClass('reward-page-right');
			} else if ($('.page:eq(0)').nextAll().length > 1) {
				$('#right-page').removeClass('reward-page-right-non-active');
				$('#right-page').addClass('reward-page-right');
			}
			
			var supportLength = Number($('#supportLength').val());
			var curPageValue = Number($('.page:eq(0)').text()) * 5;
			
	
			if((curPageValue) >= supportLength) {
 				$('#right-page').addClass('reward-page-right-non-active');
				$('#right-page').removeClass('reward-page-right');
			} else {
				$('#right-page').removeClass('reward-page-right-non-active');
				$('#right-page').addClass('reward-page-right');	
			}
    	}
    	
    	function onClickPreBtn() {
    		$('#left-page').off('click').on('click', function(e){
    			if($(this).attr('class').indexOf('non-active') != -1) {
    				
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
    				
    				return;
    			}
    			
    			
    			if ($('.curpage').nextAll().length != 1) {
    				$('.curpage').next().trigger('click');
    			} else {
    				var curPage = $('.curpage').text().trim();
    				var pageNum = $('#supportLength').val() - (5 * Number(curPage));
    				var willMakePageNum = Math.ceil(Number(pageNum) / 5);
    				var startPageNum = Number(curPage) + 1;
    				
    		
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
    		
    		
    				
    				setRewardSupporterBasicInfo(data.data);
    				
    			
    				
    			}, error : function(error) {
    			
    			}
    		});
    	}
    	
    	function parseData(pageNo) {
    		
    		var rewardNo = $('#rewardNo').val();
    		
    		var param= {};
    		param.rewardNo = rewardNo.trim();
    		param.requestPage = pageNo;
    		
    		if ($('.reward-supporter-filter2').val() != 0) {
    			param.supportstate = Number($('.reward-supporter-filter2').val());
    		}
    		
    		if ($('.reward-supporter-name-input').val().trim().length != 0) {
    			
    			param.username = $('.reward-supporter-name-input').val();
    		}
    		
    	
    		
    		return param;
    	}
    	
    	function setRewardSupporterBasicInfo(datas) {
    		for (var i = datas.length; i < 5; i++) {
    			$('.reward-supporter-basic:eq(' + i +')').slideUp(250);
    			$('.reward-supporter-basic:eq(' + i +') .rewardSupportNo').val('');
    			$('.reward-supporter-basic:eq(' + i +') .supporter-name').text('');
    			$('.reward-supporter-basic:eq(' + i +') .supporter-profilephoto').css('background-image','');
    		}
    		
    		for (var i = 0; i < datas.length; i++) {
    			var data = datas[i];
    			
    			if($('.reward-supporter-basic:eq(' + i +')').css('display') == 'none'){
    				$('.reward-supporter-basic:eq(' + i +')').slideDown(250);
    				$('.reward-supporter-basic:eq(' + i +')').css('display','inline-block');
    			};
    			$('.reward-supporter-basic:eq(' + i +') .rewardSupportNo').val(data.SUPPORTNO);
    			$('.reward-supporter-basic:eq(' + i +') .supporter-name').text(data.USERNAME);
    			$('.reward-supporter-basic:eq(' + i +') .supporter-profilephoto').css('background-image','url("' + getContextPath() + data.USERPROFILEPHOTO +'")');
 
    			
    		}
    	
    	}
    	
    	
    
    </script>

    
	<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>
</div>



