<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>  -->
	
	
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">


<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>

	<div class="main_full_screen_background">
		<div class="main_full_screen">
			<div class="main_notice_wrap">
				<h4>공지사항</h4>
				<ul class="main_notice">
				</ul>
			</div>
			
			<div class="main_advertisement_wrap">
				<img class="slide_back_button" id="main_advertisement_wrap_back" src="${pageContext.request.contextPath}/resources/images/icon/slide_back2.png" onclick="slideBack(this,650);"/>
		  		<ul value="advertisement">
		  			
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
						
					</div>
					<div class="main_rank_content">
						
					</div>
				</div>

				<div class="main_rank_content2_wrap">
					<div class="main_rank_content2_img_wrap">
						
					</div>
					<div class="main_rank_content2">
						
					</div>
				</div>
			</div>

			<div class="main_open_schedule_wrap">
				<h3><em>오픈예정</em> 곧 다가올 리워드</h3>
				<ul value="schedule">
					
				</ul>
	
				<img class="slide2_back_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_back2.png" onclick="slideBack(this,317);" onmouseover="slideBackButtonHover(this);"/>
				<img class="slide2_next_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_next2.png" onclick="slideNext(this,317);" onmouseover="slideNextButtonHover(this);"/>
				<div class="main_open_schedule_body_slideControll_wrap">
					
				</div>
			</div>

		
			<div class="main_deadline_approaching_wrap">
				<h3><em>마감임박</em> 시간이 얼마 안남았다!</h3>
				<ul value="deadline_approaching">
					
				</ul>
				<img class="slide2_back_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_back2.png" onclick="slideBack(this,317);" onmouseover="slideBackButtonHover(this);"/>
				<img class="slide2_next_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_next2.png" onclick="slideNext(this,317);" onmouseover="slideNextButtonHover(this);"/>
				<div class="main_deadline_approaching_body_slideControll_wrap">
					
				</div>
			</div>
				
			<div class="main_invention_wrap">
				<h3><em>신규상품</em> 지금부터 시작이다!</h3>
				<ul value="invention">
					
				</ul>
				<img class="slide2_back_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_back2.png" onclick="slideBack(this,317);" onmouseover="slideBackButtonHover(this);"/>
				<img class="slide2_next_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_next2.png" onclick="slideNext(this,317);" onmouseover="slideNextButtonHover(this);"/>
				<div class="main_invention_body_slideControll_wrap">
					
				</div>
			</div>
			
			 
			<img class="main_brand_story" alt="" src="${pageContext.request.contextPath}/resources/images/main/main_funding_story.jpg">
			
			<div class="main_event_wrap">
				<img class="slide_back_button" id="main_event_slide_back_button" src="${pageContext.request.contextPath}/resources/images/icon/slide_back2.png" onclick="slideBack(this,700);"/>
		  		<ul value="main_event_ul">
		  			
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

		$(document).ready(function(){
			 
			//탭 이동할때 setInterval 해제
			document.addEventListener( 'visibilitychange' , function() {
			    if (document.hidden) {//다른 탭 선택하면
			    	clearInterval(slideNoticeChange_setInterval);
			    	clearInterval(advertisement_setInterval);
			    	if(rank1ChangeImage_setInterval!=null){
			    		clearInterval(rank1ChangeImage_setInterval);
			    	}
			    	if(rank2ChangeImage_setInterval!=null){
			    		clearInterval(rank2ChangeImage_setInterval);
			    	} 	
			    	clearInterval(main_event_slide_setInterval);
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
			    	main_event_slide_setInterval=setInterval(function(){
						slideNext($('#main_event_slide_next_button'),700);
					},2000);
			    	
			    }
			}, false );
			
		///////메인 화면만들기/////////
		
			//메인 공지사항 만들기
			<%for(int i=0;i<5;i++){%>
			$('.main_notice_wrap>.main_notice').append($('<li/>',{
				id:'main_notice_li<%=i%>',
				text:'알려드립니다 <%=i+1%>번째 공지'
			}));
				
			
			<%}%>
			
			//메인 광고 슬라이드 화면 만들기
			<%for(int i=0;i<3;i++){%>
				$('.main_advertisement_wrap>ul').append($('<li/>',{
				           id:'advertisement_li<%=i%>'
				 }));
				$('#advertisement_li<%=i%>').append($('<div/>',{
				           id:'advertisement_div<%=i%>'
				 }));
				$('#advertisement_div<%=i%>').append($('<em/>',{
				          text:'리워드'
				 }));
				$('#advertisement_div<%=i%>').append($('<h3/>',{
				          text:'수제맥주라디오'
				 }));
				$('#advertisement_div<%=i%>').append($('<p/>',{
				          text:'맛있어에라모르겠다리오졌다리'
				 }));
				$('#advertisement_li<%=i%>').append($('<img/>',{
				           src: "${pageContext.request.contextPath}/resources/images/upload/10.jpg"
				 }));
			<%}%>

			//메인 랭킹 화면 만들기	 
			<%for(int i=0;i<5;i++){%>
				$('.main_rank_content_img_wrap').append($('<img/>',{
					  src:'${pageContext.request.contextPath}/resources/images/upload/10.jpg'
			 	}));
				 
				$('.main_rank_content').append($('<div/>',{
				           id:'rank_div<%=i%>',
				           class:'main_rank_content_text'
				 }));
				$('#rank_div<%=i%>').append($('<em/>',{
			        text:'<%=i+1%>'
				}));
				$('#rank_div<%=i%>').append($('<label/>',{
			        text:'가나다라마바사아자차카가나다라마바사아자차카가나다라마바사아자차카'
				}));
				
				$('.main_rank_content2_img_wrap').append($('<img/>',{
					  src:'${pageContext.request.contextPath}/resources/images/upload/13.jpg'
				}));
				$('.main_rank_content2').append($('<div/>',{
			        id:'rank2_div<%=i%>',
			        class:'main_rank_content2_text'
				}));
				$('#rank2_div<%=i%>').append($('<em/>',{
				 text:'<%=i+1%>'
				}));
				$('#rank2_div<%=i%>').append($('<label/>',{
				 text:'내가제일 잘나가 으라차차차리아지러라니까로루꾸니크'
				}));
			<%}%>
			$('.main_rank_content_img_wrap>img:nth-child(1)').css('display','block');
			
			//메인 오픈예정 슬라이드 화면 만들기
			<%for(int i=0;i<4;i++){%>
				
				$('.main_open_schedule_wrap>ul').append($('<li/>',{
					  id:'open_schedule_li<%=i%>'
				})); 
				$('#open_schedule_li<%=i%>').append($('<div/>',{
					  class:'main_open_schedule_body_img_wrap'
				})); 
				$('#open_schedule_li<%=i%>>.main_open_schedule_body_img_wrap').append($('<img/>',{
					  src:'${pageContext.request.contextPath}/resources/images/upload/10.jpg'
				}));
				$('#open_schedule_li<%=i%>>.main_open_schedule_body_img_wrap').append($('<div/>',{
					 class:'main_open_schedule_persentBar_Background'
				}));
				$('#open_schedule_li<%=i%>>.main_open_schedule_body_img_wrap>.main_open_schedule_persentBar_Background').append($('<div/>',{
					 class:'main_open_schedule_persentBar',
					 id:'main_open_schedule_persentBar<%=i%>'
				}));
				
				//퍼센트바 채우기
				$('#main_open_schedule_persentBar<%=i%>').css("width",(((270/100)*100)+'px'));
				
				$('#open_schedule_li<%=i%>>.main_open_schedule_body_img_wrap').append($('<div/>',{
					 class:'main_open_schedule_body_information_wrap'
				}));
				$('#open_schedule_li<%=i%>>.main_open_schedule_body_img_wrap>.main_open_schedule_body_information_wrap').append($('<label/>',{
					 text:'273%'
				}));
				$('#open_schedule_li<%=i%>>.main_open_schedule_body_img_wrap>.main_open_schedule_body_information_wrap').append($('<label/>',{
					 text:'11,111,036,000원'
				}));
				$('#open_schedule_li<%=i%>>.main_open_schedule_body_img_wrap>.main_open_schedule_body_information_wrap').append($('<label/>',{
					 text:'999일 남음'
				}));
				$('#open_schedule_li<%=i%>').append($('<div/>',{
					  class:'main_open_schedule_body_content_wrap'
				})); 
				$('#open_schedule_li<%=i%>>.main_open_schedule_body_content_wrap').append($('<h3/>',{
					  text:'왜 세럼은 모두 작고 비쌀까? 목에도 바르는 대용량"밀키웨이세럼"ㅁㄷㄻㅈㄻㄷㄻㄷㄷㄻ'
				})); 
				$('#open_schedule_li<%=i%>>.main_open_schedule_body_content_wrap').append($('<h5/>',{
					  text:'레셀레스트'
				})); 
				//개수만큼 슬라이드 동그라미 버튼 생성
				<%if(i==0){%>
					$('.main_open_schedule_body_slideControll_wrap').append($('<img/>',{
						src:'${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png',
						value:'<%=i+1%>',
						onclick:'clickSlideCircleButton(this,317);'
					}));
				<%}else{%>
					$('.main_open_schedule_body_slideControll_wrap').append($('<img/>',{
						src:'${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png',
						value:'<%=i+1%>',
						onclick:'clickSlideCircleButton(this,317);'
					}));
				<%}%>
			<%}%>
	
			//메인 마감임박 슬라이드 화면 만들기
			<%for(int i=0;i<3;i++){%>
				
				$('.main_deadline_approaching_wrap>ul').append($('<li/>',{
					  id:'deadline_approaching_li<%=i%>'
				})); 
				$('#deadline_approaching_li<%=i%>').append($('<div/>',{
					  class:'main_deadline_approaching_body_img_wrap'
				})); 
				$('#deadline_approaching_li<%=i%>>.main_deadline_approaching_body_img_wrap').append($('<img/>',{
					  src:'${pageContext.request.contextPath}/resources/images/upload/13.jpg'
				}));
				$('#deadline_approaching_li<%=i%>>.main_deadline_approaching_body_img_wrap').append($('<div/>',{
					 class:'main_deadline_approaching_persentBar_Background'
				}));
				$('#deadline_approaching_li<%=i%>>.main_deadline_approaching_body_img_wrap>.main_deadline_approaching_persentBar_Background').append($('<div/>',{
					 class:'main_deadline_approaching_persentBar',
					 id:'main_deadline_approaching_persentBar<%=i%>'
				}));

				//퍼센트바 채우기
				$('#main_deadline_approaching_persentBar<%=i%>').css("width",(((270/100)*3)+'px'));
				
				$('#deadline_approaching_li<%=i%>>.main_deadline_approaching_body_img_wrap').append($('<div/>',{
					 class:'main_deadline_approaching_body_information_wrap'
				}));
				$('#deadline_approaching_li<%=i%>>.main_deadline_approaching_body_img_wrap>.main_deadline_approaching_body_information_wrap').append($('<label/>',{
					 text:'3%'
				}));
				$('#deadline_approaching_li<%=i%>>.main_deadline_approaching_body_img_wrap>.main_deadline_approaching_body_information_wrap').append($('<label/>',{
					 text:'36,000원'
				}));
				$('#deadline_approaching_li<%=i%>>.main_deadline_approaching_body_img_wrap>.main_deadline_approaching_body_information_wrap').append($('<label/>',{
					 text:'30일 남음'
				}));
				$('#deadline_approaching_li<%=i%>').append($('<div/>',{
					 class:'main_deadline_approaching_body_content_wrap'
				})); 
				$('#deadline_approaching_li<%=i%>>.main_deadline_approaching_body_content_wrap').append($('<h3/>',{
					 text:'왜 세럼은 모두 작고 비쌀까? 목에도 바르는 대용량"밀키웨이세럼"ㅁㄷㄻㅈㄻㄷㄻㄷㄷㄻ'
				})); 
				$('#deadline_approaching_li<%=i%>>.main_deadline_approaching_body_content_wrap').append($('<h5/>',{
					 text:'레셀레스트'
				})); 
				//개수만큼 슬라이드 동그라미 버튼 생성
				<%if(i==0){%>
					$('.main_deadline_approaching_body_slideControll_wrap').append($('<img/>',{
						src:'${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png',
						value:'<%=i+1%>',
						onclick:'clickSlideCircleButton(this,317);'
					}));
				<%}else{%>
					$('.main_deadline_approaching_body_slideControll_wrap').append($('<img/>',{
						src:'${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png',
						value:'<%=i+1%>',
						onclick:'clickSlideCircleButton(this,317);'
					}));
				<%}%>
			<%}%>
		
			//메인 신규상품 슬라이드 화면 만들기
			<%for(int i=0;i<3;i++){%>
				
				$('.main_invention_wrap>ul').append($('<li/>',{
					  id:'invention_li<%=i%>'
				})); 
				$('#invention_li<%=i%>').append($('<div/>',{
					  class:'main_invention_body_img_wrap'
				})); 
				$('#invention_li<%=i%>>.main_invention_body_img_wrap').append($('<img/>',{
					  src:'${pageContext.request.contextPath}/resources/images/upload/09.jpg'
				}));
				$('#invention_li<%=i%>>.main_invention_body_img_wrap').append($('<div/>',{
					 class:'main_invention_persentBar_Background'
				}));
				$('#invention_li<%=i%>>.main_invention_body_img_wrap>.main_invention_persentBar_Background').append($('<div/>',{
					 class:'main_invention_persentBar',
					 id:'main_invention_persentBar<%=i%>'
				}));

				 //퍼센트바 채우기
				$('#main_invention_persentBar<%=i%>').css("width",(((270/100)*53)+'px')); 
				
				$('#invention_li<%=i%>>.main_invention_body_img_wrap').append($('<div/>',{
					 class:'main_invention_body_information_wrap'
				}));
				$('#invention_li<%=i%>>.main_invention_body_img_wrap>.main_invention_body_information_wrap').append($('<label/>',{
					 text:'53%'
				}));
				$('#invention_li<%=i%>>.main_invention_body_img_wrap>.main_invention_body_information_wrap').append($('<label/>',{
					 text:'11,036,000원'
				}));
				$('#invention_li<%=i%>>.main_invention_body_img_wrap>.main_invention_body_information_wrap').append($('<label/>',{
					 text:'9일 남음'
				}));
				$('#invention_li<%=i%>').append($('<div/>',{
					  class:'main_invention_body_content_wrap'
				})); 
				$('#invention_li<%=i%>>.main_invention_body_content_wrap').append($('<h3/>',{
					  text:'왜 세럼은 모두 작고 비쌀까? 목에도 바르는 대용량"밀키웨이세럼"ㅁㄷㄻㅈㄻㄷㄻㄷㄷㄻ'
				})); 
				$('#invention_li<%=i%>>.main_invention_body_content_wrap').append($('<h5/>',{
					  text:'레셀레스트'
				})); 
				//개수만큼 슬라이드 동그라미 버튼 생성
				<%if(i==0){%>
					$('.main_invention_body_slideControll_wrap').append($('<img/>',{
						  src:'${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png',
						  value:'<%=i+1%>',
						  onclick:'clickSlideCircleButton(this,317);'
					}));
				<%}else{%>
					$('.main_invention_body_slideControll_wrap').append($('<img/>',{
						  src:'${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png',
						  value:'<%=i+1%>',
						  onclick:'clickSlideCircleButton(this,317);'
					}));
				<%}%>
			<%}%>
			
			//메인 이벤트 슬라이드 화면 만들기
			<%for(int i=0;i<3;i++){%>
				$('.main_event_wrap>ul').append($('<li/>',{
				           id:'main_event_li<%=i%>'
				 }));
				$('#main_event_li<%=i%>').append($('<div/>',{
				           id:'main_event_div<%=i%>'
				 }));
				$('#main_event_div<%=i%>').append($('<em/>',{
				          text:'이벤트'
				 }));
				$('#main_event_div<%=i%>').append($('<h3/>',{
				          text:'수제맥주라디오'
				 }));
				$('#main_event_div<%=i%>').append($('<p/>',{
				          text:'맛있어에라모르겠다리오졌다리'
				 }));
				$('#main_event_li<%=i%>').append($('<img/>',{
				           src: "${pageContext.request.contextPath}/resources/images/upload/optimize.png"
				 }));
			<%}%>
			 //메인 이벤트 슬라이드 자동실행
			main_event_slide_setInterval=setInterval(function(){
				slideNext($('#main_event_slide_next_button'),700);
			},2000);
			 
			//메인 이벤트 슬라이드 마우스 올라가면 슬라이드 자동실행 중지 
			$('.main_event_wrap').hover(function(){
				clearInterval(main_event_slide_setInterval);
			},function(){
				main_event_slide_setInterval=setInterval(function(){
					slideNext($('#main_event_slide_next_button'),700);
				},2000);
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
		
			 //슬라이드 자동실행
			advertisement_setInterval=setInterval(function(){
				slideNext($('#main_advertisement_wrap_next'),650);
			},2000);
			 
			//광고 슬라이드 마우스 올라가면 슬라이드 자동실행 중지 
			$('.main_advertisement_wrap').hover(function(){
				clearInterval(advertisement_setInterval);
			},function(){
				advertisement_setInterval=setInterval(function(){
					slideNext($('#main_advertisement_wrap_next'),650);
				},2000);
			});

		});
		
   
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
					$('.main_rank_content2_img_wrap>img:nth-child(1)').css('display','block');
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
								var is=0;
								for(var j=0;j<$(ul).children().length;j++){
									if($('.main_open_schedule_body_slideControll_wrap>img:nth-child('+(j+1)+')').attr("src")=="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png"){
										is=j;
									}
								}
								$('.main_open_schedule_body_slideControll_wrap>img').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png");
								$('.main_open_schedule_body_slideControll_wrap>img:nth-child('+is+')').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png");	
								/* $('.main_open_schedule_body_slideControll_wrap>img:nth-child('+Math.ceil((($(ul).css('left').replace(/[^0-9]/g,""))/slide_img_width))+')').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png"); */			
							}
							//마감예정 슬라이드 밑에 동그라미 버튼 움직이기
							if($(ul).attr("value")=="deadline_approaching"){
								var is=0;
								for(var j=0;j<$(ul).children().length;j++){
									if($('.main_open_schedule_body_slideControll_wrap>img:nth-child('+(j+1)+')').attr("src")=="${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png"){
										is=j;
									}
								}
								$('.main_deadline_approaching_body_slideControll_wrap>img').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button.png");
								$('.main_deadline_approaching_body_slideControll_wrap>img:nth-child('+is+')').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png");	
								/* $('.main_deadline_approaching_body_slideControll_wrap>img:nth-child('+Math.ceil((($(ul).css('left').replace(/[^0-9]/g,""))/slide_img_width))+')').attr("src","${pageContext.request.contextPath}/resources/images/icon/slide_circle_button_check.png"); */			
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
			
			
	</script>
	
