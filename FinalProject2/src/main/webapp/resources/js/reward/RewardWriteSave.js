/**
 * 
 */



function saveBasicInfo() {
	var formData = new FormData();
	var data = {};
	
	data.projectTitle = $('input[name=rewardTitle]').val();
	data.projectShortTitle = $('input[name=rewardShortTitle]').val();
	data.projectCategory = $('select[name=rewardCategory]').val();
	data.projectGoal = $('textarea[name=rewardProjectSynopsis]').val();
	data.projectDeadline = $('input[name=rewardDeadline').val();
	
	formData.append('projectRepresentMedia','');
	
	
	$.ajax({
		type:'post',
		url:'',
		data:'formData',
		contentType : false,
		processData : false,
		success : function(data){
			
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
