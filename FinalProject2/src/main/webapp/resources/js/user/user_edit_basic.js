//비번위한거
var global_changePw = 0;
//이메일 위한거
var global_oriEmail;

$(function(){
	$('#resetPwFrm').submit(function(e){
		e.preventDefault();
		editPw();
	});
	$('#editForm').submit(function(e){
		e.preventDefault();
		editBasic();
	});
	
	global_oriEmail = $('#email').val();
	
	$('#pw').blur(function(){
		if($('#pw').val().trim()!=null && $('#pw').val().trim()!='')
		{
			global_changePw = 1;
		}
		else
		{
			global_changePw = 0;
		}
	});
});

function editBasic(){
	
	if(global_changePw == 1 && global_oriEmail != $('#email').val().trim())
	{
		if(global_pwCheck == 1 && $('#cor_pw').val().trim() != '' && $('#cor_pw').val().trim() != null)
		{
			if(global_emailConform == 1)
			{
				updateAll();
			}
			else
			{
				alertBox(null, '이메일을 인증해 주세요.');
			}
		}
		else
		{
			alertBox(null,'비밀번호를 입력해 주세요.')
		}
	}
	else if(global_changePw == 1)
	{
		if(global_pwCheck == 1 && $('#cor_pw').val().trim() != '' && $('#cor_pw').val().trim() != null)
		{
			updatePw();
		}
		else
		{
			alertBox(null,'비밀번호를 다시 입력해 주세요.')
		}
	}
	else if(global_oriEmail != $('#email').val().trim())
	{
		if(global_emailConform == 1)
		{
			updateEmail();
		}
		else
		{
			alertBox(null, '이메일을 인증해 주세요.');
		}
	}
	else
	{
		alterBox(null,'변경된 정보가 없습니다.');
	}
}
//전체변경
function updateAll()
{
	$.ajax({
		url : "/test/myprofile/edit/basic.do",
		data : {"email":$('#email').val().trim(), "password" : $('#cor_pw').val().trim(), "newPassword":$('#pw').val().trim()},
		async : false,
		type : 'post',
		success : function(data){
			if(data>0)
			{
				alertBox(function(){location.href='/test/myprofile'},'변경이 완료되었습니다.')
			}
			else
			{
				alertBox(null,'변경 실패');
			}
		},
		error : function(){
			alertBox(null,'변경 실패');
		}
	});
}

//비밀번호 변경
function updatePw()
{
	$.ajax({
		url : "/test/myprofile/edit/basic.do",
		data : {"password" : $('#cor_pw').val().trim(), "newPassword":$('#pw').val().trim()},
		async : false,
		type : 'post',
		success : function(data){
			if(data>0)
			{
				alertBox(function(){location.href='/test/myprofile'},'변경이 완료되었습니다.')
			}
			else
			{
				alertBox(null,'변경 실패');
			}
		},
		error : function(){
			alertBox(null,'변경 실패');
		}
	});
}

//이메일 변경
function updateEmail()
{
	$.ajax({
		url : "/test/myprofile/edit/basic.do",
		data : {"email":$('#email').val().trim()},
		async : false,
		type : 'post',
		success : function(data){
			if(data>0)
			{
				alertBox(function(){location.href='/test/myprofile'},'이메일 변경이 완료되었습니다.변경된 이메일로 로그인 해 주세요.')
			}
			else
			{
				alertBox(null,'변경 실패');
			}
		},
		error : function(){
			alertBox(null,'변경 실패');
		}
	});
}


//이메일 중복 확인
var global_idCheck=0;
//pw와 pw 확인 같은지 확인
var global_pwCheck=0;
//이메일 인증 받았나
var global_emailConform = 0;

//타이머용 
var global_time_sum=0;

//이메일 중복 확인 함수
function emailLookUp()
{
	if(global_oriEmail != $('#email').val().trim())
	{
		if(emailReg($('#email')))
		{
			$.ajax({
				url : "/test/regist/user/emailCheckUp",
				data : {"email":$('#email').val().trim()},
				success : function(data)
				{
					if(data==0)
					{
						setGreen($('#email'));
						abledEmailConfirm();
						global_idCheck=1;
						$('#email-result').text('');
					}
					else
					{
						setRed($('#email'));
						disabledEmailConfirm();
						$('#email-result').text('사용할 수 없는 이메일 입니다.').css('color','red');
						global_idCheck=0;
					}
				}
			});
		}
		else
		{
			setRed($('#email'));
			disabledEmailConfirm();
			global_idCheck=0;
		}
	}
	else
	{
		setGreen($('#email'));
		disabledEmailConfirm();
		global_idCheck=0;
	}
}
//이메일 인증
//이메일 인증 버튼 처음에 비활성화
$(function(){
	disabledEmailConfirm();
});
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
//이메일 인증 버튼 기능 변화 (체크풀렸을 때 or 체크 되었을 때)
$(function(){
	$('#emailConfirm').click(function(event){
		event.preventDefault();
		sendEmail();
	});
});
//이메일 인증 메일 보내기
function sendEmail(){
	//타이머 리셋
	global_time_sum=300;
	
	//인증번호 기능 사용 가능하게(시간초과 후 재전송시 필요)
	ableConfirm();
	
	//인증 메일 날린 이메일주소 가져옴
	global_conformEmail=$('#email').val();
	
	//버튼 글씨 바꿈(한번 전송했다고)
	$('#emailConfirm').val('재전송');
	
	//타이머 시작
	timer();
	
	//이메일 보내는 ajax
	$.ajax({
		url:"/test/sendEmail",
		type:'post',
		data:{"email":$('#email').val(),"type" : "ENROLL"},
		dataType:'json',
		success:function(data){
		}
	});
	//인증번호 창 보이기
	$('#confirmNo').css('display','inline-block');
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
$(function(){
	$('#confirm').click(function(event){
		event.preventDefault();
		checkKey();
	});
});
//인증번호 확인
function checkKey()
{
	$.ajax({
		url:"/test/user/checkTempKey",
		type:'get',
		data : {"key":$('#confirmInput').val().trim()},
		dataType :'json',
		success : function(data){
			if(data)
			{
				alertBox(null,"인증되었습니다");
				$('#email-result').text('사용 가능한 이메일입니다').css('color','green');
				$('#confirmNo').css('display','none');
				$('#confirm-result').text('').css('display','none');
				$('#email').attr('readonly','readonly').css('background-color','rgba(0,0,0,0)').parent().css('background-color','rgba(0,0,0,0.07)');
				$('#emailConfirm').css("display","none");
				$('#emailResult').css("display","none");
				$('#agree').attr('disabled','disabled');
				global_emailConform=1;
				clearInterval(global_timerId);
				timeUp();
			}
			else
			{
				global_emailConform=0;
				alertBox(null,"인증번호를 다시 확인해 주세요");
			}
		}
	});
}

//타이머
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
		url:"/test/user/enroll/timeUp",
		type:'get',
		dataType:'text',
		success:function(data){
		}
	});
		disableConfirm();
}

//정규식
//비밀번호 두개 같은지 , 정규식에 맞는지
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
				$('#password-result').text("패스워드 일치").css('color','green');
				global_pwCheck=1;
			}
			else 
			{
				setRed($('#pw2'));
				$('#password-result').text("패스워드 불일치").css('color','red');
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

//정규식
function pwReg(pw)
{
	var re=/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-_=+]).{8,}$/;
	return check(re,pw);
}
function emailReg(email)
{
	var re=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	return check(re,email);
}

//정규식 확인용 함수
function check(re, what) {
   if(re.test(what.val())) 
   {
       return true;
   }
}

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

//비밀번호 재설정 관련
function editPw(){
	if(global_pwCheck == 1)
	{
		resetPw();
		$('#pwResult').text('');
	}
	else
	{
		$('#pwResult').text('다시 입력해 주세요').css('color','red');
	}
}

function resetPw(){
	$.ajax({
		url : '/test/goResetPw',
		data : {'password' : $('#pw').val()},
		type : 'post',
		ansyc : false,
		success : function(data){
			if(data>0)
			{
				alertBox(function(){location.href='/test/mainPage'},"비밀번호 변경이 완료되었습니다.");
			}
			else
			{
				alertBox(null,"비밀번호 변경 실패");
			}
		}
	});
}