<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>  -->
   
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">


<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>

	<div class="main_full_screen_background">
		<div class="main_full_screen">
			<div class="main_notice_wrap">
				<h4>공지사항</h4>
				<ul class="main_notice">
					<c:forEach var="notice" items="${noticeList}">
						<li id="${notice.NOTICE_NO }" onclick="clickNotice(this);">${notice.NOTICE_TITLE }</li>
					</c:forEach>		
				</ul>
			</div>
			
			<div class="main_advertisement_wrap">
				<img class="slide_back_button" id="main_advertisement_wrap_back" src="${pageContext.request.contextPath}/resources/images/icon/slide_back2.png" onclick="slideBack(this,650);"/>
		  		<ul value="advertisement">
		  			<c:forEach var="ad" items="${advertisementList}">
		  				<li id="${ad.REWARD_NO }" onclick="clickReward(this);">
		  					<div>
		  						<em>리워드</em>
		  						<h3>${ad.REWARD_SHORT_NAME }</h3>
		  						<p>${ad.REWARD_SYNOPSIS }</p>
		  					</div>
		  					<img alt="" src="${pageContext.request.contextPath}${ad.REWARD_REPRESENT_IMAGE}">
		  				</li>
		  			</c:forEach>
		  		</ul>
		  		<img class="slide_next_button" id="main_advertisement_wrap_next" src="${pageContext.request.contextPath}/resources/images/icon/slide_next2.png" onclick="slideNext(this,650);"/>
		  		<div class='main_advertisement_border_bottom'></div>
			</div>

			<div class="main_rank_wrap">
				<div class="main_rank_menu">
					<ul>
						<li><button onclick="rankMenuClick(this);">리워드</button></li>
						<li><button onclick="rankMenuClick(this);">오픈예정</button></li>
					</ul>
				</div>
				

				<div class="main_rank_content_wrap">
					<div class="main_rank_content_img_wrap">
						<c:forEach var="rewardRankList" items="${ongoing_rewardRankList }">
							<img alt="" id='${rewardRankList.REWARD_NO }'  onclick="clickReward(this);" src="${pageContext.request.contextPath}${rewardRankList.REWARD_REPRESENT_IMAGE }" >
						</c:forEach>
					</div>
					<div class="main_rank_content">
						<c:forEach var="rewardRankList" items="${ongoing_rewardRankList }" varStatus="vs">
							<div class='main_rank_content_text' id='${rewardRankList.REWARD_NO }' onclick="clickReward(this);">
								<em>${vs.count }</em>	
								<label>${rewardRankList.REWARD_SHORT_NAME }</label>
							</div>
						</c:forEach>
					</div>
				</div>

				<div class="main_rank_content2_wrap">
					<div class="main_rank_content2_img_wrap">
						<c:forEach var="rewardRankList2" items="${open_schedule_rewardRankList }">
							<img alt="" id='${rewardRankList2.REWARD_NO }' onclick="clickReward(this);" src="${pageContext.request.contextPath}${rewardRankList2.REWARD_REPRESENT_IMAGE}" >
						</c:forEach>
					</div>
					<div class="main_rank_content2">
						<c:forEach var="rewardRankList2" items="${open_schedule_rewardRankList }" varStatus="vs">
							<div class='main_rank_content_text' id='${rewardRankList2.REWARD_NO }' onclick="clickReward(this);">
								<em>${vs.count }</em>	
								<label>${rewardRankList2.REWARD_SHORT_NAME }</label>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

			<div class="main_open_schedule_wrap">
				<h3><em>오픈예정</em> 곧 다가올 리워드</h3>
				<ul value="schedule">
					<c:forEach var="list" items="${newest_open_schedule_rewardList }">
						<li id="${list.REWARD_NO }" onclick="clickReward(this);">
							<div class="main_open_schedule_body_img_wrap">
								<img alt="" src="${pageContext.request.contextPath}${list.REWARD_REPRESENT_IMAGE}">
								
							</div>
							<div class="main_open_schedule_body_content_wrap">
								<h3>${list.REWARD_SHORT_NAME }</h3>
								<h5>${list.REWARD_MC_NAME }</h5>
							</div>
						</li>
					</c:forEach>
				</ul>
	
				<img class="slide2_back_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_back2.png" onclick="slideBack(this,317);" onmouseover="slideBackButtonHover(this);"/>
				<img class="slide2_next_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_next2.png" onclick="slideNext(this,317);" onmouseover="slideNextButtonHover(this);"/>
				<div class="main_open_schedule_body_slideControll_wrap">
					<c:forEach var="list" items="${newest_open_schedule_rewardList }" varStatus="vs">
						<c:choose>
							<c:when test="${vs.index==0}">
								<img alt="" value=${vs.count } onclick="clickSlideCircleButton(this,317);" src="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png">
							</c:when>
							<c:when test="${vs.index!=0}">
								<img alt="" value=${vs.count } onclick="clickSlideCircleButton(this,317);" src="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png">
							</c:when>
						</c:choose>
					</c:forEach>
				</div>
			</div>

		
			<div class="main_deadline_approaching_wrap">
				<h3><em>마감임박</em> 시간이 얼마 안남았다!</h3>
				<ul value="deadline_approaching">
					<c:forEach var="list" items="${deadline_approaching_rewardList }">
						<li id="${list.REWARD_NO }" onclick="clickReward(this);">
							<div class="main_deadline_approaching_body_img_wrap">
								<img alt="" src="${pageContext.request.contextPath}${list.REWARD_REPRESENT_IMAGE}">
								<div class="main_deadline_approaching_persentBar_Background">
									<div class="main_deadline_approaching_persentBar" style="width:${list.REWARD_ACHIEVEMENT_PERSENT*3}px"></div>
								</div>
								<div class="main_deadline_approaching_body_information_wrap">
									<label>${list.REWARD_ACHIEVEMENT_PERSENT }%</label>
									<label>${list.REWARD_PRESENT_COLLECTION }원</label>
									<label>${list.REWARD_REMAIN_DATE }일 남음</label>
								</div>
							</div>
							<div class="main_deadline_approaching_body_content_wrap">
								<h3>${list.REWARD_SHORT_NAME }</h3>
								<h5>${list.REWARD_MC_NAME }</h5>
							</div>
						</li>
					</c:forEach>
				</ul>
				<img class="slide2_back_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_back2.png" onclick="slideBack(this,317);" onmouseover="slideBackButtonHover(this);"/>
				<img class="slide2_next_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_next2.png" onclick="slideNext(this,317);" onmouseover="slideNextButtonHover(this);"/>
				<div class="main_deadline_approaching_body_slideControll_wrap">
					<c:forEach var="list" items="${deadline_approaching_rewardList }" varStatus="vs">
						<c:choose>
							<c:when test="${vs.index==0}">
								<img alt="" value=${vs.count } onclick="clickSlideCircleButton(this,317);" src="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png">
							</c:when>
							<c:when test="${vs.index!=0}">
								<img alt="" value=${vs.count } onclick="clickSlideCircleButton(this,317);" src="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png">
							</c:when>
						</c:choose>
					</c:forEach>			
				</div>
			</div>
	
			<div class="main_invention_wrap">
				<h3><em>신규상품</em> 지금부터 시작이다!</h3>
				<ul value="invention">
					<c:forEach var="list" items="${new_rewardList }">
						<li id="${list.REWARD_NO }" onclick="clickReward(this);">
							<div class="main_invention_body_img_wrap">
								<img alt="" src="${pageContext.request.contextPath}${list.REWARD_REPRESENT_IMAGE}">
								<div class="main_invention_persentBar_Background">
									<div class="main_invention_persentBar" style="width:${list.REWARD_ACHIEVEMENT_PERSENT*3}px"></div>
								</div>
								<div class="main_invention_body_information_wrap">
									<label>${list.REWARD_ACHIEVEMENT_PERSENT }%</label>
									<label>${list.REWARD_PRESENT_COLLECTION }원</label>
									<label>${list.REWARD_REMAIN_DATE }일 남음</label>
								</div>
							</div>
							<div class="main_invention_body_content_wrap">
								<h3>${list.REWARD_SHORT_NAME }</h3>
								<h5>${list.REWARD_MC_NAME }</h5>
							</div>
						</li>
					</c:forEach>
				</ul>
				<img class="slide2_back_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_back2.png" onclick="slideBack(this,317);" onmouseover="slideBackButtonHover(this);"/>
				<img class="slide2_next_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_next2.png" onclick="slideNext(this,317);" onmouseover="slideNextButtonHover(this);"/>
				<div class="main_invention_body_slideControll_wrap">
					<c:forEach var="list" items="${new_rewardList }" varStatus="vs">
						<c:choose>
							<c:when test="${vs.index==0}">
								<img alt="" value=${vs.count } onclick="clickSlideCircleButton(this,317);" src="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png">
							</c:when>
							<c:when test="${vs.index!=0}">
								<img alt="" value=${vs.count } onclick="clickSlideCircleButton(this,317);" src="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png">
							</c:when>
						</c:choose>
					</c:forEach>		
				</div>
			</div>
			
			 
			<a href="${pageContext.request.contextPath }/fundingStory"><img class="main_brand_story" alt="" src="${pageContext.request.contextPath}/resources/images/main/main_funding_story.jpg"></a>
			
			<div class="main_event_wrap">
				<img class="slide_back_button" id="main_event_slide_back_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_back2.png" onclick="slideBack(this,700);"/>
		  		<ul value="main_event_ul">
		  			<c:forEach var="list" items="${main_slide_eventList }">
		  				<li id="${list.EVENT_NO }" onclick="clickEvent(this);">
		  					<div>
		  						<em>이벤트</em>
		  						<h3>${list.EVENT_TITLE }</h3>
		  						<p>${list.EVENT_CONTENT }</p>
		  					</div>
		  					<img alt="" src="${pageContext.request.contextPath}${list.EVENT_IMAGE_STORED_PATH}">
		  				</li>
		  			</c:forEach>
		  		</ul>
		  		<img class="slide_next_button" id="main_event_slide_next_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_next2.png" onclick="slideNext(this,700);"/>
			</div> 
			
		</div>
	</div>
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>




	<script>
		var global_advertisementBottomBoderWidth; //광고슬라이드 이미지 가로크기
		var global_isClick=true; //클릭중복방지에 쓰일 변수
		var global_rankChangeImage_index=2;
		var global_IsRank1Interval=true;
		var global_IsRank2Interval=false;	
		var global_IsAdvertisementSlide=true;
		var global_IsEventSlide=true;

		$(document).ready(function(){
			 
			$(window).scrollTop(0);
			
			//탭 이동할때 setInterval 해제
			document.addEventListener( 'visibilitychange' , function() {
			    if (document.hidden) {//다른 탭 선택하면
			    	clearInterval(slideNoticeChange_setInterval);
			    	clearInterval(advertisement_setInterval);
			    	if(global_IsRank1Interval){
			    		clearInterval(rank1ChangeImage_setInterval);
			    	}
			    	if(global_IsRank2Interval){
			    		clearInterval(rank2ChangeImage_setInterval);
			    	} 	
			    	if(global_IsEventSlide){
			    		clearInterval(main_event_slide_setInterval);
			    		global_IsEventSlide=false;
			    	}
			    } else {//탭 돌아오면
			    	slideNoticeChange_setInterval=setInterval(function(){
						slideNotice(40);
					},2500);
			    	advertisement_setInterval=setInterval(function(){
						slideNext($('#main_advertisement_wrap_next'),650);
					},2000);
			    	if(global_IsRank1Interval){
			    		rank1ChangeImage_setInterval=setInterval(function(){
							rank1ChangeImage();
						},2500); 
			    	}else if(global_IsRank2Interval){
			    		rank2ChangeImage_setInterval=setInterval(function(){
							rank2ChangeImage();
						},2500);
			    	}
			    	if(!(global_IsEventSlide)){
				    	main_event_slide_setInterval=setInterval(function(){
							slideNext($('#main_event_slide_next_button'),700);
						},2000);
				    	global_IsEventSlide=true;
			    	}
			    	
			    }
			}, false );
			
			$('.main_rank_content_img_wrap>img:nth-child(1)').css('display','block'); 			
			
			
			 
			//메인 이벤트 슬라이드 마우스 올라가면 슬라이드 자동실행 중지 
			$('.main_event_wrap').hover(function(){
				clearInterval(main_event_slide_setInterval);
				global_IsEventSlide=false;
			},function(){
				main_event_slide_setInterval=setInterval(function(){
					slideNext($('#main_event_slide_next_button'),700);
				},2000);
				global_IsEventSlide=true;
			});
			//////////////////////////////////
			
			// 공지사항 다음꺼 보여주는 이벤트	
			function slideNotice(slide_img_height){
				var ul=$('.main_notice');
					
					if($(ul).css('top')!='-'+(slide_img_height*($(ul).children().length-1))+'px'){//슬라이드가 마지막이 아닐대
						//슬라이드 이동
						$(ul).animate({
							top:'-='+slide_img_height+'px'
						});			
					}else{//슬라이드가 마지막일때
						
						$(ul).animate({
							top:'0px'
						});			
					}

			}
			
			// 공지사항 다음꺼 보여주는 이벤트 자동실행
			slideNoticeChange_setInterval=setInterval(function(){
				slideNotice(40);
			},2500);
			
			
			//공지사항 슬라이드 마우스 올라가면 슬라이드 자동실행 중지 
			$('.main_notice>li').hover(function(){
				clearInterval(slideNoticeChange_setInterval);
			},function(){
				slideNoticeChange_setInterval=setInterval(function(){
					slideNotice(40);
				},2500);
			});

			
			//광고슬라이드 밑에 현재 몇번째인지 border bottom width 넣어주기
			 global_advertisementBottomBoderWidth=(650/($('.main_advertisement_wrap>ul').children().length));
			 $('.main_advertisement_border_bottom').css('width',global_advertisementBottomBoderWidth+'px'); 

			//광고 슬라이드 좌우 버튼 호버이벤트
			$('#main_advertisement_wrap_back').hover(function(){
				 $('#main_advertisement_wrap_back').attr('src','${pageContext.request.contextPath}/resources/images/icon/'+'slide_back2_hover.png');
				 $('#main_advertisement_wrap_back').css('background-color','rgba(0,0,0,0.3)');
			}, function(){
				 $('#main_advertisement_wrap_back').attr('src','${pageContext.request.contextPath}/resources/images/icon/'+'slide_back2.png');
				 $('#main_advertisement_wrap_back').css('background-color','rgba(0,0,0,0.2)');
			});
			
			$('#main_advertisement_wrap_next').hover(function(){
				 $('#main_advertisement_wrap_next').attr('src','${pageContext.request.contextPath}/resources/images/icon/'+'slide_next2_hover.png');
				 $('#main_advertisement_wrap_next').css('background-color','rgba(0,0,0,0.3)');
			}, function(){
				 $('#main_advertisement_wrap_next').attr('src','${pageContext.request.contextPath}/resources/images/icon/'+'slide_next2.png');
				 $('#main_advertisement_wrap_next').css('background-color','rgba(0,0,0,0.2)');
			});			
		
					 
			//광고 슬라이드 마우스 올라가면 슬라이드 자동실행 중지 
			$('.main_advertisement_wrap').hover(function(){
				clearInterval(advertisement_setInterval);
			},function(){
				advertisement_setInterval=setInterval(function(){
					slideNext($('#main_advertisement_wrap_next'),650);
				},2000);
			});

			
		});
		

		
		 //광고 슬라이드 자동실행
		advertisement_setInterval=setInterval(function(){
			slideNext($('#main_advertisement_wrap_next'),650);
		},2000);
		 
		 //이벤트 슬라이드 자동실행
		main_event_slide_setInterval=setInterval(function(){
			slideNext($('#main_event_slide_next_button'),700);
		},2300);
		 
		
		 
		//랭킹 사진 변하는 이벤트
		function rank1ChangeImage(){
			$('.main_rank_content_img_wrap>img').css('display','none');
			$('.main_rank_content_img_wrap>img:nth-child('+global_rankChangeImage_index+')').fadeIn('slow');
			if(global_rankChangeImage_index!=5){
				global_rankChangeImage_index++;
			}
			else{
				global_rankChangeImage_index=1;
			}
		}
		function rank2ChangeImage(){
			$('.main_rank_content2_img_wrap>img').css('display','none');
			$('.main_rank_content2_img_wrap>img:nth-child('+global_rankChangeImage_index+')').fadeIn('slow');
			if(global_rankChangeImage_index!=5){
				global_rankChangeImage_index++;
			}
			else{
				global_rankChangeImage_index=1;
			}
		}
		
		//랭킹사진1 변화 자동실행
		rank1ChangeImage_setInterval=setInterval(function(){
			rank1ChangeImage();
		},2500);		
		
		//랭킹 메뉴탭 클릭 이벤트
		function rankMenuClick(tag){	
			global_rankChangeImage_index=1;
			$('.main_rank_menu>ul>li>button').css({'color':'rgba(183,183,183)','background-color':'#efefef','border-bottom':'1px solid #e4e4e4'});
			$(tag).css({'color':'rgb(30,30,30)','background-color':'white','border-bottom':'none'});
			if($(tag).text()=="리워드"){
				if(!global_IsRank1Interval){
					/* $('.main_rank_content_img_wrap>img:nth-child(1)').css('display','block'); */
					clearInterval(rank2ChangeImage_setInterval);
					rank1ChangeImage_setInterval=setInterval(function(){
						rank1ChangeImage();
					},2500); 
					
					global_IsRank1Interval=true;
					global_IsRank2Interval=false;
				}
				$('.main_rank_content_wrap').css('display','block');
				$('.main_rank_content2_wrap').css('display','none');	
			}
			else if($(tag).text()=="오픈예정"){
				if(!global_IsRank2Interval){
					if($('.main_rank_content2_img_wrap>img:nth-child(1)').css('display')=='none' &&
						$('.main_rank_content2_img_wrap>img:nth-child(2)').css('display')=='none' &&
						$('.main_rank_content2_img_wrap>img:nth-child(3)').css('display')=='none' &&
						$('.main_rank_content2_img_wrap>img:nth-child(4)').css('display')=='none' &&
						$('.main_rank_content2_img_wrap>img:nth-child(5)').css('display')=='none'
					){
						$('.main_rank_content2_img_wrap>img:nth-child(1)').css('display','block'); 
					}
					clearInterval(rank1ChangeImage_setInterval);
					rank2ChangeImage_setInterval=setInterval(function(){
						rank2ChangeImage();
					},2500); 
					
					global_IsRank1Interval=false;
					global_IsRank2Interval=true;
				}
				$('.main_rank_content_wrap').css('display','none');
				$('.main_rank_content2_wrap').css('display','block');				
			}
		}
		
		//메인 이벤트 슬라이드 좌우 버튼 호버이벤트
		$('#main_event_slide_back_button').hover(function(){
			 $('#main_event_slide_back_button').attr('src','${pageContext.request.contextPath}/resources/images/icon/'+'slide_back2_hover.png');
			 $('#main_event_slide_back_button').css('background-color','rgba(0,0,0,0.3)');
		}, function(){
			 $('#main_event_slide_back_button').attr('src','${pageContext.request.contextPath}/resources/images/icon/'+'slide_back2.png');
			 $('#main_event_slide_back_button').css('background-color','rgba(0,0,0,0.2)');
		});
		
		$('#main_event_slide_next_button').hover(function(){
			 $('#main_event_slide_next_button').attr('src','${pageContext.request.contextPath}/resources/images/icon/'+'slide_next2_hover.png');
			 $('#main_event_slide_next_button').css('background-color','rgba(0,0,0,0.3)');
		}, function(){
			 $('#main_event_slide_next_button').attr('src','${pageContext.request.contextPath}/resources/images/icon/'+'slide_next2.png');
			 $('#main_event_slide_next_button').css('background-color','rgba(0,0,0,0.2)');
		});	
			
		
		
		// 슬라이드 뒤로 버튼 이벤트	
			function slideBack(target,slide_img_width){
					var ul=$(target).siblings("ul");
					if(global_isClick){
						global_isClick=false;
						if(!(($(ul).css('left').replace(/[^0-9]/g,""))<=5&&($(ul).css('left').replace(/[^0-9]/g,""))>=-5)){ //슬라이드가 처음이 아닐때
							//오픈예정 슬라이드 밑에 동그라미버튼 움직이기
							if($(ul).attr("value")=="schedule"){
								/* var is=0;
								for(var j=0;j<$(ul).children().length;j++){
									if($('.main_open_schedule_body_slideControll_wrap>img:nth-child('+(j+1)+')').attr("src")=="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png"){
										is=j;
									}
								} */
								$('.main_open_schedule_body_slideControll_wrap>img').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png");
								//$('.main_open_schedule_body_slideControll_wrap>img:nth-child('+is+')').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png");	
								 $('.main_open_schedule_body_slideControll_wrap>img:nth-child('+Math.ceil((($(ul).css('left').replace(/[^0-9]/g,""))/slide_img_width))+')').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png"); 			
							}
							//마감예정 슬라이드 밑에 동그라미 버튼 움직이기
							if($(ul).attr("value")=="deadline_approaching"){
								/* var is=0;
								for(var j=0;j<$(ul).children().length;j++){
									if($('.main_open_schedule_body_slideControll_wrap>img:nth-child('+(j+1)+')').attr("src")=="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png"){
										is=j;
									}
								} */
								$('.main_deadline_approaching_body_slideControll_wrap>img').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png");
								//$('.main_deadline_approaching_body_slideControll_wrap>img:nth-child('+is+')').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png");	
								 $('.main_deadline_approaching_body_slideControll_wrap>img:nth-child('+Math.ceil((($(ul).css('left').replace(/[^0-9]/g,""))/slide_img_width))+')').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png"); 			
							}
							//신규상품 슬라이드 밑에 동그라미 버튼 움직이기
							if($(ul).attr("value")=="invention"){
								$('.main_invention_body_slideControll_wrap>img').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png");
								$('.main_invention_body_slideControll_wrap>img:nth-child('+Math.ceil((($(ul).css('left').replace(/[^0-9]/g,""))/slide_img_width))+')').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png");			
							}
							//슬라이드 이동
							ul.animate({
								left:'+='+slide_img_width+'px'
							});	
							//광고 슬라이드 밑에 보더 움직이기
							if($(ul).attr("value")=="advertisement"){
								$('.main_advertisement_border_bottom').animate({
									left:'-='+global_advertisementBottomBoderWidth+'px'
								});
							}
						}else{//슬라이드가 처음일때
							if($(ul).attr("value")=="schedule"){ 
							    $('.main_open_schedule_body_slideControll_wrap>img').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png");
								$('.main_open_schedule_body_slideControll_wrap>img:nth-child('+ul.children().length+')').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png");
							}
							if($(ul).attr("value")=="deadline_approaching"){ 
							    $('.main_deadline_approaching_body_slideControll_wrap>img').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png");
								$('.main_deadline_approaching_body_slideControll_wrap>img:nth-child('+ul.children().length+')').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png");
							}
							if($(ul).attr("value")=="invention"){ 
							    $('.main_invention_body_slideControll_wrap>img').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png");
								$('.main_invention_body_slideControll_wrap>img:nth-child('+ul.children().length+')').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png");
							}
							ul.animate({
								left:'-='+(slide_img_width*(ul.children().length-1))+'px'
							});
							if($(ul).attr("value")=="advertisement"){
								$('.main_advertisement_border_bottom').animate({
									left:'+='+(global_advertisementBottomBoderWidth*(ul.children().length-1))+'px'
								});
							}	
						}
						
						setTimeout(function(){
							global_isClick=true;
						},500);
					}
					
			}
			// 슬라이드 앞으로 버튼 이벤트	
			function slideNext(target,slide_img_width){
				var ul=$(target).siblings("ul");
				if(global_isClick){
					global_isClick=false;
					
					if(!($(ul).css('left').replace(/[^0-9]/g,"")<=((slide_img_width*($(ul).children().length-1))+5)&&$(ul).css('left').replace(/[^0-9]/g,"")>=((slide_img_width*($(ul).children().length-1))-5))){//슬라이드가 마지막이 아닐대
						//오픈예정 슬라이드 밑에 동그라미버튼 움직이기
						if($(ul).attr("value")=="schedule"){						
							var is=0;
							for(var j=0;j<$(ul).children().length;j++){
								if($('.main_open_schedule_body_slideControll_wrap>img:nth-child('+(j+1)+')').attr("src")=="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png"){
									is=j+2;
								}
							}
							$('.main_open_schedule_body_slideControll_wrap>img').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png");
							$('.main_open_schedule_body_slideControll_wrap>img:nth-child('+is+')').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png");
							/* $('.main_open_schedule_body_slideControll_wrap>img:nth-child('+Math.ceil(((($(ul).css('left').replace(/[^0-9]/g,""))/slide_img_width)+2))+')').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png"); */			
						}
						//마감예정 슬라이드 밑에 동그라미 버튼 움직이기
						if($(ul).attr("value")=="deadline_approaching"){
							var is=0;
							for(var j=0;j<$(ul).children().length;j++){
								if($('.main_deadline_approaching_body_slideControll_wrap>img:nth-child('+(j+1)+')').attr("src")=="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png"){
									is=j+2;
								}
							}
							$('.main_deadline_approaching_body_slideControll_wrap>img').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png");
							$('.main_deadline_approaching_body_slideControll_wrap>img:nth-child('+is+')').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png");
							/* $('.main_deadline_approaching_body_slideControll_wrap>img:nth-child('+Math.ceil(((($(ul).css('left').replace(/[^0-9]/g,""))/slide_img_width)+2))+')').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png"); */			
						}
						//신규상품 슬라이드 밑에 동그라미 버튼 움직이기
						if($(ul).attr("value")=="invention"){
							var is=0;
							for(var j=0;j<$(ul).children().length;j++){
								if($('.main_invention_body_slideControll_wrap>img:nth-child('+(j+1)+')').attr("src")=="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png"){
									is=j+2;
								}
							}
							$('.main_invention_body_slideControll_wrap>img').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png");
							$('.main_invention_body_slideControll_wrap>img:nth-child('+is+')').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png");
							/* $('.main_invention_body_slideControll_wrap>img:nth-child('+Math.ceil(((($(ul).css('left').replace(/[^0-9]/g,""))/slide_img_width)+2))+')').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png"); */			
						}
						//슬라이드 이동
						$(ul).animate({
							left:'-='+slide_img_width+'px'
						});
						if($(ul).attr("value")=="advertisement"){
							$('.main_advertisement_border_bottom').animate({
								left:'+='+global_advertisementBottomBoderWidth+'px'
							});
						}	
					}else{//슬라이드가 마지막일때
						if($(ul).attr("value")=="schedule"){
							$('.main_open_schedule_body_slideControll_wrap>img').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png");
							$('.main_open_schedule_body_slideControll_wrap>img:nth-child(1)').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png");			
						}
						if($(ul).attr("value")=="deadline_approaching"){
							$('.main_deadline_approaching_body_slideControll_wrap>img').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png");
							$('.main_deadline_approaching_body_slideControll_wrap>img:nth-child(1)').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png");			
						}
						if($(ul).attr("value")=="invention"){
							$('.main_invention_body_slideControll_wrap>img').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png");
							$('.main_invention_body_slideControll_wrap>img:nth-child(1)').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png");			
						}
						$(ul).animate({
							left:'+='+(slide_img_width*($(ul).children().length-1))+'px'
						});
						if($(ul).attr("value")=="advertisement"){
							$('.main_advertisement_border_bottom').animate({
								left:'-='+(global_advertisementBottomBoderWidth*(ul.children().length-1))+'px'
							});
						}	
					}
					
					setTimeout(function(){
						global_isClick=true;
					},500);
				}
	
			}
			
			// 슬라이드 뒤로 버튼 호버 이벤트
			function slideBackButtonHover(targ){
				$(targ).attr('src','${pageContext.request.contextPath}/resources/images/icon/slide_back2_hover.png');
				$(targ).hover(function(){
					$(targ).attr('src','${pageContext.request.contextPath}/resources/images/icon/slide_back2_hover.png');
				},function(){
					$(targ).attr('src','${pageContext.request.contextPath}/resources/images/icon/slide_back2.png');
				});
			}
			// 슬라이드 앞로 버튼 호버 이벤트
			function slideNextButtonHover(targ){
				$(targ).attr('src','${pageContext.request.contextPath}/resources/images/icon/slide_next2_hover.png');
				$(targ).hover(function(){
					$(targ).attr('src','${pageContext.request.contextPath}/resources/images/icon/slide_next2_hover.png');
				},function(){
					$(targ).attr('src','${pageContext.request.contextPath}/resources/images/icon/slide_next2.png');
				});
			}
			//슬라이드 동그라미버튼 클릭 이벤트
			function clickSlideCircleButton(targ,slide_img_width){
				var ul=$(targ).parent().siblings('ul');
				var click_index=$(targ).attr("value");
				var now_index=1;
				
				for(var i=1;i<=(ul.children().length);i++){
					 if($('.'+$(targ).parent().attr('class')+'>img:nth-child('+i+')').attr("src")=="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png"){
						 now_index=$('.'+$(targ).parent().attr('class')+'>img:nth-child('+i+')').attr("value");
					 } 
				} 
		
				$(targ).siblings('img').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png");
				$(targ).attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png");
				
				$(ul).animate({
					left:'-='+(slide_img_width*(click_index-now_index))+'px'
				});
			}
			
			function clickReward(targ){
				location.href="${pageContext.request.contextPath}/project/reward/"+$(targ).attr("id");
			}
			function clickNotice(targ){
				console.log($(targ).attr("id"));
			}
			function clickEvent(targ){
				console.log($(targ).attr("id"));
			}
			
	</script>
	
