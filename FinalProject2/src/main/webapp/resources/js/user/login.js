

//input의 focus/blur에 따라, 감싸고 있는 div의 테두리를 변화시킴
        $(function(){
            $('.loginInput').focus(function(){
                $(this).parent().css('border','3px solid #D0CCE8');
                $(this).parent().css('margin','3px');
            });
            $('.loginInput').blur(function(){
                $(this).parent().css('border','1px solid rgba(0, 0, 0, 0.2)');
                $(this).parent().css('margin','5px');
            });
        });
        
        $('#loginFrm').submit(function(event){
			
			event.preventDefault();
			
			$.ajax({
				url:"/test/login/basic",
				data:{"email":$('#email').val(),"password":$('#password').val()},
				type:'post',
				dataType:'json',
				success: function(data){
					console.log(data)
					if(data.msg!=null&&data.msg!='')
					{
						$('#loginError').text(data.msg).css('color','red');
						/* location.href='${path}/login'; */
						$('#email').val('');
						$('#password').val('');
						$('#email').focus();
					}
					else
					{
						console.log("널임");
						window.location.href="/test/main";
					}
				}
			});
		});
/* $(function(){
location.harf='/test/naver/naverlogin';
	}); */