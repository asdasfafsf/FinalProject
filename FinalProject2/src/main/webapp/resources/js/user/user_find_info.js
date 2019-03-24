$(function(){
	//이동
	$('#find_pw').click(function(){
		location.href='/test/forget_my_pw';
	});
	$('#find_id').click(function(){
		location.href='/test/forget_my_id';
	});
	
	//기능
	$('#user_find_container').submit(function(event){
		event.preventDefault();
		if($('#email').val()!=null&&$('#email').val().trim()!="")
		{
			if($('#type').text()=='아이디찾기')
			{
				$.ajax({
					url : '/test/user/isOurUserEmail',
					data : {"email" : $('#email').val()},
					type : 'post',
					success : function(data){
						if(data.linkType==0)
						{
							alertBox(null,"등록되지 않은 이메일입니다.");
						}
						else if(data.linkType==1)
						{
							alertBox(function(){location.href='/test/login'},"홈페이지 가입 회원이십니다. 로그인 후 이용해주세요.");
						}
						else if(data.linkType==2)
						{
							alertBox(function(){location.href='/test/login'},"네이버 연계 가입 회원이십니다. 로그인 후 이용해주세요.");
						}
					},
					error : function(){
						
					}
				});
			}
			else
			{
				
				$.ajax({
					url : '/test/user/findPassword',
					data : {"email" : $('#email').val()},
					type : 'post',
					async : false,
					success : function(data){
						alertBox(null,data.result_msg);
					}
				});
			}
		}
	});
});