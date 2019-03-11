/**
 * 
 */

function saveReward(path) {
	var index = $('.list-selected').prevAll().length;
	
	if (index == 0) {
		ajaxRewardProjectForm(path, '/project/reward/updateBasicInfo',$('#rewardProjectForm')[0]);
	} else if (index == 1) {
		ajaxRewardProjectForm(path, '/project/reward/updateMCInfo',$('#rewardMCForm')[0]);
	}
	
}

function ajaxRewardProjectForm(path,url, form) {
	var formData = new FormData(form);
	
	$.ajax({
		type:'post',
		url:path + url,
		data:formData,
		contentType : false,
		processData : false,
		success : function(data){
			
		},  error: function(xhr, status, error) {
            console.log(error);
            console.log(status);
            console.log(xhr);
        } 

	});
	
}


function saveBasicInfo(path) {
	var formTag = document.createElement('form');

	var formData = new FormData(formTag);
	var data = {};
	var contentType = true;
	var processType = false;
	
	formTag.enctype='multipart/form-data';
	formTag.method='post';
	
	console.log(formTag);
	data.rewardTitle = $('input[name=rewardTitle]').val();
	data.rewardShortTitle = $('input[name=rewardShortTitle]').val();
	data.rewardCategory = $('select[name=rewardCategory]').val();
	data.rewardGoal = $('textarea[name=rewardProjectSynopsis]').val();
	data.rewardDeadline = $('input[name=rewardDeadline]').val();
	
	console.log(data);
	
	
	formData.append('abc', 'hihi');
	
	if (typeof $('#reward-project-photo1')[0].files[0] != "undefined") {
		formData.append('file',$('#reward-project-photo1')[0].files[0]);
	}
	
	$.ajax({
		type:'post',
		url:path + url,
		data:formData,
		contentType : contentType,
		processData : processType,
		success : function(data){
			
		},  error: function(xhr, status, error) {
            console.log(error);
            console.log(status);
            console.log(xhr);
        } 

	});	
}

function saveMCInfo() {
	
}

function saveStory() {
	
	
}

function saveOpen() {
	
}

function saveMoney() {
	
	
}
