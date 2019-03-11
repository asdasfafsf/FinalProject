<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>  -->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
   <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reward.css"> --%>
	
	<style>
		
		.reward_list_full_screen_background{
   			position:relative;
   			width: 100%;
   			height:100%;
   			background-color: white;
   		}
   		.reward_list_full_screen{
   			position:relative;
   			width:1000px;	
   			margin:auto;		
   			top: 70px;
   		}
   		.reward_category_list_wrap{
   			position: relative;
   			width:1000px;
   			height:100px;
   		}
   		.reward_category_list_back_button{
   			position:absolute;	
   			display:none;
   			width:60px;
   			height:60px;
   			top:15px;
   			left:30px;
	   		cursor: pointer;
	   	}
   		.reward_category_list_next_button{
   			position:absolute;	
   			width:60px;
   			height:60px;
   			top:15px;
   			left:910px;
	   		cursor: pointer;
	   	}
   		.reward_category_list{
   			position:relative;
   			width:900px;
   			height: 100px;			
			overflow: hidden;
			padding-top:10px;
   		}
   		.reward_category_list>ul{
	   		position: absolute;
   			width: 2000px;
	   		font-size:0;
	   		padding:0;
   		}
   		.reward_category_list>ul>li{
   			position:relative;
   			width:100px;
   			height:100px;
   			position:relative;
	   		display: inline-block;
	   		cursor: pointer;
	   		margin-right: 15px;
	   		text-align: center;
	   		cursor: pointer;
   		}
   		.reward_category_list>ul>li>img{
   			position:relative;
   			width:70px;
   			height:70px;
   			border-radius: 100px;
   		}
   		.reward_category_list>ul>li>p{
   			position:relative;
   			display:block;
   			font-size: 13px;
   			font-weight: bold;
   			bottom: 10px;
   		}
   		
   		.reward_list_wrap{
   			position:relative;
   			width:1000px;
   			margin-top: 60px;
   		}
   		.reward_category_head{
   			position: relative;
   			width:1000px;
   			height: 60px;
   			border-bottom:1px solid rgba(0,0,0,.1);
   		}
   		#reward_category_title{
   			position: relative;
   			display: inline-block;
   		}
   		#reward_watch_filter{
   			position: relative;
   			display: inline-block;
   			height:30px;
   			float: right;
   			margin-right: 20px;
   			margin-top: 25px;
   			border:0px;
   			outline:0px;
   			font-size: 15px;
   			font-weight: bold;
   		}
   		#reward_state_filter{
   			position: relative;
   			display: inline-block;
   			height:30px;
   			float: right;
   			margin-right: 10px;
   			margin-top: 25px;
   			border:0px;
   			outline:0px;
   			font-size: 15px;
   			font-weight: bold;
   		}
   		
   		.reward_category_content{
   			position: relative;
   			width:1000px;
   			height: 100%;
   		}
   		.reward_category_content_item{
   			position: relative;
   			display: inline-block;
   			width:320px;
   			height:380px;
   			margin-top:20px;
   			margin-right:10px;
   			border: 1px solid #e4e4e4;	
   			box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1); 
			border-radius: 2px;
			cursor: pointer;
   		}
   		.reward_category_content_item:hover{
   			box-shadow: 0 0 15px hsla(50,70%,70%,1);
   		}
   		.reward_category_content_item:nth-child(3n) {
			margin-right: -10px;
		}
		.reward_category_content_item>img{
			position: relative;
			width:320px;
			height:200px;
		}
		.reward_category_content_item_inform1{
			position: relative;
			width:300px;
			height:95px;
			margin:auto;
		}
		.category_item_punding_title{
			width: 300px;
		    height:44px;
			font-size: 18px;
			font-weight: bold;
			overflow: hidden;
		    white-space: normal;
		    text-overflow: ellipsis;
		    text-align: left;
		    line-height: 1.2;
		    word-wrap: break-word; 
		    display: -webkit-box; 
		    -webkit-line-clamp: 2; 
		    -webkit-box-orient: vertical;
		    margin: 15px 0;

		}
		.reward_category_content_item_inform1>h5{
			position: relative;
			display: inline-block;
			color: #90949c;
			margin:10px 0;
		}
		.reward_category_persentBar_background{
			position: relative;
			width:300px;
			height:3.5px;
			margin:auto;
			margin-top:5px;
			margin-bottom:5px;
			background-color: rgba(183,183,183);
		}
		.reward_category_persentBar{
			width: 100px; 
   			height: 3.5px;
   			background-color: #000d33;
   		}
		.reward_category_content_item_inform2{
			position: relative;
			width:300px;
			height:55px;
			margin:auto;
		}
	    .category_item_punding_achievement_quotient{
		    float: left;
		}
		.category_item_punding_sum{
			color: #90949c;
			margin-left:5px;
		    float: left;
		}
		.category_item_punding_remain_date{
			color: #90949c;
		    float: right;
		}
		#reward_list_loading{
			position:relative;
			width:40px;
			left:50%;
			margin-top: 50px;
			margin-bottom: 50px;
		}

	</style>

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
					<select id="reward_watch_filter">
						<option value="1">최신순</option>
						<option value="2">마감일순</option>
						<option value="3">목표액순</option>
					</select>
					<select id="reward_state_filter">
						<option value="1">펀딩중</option>
						<option value="2">오픈예정</option>
						<option value="3">종료</option>
					</select>
				</div>

				<div class="reward_category_content">
					<c:forEach var="l" items="${rewardList}">
						<div class="reward_category_content_item">
							<img src="${pageContext.request.contextPath}/resources/images/upload/${l.REWARD_REPRESENT_IMAGE}"/>
							<div class="reward_category_content_item_inform1">
								<h3 class="category_item_punding_title">${l.REWARD_SHORT_NAME }</h3>
								<h5 class="category_item_category_name">스포츠·모빌리티</h5>
								<h5>|</h5>
								<h5 class="category_item_company_name">${l.REWARD_MC_NAME }</h5>
							</div>
							<div class="reward_category_persentBar_background">
								<div class="reward_category_persentBar" style="width:159px"></div>
							</div>
							<div class="reward_category_content_item_inform2">
								<h3 class="category_item_punding_achievement_quotient">53%</h3>
								<h4 class="category_item_punding_sum">2,901,500원</h4>
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
		    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		    	
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
					   				class:'reward_category_content_item'
					   			}));
					   			$('#'+data[i].REWARD_NO+'').append($('<img/>',{
					   				src:'${pageContext.request.contextPath}/resources/images/upload/'+data[i].REWARD_REPRESENT_IMAGE
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
					   				text:'스포츠·모빌리티'
					   			}));
					   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h5/>',{
					   				text:'|'
					   			}));
					   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h5/>',{
					   				class:'category_item_company_name',
					   				text:data[i].REWARD_MC_NAME
					   			}));
					   			
					   			$('#'+data[i].REWARD_NO+'').append($('<div/>',{
					   				id:data[i].REWARD_NO+'_persentBar_background',
					   				class:'reward_category_persentBar_background'
					   			}));
					   			$('#'+data[i].REWARD_NO+'_persentBar_background').append($('<div/>',{
					   				id:data[i].REWARD_NO+'_persentBar',
					   				class:'reward_category_persentBar'
					   			}));
					   			
					   			//퍼센트바 채우기
					   			$('#'+data[i].REWARD_NO+'_persentBar').css("width",(((300/100)*53)+'px')); 
					   			
					   			$('#'+data[i].REWARD_NO+'').append($('<div/>',{
					   				id:data[i].REWARD_NO+'_inform2',
					   				class:'reward_category_content_item_inform2'
					   			}));
					   			$('#'+data[i].REWARD_NO+'_inform2').append($('<h3/>',{
					   				class:'category_item_punding_achievement_quotient',
					   				text:'53%'
					   			}));
					   			
					   			$('#'+data[i].REWARD_NO+'_inform2').append($('<h4/>',{
					   				class:'category_item_punding_sum',
					   				text:'2,901,500원'
					   			}));
					   			$('#'+data[i].REWARD_NO+'_inform2').append($('<h4/>',{
					   				class:'category_item_punding_remain_date',
					   				text:data[i].REWARD_REMAIN_DATE+'일 남음'
					   			}));
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
		console.log($('#reward_state_filter').val()+" : "+$('#reward_watch_filter').val());
		 
		global_reward_category_item_list_page=1;
		$('#reward_category_title').text($(targ).children('p').text());
		$('#reward_category_title').attr('value',$(targ).val());
		$('.reward_category_content').empty();
		$.ajax({
		   		url:'${pageContext.request.contextPath}/rewardCategoryPage',
		   		dataType:'json',
		   		data:{'cPage':0,'categoryNum':$('#reward_category_title').attr("value"),"rewardState":$('#reward_state_filter').val(),"listFilter":$('#reward_watch_filter').val()},
		   		success:function(data){
		   			
					for(var i=0;i<data.length;i++){
			   			$('.reward_category_content').append($('<div/>',{
			   				id:data[i].REWARD_NO,
			   				class:'reward_category_content_item'
			   			}));
			   			$('#'+data[i].REWARD_NO+'').append($('<img/>',{
			   				src:'${pageContext.request.contextPath}/resources/images/upload/'+data[i].REWARD_REPRESENT_IMAGE
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
			   				text:'스포츠·모빌리티'
			   			}));
			   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h5/>',{
			   				text:'|'
			   			}));
			   			$('#'+data[i].REWARD_NO+'_inform1').append($('<h5/>',{
			   				class:'category_item_company_name',
			   				text:data[i].REWARD_MC_NAME
			   			}));
			   			
			   			$('#'+data[i].REWARD_NO+'').append($('<div/>',{
			   				id:data[i].REWARD_NO+'_persentBar_background',
			   				class:'reward_category_persentBar_background'
			   			}));
			   			$('#'+data[i].REWARD_NO+'_persentBar_background').append($('<div/>',{
			   				id:data[i].REWARD_NO+'_persentBar',
			   				class:'reward_category_persentBar'
			   			}));
			   			
			   			//퍼센트바 채우기
			   			$('#'+data[i].REWARD_NO+'_persentBar').css("width",(((300/100)*53)+'px')); 
			   			
			   			$('#'+data[i].REWARD_NO+'').append($('<div/>',{
			   				id:data[i].REWARD_NO+'_inform2',
			   				class:'reward_category_content_item_inform2'
			   			}));
			   			$('#'+data[i].REWARD_NO+'_inform2').append($('<h3/>',{
			   				class:'category_item_punding_achievement_quotient',
			   				text:'53%'
			   			}));
			   			
			   			$('#'+data[i].REWARD_NO+'_inform2').append($('<h4/>',{
			   				class:'category_item_punding_sum',
			   				text:'2,901,500원'
			   			}));
			   			$('#'+data[i].REWARD_NO+'_inform2').append($('<h4/>',{
			   				class:'category_item_punding_remain_date',
			   				text:data[i].REWARD_REMAIN_DATE+'일 남음'
			   			}));
		   			}
		   			
		   			
		   			
		   		}
		   	 
		   	 });
	}
</script>

	