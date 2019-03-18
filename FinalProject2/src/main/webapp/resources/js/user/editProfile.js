var global_name="";
$(function(){
	$('#editUserProfile').click(function(){
		location.href="/test/myprofile/modify/basic"
	});
	$('#editAddress').click(function(){
		location.href="/test/myprofile/modify/address"
	});
	$('#editAccount').click(function(){
		location.href="/test/myprofile/modify/account"
	});
	$('#editPassword').click(function(){
		location.href="/test/myprofile/modify/password"
	});
	$('#myPhoto-container').hover(function(){
		$('.photoBtn').show();
	},function(){
		$('.photoBtn').hide();
	});
	
	$('#deletePhoto').click(function(){
		var form = $('#photoFrm')[0];
		var formData = new FormData(form);
		sendFile(formData);
	});
	$('#editPhoto').click(function(){
		$('#selectedPhoto').click();
	});
	$('#selectedPhoto').change(function(e){
		var form = $('#photoFrm')[0];
		var formData = new FormData(form);
		sendFile(formData);
	});
	$('#myName-container').hover(function(){
		$('#editNameBtn').show();
	},function(){
		$('#editNameBtn').hide();
	});
	$('#editNameBtn').click(function(){
		$('#editUserName').show();
		$('#userName').hide();
		$('#editNameBtn').hide();
		$('#selectNameBtn').show();
		$('#myName-container').unbind();
	});
	$('#selectNameBtn').click(function(){
		global_name=$('#userName').val();
		$('#selectNameBtn').hide();
		$('#editUserName').hide();
		var changedName=$('#editUserName').val();
		console.log(changedName);
		if(nameReg($('#editUserName')))
		{
			if(changedName!=global_name)
			{
				changeName(editUserName);
			}
		}
		
	});
});

function changeName(editUserName)
{
	$.ajax({
		type :'post',
		url : '/test/myprofile/modify/userName.do',
		data : editUserName,
		dataType : 'json',
		success : function(data){
			if(data!=null)
			{
				alert(data.msg);
				location.href=data.loc;
			}
		}
	});
}

function sendFile(formData)
{
	$.ajax({
		type :'post',
		url : '/test/myprofile/modify/profilephoto.do',
		data : formData,
		contentType : false,
		processData : false,
		success : function(data){
			if(data!=null)
			{
				alert(data.msg);
				location.href=data.loc;
			}
		}
	});
}

function nameReg(name)
{
    var re=/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*].{1,}$/;
    return check(re,name);
}
//정규식 확인용 함수
function check(re, what) {
    if(re.test(what.val())) 
    {
        return true;
    }
}