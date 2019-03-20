function goEmailRegist()
{
	location.href='/test/regist/basic';
}

$(function(){
	$('#userEditMsg').change(function(){
		console.log('잡힘');
		if($('#userEditMsg').val()!=null)
		{
			alert(userEditMsg);
			if(('#isEdited').val()!=null)
			{
				location.href='/test/main';
			}
			else
			{
				location.href='/test/welcome';
			}
		}
	});
});