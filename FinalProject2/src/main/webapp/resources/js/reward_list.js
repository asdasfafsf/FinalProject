/**
 * 
 */

	var global_reward_category_item_list_page = 1;
	var global_isLoding=false;
	
	$(document).ready(function(){
	
		$(window).scrollTop(0);
		
		//스크롤 페이징
		$(window).scroll(function() {
		    if ($(window).scrollTop() == $(document).height() - $(window).height()+56) {
		   	 $.ajax({
		   		url:getContextPath()+'/rewardCategoryPage',
		   		dataType:'json',
		   		data:{'cPage':global_reward_category_item_list_page,'categoryNum':$('#reward_category_title').attr("value"),"rewardState":$('#reward_state_filter').val(),"listFilter":$('#reward_watch_filter').val()},
		   		success:function(data){
		   			if(data.length>0&&!(global_isLoding)){
		   				global_isLoding=true;
		   				global_reward_category_item_list_page++;
		   				$('.reward_category_content').append($('<img/>',{
		   					id:'reward_list_loading',
		   					src:getContextPath()+'/resources/images/common/loading.gif'
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
					   				src:getContextPath()+data[i].REWARD_REPRESENT_IMAGE
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
					   			
					   			if(data[i].REWARD_STATE!=4){
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
		
		//카테고리버튼 호버
		$('#reward_category_list_next_button').hover(function(){
			$('#reward_category_list_next_button').attr('src',getContextPath()+'/resources/images/icon/slide_next3_hover.png');
		},function(){
			$('#reward_category_list_next_button').attr('src',getContextPath()+'/resources/images/icon/slide_next2.png');
		});
		
		$('#reward_category_list_back_button').hover(function(){
			$('#reward_category_list_back_button').attr('src',getContextPath()+'/resources/images/icon/slide_back3_hover.png');
		},function(){
			$('#reward_category_list_back_button').attr('src',getContextPath()+'/resources/images/icon/slide_back2.png');
		});
		
		$('#reward_state_filter').val(5);
		$('#reward_watch_filter').val(1);
		
	});
//////////////ready 끝



	
	//카테고리 넥스트버튼 클릭시 나머지 카테고리 보임
	function clickCategoryListNext(){
		$('#reward_category_list>ul').animate({
			left:'-=920px'
		});
		$('#reward_category_list').animate({
			left:'+=100px'
		});
		$('#reward_category_list_next_button').css('display','none');
		$('#reward_category_list_back_button').css('display','block');
	}
	//카테고리 백버튼 클릭시 처음 카테고리 목록으로 바뀜
	function clickCategoryListBack(){
			$('#reward_category_list>ul').animate({
				left:'+=920px'
			});
			$('#reward_category_list').animate({
				left:'-=100px'
			});
			$('#reward_category_list_next_button').css('display','block');
			$('#reward_category_list_back_button').css('display','none');
	}
	
	//카테고리 클릭 이벤트
	function clickCategory(targ){
		global_reward_category_item_list_page=1;
		if(targ=='option'){
			if($('#reward_state_filter').val()==4){
				$('#reward_watch_filter').val(1);
			}
		}
		else{
			$('#reward_category_title').text($(targ).children('p').text());
			$('#reward_category_title').attr('value',$(targ).val());
		}
		$('.reward_category_content').empty();
		$.ajax({
		   		url:getContextPath()+'/rewardCategoryPage',
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
			   				src:getContextPath()+data[i].REWARD_REPRESENT_IMAGE
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
			   			
			   			if(data[i].REWARD_STATE!=4){
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
		location.href=getContextPath()+"/project/reward/"+$(targ).attr("id");
	}
	
	