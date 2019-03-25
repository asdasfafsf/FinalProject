/**
 * 
 */

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
				 $('#main_advertisement_wrap_back').attr('src',getContextPath()+'/resources/images/icon/slide_back2_hover.png');
				 $('#main_advertisement_wrap_back').css('background-color','rgba(0,0,0,0.3)');
			}, function(){
				 $('#main_advertisement_wrap_back').attr('src',getContextPath()+'/resources/images/icon/slide_back2.png');
				 $('#main_advertisement_wrap_back').css('background-color','rgba(0,0,0,0.2)');
			});
			
			$('#main_advertisement_wrap_next').hover(function(){
				 $('#main_advertisement_wrap_next').attr('src',getContextPath()+'/resources/images/icon/slide_next2_hover.png');
				 $('#main_advertisement_wrap_next').css('background-color','rgba(0,0,0,0.3)');
			}, function(){
				 $('#main_advertisement_wrap_next').attr('src',getContextPath()+'/resources/images/icon/slide_next2.png');
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

			//메인 이벤트 슬라이드 좌우 버튼 호버이벤트
				$('#main_event_slide_back_button').hover(function(){
					 $('#main_event_slide_back_button').attr('src',getContextPath()+'/resources/images/icon/slide_back2_hover.png');
					 $('#main_event_slide_back_button').css('background-color','rgba(0,0,0,0.3)');
				}, function(){
					 $('#main_event_slide_back_button').attr('src',getContextPath()+'/resources/images/icon/slide_back2.png');
					 $('#main_event_slide_back_button').css('background-color','rgba(0,0,0,0.2)');
				});
			
				$('#main_event_slide_next_button').hover(function(){
					 $('#main_event_slide_next_button').attr('src',getContextPath()+'/resources/images/icon/slide_next2_hover.png');
					 $('#main_event_slide_next_button').css('background-color','rgba(0,0,0,0.3)');
				}, function(){
					 $('#main_event_slide_next_button').attr('src',getContextPath()+'/resources/images/icon/slide_next2.png');
					 $('#main_event_slide_next_button').css('background-color','rgba(0,0,0,0.2)');
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
									if($('.main_open_schedule_body_slideControll_wrap>img:nth-child('+(j+1)+')').attr("src")==getContextPath()+"/resources/images/icon/slide_circle_button_check.png"){
										is=j;
									}
								} */
								$('.main_open_schedule_body_slideControll_wrap>img').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button.png");
								//$('.main_open_schedule_body_slideControll_wrap>img:nth-child('+is+')').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button_check.png");	
								 $('.main_open_schedule_body_slideControll_wrap>img:nth-child('+Math.ceil((($(ul).css('left').replace(/[^0-9]/g,""))/slide_img_width))+')').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button_check.png"); 			
							}
							//마감예정 슬라이드 밑에 동그라미 버튼 움직이기
							if($(ul).attr("value")=="deadline_approaching"){
								/* var is=0;
								for(var j=0;j<$(ul).children().length;j++){
									if($('.main_open_schedule_body_slideControll_wrap>img:nth-child('+(j+1)+')').attr("src")==getContextPath()+"/resources/images/icon/slide_circle_button_check.png"){
										is=j;
									}
								} */
								$('.main_deadline_approaching_body_slideControll_wrap>img').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button.png");
								//$('.main_deadline_approaching_body_slideControll_wrap>img:nth-child('+is+')').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button_check.png");	
								 $('.main_deadline_approaching_body_slideControll_wrap>img:nth-child('+Math.ceil((($(ul).css('left').replace(/[^0-9]/g,""))/slide_img_width))+')').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button_check.png"); 			
							}
							//신규상품 슬라이드 밑에 동그라미 버튼 움직이기
							if($(ul).attr("value")=="invention"){
								$('.main_invention_body_slideControll_wrap>img').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button.png");
								$('.main_invention_body_slideControll_wrap>img:nth-child('+Math.ceil((($(ul).css('left').replace(/[^0-9]/g,""))/slide_img_width))+')').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button_check.png");			
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
							    $('.main_open_schedule_body_slideControll_wrap>img').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button.png");
								$('.main_open_schedule_body_slideControll_wrap>img:nth-child('+ul.children().length+')').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button_check.png");
							}
							if($(ul).attr("value")=="deadline_approaching"){ 
							    $('.main_deadline_approaching_body_slideControll_wrap>img').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button.png");
								$('.main_deadline_approaching_body_slideControll_wrap>img:nth-child('+ul.children().length+')').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button_check.png");
							}
							if($(ul).attr("value")=="invention"){ 
							    $('.main_invention_body_slideControll_wrap>img').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button.png");
								$('.main_invention_body_slideControll_wrap>img:nth-child('+ul.children().length+')').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button_check.png");
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
								if($('.main_open_schedule_body_slideControll_wrap>img:nth-child('+(j+1)+')').attr("src")==getContextPath()+"/resources/images/icon/slide_circle_button_check.png"){
									is=j+2;
								}
							}
							$('.main_open_schedule_body_slideControll_wrap>img').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button.png");
							$('.main_open_schedule_body_slideControll_wrap>img:nth-child('+is+')').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button_check.png");
							/* $('.main_open_schedule_body_slideControll_wrap>img:nth-child('+Math.ceil(((($(ul).css('left').replace(/[^0-9]/g,""))/slide_img_width)+2))+')').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button_check.png"); */			
						}
						//마감예정 슬라이드 밑에 동그라미 버튼 움직이기
						if($(ul).attr("value")=="deadline_approaching"){
							var is=0;
							for(var j=0;j<$(ul).children().length;j++){
								if($('.main_deadline_approaching_body_slideControll_wrap>img:nth-child('+(j+1)+')').attr("src")==getContextPath()+"/resources/images/icon/slide_circle_button_check.png"){
									is=j+2;
								}
							}
							$('.main_deadline_approaching_body_slideControll_wrap>img').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button.png");
							$('.main_deadline_approaching_body_slideControll_wrap>img:nth-child('+is+')').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button_check.png");
							/* $('.main_deadline_approaching_body_slideControll_wrap>img:nth-child('+Math.ceil(((($(ul).css('left').replace(/[^0-9]/g,""))/slide_img_width)+2))+')').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button_check.png"); */			
						}
						//신규상품 슬라이드 밑에 동그라미 버튼 움직이기
						if($(ul).attr("value")=="invention"){
							var is=0;
							for(var j=0;j<$(ul).children().length;j++){
								if($('.main_invention_body_slideControll_wrap>img:nth-child('+(j+1)+')').attr("src")==getContextPath()+"/resources/images/icon/slide_circle_button_check.png"){
									is=j+2;
								}
							}
							$('.main_invention_body_slideControll_wrap>img').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button.png");
							$('.main_invention_body_slideControll_wrap>img:nth-child('+is+')').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button_check.png");
							/* $('.main_invention_body_slideControll_wrap>img:nth-child('+Math.ceil(((($(ul).css('left').replace(/[^0-9]/g,""))/slide_img_width)+2))+')').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button_check.png"); */			
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
							$('.main_open_schedule_body_slideControll_wrap>img').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button.png");
							$('.main_open_schedule_body_slideControll_wrap>img:nth-child(1)').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button_check.png");			
						}
						if($(ul).attr("value")=="deadline_approaching"){
							$('.main_deadline_approaching_body_slideControll_wrap>img').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button.png");
							$('.main_deadline_approaching_body_slideControll_wrap>img:nth-child(1)').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button_check.png");			
						}
						if($(ul).attr("value")=="invention"){
							$('.main_invention_body_slideControll_wrap>img').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button.png");
							$('.main_invention_body_slideControll_wrap>img:nth-child(1)').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button_check.png");			
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
				$(targ).attr('src',getContextPath()+'/resources/images/icon/slide_back2_hover.png');
				$(targ).hover(function(){
					$(targ).attr('src',getContextPath()+'/resources/images/icon/slide_back2_hover.png');
				},function(){
					$(targ).attr('src',getContextPath()+'/resources/images/icon/slide_back2.png');
				});
			}
			// 슬라이드 앞로 버튼 호버 이벤트
			function slideNextButtonHover(targ){
				$(targ).attr('src',getContextPath()+'/resources/images/icon/slide_next2_hover.png');
				$(targ).hover(function(){
					$(targ).attr('src',getContextPath()+'/resources/images/icon/slide_next2_hover.png');
				},function(){
					$(targ).attr('src',getContextPath()+'/resources/images/icon/slide_next2.png');
				});
			}
			//슬라이드 동그라미버튼 클릭 이벤트
			function clickSlideCircleButton(targ,slide_img_width){
				var ul=$(targ).parent().siblings('ul');
				var click_index=$(targ).attr("value");
				var now_index=1;
				
				for(var i=1;i<=(ul.children().length);i++){
					 if($('.'+$(targ).parent().attr('class')+'>img:nth-child('+i+')').attr("src")==getContextPath()+"/resources/images/icon/slide_circle_button_check.png"){
						 now_index=$('.'+$(targ).parent().attr('class')+'>img:nth-child('+i+')').attr("value");
					 } 
				} 
		
				$(targ).siblings('img').attr("src",getContextPath()+"/resources/images/icon/slide_circle_button.png");
				$(targ).attr("src",getContextPath()+"/resources/images/icon/slide_circle_button_check.png");
				
				$(ul).animate({
					left:'-='+(slide_img_width*(click_index-now_index))+'px'
				});
			}
			
			function clickReward(targ){
				location.href=getContextPath()+"/project/reward/"+$(targ).attr("id");
			}
			function clickNotice(targ){
				console.log($(targ).attr("id"));
				location.href=getContextPath()+"/noticeDetail?idx="+$(targ).attr("id");
			}
			function clickEvent(targ){
				console.log($(targ).attr("id"));
				location.href=getContextPath()+"/eventDetail?idx="+$(targ).attr("id");
			}
			