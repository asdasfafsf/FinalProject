$(function(){
	$('#resetPwFrm').submit(function(e){
		e.preventDefault();
		editPw();
	});
	$('#editForm').submit(function(e){
		e.preventDefault();
		enroll_validate();
	});
});

//페이지 전체 수정시 충족해야 하는 조건들
//id가 사용중인지 확인하기 위해 (0 : 사용불가, 1 : 사용가능)
var global_idCheck=0;
//pw1과 pw2가 맞는지 확인하기 위해 (0 : 다름, 1 : 같음)
var global_pwCheck=0;

//이메일 인증 눌렀는지 확인하기 위해 (0 : 인증 확인 안됨, 1 : 인증 확인됨)
var global_emailConform = 0;

//타이머용 
var global_time_sum=0;

//인증한 이메일과 가입 이메일 같은지 확인하기 위해 (인증 누를 때 있던 이메일 저장)
var global_pushConfirmEmail="";


//초반 이메일 받기 (로딩시 원래 있던 이메일 저장)
var global_savedEmail="";
$(document).ready(function() {
	global_savedEmail=$('#email').val();
	global_emailConform=1;
	global_pwCheck=1;
});


//이메일이 형식에 맞으면 
//아이디 중복여부 확인 + 처음과 같은 이메일이라면 인증 생략
function emailLookUp(){
	
	var param={"email":$('#email').val().trim()};
	
	if($('#email').val()!=global_savedEmail)
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
		$('#emailResult').text("");
		$('#confirmNo').hide();
		disabledEmailConfirm();
		$('#confirm-result').css('display','none');
		global_time_sum=0;
		global_idCheck=1;
		global_emailConform=1;
	}
}
//이메일 보내서 인증
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
			data:{"email":$('#email').val(),"type" : "CHANGE"},
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
			url:"/test/user/enroll/timeUp",
			type:'get',
			dataType:'text',
			success:function(data){
			}
		});
			disableConfirm();
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
	
//이메일 인증 버튼 활성화
	function abledEmailConfirm(){
		$('#emailConfirm').css('background-color','#D0CCE8');
        $('#emailConfirm').removeAttr('disabled');
        global_emailConform=0;
}
//이메일 인증 버튼 비활성화
	function disabledEmailConfirm(){
		 $('#emailConfirm').css('background-color','rgba(0,0,0,0)');
         $('#emailConfirm').attr('disabled','disabled');
         global_emailConform=0;
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
   
		
//비밀번호와 비밀번호 확인이 같은지 확인
function passwordCheck(){

var pw=$('#pw').val();
var pw2=$('#pw2').val();

//현재 비밀번호를 입력한 상태면 pw 비교 -> tempUserNo (비밀번호 잃어버린 사람) 에게는 cor_pw 뜨지 않음.
//따라서 조건을 바꿔서 cor_pw 값을 가져감.
if($('#cor_pw').val()!=null&&$('#cor_pw').val().trim()!="")
{
	//pw에 값이 입력되어있을 때.
	if(pw!=null&&pw.trim()!=""&&pwReg($('#pw')))
	{
		$('#pwRegResult').text("");
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
	//현재 pw는 입력되어 있는데 새로운 pw는 입력되어있지 않을 때
	else if(pw==null&&pw.trim()==""&&pw2==null&&pw2.trim()=="")
	{
		global_pwCheck=1;
	}
	else
	{
		setRed($('#pw'));
		$('#pwRegResult').text("비밀번호는 대문자, 숫자, 특수기호가 들어가고 8자 이상이어야 합니다.").css('color','red');
	}
}
//현재 pw가 입력되지 않고, 새 pw에 값이 입력되어 있지 않을때.
else if($('#cor_pw').val()!=null&&$('#cor_pw').val().trim()!=""&&pw==null&&pw.trim()==""&&pw2==null&&pw2.trim()=="")
{
	global_pwCheck=1;
}
}
		
//인증한 이메일과 가입하는 이메일이 같은지 확인
//submit 눌렀을 때, 정규식 확인
function enroll_validate()
{
	if(global_emailConform==1&&global_pwCheck==1)
	{
		var param={"email" : $('#email').val(), "password" : $('#cor_pw').val(), "newPassword" : $('#pw').val()};
		
			$.ajax({
				url : "/test/myprofile/edit/basic.do",
				type : 'post',
				data : param,
				anysc : false,
				dataType : 'json',
				success:function(data){
					alertBox(null,data.msg);
					location.href=data.loc;
				}
			});
		}
	else
	{
		alertBox(null,"회원정보 변경을 실패하였습니다.");
	}
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
//정규식 확인용 함수
function check(re, what) {
	if(re.test(what.val())) 
	{
	   return true;
	}
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