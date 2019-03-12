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


