function deleteAddress(no)
{
	if(confirm("정말 삭제하시겠습니까?"))
	{
		$.ajax({
			url:"/test/myprofile/modify/address/delete",
			data : {"addressNo":no},
			type : 'get',
			dataType : 'json',
			success : function(data){
				alert(data.msg);
				location.href=data.loc;
			}
		});
	}
}