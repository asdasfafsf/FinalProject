//회원가입시 충족해야 하는 조건들
	var global_idCheck=0;
	var global_pwCheck=0;
	var global_emailConform = 0;

//타이머용 
	var global_time_sum=0;
	
//인증한 이메일과 가입 이메일 같은지 확인 위한 global변수
	var global_conformEmail="";
	
	
	//약관 확인 눌려있고, 이메일 맞으면 
    	//이메일 보내서 인증
			function sendEmail(){
				//타이머 리셋
				global_time_sum=30;
				
				//인증번호 기능 사용 가능하게(시간초과 후 재전송시 필요)
				ableConfirm();
				
				//이메일 가져옴
				global_conformEmail=$('#email').val();
				//버튼 글씨 바꿈(한번 전송했다고)
				$('#emailConfirm').val('재전송');
				
				//타이머 시작
				timer();
				
				//이메일 보내는 ajax
				$.ajax({
					url:"/test/sendEmail",
					type:'post',
					data:{"email":$('#email').val()},
					dataType:'json',
					success:function(data){
					}
				});
				//인증번호 창 보이기
				$('#confirmNo').css('display','inline-block');
			}
			
			
			//타이머 멈추기 위한 변수
			var global_timerId;
			
			//인증시간 5분, 1초마다 1씩 줄어드는 타이머
			function timer(){
				global_timerId=setInterval("timeSum();", 1000);
			}
			
			//1씩 줄이기 , 시간이 다 가면 멈추기
			function timeSum(){
				global_time_sum-=1;
				$('#timer').text(global_time_sum);
				
				if(global_time_sum==0)
				{
					clearInterval(global_timerId);
					timeUp();
				}
			}
			
			//시간이 다 가면 session에서 tempKey(인증번호) 지워줌
			function timeUp(){
				$.ajax({
					url:"/test/confirm/timeUp",
					type:'get',
					dataType:'text',
					success:function(data){
						disableConfirm();
					}
				});
				
			}
			//인증번호 입력창 disable
			function disableConfirm()
			{
				$('#confirmInput').attr('readonly','readonly').css("background-color",'rgba(0,0,0,0)').val('');
				$('#confirmNo').css("background-color",'rgba(0,0,0,0.2)');
				$('#confirm').attr('disabled','disabled').css("background-color",'rgba(0,0,0,0)');
				$('#confirm-result').text('입력시간이 초과되었습니다.').css('color','red');
			}
			//인증번호 입력창 able
			function ableConfirm()
			{
				$('#timer').text(global_time_sum);
				$('#confirm').removeAttr('disabled').css('background-color','#D0CCE8');
				$('#confirmInput').removeAttr('readonly').val('');
				$('#confirmNo').css("background-color",'white');
				$('#confirm-result').text('').css('display','none');
			}
			
		//인증번호 확인
			function checkKey()
			{
				$.ajax({
					url:"/test/confirm/checkKey",
					type:'get',
					data : {"tempKey":$('#confirmInput').val().trim()},
					dataType :'json',
					success : function(data){
						if(data.result)
						{
							alert("인증되었습니다.");
							$('#confirmNo').css('display','none');
							$('#confirm-result').text('').css('display','none');
							$('#email').attr('readonly','readonly').css('background-color','rgba(0,0,0,0)').parent().css('background-color','rgba(0,0,0,0.07)');
							$('#emailConfirm').css("display","none");
							$('#emailResult').css("display","none");
							global_emailConform=1;
							clearInterval(global_timerId);
							timeUp();
						}
						else
						{
							global_emailConform=0;
							alert("인증번호를 다시 확인해 주세요");
						}
					}
				});
			}
			
		//이메일 인증 버튼 활성화
			function abledEmailConfirm(){
				$('#emailConfirm').css('background-color','#D0CCE8');
                $('#emailConfirm').removeAttr('disabled');
		}
		//이메일 인증 버튼 비활성화
			function disabledEmailConfirm(){
				 $('#emailConfirm').css('background-color','rgba(0,0,0,0)');
                 $('#emailConfirm').attr('disabled','disabled');
		}
	// 약관 확인 관련
	   //약관 >(화살표) 누르면 상세 약관으로
	   $(function(){
		  $('p#seeMore').click(function(){
			  $('#agree').trigger('click');
			  getTerms();
		  });
	   });
	
	   //약관 div 어디를 누르던 체크 되도록
	   $(function(){
	       $('#terms').click(function(){
	          $('#agree').trigger('click');
	          
	          //약관 check를 email 입력보다 나중에 하더라도 인증버튼 able로 
	          if($('#agree').is(':checked')&&global_idCheck==1)
              {
					abledEmailConfirm();
              }
	          else
        	  {
	        	  disabledEmailConfirm();
        	  }
	       });
	       
	       $('#agree').click(function(){
	          $('#agree').trigger('click');
	          
	          if($('#agree').is(':checked')&&global_idCheck==1)
              {
					abledEmailConfirm();
              }
	          else
        	  {
	        	  disabledEmailConfirm();
        	  }
	       });
	   });
	   
	   //약관 상세 새창 띄우기
		function getTerms()
	   {
			window.open('/test/terms', '_blank');
	   }
	   
	   
   //회원가입 관련
   
   		//조건 충족과 불충족에 따라 div의 색 바꿔 표시하기
   		function setGreen(el)
   		{
	   		el.parent().css('border','1px solid #47C83E');
			el.parent().css('background-color','rgba(0,0,0,0)');
			el.css('background-color','rgba(0,0,0,0)');
   		}
   		function setRed(el)
   		{
   			el.parent().css('border','1px solid #FF3636');
			el.parent().css('background-color','#FFC6C6');
			el.css('background-color','#FFC6C6');
   		}
   
   
		//아이디 중복여부 확인
		function emailLookUp(){
			var param={"email":$('#email').val().trim()};
			
			if(emailReg($('#email')))
			{
				$.ajax({
					url:"/test/regist/checkEmail",
					data:param,
					type:"get",
					dataType:'json',
					success:function(data){
						if(data.check==0)
						{
							setGreen($('#email'));
							$('#emailResult').text("사용하실 수 있는 이메일입니다.").css('color','green');
							global_idCheck=1;
							
							/* 전체동의 눌려있고 이메일이 제대로 되어있으면 이메일 인증 버튼을 활성화한다. */
							if($('#agree').is(':checked'))
                            {
								abledEmailConfirm();
                            }
						}
						else
						{
							setRed($('#email'));
							$('#emailResult').text("사용중인 이메일입니다.").css('color','red');
							global_idCheck=0;
							
							disabledEmailConfirm();
						}
					}
				});				
			}
			else
			{
				setRed($('#email'));
				$('#emailResult').text("잘못된 이메일 형식입니다.").css('color','red');
				global_idCheck=0;
				
				disabledEmailConfirm();
			}
		}
		
		
		//비밀번호와 비밀번호 확인이 같은지 확인
		function passwordCheck(){
			var pw=$('#pw').val();
			var pw2=$('#pw2').val();
			
			if(pw!=null&&pw.trim()!=""&&pwReg($('#pw')))
			{
				$('#pwRegResult').text("").css('color','red');
				if(pw2!=null&&pw2.trim()!="")
				{
					setGreen($('#pw'));
					
					if(pw==pw2)
					{
						setGreen($('#pw2'));
						$('#pwResult').text("패스워드 일치").css('color','green');
						global_pwCheck=1;
					}
					else 
					{
						setRed($('#pw2'));
						$('#pwResult').text("패스워드 불일치").css('color','red');
						global_pwCheck=0;
					}
				}
			}
			else
			{
				setRed($('#pw'));
				$('#pwRegResult').text("비밀번호는 대문자, 숫자, 특수기호가 들어가고 8자 이상이어야 합니다.").css('color','red');
			}
		}
		
		//이름이 2글자 이상인지, 특수문자 없는지 확인
		function nameCheck()
		{
			if(nameReg($('#name')))
			{
				setGreen($('#name'));
				$('#nameCheck').text('');
			}
			else
			{
				setRed($('#name'));
				$('#nameCheck').text('이름은 2글자 이상, 한글, 영문, 숫자만 사용 가능합니다.').css('color','red');
			}
		}
		
		//인증한 이메일과 가입하는 이메일이 같은지 확인
		//submit 눌렀을 때, 정규식 확인
		function enroll_validate()
		{
			if(global_emailConform==1&&global_pwCheck==1)
			{
				if(pwReg($('#pw'))&&nameReg($('#name'))&&emailReg($('#email'))&&($('#email').val()==global_conformEmail))
				{
					console.log("여기 지나감");
					enrollFormSubmit();
				}
				else
				{
					alert("회원가입에 실패하였습니다.");
					location.href="/test/regist/basic";
				}
			}
			else
			{
				alert("회원가입에 실패하였습니다.");
				location.href="/test/regist/basic";
			}
		}
		
		//enrollForm submit ajax
		function enrollFormSubmit()
		{
			var param={"email":$('#email').val(),"pw":$('#pw').val(),"name":$('#name').val(),"userType":1};
			$.ajax({
				url:"/test/registUser",
				data:param,
				type:"post",
				dataType:'text',
				success:function(data){
					if(data!=null)
					{
						alert("회원가입에 성공하였습니다.");
						location.href='/test/main';
					}
					else
					{
						alert("회원가입에 실패하였습니다.");
						location.href='/test/regist/basic';
					}
				}
			});
		}
		
		//정규식
		function pwReg(pw)
		{
			var re=/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
			return check(re,pw);
		}
		function emailReg(email)
		{
			var re=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
			return check(re,email);
		}
		function nameReg(name)
		{
			var re=/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*].{1,}$/;
			return check(re,name)
		}
		
		//정규식 확인용 함수
		function check(re, what) {
	       if(re.test(what.val())) 
	       {
	           return true;
	       }
	       /* alert(message);
	       what.value = "";
	       what.focus(); */
   		}