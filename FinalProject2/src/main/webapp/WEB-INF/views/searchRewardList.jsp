<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/searchRewardList.css"> 
	

<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>

	<div class="reward_list_wrap">
				<div class="search_reward_head">
					<h2 id="search_reward_title" value="0">검색결과</h2>
					<c:if test="${!empty searchRewardList}">
						<select id="reward_watch_filter" onchange="changeFilter('option')">
							<option value="1">최신순</option>
							<option value="2">마감일순</option>
							<option value="3">목표액순</option>
							<option value="4">인기순</option>
							<option value="5">펀딩액순</option>
						</select>
						<select id="reward_state_filter" onchange="changeFilter('option')">
							<option value="4">펀딩중</option>
							<option value="3">오픈예정</option>
							<option value="7">종료</option>
						</select>
					</c:if>
				</div>

				<div class="search_reward_content">
					<c:if test="${empty searchRewardList}">					
							<h1 class="emptySearchListContent">검색 결과가 없습니다</h1>					
					</c:if>
					<c:forEach var="l" items="${searchRewardList}">
						<div class="search_reward_content_item">
							<img src="${pageContext.request.contextPath}${l.REWARD_REPRESENT_IMAGE}"/>
							<div class="search_reward_content_item_inform1">
								<h3 class="search_reward_item_punding_title">${l.REWARD_SHORT_NAME }</h3>
								<h5 class="search_reward_item_category_name">${l.REWARD_CATEGORY_NAME }</h5>
								<h5>|</h5>
								<h5 class="search_reward_item_company_name">${l.REWARD_MC_NAME }</h5>
							</div>
							<div class="search_reward_persentBar_background">
								<div class="search_reward_persentBar" style="width:${l.REWARD_ACHIEVEMENT_PERSENT*3 }px"></div>
							</div>
							<div class="search_reward_content_item_inform2">
								<h3 class="search_reward_item_punding_achievement_quotient"> ${l.REWARD_ACHIEVEMENT_PERSENT }%</h3>
								<h4 class="search_reward_item_punding_sum"><fmt:formatNumber type="number"> ${l.REWARD_PRESENT_COLLECTION }</fmt:formatNumber>원</h4>
								<h4 class="search_reward_item_punding_remain_date">${l.REWARD_REMAIN_DATE }일 남음</h4>
							</div>
						</div>
					</c:forEach>			
				</div>
				
			</div>
			
</body>

<script>

	var global_reward_category_item_list_page = 1;
	var global_isLoding=false;
	
	$(document).ready(function(){
	
		$(window).scrollTop(0);
		
		//스크롤 페이징
		$(window).scroll(function() {

		    if ($(window).scrollTop() == $(document).height() - $(window).height()+117) {
		   	 $.ajax({
		   		url:'${pageContext.request.contextPath}/searchRewardListAjax',
		   		dataType:'json',
		   		data:{'cPage':global_reward_category_item_list_page,"rewardState":$('#reward_state_filter').val(),"listFilter":$('#reward_watch_filter').val(),"main_header_searchbar":'<%=request.getAttribute("searchInform")%>'},
		   		success:function(data){
		   			if(data.length>0&&!(global_isLoding)){
		   				global_isLoding=true;
		   				global_reward_category_item_list_page++;
		   				$('.search_reward_content').append($('<img/>',{
		   					id:'reward_list_loading',
		   					src:'${pageContext.request.contextPath}/resources/images/common/loading.gif'
		   				}));
		   				setTimeout(function(){
							$('#reward_list_loading').remove();
							for(var i=0;i<data.length;i++){
								$('.search_reward_content').append($('<div/>',{
					   				id:data[i].REWARD_NO,
					   				class:'search_reward_content_item',
					   				style:'margin-right:15px'
					   			}));
								$('.search_reward_content_item:nth-child(3n)').css("margin-right","-10px");
								
					   			$('#'+data[i].REWARD_NO+'').append($('<img/>',{
					   				src:'${pageContext.request.contextPath}'+data[i].REWARD_REPRESENT_IMAGE
					   			}));
					   			$('#'+data[i].REWARD_NO+'').append($('<div/>',{
					   				id: data[i].REWARD_NO+'_inform1',
					   				class:'search_reward_content_item_inform1'
					   			}));
					   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h3/>',{
					   				class:'search_reward_item_punding_title',
					   				text:data[i].REWARD_SHORT_NAME
					   			}));
					   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h5/>',{
					   				class:'search_reward_item_category_name',
					   				text:data[i].REWARD_CATEGORY_NAME,
					   				style:'margin-right:5px'
					   			}));
					   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h5/>',{
					   				text:'|',
					   				style:'margin-right:5px'
					   			}));
					   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h5/>',{
					   				class:'search_reward_item_company_name',
					   				text:data[i].REWARD_MC_NAME
					   			}));
					   			
					   			if(data[i].REWARD_STATE!=3){
						   			$('#'+data[i].REWARD_NO+'').append($('<div/>',{
						   				id:data[i].REWARD_NO+'_persentBar_background',
						   				class:'search_reward_persentBar_background'
						   			}));
						   			$('#'+data[i].REWARD_NO+'_persentBar_background').append($('<div/>',{
						   				id:data[i].REWARD_NO+'_persentBar',
						   				class:'search_reward_persentBar'
						   			}));
						   			
						   			//퍼센트바 채우기
						   			$('#'+data[i].REWARD_NO+'_persentBar').css("width",(3*data[i].REWARD_ACHIEVEMENT_PERSENT+'px')); 
					   		
						   			$('#'+data[i].REWARD_NO+'').append($('<div/>',{
						   				id:data[i].REWARD_NO+'_inform2',
						   				class:'search_reward_content_item_inform2'
						   			}));
					   			
						   			$('#'+data[i].REWARD_NO+'_inform2').append($('<h3/>',{
						   				class:'search_reward_item_punding_achievement_quotient',
						   				text:data[i].REWARD_ACHIEVEMENT_PERSENT+'%'
						   			}));
						   			
						   			$('#'+data[i].REWARD_NO+'_inform2').append($('<h4/>',{
						   				class:'search_reward_item_punding_sum',
						   				text:data[i].REWARD_PRESENT_COLLECTION.toLocaleString()+'원'
						   			}));
					   			
						   			$('#'+data[i].REWARD_NO+'_inform2').append($('<h4/>',{
						   				class:'search_reward_item_punding_remain_date',
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




	
	//필터변경 시 리워드 초기화 이벤트
	function changeFilter(targ){
		global_reward_category_item_list_page=1;
		if(targ=='option'){
			if($('#reward_state_filter').val()==3){
				$('#reward_watch_filter').val(1);
			}
		}

		$('.search_reward_content').empty();
		$.ajax({
		   		url:'${pageContext.request.contextPath}/searchRewardListAjax',
		   		dataType:'json',
		   		data:{'cPage':0,"rewardState":$('#reward_state_filter').val(),"listFilter":$('#reward_watch_filter').val(),"main_header_searchbar":'<%=request.getAttribute("searchInform")%>'},
		   		success:function(data){
		   			
					for(var i=0;i<data.length;i++){
			   			$('.search_reward_content').append($('<div/>',{
			   				id:data[i].REWARD_NO,
			   				class:'search_reward_content_item',
			   				style:'margin-right:15px'
			   			}));
						$('.search_reward_content_item:nth-child(3n)').css("margin-right","-10px");
						
			   			$('#'+data[i].REWARD_NO+'').append($('<img/>',{
			   				src:'${pageContext.request.contextPath}'+data[i].REWARD_REPRESENT_IMAGE
			   			}));
			   			$('#'+data[i].REWARD_NO+'').append($('<div/>',{
			   				id: data[i].REWARD_NO+'_inform1',
			   				class:'search_reward_content_item_inform1'
			   			}));
			   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h3/>',{
			   				class:'search_reward_item_punding_title',
			   				text:data[i].REWARD_SHORT_NAME
			   			}));
			   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h5/>',{
			   				class:'search_reward_item_category_name',
			   				text:data[i].REWARD_CATEGORY_NAME,
			   				style:'margin-right:5px'
			   			}));
			   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h5/>',{
			   				text:'|',
			   				style:'margin-right:5px'
			   			}));
			   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h5/>',{
			   				class:'search_reward_item_company_name',
			   				text:data[i].REWARD_MC_NAME
			   			}));
			   			
			   			if(data[i].REWARD_STATE!=3){
				   			$('#'+data[i].REWARD_NO+'').append($('<div/>',{
				   				id:data[i].REWARD_NO+'_persentBar_background',
				   				class:'search_reward_persentBar_background'
				   			}));
				   			$('#'+data[i].REWARD_NO+'_persentBar_background').append($('<div/>',{
				   				id:data[i].REWARD_NO+'_persentBar',
				   				class:'search_reward_persentBar'
				   			}));
				   			
				   			//퍼센트바 채우기
				   			$('#'+data[i].REWARD_NO+'_persentBar').css("width",(3*data[i].REWARD_ACHIEVEMENT_PERSENT+'px')); 
				   			
				   			$('#'+data[i].REWARD_NO+'').append($('<div/>',{
				   				id:data[i].REWARD_NO+'_inform2',
				   				class:'search_reward_content_item_inform2'
				   			}));
				   			
					   			$('#'+data[i].REWARD_NO+'_inform2').append($('<h3/>',{
					   				class:'search_reward_item_punding_achievement_quotient',
					   				text:data[i].REWARD_ACHIEVEMENT_PERSENT+'%'
					   			}));
					   			
					   			$('#'+data[i].REWARD_NO+'_inform2').append($('<h4/>',{
					   				class:'search_reward_item_punding_sum',
					   				text:data[i].REWARD_PRESENT_COLLECTION.toLocaleString()+'원'
					   			}));
				   			
				   			$('#'+data[i].REWARD_NO+'_inform2').append($('<h4/>',{
				   				class:'search_reward_item_punding_remain_date',
				   				text:data[i].REWARD_REMAIN_DATE+'일 남음'
				   			}));
			   			}
		   			}
		   			
		   			
		   			
		   		}
		   	 
		   	 });
	}
</script>

	
</html>