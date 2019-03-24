
/*누르면 페이지 이동*/
	
	$(function(){
		$('#editUserProfile').click(function(){
			location.href="/test/myprofile/edit/basic"
		});
		$('#editAddress').click(function(){
			location.href="/test/myprofile/edit/address"
		});
		$('#editAccount').click(function(){
			location.href="/test/myprofile/edit/account"
		});
	});
	
/*사진/이름 수정 버튼 보이게*/
	
	$(function(){
		
		//사진
		$('#myPhoto-container').hover(function(){
			$('.photoBtn').show();
		},function(){
			$('.photoBtn').hide();
		});
		
		//이름
		$('#myName-container').hover(function(){
			$('#editNameBtn').show();
		},function(){
			$('#editNameBtn').hide();
		});
	});
	
	
/*이름 수정 창 나오게*/
	$(function(){
		
		//수정창 나오게
			$('#editNameBtn').click(function(){
			$('#userName').hide();
			$('#editNameBtn').hide();
			
			$('#editUserName').show();
			$('#selectNameBtn').show();
			
			//이름수정 버튼 계속 안나오게
			$('#myName-container').unbind();
		});
	});

//이름 바꾸기 기능
	$(function(){
		
		$('#selectNameBtn').click(function(event){
			event.preventDefault();
			
			if(nameReg($('#editUserName')))
			{
				if($('#editUserName').val()!=$('#userName'))
				{
					changeName();
				}
				else
				{
					$('#userName').show();
				}
				$('#selectNameBtn').hide();
				$('#editUserName').hide();
			}
			else
			{
				alertBox(null,"이름은 2글자 이상, 한글, 영문, 숫자만 사용 가능합니다.");
			}
		});	
		$('#nameFrm').submit(function(e){
			e.preventDefault();
			if(nameReg($('#editUserName')))
			{
				if($('#editUserName').val()!=$('#userName'))
				{
					changeName();
				}
				else
				{
					$('#userName').show();
				}
				$('#selectNameBtn').hide();
				$('#editUserName').hide();
			}
			else
			{
				alertBox(null,"이름은 2글자 이상, 한글, 영문, 숫자만 사용 가능합니다.");
			}
		});
	});
	
	//이름 바꾸기
	function changeName()
	{
		$.ajax({
			url : '/test/myprofile/edit/name.do',
			data : {"editUserName" : $('#editUserName').val()},
			type :'post',
			dataType : 'json',
			success : function(data){
				if(data>0)
				{
					alertBox(location.href='/test/myprofile',"유저 이름 변경 성공");
				}
				else
				{
					alertBox(location.href='/test/myprofile',"유저 이름 변경 실패");
				}
			}
		});
	}
	

/*프로필 사진 바꾸기 기능 */
	$(function(){
	
		$('#deletePhoto').click(function(){
			var form = $('#photoFrm')[0];
			var formData = new FormData(form);
			sendFile(formData);
		});
		
		$('#editPhoto').click(function(){
			$('#selectedPhoto').click();
		});
		
		$('#selectedPhoto').change(function(e){
			var form = $('#photoFrm')[0];
			var formData = new FormData(form);
			sendFile(formData);
		});
		
	});
	
//프로필 사진 바꾸기
	function sendFile(formData)
	{
		$.ajax({
			type :'post',
			url : '/test/myprofile/edit/photo.do',
			data : formData,
			contentType : false,
			processData : false,
			success : function(data){
				if(data > 0)
				{
					alertBox(location.href='/test/myprofile',"프로필 사진 변경 성공");
				}
				else
				{
					alertBox(location.href='/test/myprofile',"프로필 사진 변경 실패");
				}
			}
		});
	}
	
//이름 정규식
	function nameReg(name)
	{
	    var re=/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*].{1,}$/;
	    return check(re,name);
	}
	//정규식 확인용 함수
	function check(re, what) {
	    if(re.test(what.val())) 
	    {
	        return true;
	    }
	}