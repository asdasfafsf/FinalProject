/**
 * 
 */



$(function(){
	onEnterRewardRecomment();
	onClickRewardRecommentMoreShow();
	onClickCommentDelete();
	onClickRecommentDelete();
	$('.reward-report-cancel').click(function() {
		var lastIndex = location.href.lastIndexOf('/');
		var rewardNo = location.href.substr(lastIndex + 1);
		location=getContextPath() + '/project/reward/'+rewardNo;
	});
	$('.reward-report-cancel2').click(function() {
		var lastIndex = location.href.lastIndexOf('/');
		var rewardNo = location.href.substr(lastIndex + 1);
		location=getContextPath() + '/project/reward/comment/'+rewardNo;
	});
	$('.reward-report-btn').click(function() {
		console.log("dd");
		$('.reward-report-background').css('display','block');
	});
	$('.reward-report-submit').click(function () {
		var lastIndex = location.href.lastIndexOf('/');
		var rewardNo = location.href.substr(lastIndex + 1);
		var reportTitle=$('.reward-report-title').val();
		var reportContent=$('.reward-report-content').val();
		if(reportTitle.trim().length==0||reportContent.trim().length==0){
			alertBox(function(){}, '빈칸을 입력해주세요', '알림', '확인');
		}else{
		confirmBox(function(){
		console.log(rewardNo+reportTitle+reportContent);
		$.ajax({
			url:getContextPath() + '/project/reward/report',
			data:{"rewardNo":rewardNo,"reportTitle":reportTitle,"reportContent":reportContent},
			success:function(data){
				console.log(data);
				location=getContextPath()+"/project/reward/"+rewardNo;
			} , error:function(error) {
				console.log(error);
			}
		
		});},'','신고를 등록하시겠습니까?','알림','확인','취소');}
	});
	$('.reward-report-submit2').click(function () {
		var lastIndex = location.href.lastIndexOf('/');
		var rewardNo = location.href.substr(lastIndex + 1);
		var reportTitle=$('.reward-report-title').val();
		var reportContent=$('.reward-report-content').val();
		if(reportTitle.trim().length==0||reportContent.trim().length==0){
			alertBox(function(){}, '빈칸을 입력해주세요', '알림', '확인');
		}else{
		confirmBox(function(){
		console.log(rewardNo+reportTitle+reportContent);
		$.ajax({
			url:getContextPath() + '/project/reward/report',
			data:{"rewardNo":rewardNo,"reportTitle":reportTitle,"reportContent":reportContent},
			success:function(data){
				console.log(data);
				location=getContextPath()+"/project/reward/comment/"+rewardNo;
			} , error:function(error) {
				console.log(error);
			}
		
		});},'','신고를 등록하시겠습니까?','알림','확인','취소');}
	});
	
	
});

function onClickCommentDelete() {
	$('.reward-comment-delete').off('click').on('click', function(e){
		var commentNo = $(this).parents().next().next().children('[name=rootCommentNo]').val();
		var root = $(this).parent().parent();
		
		console.log(commentNo);
		console.log('안녕?');
		
		confirmBox(function(){
			$.ajax({
				type:'post',
				data:JSON.stringify({'commentNo' : commentNo}),
				url : getContextPath() + '/project/reward/deletecomment',
				dataType : 'json',
				contentType : 'application/json',
				success:function(data){
					if (data.result == 'noLogin') {
						alertBox(function(){}, '세션이 만료되었습니다. 다시 로그인하세요', '알림', '확인');
					} else if (data.result == 'success') {
						alertBox(function(){
							
						}, '댓글 삭제 성공!', '알림', '확인');
						
						$(root).remove();
					}
				}, error:function(data){
					console.log('실패');
				}
			})
		},'','정말 삭제하시겠습니까?','알림','확인','취소');
	});
}

function onClickRecommentDelete(){
	
	
	$('.reward-recomment-delete').off('click').on('click', function(e){
		var writerInfo = $(this).parent().parent().prev();
		var commentNo = $(writerInfo).children('[name=commentNo]').val();
		var root = $(this).parent().parent().parent().parent().prev();
		var rootCommentNo = $(root).children('[name=rootCommentNo]').val();
		var size = $(root).children('[name=size]').val();
		var lastIndex = location.href.lastIndexOf('/');
		var rewardNo = location.href.substr(lastIndex + 1);
		
		console.log(root);
		console.log(rootCommentNo);
		
		
		confirmBox(function(){
			$.ajax({
				type:'post',
				data:JSON.stringify({'commentNo' : commentNo, 'rootCommentNo' : rootCommentNo, 'size' : Number(size.trim()), 'rewardNo' : rewardNo}),
				url : getContextPath() + '/project/reward/deleterecomment',
				dataType : 'json',
				contentType : 'application/json',
				success:function(data){
					console.log(data);
					
					if (data.result == 'noLogin') {
						alertBox(function(){}, '세션이 만료되었습니다. 다시 로그인하세요', '알림', '확인');
					} else if (data.result == 'success') {
						alertBox(function(){
							
						}, '댓글 삭제 성공!', '알림', '확인');
				
						appendRewardRecomment(data.recommentList, $(root));
					}
				}, error:function(data){
					console.log('실패');
				}
			})
			
		},'','정말 삭제하시겠습니까?','알림','확인','취소');
		
	});
}


var global_scrollTopPrev = 0;
var global_scrollTopNext;

var global_isLoading = false;

$(window).scroll(function(e) {
    
    global_scrollTopNext = $(window).scrollTop();
    var present = $('html').height() - global_scrollTopNext;
    
    if (present < 860) {
    	if (global_scrollTopNext - global_scrollTopPrev > 0) {
    		if(!global_isLoading){
    			requestMoreCommentAjax();
    		}
    	}
    }
    
    global_scrollTopPrev = global_scrollTopNext;
});

function requestMoreCommentAjax() {
	if (global_isLoading) {
		return;
	}
	
	global_isLoading = true;
	
	var size = $('.reward-comment-wrapper').length;
	
	console.log(size);
	
	var param = {};
	param.size = size;
	param.rewardNo = $('.reward-comment-wrapper:eq(' + (size - 1) + ') input[name=rewardNo]').val();	
	param.commentNo = $('.reward-comment-wrapper:eq(' + (size - 1) + ') input[name=rootCommentNo]').val();
	
	$.ajax({
		url: getContextPath() + '/project/reward/rewardcommentload',
		data:param,
		type:'post',
		success:function(data){
			console.log(data);
			for (var i = 0; i < data.length; i++) {
				var comment = data[i];
				appendRewardComment(comment);
			}
			
			onEnterRewardRecomment();
			onClickRewardRecommentMoreShow();
			
			global_isLoading = false;
		}, error:function(data) {
			global_isLoading = false;
		}
		
	});
}

function onClickRewardRecommentMoreShow() {
	$('.recomment-plus').off('click').on('click', function(e){
		global_isLoading = true;
		e.stopPropagation();
		
		var hiddenArea = $(this).parent().parent().prev();
		var sizeVal = Number($(hiddenArea).children('input[name=size]').val());
		
		if (sizeVal < 5) {
			$(this).hide();
			global_isLoading = false;
		} else {
			global_isLoading = true;
			sizeVal += 5;
			
			var param = {};
			param.size = sizeVal;
			param.rewardNo = $(hiddenArea).children('input[name=rewardNo]').val();
			param.rootNo = $(hiddenArea).children('input[name=rootCommentNo]').val();
			
			$.ajax({
				type:'post',
				url:getContextPath() + '/project/reward/rewardrecommentload',
				data: param,
				success:function(data) {
					console.log(data);
					if (typeof data != "undefined" && data.length != 0) {
						appendRewardRecomment(data, hiddenArea);
					}
					
					global_isLoading = false;
				}, error:function(error) {
					console.log('에러');
					global_isLoading = false;
				}
			});
		}
		
		
		
	});
	
}


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
			param.size = Number($(parent).children('input[name=size]').val());
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

function appendRewardComment(comment) {
	var index = $('.reward-comment-wrapper').length;
	
	$('.reward-comment-list').append($('<div/>',{
		class:'reward-comment-wrapper'
	}));
	
	$('.reward-comment-wrapper:eq(' + index + ')').append($('<div/>',{
		class:'reward-comment-writer-info-area'
	}));
	
	$('.reward-comment-wrapper:eq(' + index + ') .reward-comment-writer-info-area').append($('<div/>',{
		class:'reward-comment-writer-profilephoto-wrapper'
	}));
	
	$('.reward-comment-wrapper:eq(' + index + ') .reward-comment-writer-info-area .reward-comment-writer-profilephoto-wrapper').append($('<div/>',{
		class:'reward-comment-writer-profilephoto',
		style:'background-image:url("' +getContextPath() + comment.userProfilePhoto + '");'
	}));
	
	$('.reward-comment-wrapper:eq(' + index + ') .reward-comment-writer-info-area').append($('<div/>',{
		class:'reward-comment-writer-name-wrapper'
	}));
	
	if (comment.isMine || comment.isMine == 'true') {
		$('.reward-comment-wrapper:eq(' + index + ') .reward-comment-writer-info-area').append($('<div/>',{
			class:'reward-comment-delete',
			style:'left:462px'
		}));
		
	}
	
	
	$('.reward-comment-wrapper:eq(' + index + ') .reward-comment-writer-info-area .reward-comment-writer-name-wrapper').append($('<p/>',{
		class:'reward-comment-writer-name',
		text:comment.userName
	}));
	
	$('.reward-comment-wrapper:eq(' + index + ') .reward-comment-writer-info-area .reward-comment-writer-name-wrapper').append($('<p/>',{
		class:'reward-comment-write-date',
		text:comment.dateStr
	}));
	
	$('.reward-comment-wrapper:eq(' + index + ') .reward-comment-writer-info-area').append($('<div/>',{
		class:'reward-comment-content-area',
		text:comment.content
	}));
	
	$('.reward-comment-wrapper:eq(' + index + ') .reward-comment-writer-info-area').append($('<div/>',{
		class:'reward-comment-recomment-area',
	}));
	
	$('.reward-comment-wrapper:eq(' + index + ') .reward-comment-writer-info-area .reward-comment-recomment-area').append($('<input/>',{
		type:'text',
		class:'reward-comment-recomment-content'
	}));
	
	$('.reward-comment-wrapper:eq(' + index + ') .reward-comment-writer-info-area .reward-comment-recomment-area').append($('<div/>',{
		onClick:'onClickRewardRecommentWrite(this)',
		style:'margin-left:5px',
		class:'reward-recomment-btn',
		html:'<p>답글</p>'
	}));
	
	$('.reward-comment-wrapper:eq(' + index + ') .reward-comment-writer-info-area .reward-comment-recomment-area').append($('<input/>',{
		type:'hidden',
		name:'rootCommentNo',
		value:comment.no
	}));
	
	$('.reward-comment-wrapper:eq(' + index + ') .reward-comment-writer-info-area .reward-comment-recomment-area').append($('<input/>',{
		type:'hidden',
		name:'rewardNo',
		value:comment.rewardNo
	}));
	
	$('.reward-comment-wrapper:eq(' + index + ') .reward-comment-writer-info-area .reward-comment-recomment-area').append($('<input/>',{
		type:'hidden',
		name:'size',
		value:comment.recommentList.length	
	}));
	
	$('.reward-comment-wrapper:eq(' + index + ') .reward-comment-writer-info-area .reward-comment-recomment-area').append($('<input/>',{
		type:'hidden',
		name:'userNo',
		value:comment.userNo	
	}));
	
	
	$('.reward-comment-wrapper:eq(' + index + ') .reward-comment-writer-info-area').append($('<div/>',{
		class:'reward-recomment-list',
	}));
	
	var parent = $('.reward-comment-wrapper:eq(' + index + ') .reward-recomment-list').prev();
	
	appendRewardRecomment(comment.recommentList, parent);
	
	if (comment.recommentList.length > 0) {
	
	$(parent).next().append($('<div/>', {
		class:'reward-recomment-plus',
		html:'<p class="reward-comment-warning-content recomment-plus" style="width:70px;">댓글 더 보기</p>'
	}));
	
	}
	
	onClickCommentDelete();
	
}


function appendRewardRecomment(recommentList, parent) {
	$(parent).children('input[name=size]').val(recommentList.length);
	var reParent = $(parent).next();
	
	$(reParent).children('.reward-recomment').remove();
	
	for (var i = recommentList.length - 1; i >= 0; i--) {
		var recomment = recommentList[i];
		
		$(reParent).prepend($('<div/>',{
			class:'reward-recomment',
			style:'margin-bottom:17.25px; margin-top:15.5px;'
		}));
		
		$(reParent).children('.reward-recomment:eq(' + 0 + ')').append($('<div/>', {
			class:'reward-recomment-writer-info',
			style:'margin-top:-0.25px'
		
		}));
		
		$(reParent).children('.reward-recomment:eq(' + 0 + ')').children('.reward-recomment-writer-info').append($('<div/>', {
			class:'reward-recomment-writer-profilephoto-wrapper'
		}));
		
		$(reParent).children('.reward-recomment:eq(' + 0 + ')').children('.reward-recomment-writer-info').children('.reward-recomment-writer-profilephoto-wrapper').append($('<div/>', {
			class:'reward-recomment-writer-profilephoto',
			style:'background-image:url("' + getContextPath() +  recomment.userProfilePhoto +'")'
		}));
		
		
		$(reParent).children('.reward-recomment:eq(' + 0 + ')').children('.reward-recomment-writer-info').append($('<div/>', {
			class:'reward-recomment-writer-name',
			text:recomment.userName,
			style:'margin-left:5.5px'
		}));
		
		$(reParent).children('.reward-recomment:eq(' + 0 + ')').children('.reward-recomment-writer-info').append($('<input/>', {
			type:'hidden',
			name:'userNo',
			value:recomment.userNo
		}));
		
		$(reParent).children('.reward-recomment:eq(' + 0 + ')').children('.reward-recomment-writer-info').append($('<input/>', {
			type:'hidden',
			name:'commentNo',
			value:recomment.no
		}));
		
		$(reParent).children('.reward-recomment:eq(' + 0 + ')').append($('<div/>', {
			class:'reward-recomment-view-content-area',
			style:'padding-top:6px; margin-left:5.5px;'
		}));
		
		$(reParent).children('.reward-recomment:eq(' + 0 + ')').children('.reward-recomment-view-content-area').append($('<div/>', {
			class:'reward-recomment-view-content',
			text:recomment.content
		}));
		
		
		if (recomment.isMine == 'true' || recomment.isMine) {
			$(reParent).children('.reward-recomment:eq(' + 0 + ')').children('.reward-recomment-view-content-area').children('.reward-recomment-view-content').append($('<div/>', {
				class:'reward-recomment-delete',
				style:'left:5.5px; top:0'
			}));
		}
		
		$(reParent).children('.reward-recomment:eq(' + 0 + ')').children('.reward-recomment-view-content-area').children('.reward-recomment-view-content').append($('<div/>', {
			class:'reward-recomment-write-time',
			text:recomment.dateStr,
			style:'margin-left:10.5px;'
		}));	
		
		
		
		onClickRecommentDelete();
	}
	$(document).ready(function() {
		
	
	
	});
}