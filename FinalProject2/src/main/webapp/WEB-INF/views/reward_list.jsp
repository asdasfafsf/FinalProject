<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>  -->
	
	
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
   			height:90px;
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
   			height: 90px;			
			overflow: hidden;
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
   			float: right;
   			margin-right: 20px;
   			margin-top: 30px;
   		}
   		#reward_state_filter{
   			position: relative;
   			display: inline-block;
   			float: right;
   			margin-right: 10px;
   			margin-top: 30px;
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
   			border: 1px solid red;
   		}
   		.reward_category_content_item:nth-child(3n) {
			margin-right: -10px;
		}
		.reward_category_content_item>img{
			position: relative;
			width:320px;
			height:200px;
			border-radius: 3px;
		}
		.reward_category_content_item_inform1{
			position: relative;
			width:320px;
			height:105px;
			border:1px solid blue;
		}
		.reward_category_content_item_inform1>h5{
			position: relative;
			display: inline-block;
		}
		.reward_category_persentBar_background{
			position: relative;
			width:320px;
			height:4px;
			background-color: rgba(183,183,183);
		}
		.reward_category_persentBar{
			width: 100px; 
   			height: 4px;
   			background-color: #000d33;
   		}
		.reward_category_content_item_inform2{
			position: relative;
			width:320px;
			height:70px;
			border:1px solid yellow;
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
						<li>
							<img alt="" src="${pageContext.request.contextPath}/resources/images/upload/10.jpg">
							<p>전체보기<p>
						</li>
						<li>
							<img alt="" src="${pageContext.request.contextPath}/resources/images/upload/10.jpg">
							<p>테크·가전<p>
						</li>
						<li>
							<img alt="" src="${pageContext.request.contextPath}/resources/images/upload/10.jpg">
							<p>패션·잡화<p>
						</li>
						<li>
							<img alt="" src="${pageContext.request.contextPath}/resources/images/upload/10.jpg">
							<p>뷰티<p>
						</li>
						<li>
							<img alt="" src="${pageContext.request.contextPath}/resources/images/upload/10.jpg">
							<p>푸드<p>
						</li>
						<li>
							<img alt="" src="${pageContext.request.contextPath}/resources/images/upload/10.jpg">
							<p>홈리빙<p>
						</li>
						<li>
							<img alt="" src="${pageContext.request.contextPath}/resources/images/upload/10.jpg">
							<p>디자인소품<p>
						</li>
						<li>
							<img alt="" src="${pageContext.request.contextPath}/resources/images/upload/10.jpg">
							<p>여행·레저<p>
						</li>
						<li>
							<img alt="" src="${pageContext.request.contextPath}/resources/images/upload/10.jpg">
							<p>스포츠·모빌리티<p>
						</li>
						<li>
							<img alt="" src="${pageContext.request.contextPath}/resources/images/upload/10.jpg">
							<p>반려동물<p>
						</li>
						<li>
							<img alt="" src="${pageContext.request.contextPath}/resources/images/upload/10.jpg">
							<p>공연·컬쳐<p>
						</li>
						<li>
							<img alt="" src="${pageContext.request.contextPath}/resources/images/upload/10.jpg">
							<p>소셜·캠페인<p>
						</li>
						<li>
							<img alt="" src="${pageContext.request.contextPath}/resources/images/upload/10.jpg">
							<p>교육·키즈<p>
						</li>
						<li>
							<img alt="" src="${pageContext.request.contextPath}/resources/images/upload/10.jpg">
							<p>게임·취미<p>
						</li>
						<li>
							<img alt="" src="${pageContext.request.contextPath}/resources/images/upload/10.jpg">
							<p>출판<p>
						</li>
						<li>
							<img alt="" src="${pageContext.request.contextPath}/resources/images/upload/10.jpg">
							<p>기부·후원<p>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="reward_list_wrap">
				<div class="reward_category_head">
					<h2 id="reward_category_title">전체보기</h2>
					<select id="reward_watch_filter">
						<option>최신순</option>
						<option>추천순</option>
						<option>달성률순</option>
					</select>
					<select id="reward_state_filter">
						<option>펀딩중</option>
						<option>오픈예정</option>
						<option>종료</option>
					</select>
				</div>

				<div class="reward_category_content">
					<div class="reward_category_content_item">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/upload/10.jpg">
						<div class="reward_category_content_item_inform1">
							<h3>제목이라요</h3>
							<h5>카테고리이름</h5>
							<h5>|</h5>
							<h5>회사이름</h5>
						</div>	
						<div class="reward_category_persentBar_background">
							<div class="reward_category_persentBar"></div>
						</div>
						<div class="reward_category_content_item_inform2">
							<h3>달성률</h3>
							<h4>펀딩금액</h4>
							<h4>남은일자</h4>
						</div>
					</div>
					<div class="reward_category_content_item"></div>
					<div class="reward_category_content_item"></div>
				</div>
			</div>
			
			
		</div>
	</div>
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>


<script>
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
	
	
</script>

	
