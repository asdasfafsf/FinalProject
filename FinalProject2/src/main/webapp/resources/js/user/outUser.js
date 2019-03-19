//input:checkbox id=agree :checked , 
//reason 입력 하고, 
//인증번호 맞춘 후
//회원탈퇴 누르면 confirm 물어보고, 
//탈퇴
var global_checkNum=0; // 0:인증번호 틀리거나 입력 안함, 1 : 인증번호 확인 완료
var global_getReason="";

//회원탈퇴 누르면
function formVal()
{
	if(global_checkNum==1)
	{
		if($('#agree').is(":checked"))
		{
			if($('#reason').val()!=null&&$('#reason').val()!="")
			{
				if(confirm("정말로 탈퇴하시겠습니까?"))
				{
					getReason();
					byebyeUser();
				}
			}
			else
			{
				alert("이유를 알려주세요!");
				$('#reason').focus();
			}
		}
		else
		{
			alert("유의사항을 확인해주세요!");
			$('#agree').focus();
		}
	}
	else
	{
		alert("인증번호를 입력해주세요!");
		$('#number').focus();
	}
}

function getReason()
{
	if($('#reason').val()=='5. 기타'&&$('#reason5').text())
	{
		global_getReason=$('#reason').val()+$('#reason5').text();
	}
	else
	{
		global_getReason=$('#reason').val();
	}
}

function byebyeUser()
{
	$.ajax({
		url : '/test/leave/outUser',
		data : {"outReason" : global_getReason},
		dataType : 'json',
		type : 'post',
		success : function(data){
			alert(data.msg);
			location.href=data.loc;
		}
	});
}

//reason 5 누르면 textarea reason5 자동 display:inline-block;
$(function(){
	$('#reason').change(function(){
		if($('#reason').val()=='5. 기타')
		{
			$('#reason5').show();
		}
		else{
			$('#reason5').hide();
		}
	});
});

//tempKey(인증번호 ) 확인
function checkKey()
{
	$.ajax({
		url : "/test/confirm/checkKey",
		type : 'get',
		data : {"tempKey" : $('#number').val().trim()},
		dataType : 'json',
		success : function(data){
			if(data.result)
			{
				alert(data.msg);
				$('#number').attr('readonly','readonly').css('background-color','rgba(0,0,0,0.07)').css('border','1px solid rgba(0,0,0,0.2)');
				$('#confirm').attr('disabled','disabled');
				global_checkNum=1;
			}
			else
			{
				alert(data.msg);
				global_checkNum=0;
				$('#confirm').unbind();
			}
		},
		error : function(){
			alert("인증번호를 입력해 주세요.");
		}
	});
}
//페이지 로딩되면 이메일 보냄
$(document).ready(function() {
	//이메일 보내는 ajax
	$.ajax({
		url:"/test/sendEmail",
		type:'post',
		data:{"email":$('#email').text(),"type" : "OUT"},
		dataType:'json',
		success:function(data){
		}
	});
});
