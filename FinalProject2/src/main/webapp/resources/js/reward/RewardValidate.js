	/**
 * 
 */

$(function(){
	setRewardCheckIcon();
	
	if(isValidateBasicInfo()){
		changeRewardHeaderIconComplete($('.reward-menu-check-icon:eq(4)'));
	}
	
	if(isValidateMCInfo()){
		changeRewardHeaderIconComplete($('.reward-menu-check-icon:eq(5)'));
	}
	
	if (isValidateStory()) {
		changeRewardHeaderIconComplete($('.reward-menu-check-icon:eq(6)'));
	}
	
	if (isValidateRewardReward()) {
		changeRewardHeaderIconComplete($('.reward-menu-check-icon:eq(7)'));
	}
	
	if (isValidateRewardAccount()) {
		changeRewardHeaderIconComplete($('.reward-menu-check-icon:eq(9)'));
		
	}
	
	
	changeRewardHeaderIconComplete($('.reward-menu-check-icon:eq(8)'));
})

function isValidate() {
	var length = $('.reward-menu .reward-menu-complete').length;
	var length2 = $('.reward-menu li').length;
	
	return length == length2;
}




function isValidateBasicInfo() {
	
	if ($('input[name=rewardTitle]').val().trim().length == 0) {
		return false;
	} else if ($('input[name=rewardShortTitle]').val().trim().length == 0){
		return false;
	} else if ($('#reward-project-photo1').prev().css('background-image').trim().length  < 7){
		return false;
	} else if ($('[name=rewardSynopsis]').val().trim().length == 0) {
		return false;
	} else if (Number($('input[name=rewardGoal]').val()) < 0 || Number($('input[name=rewardGoal]').val()) == "NaN") {
		return false;
	} else if ($('#rewardStartDate').val() < $('#rewardStartDate').attr('min') || $('#rewardStartDate').val() > $('#rewardStartDate').attr('max')) {
		return false;
	}  else if ($('#rewardDeadline').val() > $('#rewardDeadline').attr('min') || $('#rewardDeadline').val() < $('#rewardDeadline').attr('max')) {
		return false;
	} 
	
	console.log($('#rewardStartDate').val() > $('#rewardStartDate').attr('min'));
	console.log('댐?');
	
	return true;
}


function isValidateMCInfo() {
	if ($('input[name=rewardMCName]').val().trim().length == 0) {
		return false;
	} else if ($('[name=rewardMCIntroduce]').val().trim().length == 0) {
		return false;
	} else if ($('#reward-project-photo2').prev().css('background-image').trim().length < 7) {
		return false;
	}
	
	return true;
}

function isValidateStory() {
	if ($('#reward-project-photo3').prev().css('background-image').trim().length < 7) {
		console.log('아님여기?');
		return false;
	} else if ($('.text-editor-content')[0].childNodes.length == 0) {
		console.log('여기?');
		return false;
	}
	
	return true;
}

function isValidateRewardReward() {
	if ($('.reward-subcontents .reward-menu-no-save').length != 0) {
		return false;
	} else if ($('.reward-subcontents .reward-menu-save').length != 0) {
		return false;
	} else if ($('.reward-subcontents .reward-content').length == 0) {
		return false;
	}
	
	return true;
}

function setRewardCheckIcon() {
	var children = $('.reward-subcontents > .reward-content');
	
	if (children.length == 0) {
		changeRewardHeaderIconSave($('.reward-menu-check-icon:eq(7)'));
		return;
	}
	
	for (var i = 0; i < children.length; i++) {
		if(isValidateRewardItem(rewardItemToJSON(i, 0))) {
			changeRewardHeaderIconComplete($(children[i]).children('.reward-menu-check-icon'));
			
			$(children[i]).trigger('click');
		}
	}
}


function isValidateRewardItem(rewardItem) {
	console.log('어디서걸리나보자!');
	
	if (typeof rewardItem.price == "undefined" || rewardItem.price <= 0) {
		return false;
	} else if(typeof rewardItem.maxNum == "undefined" || rewardItem.maxNum <= 0) {
		return false;
	} else if(typeof rewardItem.name == "undefined" || rewardItem.name.length == 0) {
		return false;
	} else if (typeof rewardItem.introduce == "undefined" || rewardItem.introduce.length == 0) {
		return false;
	} else if (typeof rewardItem.needAddress == "undefined") {
		return false;
	} else if (typeof rewardItem.deliveryPrice == "undefined" || Number(rewardItem.deliveryPrice) <= 0) {
		return false;
	} else if (typeof rewardItem.deliveryStart == "undefined" || Number(rewardItem.deliveryStart) > 30 || Number(rewardItem.deliveryStart) <= 0) {
		return false;
	} else if (typeof rewardItem.deliveryEnd == "undefined" || Number(rewardItem.deliveryEnd) > 60 || Number(rewardItem.deliveryEnd) <= 0) {
		return false;
	}
	
	console.log('야?');
	
	return true;
}


function isValidateRewardPreOpen() {
	return true;
}

function isValidateRewardAccount() {
	if ($('[name=fintech_use_num]').val().length < 5) {
		return false;
	} else if ($('#reward-project-photo4').prev().css('background-image').length < 7) {
		return false;
	}
	
	return true;
}


function isURL(text) {
	var reg = new RegExp('/[-a-zA-Z0-9@:%_\+.~#?&//=]{2,256}\.[a-z]{2,4}\b(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?/gi');
	console.log(text + 'd?');
	

	return reg.test(text);
}


function changeRewardHeaderIcon(headerIcon) {
	
	if (typeof headerIcon == "undefined") {
		headerIcon = $('.list-selected > div');
	}
	
	$(headerIcon).removeClass();
	$(headerIcon).addClass('reward-menu-check-icon');
	$(headerIcon).addClass('reward-menu-no-save');
}

function changeRewardHeaderIconComplete(headerIcon) {
	if (typeof headerIcon == 'undefined') {
		headerIcon = $('.list-selected > div');
	}
	
	$(headerIcon).removeClass();
	$(headerIcon).addClass('reward-menu-check-icon');
	$(headerIcon).addClass('reward-menu-complete');
}


function changeRewardHeaderIconSave(headerIcon) {
	if (typeof headerIcon == "undefined") {	
		headerIcon = $('.list-selected > div');
	}
	
	$(headerIcon).removeClass();
	$(headerIcon).addClass('reward-menu-check-icon');
	$(headerIcon).addClass('reward-menu-save');
}



