/**
 * 
 */


$(function(){
	onClickRewardLike();
	onClickFunding();
});


function onClickFunding() {
  $('.reward-funding-btn').on('click', function(e){
	 e.stopPropagation();
	 
	 var value = $(this).text().trim();
	 
	 var form = document.createElement('form');
	 form.action = getContextPath() + '/project/test';
	 form.method = 'post';
	 console.log(form);
	 var formData = new FormData(form);
	 
	 var hihi = ['안녕','반가워'];
	 var nonono = {"반가워":"나두", "넌?": hihi};
	 formData.append('hihi', JSON.stringify(nonono));
	 formData.append("dd",hihi);
	 formData.append('dd','asdasd');
	 
	 document.body.appendChild(form);
	 
	 //form.submit();
	 
	 
	 
	 return;
	 
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



