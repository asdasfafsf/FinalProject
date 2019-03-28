/**
 * 
 */

$(function(){
	onClickRequestRewardCheck();
});

function getRewardStoryData() {
	var formData = new FormData();	
}

function onClickRequestRewardCheck() {
	$('#reward-check-btn').on('click', function(e){
		if(!isValidate()){
			alertBox('','모든 항목을 작성 및 저장해야 검토요청 할 수 있습니다.','알림','확인');
			return;
		}
		
		confirmBox(function(){
			var form = document.createElement('form');
			form.method='post';
			form.action = getContextPath() + '/project/reward/rewardcheck';
			var lastIndex = location.href.lastIndexOf('/');
			var rewardNo = location.href.substr(lastIndex + 1);
			
			$(form).append($('<input>',{
				name:'rewardNo',
				type:'hidden',
				value:rewardNo
			}));
			
			document.body.append(form);
			
			form.submit();
		}, '' , '프로젝트 심사중에는 프로젝트를 수정할 수 없습니다. 검토요청 하시겠습니까?','알림','확인','취소');
		


	})
}

function onClickRewardWriteNext(btn) {
	var index = $('.list-selected').prevAll().length;
	
	if (index > 4) {
		alertBox(function(){}, '마지막 메뉴입니다', '알림', '확인');
		return;
	}
	
	$('.list-selected').next().trigger('click');
}



function saveReward(path, callback) {
	var index = $('.list-selected').prevAll().length;
	
	
	if (index == 0) {
		ajaxRewardProjectForm(path, '/project/reward/updateBasicInfo',$('#rewardProjectForm')[0], function(){
			if(isValidateBasicInfo()){
				changeRewardHeaderIconComplete();
			} else {
				changeRewardHeaderIconSave();
			}	
			
			if (typeof callback == "function") {
				callback();
			}
		});
		
	} else if (index == 1) {
		ajaxRewardProjectForm(path, '/project/reward/updateMCInfo',$('#rewardMCForm')[0], function(){
			if(isValidateMCInfo()){
				changeRewardHeaderIconComplete();
			} else {
				changeRewardHeaderIconSave();
			}
			if (typeof callback == "function") {
				callback();
			}
		});
	} else if (index == 2) {		

		ajaxRewardProjectForm(path, '/project/reward/updateStory', $('#projectStoryForm')[0],
			function(){
		
				ajaxRewardProjectFormFormData(path, '/project/reward/updateStoryContent', getTextEditorContentJSONData());
				
				if(isValidateStory()){
					changeRewardHeaderIconComplete();
				} else {
					changeRewardHeaderIconSave();
				}
				
				if (typeof callback == "function") {
					callback();
				}
			}
		);
		
		
		
	} else if (index == 3) {
		if (typeof callback == 'function') {
			alertBox(callback,'리워드는 각 항목별로 개별 저장해야 합니다. 저장하지 않고 이동합니다.','알림', '확인');
		} else {
			alertBox(function(){},'리워드의 경우 저장하기 버튼이 아닌 각 항목에 있는 저장 버튼을 눌러야 저장됩니다.','알림', '확인');
		}
	} else if (index == 4) {
		ajaxRewardProjectForm(path, '/project/reward/preOpen', $('#rewardPreOpenForm')[0], function(){
			changeRewardHeaderIconComplete();
			if (typeof callback == "function") {
				callback();
			}
		});
	} else if (index == 5) {
		ajaxRewardProjectForm(path, '/project/reward/account', $('#rewardAccountForm')[0], function(){
			changeRewardHeaderIcon();
			if (typeof callback == "function") {
				callback();
				
			}
			
			if (isValidateRewardAccount()) {
				changeRewardHeaderIconComplete($('.reward-menu-check-icon:eq(9)'));	
			} else {
				changeRewardHeaderIconSave($('.reward-menu-check-icon:eq(9)'));	
			}
		});
	}
}

function ajaxRewardProjectFormFormData(path, url, storyContentList) {
	var lastIndex = location.href.lastIndexOf('/');
	var rewardNo = location.href.substr(lastIndex + 1);
	storyContentList.no = Number(rewardNo);
	

	
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
		dataType : 'text',
		success : function(data){
			
			if (typeof callback == "function") {
				callback();
			}
			
		
			
			if (data || data == "true" ) {
				alertBox(function(){},'저장되었습니다','메세지', '확인');
			}
		},  error: function(xhr, status, error) {
           
        } 

	});
	
}


