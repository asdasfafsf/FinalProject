$(function(){
	$('#reshow').hide();
	$('#addAddress').click(function(){
		findAddr();
		$('#reshow').show();
		$('#addrDetail').focus();
	});
	$('#cancel').click(function(e){
		e.preventDefault();
		$('#addressForm').trigger('reset');
		$('#reshow').hide();
	});
	$('#addressForm').submit(function(e){
		e.preventDefault();
		if(isUseful())
		{
			addAddress();
			$('#reshow').hide();
		}
		else
		{
			alertBox(null, "입력한 항목을 다시 확인해 주세요.");
		}
	});
});

function addAddress()
{
	$.ajax({
		url : '/test/myprofile/edit/add/address',
		type : 'post',
		data : {'addrName':$('#addrName').val(), 'receiver':$('#receiver').val(),
			'phone' : $('#phone').val(), 'zipNo':$('#zip-no').val(), 'addrWhole' : $('#addrWhole').val(), 
			'extraAddr':$('#extraAddr').val(), 'addrDetail':$('#addrDetail').val()},
		anysc:false,
		success : function(data){
			if(data<0)
			{
				alertBox(null,"주소록은 3개까지 등록 가능합니다. 삭제 후 재입력 해주세요.");
			}
			else if(data==0)
			{
				alertBox(null,"등록 실패");
			}
			else
			{
				alertBox(function(){location.href='/test/myprofile/edit/address'},"주소록이 추가되었습니다.");
			}
		}
	});
}

function isUseful()
{
	return telRe($('#phone'));
}

function deleteAddress(no)
{
	$.ajax({
		url : '/test/myprofile/edit/del/address',
		type : 'post',
		data : {'addrNo':no},
		success : function(data){
			alertBox(function(){location.href='/test/myprofile/edit/address'},"삭제되었습니다");
		}
	});
}

//정규식
function telRe(tel)
{
	var re = /^[0-9]{4,20}$/;
	return check(re,tel);
}

function check(re, what) {
   if(re.test(what.val())) 
   {
       return true;
   }
}