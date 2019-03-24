
//비밀번호 찾기 페이지로
$(function(){
	$('#btn-find-user').click(function(){
		location.href = '/test/forget_my_pw';
	});
	
	
//로그인
	$('#loginFrm').submit(function(event){
		
		event.preventDefault();
		
		if($('#email').val().trim()!=null&&$('#email').val().trim()!=""&&$('#password').val().trim()!=null&&$('#password').val().trim()!='')
		{
			$.ajax({
				url:"/test/login.do",
				data:{"email":$('#email').val().trim(),"password":$('#password').val().trim()},
				type:'post',
				success: function(data){
					if(data.msg!=null&&data.msg!='')
					{
						$('#loginError').text(data.msg).css('color','red');
						$('#password').val('');
						$('#password').focus();
					}
					else
					{
						if (typeof data.destination != "undefined" || data.destination == "undefined") {
							location.href = data.destination;
							return;
						} 
							location.href=data.loc;
					}
				}
			});
		}
		else
		{
			$('#loginError').text('아이디와 비밀번호를 입력해 주세요').css('color','red');
		}
	});
	
//네이버 로그인
	
//아이디 저장 (쿠키)
	
});