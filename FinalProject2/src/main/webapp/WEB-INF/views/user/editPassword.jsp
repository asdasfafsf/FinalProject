<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyProfile</title>
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <style>
        /* 폰트 */
            /* 라벨용 */
        @font-face { font-family: 'NIXGONM-Vb'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/NIXGONM-Vb.woff') format('woff'); font-weight: normal; font-style: normal; }
            /* 버튼용 */
        @font-face { font-family: 'yg-jalnan'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff'); font-weight: normal; font-style: normal; }

        /* 대략적인 위치 잡기 (가운데 정렬은 text-align, display:inline-block으로 함) */
        body{
            margin:0;
            width:100%;
            text-align: center;
        }
        header{
            display:inline-block;
            width:1000px;
            height:55px;
            border-bottom:1px solid  rgba(0, 0, 0, 0.2);
        }
        section{
            display: inline-block;
            width:1000px;
            /* border:1px solid black; */
        }

        /* 회원가입 페이지 중 가운데 부분 */
        div#enroll-container{
            margin-top:60px;
            width:430px;
            text-align: center;
            display:inline-block;
            font-family: 'NIXGONM-Vb',바탕;
        }
        div#enroll-container>h2{
            text-align:left;
            margin-bottom:30px;
        }
        div#enroll-container a{
            text-decoration: none;
        }

        /* 가입 약관 */
        div#terms{
            display:inline-block;
            width:400px;
            height:45px;
            text-align: left;
            cursor: pointer;
            line-height: 1.8;
        }
        div#terms input{
            display:inline-block;
            width:15px;
            height:15px;
            border:1px solid rgba(0, 0, 0, 0.2);
            margin:3px;
            margin-left:5px;
        }
        div#terms div{
            display:inline-block;
            width:250px;
            height:30px;
        }
        div#terms p{
            display:inline-block;
            width:80px;
            height:30px;
            margin:3px;
            margin-left:5px;
        }
        div#terms p#seeMore{
            display:inline-block;
            width:20px;
            height:30px;
            margin:3px;
            float:right;
        }

        /* 입력창 모양 */
        div.inputDiv{
            display: inline-block;
            width:400px;
            height:45px;
            border:1px solid rgba(0, 0, 0, 0.2);
            border-radius: 5px;
            margin:5px;
            padding-left:0;
        }
        div.inputDiv:hover{
            margin:5px;
            border:1px solid rgba(0, 0, 0, 0.7);
        }
        input.registInput{
            width:370px;
            padding-right:15px;
            padding-left: 15px;
            height:43px;
            border-radius: 5px;
            border:none;
            font-size:15px;
        }
        input.registInput#email{
            width:324px;
            height:43px;
            border-radius: 5px;
            border:none;
            font-size:15px;
            padding-left: 15px;
        }
        input.registInput:focus{
            outline: none;
        }
        small.explain{
            margin-left:15px;
            float:left;
        }

        /* 에러(입력창 아래에) 출력 */
        div.displayError{
            width:400px;
            text-align: center;
        }

        /* 가입 버튼 */
        div#btn-container{
            width:400px;
            display: inline-block;
            text-align: center;
            margin-top:30px;
            margin-bottom:10px;
            clear:both;
        }
        div#submitBtn{
            background-color: #D0CCE8;
            width:400px;
            height:40px;
            display:inline-block;
            text-align: center;
            line-height: 2.5;
            margin:none;
            border-radius: 5px;
            cursor:pointer;
            font-family: 'yg-jalnan', 고딕;
        }
        div#submitBtn:hover{
            background-color: rgb(186, 182, 206);
        }
    </style>
</head>
<body>
    <header>깔끔한 메뉴가 이쪽에!</header>
    <nav></nav>
    <section>
        <div id='enroll-container'>

            <h2>비밀번호 변경</h2>

            <form id='enrollFrm'>
                <div class='inputDiv'>
                    <input type='password' id='pw' name='pw' placeholder="비밀번호" class='registInput' required oninput='passwordCheck();'/>
                </div>
                <br/>
                <small><span id='pwRegResult' class='displayError'></span></small>

                <div class='inputDiv'>
                    <input type='password' id='pw2' name='pw2' placeholder="비밀번호 확인" class='registInput' required oninput='passwordCheck();'/>
                </div>
                <br/>
                <small><span id='pwResult' class='displayError'>영문, 숫자, 특수문자를 조합한 8자 이상</span></small>
                <div id='btn-container'>
                    <div id='submitBtn' onclick='enroll_validate();'>등록</div>
                </div>

            </form>
        </div>
    </section>
    <footer></footer>
    
    <script>
       
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

        //submit 눌렀을 때, 정규식 확인
        function enroll_validate()
        {
            if(global_pwCheck==1)
            {
                enrollFormSubmit();
            }
            else
            {
                alert("회원가입에 실패하였습니다.");
                $('#enrollFrm').reset();
            }
        }
        
        //enrollForm submit ajax
        function enrollFormSubmit()
        {
            var param={pw:$('#pw').val()};
            $.ajax({
                url:"${path}/userEdit/passwordEnd",
                data:param,
                type:"post",
                dataType:'json',
                success:function(data){
                    if(data!=null)
                    {
                        alert("비밀번호 수정 성공");
                        location.href='${path}/';
                    }
                    else
                    {
                        alert("비밀번호 수정 실패");
                        $('#enrollFrm').reset();
                        $('#id').focus();
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
            /* alert(message);
            what.value = "";
            what.focus(); */
            }
    </script>
</body>
</html>