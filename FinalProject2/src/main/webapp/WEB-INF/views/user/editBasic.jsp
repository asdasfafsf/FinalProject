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
            margin-top:10px;
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

        /* 이메일 인증버튼 처음에 비활성화 */
        input#emailConfirm{
            display:inline-block;
            background-color: white;
            width:40px;
            height:40px;
            border:none;
        }

        /* 이메일 인증번호 입력란 처음에 비활성화 */
        div.confirm{
            display:none;
        }
    </style>
</head>
<body>
    <header>깔끔한 메뉴가 이쪽에!</header>
    <nav></nav>
    <section>
        <div id='enroll-container'>

            <h2>회원정보 변경</h2>

            <form id='editForm'>
                <div class='inputDiv'>
                    <input type='email' id='email' name='email' placeholder="이메일 아이디" class='registInput' required oninput='emailLookUp();'/>
                    <input type='button' id='emailConfirm' onclick='sendEmail();' value='인증' disabled/>
                </div>
                <br/>
                <small><span id='emailResult' class='displayError'></span></small>
                <div class='inputDiv confirm'>
                    <input type="text" id='confirmNo' class="confirm registInput" placeholder="인증번호를 입력해 주세요" required/>
                    <input type="button" id="confirmSubmit" onclick='submitEmail();' value='확인'/>
                </div>
                <small><span id='confirmResult' class='displayError'></span></small>
                <div class='inputDiv'>
                    <input type='text' id='name' name='name' placeholder="이름" class='registInput' required oninput='nameCheck();'/>
                </div>
                <br/>
                <small><span id='nameCheck' class='displayError'></span></small>

                <div id='btn-container'>
                    <div id='submitBtn' onclick='enroll_validate();'>변경</div>
                </div>

            </form>
        </div>
    </section>
    <footer></footer>
    
    <script>
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
                    url:"${path}/regist/checkEmail",
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
    </script>
</body>
</html>