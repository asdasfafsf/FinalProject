/**
 * 
 */

function saveProjectAllData() {
	var rewardData = {};
	
	
	
}

function getRewardStoryData() {
	var formData = new FormData();
	
}

function onClickRewardWriteNext(btn) {
	var index = $('.list-selected').prevAll().length;
	
	if (index > 4) {
		alertBox(function(){}, '마지막 메뉴입니다', '알림', '확인');
		return;
	}
	
	$('.list-selected').trigger('click');
}



function saveReward(path) {
	var index = $('.list-selected').prevAll().length;
	
	console.log(index);
	
	if (index == 0) {
		ajaxRewardProjectForm(path, '/project/reward/updateBasicInfo',$('#rewardProjectForm')[0], function(){
			if(isValidateBasicInfo()){
				changeRewardHeaderIconComplete();
			} else {
				changeRewardHeaderIconSave();
			}	
		});
		
	} else if (index == 1) {
		ajaxRewardProjectForm(path, '/project/reward/updateMCInfo',$('#rewardMCForm')[0], function(){
			if(isValidateMCInfo()){
				changeRewardHeaderIconComplete();
			} else {
				changeRewardHeaderIconSave();
			}
		});
	} else if (index == 2) {		
		ajaxRewardProjectForm(path, '/project/reward/updateStory', $('#projectStoryForm')[0],
			function(){
			ajaxRewardProjectFormFormData(path, '/project/reward/updateStoryContent', getTextEditorContentJSONData());
			}
		);
		
		
		
	} else if (index == 3) {
		alertBox(function(){},'리워드의 경우 저장하기 버튼이 아닌 각 항목에 있는 저장 버튼을 눌러야 저장됩니다.','알림', '확인');
	} else if (index == 4) {
		ajaxRewardProjectForm(path, '/project/reward/preOpen', $('#rewardPreOpenForm')[0], function(){
			changeRewardHeaderIconComplete();
		});
	} else if (index == 5) {
		ajaxRewardProjectForm(path, '/project/reward/account', $('#rewardAccountForm')[0]);
	}
}

function ajaxRewardProjectFormFormData(path, url, storyContentList) {
	var lastIndex = location.href.lastIndexOf('/');
	var rewardNo = location.href.substr(lastIndex + 1);
	storyContentList.noo = Number(rewardNo);
	
	console.log(storyContentList);
	console.log('왜그러세요??');
	
	
	$.ajax({
		type:'post',
		url:path + url,
		dataType:"json",
		contentType:"application/json",
		data: JSON.stringify(storyContentList),
		success : function(data){
			if (data || data == "true" ) {
				alertBox(function(){},'저장되었습니다','메세지', '확인');
			}
		},  error: function(xhr, status, error) {
            console.log(error);
            console.log(status);
            console.log(xhr);
        } 

	});
	
}



function ajaxRewardProjectForm(path,url, form, callback) {
	var formData = new FormData(form);
	var lastIndex = location.href.lastIndexOf('/');
	var rewardNo = location.href.substr(lastIndex + 1);
	formData.append('rewardNo', rewardNo);
	
	$.ajax({
		type:'post',
		url:path + url,
		data:formData,
		contentType : false,
		processData : false,
		success : function(data){
			if (typeof callback == "function") {
				callback();
			}
			
			if (data || data == "true" ) {
				alertBox(function(){},'저장되었습니다','메세지', '확인');
			}
		},  error: function(xhr, status, error) {
            console.log(error);
            console.log(status);
            console.log(xhr);
        } 

	});
	
}


