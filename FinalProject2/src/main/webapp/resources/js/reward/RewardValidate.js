/**
 * 
 */

$(function(){
	if(isValidateBasicInfo()){
		changeRewardHeaderIconComplete($('.reward-menu-check-icon:eq(4)'));
	}
	
	if(isValidateMCInfo()){
		changeRewardHeaderIconComplete($('.reward-menu-check-icon:eq(5)'));
	}
	
	if (isValidateStory()) {
		changeRewardHeaderIconComplete($('.reward-menu-check-icon:eq(6)'));
	}
	
	changeRewardHeaderIconComplete($('.reward-menu-check-icon:eq(8)'));
})

function isValidate() {
	
	
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
	}
	
	return true;
}


function isValidateMCInfo() {
	if ($('input[name=rewardMCName]').val().trim().length == 0) {
		return false;
	} else if ($('[name=rewardMCIntroduce]').val().trim().length == 0) {
		return false;
	} else if ($('#reward-project-photo2').prev().css('background-image').trim().length < 7) {
		return false;
	} else if ($('input[name=rewardMCUrl1]').val().trim().length == 0) {
		return false;
	} else if ($('input[name=rewardMCUrl2]').val().trim().length == 0) {
		return false;
	} else if ($('input[name=rewardMCUrl3]').val().trim().length == 0) {
		return false;
	}
	
	return true;
}

function isValidateStory() {
	if ($('#reward-project-photo3').prev().css('background-image').trim().length < 7) {
		return false;
	} else if ($('.text-editor-content').val().trim().length == 0) {
		return false;
	}
	
	return true;
}

function isValiadteRewardItem() {
	return true;
}

function isValidateRewardPreOpen() {
	return true;
}

function isValidateRewardAccount() {
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

