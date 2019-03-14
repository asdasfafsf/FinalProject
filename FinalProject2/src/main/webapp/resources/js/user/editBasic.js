 //약관 확인 눌려있고, 이메일 맞으면 
            //이메일 보내서 인증
        function sendEmail(){
            alert('sendEmail');
            $('div.confirm').css('display','inline-block');
        }
        // 약관 확인 관련
            //약관 >(화살표) 누르면 상세 약관으로

            //약관 div 어디를 누르던 체크 되도록
            $(function(){
                $('#terms,#agree').click(function(){
                   $('#agree').trigger('click');
                });
            });

        var global_idCheck=0;
        
        //아이디(이메일) 중복여부 확인
        function emailLookUp(){
            var param={id:$('#email').val().trim()};
            
            if(emailReg($('#email')))
            {
                $.ajax({
                    url:"/test/regist/checkEmail",
                    data:param,
                    type:"get",
                    dataType:'json',
                    success:function(data){
                        if(data!=null)
                        {
                            $('#emailResult').text("사용하실 수 있는 이메일입니다.").css('color','green');
                            global_idCheck=1;

                            if($('#terms').is('clicked'))
                            {
                                $('#emailConfirm').attr('disabled',' ');
                                $('#emailConfirm').css('background-color','#D0CCE8');
                            }
                        }
                        else
                        {
                            $('#emailResult').text("사용중인 이메일입니다.").css('color','red');
                            global_idCheck=0;
                        }
                    }
                });				
            }
            else
            {
                $('#emailResult').text("잘못된 이메일 형식입니다.").css('color','red');
            }
        }
        
        function nameCheck()
        {
            if(nameReg($('#name')))
            {
                $('#nameCheck').text('');
            }
            else
            {
                $('#nameCheck').text('이름은 2글자 이상, 한글, 영문, 숫자만 사용 가능합니다.').css('color','red');
            }
        }
        
        //submit 눌렀을 때, 정규식 확인
        function enroll_validate()
        {
            if(global_idCheck==1)
            {
                if(nameReg($('#name'))&&emailReg($('#email')))
                {
                    enrollFormSubmit();
                }
                else
                {
                    alert("회원 정보 수정 실패");
                    $('#enrollFrm').reset();
                }
            }
        }
        
        //enrollForm submit ajax
        function enrollFormSubmit()
        {
            var param={id:$('#id').val(),name:$('#name').val()};
            $.ajax({
                url:"${path}/userEdit/basicEnd",
                data:param,
                type:"post",
                dataType:'json',
                success:function(data){
                    if(data!=null)
                    {
                        alert("정보 수정 성공");
                        location.href='${path}/';
                    }
                    else
                    {
                        alert("정보 수정 실패");
                        $('#enrollFrm').reset();
                        $('#id').focus();
                    }
                }
            });
        }
        
        //정규식
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