$(function(){
	$('#addAddress').click(function(){
		addAddress();
	});
});

function addAddress()
{
	
}

function deleteAddress()
{
	$.ajax({
		url : '/test/myprofile/edit/del/address',
		type : 'post',
		data : {'addrNo':$('#addrNo').val()},
		success : function(data){
			alertBox(null,"삭제되었습니다");
		}
	});
}