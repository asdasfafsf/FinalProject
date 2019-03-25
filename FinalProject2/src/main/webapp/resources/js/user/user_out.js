var global_emailCheck=0;

$(function(){
//reason 5 누르면 textarea reason5 자동 display:inline-block;
	$('#reason').change(function(){
		if($('#reason').val()=='5. 기타')
		{
			$('#reason5').show();
		}
		else{
			$('#reason5').hide();
		}
	});
	
//탈퇴 조건 충족했나 확인 + 충족시엔 다음단계로
	$('#outUserFrm').submit(function(e){
		e.preventDefault();
		if(!$('#agree').is(":checked"))
		{
			alertBox(location.href='#outPage-terms-container',"탈퇴시 유의사항을 확인해 주세요");
		}
		else
		{
			if($('#reason').val()!=null)
			{
				canOut();
			}
			else
			{
				alertBox(location.href='#reason',"탈퇴 이유를 알려주세요");
			}
		}
	});
//이메일 입력하고 메일 보내기
	$('#sendOutEmail').click(function(e){
		e.preventDefault();
		if($('#email').val().trim()!=null &&$('#email').val().trim()!=""&&$('#getEmail').val().trim()==$('#email').val())
		{
			sendEmail();
			alertBox(null,"이메일이 전송됩니다.");
		}
		else
		{
			alertBox(null,"등록하신 이메일을 입력해 주세요");
		}
	});
	
//인증번호 입력했으면 키 체크하기
	$('#userOutKeyFrm').submit(function(e){
		e.preventDefault();
		if($('#number').val().trim()!=null)
		{
			checkKey();
		}
		else
		{
			alterBox(location.href="#userOutKeyFrm","인증번호를 입력해주세요");
		}
	});
//마지막 회원 탈퇴 (위에 다 만족 했는지 확인 + 회원 정보 삭제)
	$('#finallyOut').click(function(e){
		e.preventDefault();
		if(!global_emailCheck)
		{
			alertBox(location.href='#userOutKeyFrm',"본인인증 확인을 진행해주세요.");
		}
		else
		{
			if(!$('#agree').is(":checked"))
			{
				alertBox(location.href='#outPage-terms-container',"탈퇴시 유의사항을 확인해 주세요");
			}
			else
			{
				if($('#reason').val()==null)
				{
					alertBox(location.href='#reason',"탈퇴 이유를 알려주세요");
				}
				else
				{
					if(confirm("정말로 탈퇴하시겠습니까?"))
					{
						userOut();
					}
					else
					{
						location.href = '/test/myprofile';
					}
				}
			}
		}
	});
});

function canOut()
{
	$.ajax({
		url : '/test/user/canOut.do',
		type : 'post',
		async : false,
		success : function(data){
			if(data)
			{
				$('#userOutKeyFrm').show();
				$('#firstSubmit').hide();
			}
			else
			{
				alertBox(location.href='/test/myprofile','진행중인 리워드가 있으면 탈퇴할 수 없습니다.');
			}
		},error : function(){
			alertBox(null,'다시 시도해주세요.');
		}
	});
}

function sendEmail()
{
	$.ajax({
		url : '/test/sendEmail',
		type : 'post',
		data : {'email':$('#email').val(), "type" : "OUT"},
		success : function(){
		},error : function(){
			alertBox(null,"이메일 전송 실패. 다시 시도해주세요.");
		}
	});
}

function checkKey()
{
	$.ajax({
		url : '/test/user/checkTempKey',
		type : 'post',
		data : {"key" : $('#number').val()},
		async : false,
		success : function(data){
			if(data)
			{
				 global_emailCheck=true;
				 alertBox(null,"인증되었습니다.");
				 $('#number').attr('readonly','readonly');
			}
			else
			{
				alertBox(null,"인증번호가 일치하지 않습니다.");
			}
		}
	});
}


function userOut()
{
	if($('#reason').val()=='5. 기타')
	{
		param = {'reason' : $('#reason').val()+" : "+$('#reason5').val().trim()};
	}
	else
	{
		param = {'reason' : $('#reason').val()};
	}
	
	$.ajax({
		url : '/test/user/delete.do',
		type : 'post',
		data : param,
		async : false,
		success : function(data)
		{
			if(data>0)
			{
				alertBox(function(){location.href="/test/logout"},"이용해주셔서 감사합니다.");
			}
			else
			{
				alertBox(null,'다시 시도해 주세요.');
			}
		},
		error : function(){
			alertBox(null,'다시 시도해 주세요.');
		}
	});
}