/**
 * 
 */


$(function(){
	onClickRewardLike();
})


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
