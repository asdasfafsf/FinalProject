<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>  -->
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reward_list.css"> 
	


<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>

	<div class="reward_list_full_screen_background">
		<div class="reward_list_full_screen">
		
			<div class="reward_category_list_wrap" >
				<img class="reward_category_list_back_button" id="reward_category_list_back_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_back2.png"/>
				<img class="reward_category_list_next_button" id="reward_category_list_next_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_next2.png"/>
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
						<option value="4">펀딩중</option>
						<option value="3">오픈예정</option>
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

<script>

	var global_reward_category_item_list_page = 1;
	var global_isLoding=false;
	
	$(document).ready(function(){
	
		$(window).scrollTop(0);
		
		//스크롤 페이징
		$(window).scroll(function() {
		    if ($(window).scrollTop() == $(document).height() - $(window).height()+56) {
		   	 $.ajax({
		   		url:'${pageContext.request.contextPath}/rewardCategoryPage',
		   		dataType:'json',
		   		data:{'cPage':global_reward_category_item_list_page,'categoryNum':$('#reward_category_title').attr("value"),"rewardState":$('#reward_state_filter').val(),"listFilter":$('#reward_watch_filter').val()},
		   		success:function(data){
		   			if(data.length>0&&!(global_isLoding)){
		   				global_isLoding=true;
		   				global_reward_category_item_list_page++;
		   				$('.reward_category_content').append($('<img/>',{
		   					id:'reward_list_loading',
		   					src:'${pageContext.request.contextPath}/resources/images/common/loading.gif'
		   				}));
		   				setTimeout(function(){
							$('#reward_list_loading').remove();
							for(var i=0;i<data.length;i++){
								$('.reward_category_content').append($('<div/>',{
					   				id:data[i].REWARD_NO,
					   				class:'reward_category_content_item',
					   				style:'margin-right:15px',
					   				onclick:"clickReward(this);"
					   			}));
								$('.reward_category_content_item:nth-child(3n)').css("margin-right","-10px");
								
					   			$('#'+data[i].REWARD_NO+'').append($('<img/>',{
					   				src:'${pageContext.request.contextPath}'+data[i].REWARD_REPRESENT_IMAGE
					   			}));
					   			$('#'+data[i].REWARD_NO+'').append($('<div/>',{
					   				id: data[i].REWARD_NO+'_inform1',
					   				class:'reward_category_content_item_inform1'
					   			}));
					   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h3/>',{
					   				class:'category_item_punding_title',
					   				text:data[i].REWARD_SHORT_NAME
					   			}));
					   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h5/>',{
					   				class:'category_item_category_name',
					   				text:data[i].REWARD_CATEGORY_NAME,
					   				style:'margin-right:5px'
					   			}));
					   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h5/>',{
					   				text:'|',
					   				style:'margin-right:5px'
					   			}));
					   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h5/>',{
					   				class:'category_item_company_name',
					   				text:data[i].REWARD_MC_NAME
					   			}));
					   			
					   			if(data[i].REWARD_STATE!=3){
						   			$('#'+data[i].REWARD_NO+'').append($('<div/>',{
						   				id:data[i].REWARD_NO+'_persentBar_background',
						   				class:'reward_category_persentBar_background'
						   			}));
						   			$('#'+data[i].REWARD_NO+'_persentBar_background').append($('<div/>',{
						   				id:data[i].REWARD_NO+'_persentBar',
						   				class:'reward_category_persentBar'
						   			}));
						   			
						   			//퍼센트바 채우기
						   			$('#'+data[i].REWARD_NO+'_persentBar').css("width",(3*data[i].REWARD_ACHIEVEMENT_PERSENT+'px')); 
					   		
						   			$('#'+data[i].REWARD_NO+'').append($('<div/>',{
						   				id:data[i].REWARD_NO+'_inform2',
						   				class:'reward_category_content_item_inform2'
						   			}));
					   			
						   			$('#'+data[i].REWARD_NO+'_inform2').append($('<h3/>',{
						   				class:'category_item_punding_achievement_quotient',
						   				text:data[i].REWARD_ACHIEVEMENT_PERSENT+'%'
						   			}));
						   			
						   			$('#'+data[i].REWARD_NO+'_inform2').append($('<h4/>',{
						   				class:'category_item_punding_sum',
						   				text:data[i].REWARD_PRESENT_COLLECTION.toLocaleString()+'원'
						   			}));
					   			
						   			$('#'+data[i].REWARD_NO+'_inform2').append($('<h4/>',{
						   				class:'category_item_punding_remain_date',
						   				text:data[i].REWARD_REMAIN_DATE+'일 남음'
						   			}));
					   			}
				   			}							
			   				global_isLoding=false;
						},1000);
		   			}
					
		   		}
		   	 });
		   	 
		    }
		});
		
		
	});
//////////////ready 끝


	//카테고리버튼 호버
	$('#reward_category_list_next_button').hover(function(){
		$('#reward_category_list_next_button').attr('src','${pageContext.request.contextPath}/resources/images/icon/slide_next3_hover.png');
	},function(){
		$('#reward_category_list_next_button').attr('src','${pageContext.request.contextPath}/resources/images/icon/slide_next2.png');
	});
	$('#reward_category_list_back_button').hover(function(){
		$('#reward_category_list_back_button').attr('src','${pageContext.request.contextPath}/resources/images/icon/slide_back3_hover.png');
	},function(){
		$('#reward_category_list_back_button').attr('src','${pageContext.request.contextPath}/resources/images/icon/slide_back2.png');
	});
	
	//카테고리 넥스트버튼 클릭시 나머지 카테고리 보임
	$('#reward_category_list_next_button').on('click',function(){
		$('#reward_category_list>ul').animate({
			left:'-=920px'
		});
		$('#reward_category_list').animate({
			left:'+=100px'
		});
		$('#reward_category_list_next_button').css('display','none');
		$('#reward_category_list_back_button').css('display','block');
	});
	//카테고리 백버튼 클릭시 처음 카테고리 목록으로 바뀜
	$('#reward_category_list_back_button').on('click',function(){
		$('#reward_category_list>ul').animate({
			left:'+=920px'
		});
		$('#reward_category_list').animate({
			left:'-=100px'
		});
		$('#reward_category_list_next_button').css('display','block');
		$('#reward_category_list_back_button').css('display','none');
	});
	
	//카테고리 클릭 이벤트
	function clickCategory(targ){
		global_reward_category_item_list_page=1;
		if(targ=='option'){
			if($('#reward_state_filter').val()==3){
				$('#reward_watch_filter').val(1);
			}
		}
		else{
			$('#reward_category_title').text($(targ).children('p').text());
			$('#reward_category_title').attr('value',$(targ).val());
		}
		$('.reward_category_content').empty();
		$.ajax({
		   		url:'${pageContext.request.contextPath}/rewardCategoryPage',
		   		dataType:'json',
		   		data:{'cPage':0,'categoryNum':$('#reward_category_title').attr("value"),"rewardState":$('#reward_state_filter').val(),"listFilter":$('#reward_watch_filter').val()},
		   		success:function(data){
		   			
					for(var i=0;i<data.length;i++){
			   			$('.reward_category_content').append($('<div/>',{
			   				id:data[i].REWARD_NO,
			   				class:'reward_category_content_item',
			   				style:'margin-right:15px',
			   				onclick:"clickReward(this);"
			   			}));
						$('.reward_category_content_item:nth-child(3n)').css("margin-right","-10px");
						
			   			$('#'+data[i].REWARD_NO+'').append($('<img/>',{
			   				src:'${pageContext.request.contextPath}'+data[i].REWARD_REPRESENT_IMAGE
			   			}));
			   			$('#'+data[i].REWARD_NO+'').append($('<div/>',{
			   				id: data[i].REWARD_NO+'_inform1',
			   				class:'reward_category_content_item_inform1'
			   			}));
			   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h3/>',{
			   				class:'category_item_punding_title',
			   				text:data[i].REWARD_SHORT_NAME
			   			}));
			   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h5/>',{
			   				class:'category_item_category_name',
			   				text:data[i].REWARD_CATEGORY_NAME,
			   				style:'margin-right:5px'
			   			}));
			   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h5/>',{
			   				text:'|',
			   				style:'margin-right:5px'
			   			}));
			   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h5/>',{
			   				class:'category_item_company_name',
			   				text:data[i].REWARD_MC_NAME
			   			}));
			   			
			   			if(data[i].REWARD_STATE!=3){
				   			$('#'+data[i].REWARD_NO+'').append($('<div/>',{
				   				id:data[i].REWARD_NO+'_persentBar_background',
				   				class:'reward_category_persentBar_background'
				   			}));
				   			$('#'+data[i].REWARD_NO+'_persentBar_background').append($('<div/>',{
				   				id:data[i].REWARD_NO+'_persentBar',
				   				class:'reward_category_persentBar'
				   			}));
				   			
				   			//퍼센트바 채우기
				   			$('#'+data[i].REWARD_NO+'_persentBar').css("width",(3*data[i].REWARD_ACHIEVEMENT_PERSENT+'px')); 
				   			
				   			$('#'+data[i].REWARD_NO+'').append($('<div/>',{
				   				id:data[i].REWARD_NO+'_inform2',
				   				class:'reward_category_content_item_inform2'
				   			}));
				   			
					   			$('#'+data[i].REWARD_NO+'_inform2').append($('<h3/>',{
					   				class:'category_item_punding_achievement_quotient',
					   				text:data[i].REWARD_ACHIEVEMENT_PERSENT+'%'
					   			}));
					   			
					   			$('#'+data[i].REWARD_NO+'_inform2').append($('<h4/>',{
					   				class:'category_item_punding_sum',
					   				text:data[i].REWARD_PRESENT_COLLECTION.toLocaleString()+'원'
					   			}));
				   			
				   			$('#'+data[i].REWARD_NO+'_inform2').append($('<h4/>',{
				   				class:'category_item_punding_remain_date',
				   				text:data[i].REWARD_REMAIN_DATE+'일 남음'
				   			}));
			   			}
		   			}
		   			
		   			
		   			
		   		}
		   	 
		   	 });
	}
	
	function clickReward(targ){
		location.href="${pageContext.request.contextPath}/project/reward/"+$(targ).attr("id");
	}
</script>

	
