var global_pwCheck=0;
        
        //비밀번호와 비밀번호 확인이 같은지 확인
        function passwordCheck(){
            var pw=$('#pw').val();
            var pw2=$('#pw2').val();
            
            if(pw!=null&&pw.trim()!=""&&pwReg($('#pw')))
            {
                $('#pwRegResult').text("").css('color','red');
                if(pw2!=null&&pw2.trim()!="")
                {
                    if(pw==pw2)
                    {
                        $('#pwResult').text("패스워드 일치").css('color','green');
                        global_pwCheck=1;
                    }
                    else 
                    {
                        $('#pwResult').text("패스워드 불일치").css('color','red');
                        global_pwCheck=0;
                    }
                }
            }
            else
            {
                $('#pwRegResult').text("비밀번호는 대문자, 숫자, 특수기호가 들어가고 8자 이상이어야 합니다.").css('color','red');
            }
        }
        
      	//현재 비밀번호 확인

        //찾기 눌렀을 때, 비밀번호 두번이 같고, 현재 비밀번호가 맞으면 form submit으로 
        function enroll_validate()
        {
            if(global_pwCheck==1)
            {
                enrollFormSubmit();
            }
            else
            {
                alert("비밀번호가  일치하지 않습니다.");
                $('#enrollFrm').reset();
            }
        }
        
        
        //enrollForm(
        function enrollFormSubmit()
        {
            var param={pw:$('#pw').val()};
            $.ajax({
                url:"/test/userEdit/passwordEnd",
                data:param,
                type:"post",
                dataType:'json',
                success:function(data){
                    if(data!=null)
                    {
                        alert("비밀번호 수정 성공");
                        location.href='/test/main';
                    }
                    else
                    {
                        alert("비밀번호 수정 실패");
                        $('#enrollFrm').reset();
                        $('#cor_pw').focus();
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
        
        //정규식 확인용 함수
        function check(re, what) {
            if(re.test(what.val())) 
            {
                return true;
            }
        }