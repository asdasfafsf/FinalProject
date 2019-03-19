/**
 * 
 */



$(function(){
	onEnterRewardRecomment();
});
function onEnterRewardRecomment() {
	$('.reward-comment-recomment-content').off('keyup').on('keyup', function(e){
		console.log(e.key);
		
		if (e.key == 'Enter') {
			$(this).next().trigger('click');
		}
	});
}


function onClickRewardComment() {
	var lastIndex = location.href.lastIndexOf('/');
	var rewardNo = location.href.substr(lastIndex + 1);
	
	checkLoginAjax(function(){
		var textVal = $('.reward-comment-content').val();
		
		if (textVal.trim().length < 5) {
			alertBox(function(){},'띄어쓰기 미포함 5글자 이상 입력해주세요.','알림','확인');
		} else {
			$('#rewardCommentForm').submit();
		}
		
	}, function(){
		alertBox(function(){},'로그인 하셔야 댓글을 달 수 있습니다.','알림','확인');
	});
}


function onClickRewardRecommentWrite(btn) {
	checkLoginAjax(function(){
		var parent = $(btn).parent();
		var textVal = $(btn).prev().val();
		
		if (textVal.trim().length < 5) {
			alertBox(function(){},'띄어쓰기 미포함 5글자 이상 입력해주세요.','알림','확인');
		} else {
			var param = {};
			param.content = textVal;
			param.rootNo = $(parent).children('input[name=rootCommentNo]').val();
			param.size = Number($(parent).children('input[name=size]').val()) + 1;
			param.rewardNo = $(parent).children('input[name=rewardNo]').val();
			
			console.log(param);
			
			$.ajax({
				type:'post',
				url:getContextPath() + '/project/reward/recommentwrite',
				data:param,
				success:function(data){
					console.log(data);
					$(btn).prev().val('');
					appendRewardRecomment(data, parent);
				} , error:function(error) {
					console.log(error);
				}
			
			
			});
			
		}
		
	}, function(){
		alertBox(function(){},'로그인 하셔야 댓글을 달 수 있습니다.','알림','확인');
	});
}


function appendRewardRecomment(recommentList, parent) {
	var reParent = $(parent).next();
	
	$(reParent).children().remove();
	
	for (var i = 0; i < recommentList.length; i++) {
		var recomment = recommentList[i];
		
		$(reParent).append($('<div/>',{
			class:'reward-recomment',
			style:'margin-bottom:17.25px; margin-top:15.5px;'
		}));
		
		$(reParent).children('.reward-recomment:eq(' + i + ')').append($('<div/>', {
			class:'reward-recomment-writer-info',
			style:'margin-top:-0.25px'
		
		}));
		
		$(reParent).children('.reward-recomment:eq(' + i + ')').children('.reward-recomment-writer-info').append($('<div/>', {
			class:'reward-recomment-writer-profilephoto-wrapper'
		}));
		
		$(reParent).children('.reward-recomment:eq(' + i + ')').children('.reward-recomment-writer-info').children('.reward-recomment-writer-profilephoto-wrapper').append($('<div/>', {
			class:'reward-recomment-writer-profilephoto',
			style:'background-image:url("' + getContextPath() +  recomment.userProfilePhoto +'")'
		}));
		
		
		$(reParent).children('.reward-recomment:eq(' + i + ')').children('.reward-recomment-writer-info').append($('<div/>', {
			class:'reward-recomment-writer-name',
			text:recomment.userName,
			style:'margin-left:5.5px'
		}));
		
		$(reParent).children('.reward-recomment:eq(' + i + ')').append($('<div/>', {
			class:'reward-recomment-view-content-area',
			style:'padding-top:6px; margin-left:5.5px;'
		}));
		
		$(reParent).children('.reward-recomment:eq(' + i + ')').children('.reward-recomment-view-content-area').append($('<div/>', {
			class:'reward-recomment-view-content',
			text:recomment.content
		}));
		
		
		if (recomment.isMine == 'true' || recomment.isMine) {
			$(reParent).children('.reward-recomment:eq(' + i + ')').children('.reward-recomment-view-content-area').children('.reward-recomment-view-content').append($('<div/>', {
				class:'reward-comment-delete',
				style:'left:5.5px; top:0'
			}));
		}
		
		$(reParent).children('.reward-recomment:eq(' + i + ')').children('.reward-recomment-view-content-area').children('.reward-recomment-view-content').append($('<div/>', {
			class:'reward-recomment-write-time',
			text:recomment.dateStr,
			style:'margin-left:10.5px;'
		}));		
	}
}