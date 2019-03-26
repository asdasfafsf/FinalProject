/**
 * 
 */


$(function(){
	onClickRewardLike();
	onClickFunding();
	onClickRewardItem();
});


function onClickFunding() {
  $('.reward-funding-btn').on('click', function(e){
	 e.stopPropagation();
	 
	 var value = $(this).text().trim();

	 
	 if (value == '펀딩하기') {
	  	var lastIndex = location.href.lastIndexOf('/');
	  	var rewardNo = location.href.substr(lastIndex + 1);
	  		
		 console.log('안녕?');
		 
		 location.href = getContextPath() + '/project/reward/rewardpayment/' + rewardNo;
	 }

  });
  
}


function onClickRewardLike() {
	$('#reward-like-btn').off('click').on('click', function(e){
		e.stopPropagation();
		
		var btn = this;
		
		checkLoginAjax(function(){
			var lastIndex = location.href.lastIndexOf('/');
			var rewardNo = location.href.substr(lastIndex + 1);
			
			$.ajax({
				url:getContextPath() + '/project/reward/rewardlike',
				type:'post',
				data: {'rewardNo':rewardNo},
				success:function(data) {
					console.log(data);
					
					$(btn).removeClass();
					
					if (data.isLike == "true" || data.isLike) {
						$(btn).addClass('reward-funding-like');
					} else {
						$(btn).addClass('reward-funding-unlike');
					}
					
					$(btn).children('p').text(data.likeNum);
				}, error:function(error) {
					console.log(data);
				}
			});
		},function(){
			alertBox(function(){},'로그인 하셔야 좋아요를 누를 수 있습니다.','알림','확인');
		});
	});
	
}

function onClickRewardItem() {
	$('.reward-product-hover').on('click', function(e){
		e.stopPropagation();
		
		var text= $(this).parent().children('.reward-product-stock').text().trim().replace('개','');
		var index = $(this).parent().prevAll().length;
		console.log(text);
		
		if($('.reward-funding-btn').text().trim() != '펀딩하기'){
			alertBox(function(){},'현재 진행중인 프로젝트가 아닙니다.','알림','확인');
			return;
		}
		
		if (text == 0) {
			alertBox(function(){},'품절된 리워드입니다.','알림','확인');
			return;
		}
		
		
		var lastIndex = location.href.lastIndexOf('/');
		var rewardNo = location.href.substr(lastIndex + 1);
		
		
		location.href = getContextPath() + '/project/reward/rewardpayment/' + rewardNo + '?itemIndex=' + index;
	})
	
}



