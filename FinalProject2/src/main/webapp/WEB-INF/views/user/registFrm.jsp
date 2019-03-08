<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    input.registInput:focus{
        outline: none;
    }
    small.explain{
        margin-left:15px;
        float:left;
    }
    
     /* 이메일 인증 버튼 위한 설정 */
     input.registInput#email{
        width:324px;
        height:43px;
        border-radius: 5px;
        border:none;
        font-size:15px;
        padding-left: 15px;
        padding-right:11px;
    }
    /* 이메일 인증버튼 */
     input#emailConfirm{
        display:inline-block;
        background-color: white;
        width:40px;
        height:30px;
        border:none;
        margin-right:4px;
        border-radius: 5px;
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
    
    /* 약관 상세 보기 위한 모달 */
    div#terms-modal{
    	display:none;
    	font-family:'NIXGONM-Vb',바탕;
    	background-color:rgba(0,0,0,0.4);
    	position:fixed;
    	width:100%;
    	height:100%;
    	margin:0;
    	padding:0;
    	overflow:auto;
    	z-index: 1;
    }
    div#terms-content{
    	display:inline-block;
    	width:400px;
    	margin:20px;
    }
    div#terms-content a{
    	text-decoration: none;
    	color:rgba(0,0,0,0.4);
    }
    div#terms-content>span{
    	float:right;
    	cursor: pointer;
    }
    
    /* 인증번호 창 */
    div#confirmNo{
    	display:none;
    }
</style>
</head>
<body>
    <header>깔끔한 메뉴가 이쪽에!</header>
    <nav></nav>
    <section>
        <div id='enroll-container'>

            <h2>회원가입</h2>

            <form id='enrollFrm'>

                <div id='terms'>
                    <input type='checkbox' id='agree' name='agree'>
                    <div>
                        <p>전체동의</p>
                        <small>너나들이 서비스 이용약관</small>
                    </div>
                    <p id='seeMore'>></p>
                </div>

                <div class='inputDiv'>
                    <input type='email' id='email' name='email' placeholder="이메일 아이디" class='registInput' required oninput='emailLookUp();'/>
                    <input type='button' id='emailConfirm' onclick='sendEmail();' value='인증'/>
                </div>
                <br/>
                <small><span id='emailResult' class='displayError'></span></small>
    			<div class='inputDiv' id='confirmNo'>
    				<input type='text' id='confirmNo' name='confirmNo' placeholder='인증번호 확인' class='registInput' required/>
    			</div>
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

                <div class='inputDiv'>
                    <input type='text' id='name' name='name' placeholder="이름" class='registInput' required oninput='nameCheck();'/>
                </div>
                <br/>
                <small><span id='nameCheck' class='displayError'></span></small>

                <div id='btn-container'>
                    <div id='submitBtn' onclick='enroll_validate();'>등록</div>
                </div>
            </form>
        </div>
    </section>
    <footer></footer>
        
        
	<script>
	var global_conformEmail="";
	//약관 확인 눌려있고, 이메일 맞으면 
    	//이메일 보내서 인증
			function sendEmail(){
				global_conformEmail=$('#email').val();
				$.ajax({
					url:"${path}/sendEmail",
					type:'post',
					data:{"email":$('#email').val()},
					dataType:'json',
					success:function(data){
						if(data!=null)
						{
						}
					}
				});
			    $('#confirmNo').show();
			}
		//이메일 인증 버튼 활성화
			function abledEmailConfirm(){
				$('#emailConfirm').css('background-color','#D0CCE8');
                $('#emailConfirm').removeAttr('disabled');
		}
		//이메일 인증 버튼 비활성화
			function disabledEmailConfirm(){
				 $('#emailConfirm').css('background-color','white');
                 $('#emailConfirm').attr('disabled','disabled');
		}
	// 약관 확인 관련
	   //약관 >(화살표) 누르면 상세 약관으로
	   $(function(){
		  $('p#seeMore').click(function(){
			  $('#agree').trigger('click');
			  getTerms();
		  });
	   });
	
	   //약관 div 어디를 누르던 체크 되도록
	   $(function(){
	       $('#terms').click(function(){
	          $('#agree').trigger('click');
	       });
	       $('#agree').click(function(){
	          $('#agree').trigger('click');
	       });
	   });
	   
	   //약관 상세 새창 띄우기
		function getTerms()
	   {
			window.open('${path}/terms', '_blank');
	   }
	   
	   
   //회원가입 관련
   
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
   
   
   		//회원가입시 충족해야 하는 조건들
		var idCheck=0;
		var pwCheck=0;
		
		//아이디 중복여부 확인
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
							setGreen($('#email'));
							$('#emailResult').text("사용하실 수 있는 이메일입니다.").css('color','green');
							idCheck=1;
							
							/* 전체동의 눌려있고 이메일이 제대로 되어있으면 이메일 인증 버튼을 활성화한다. */
							if($('#agree').is(':checked'))
                            {
								abledEmailConfirm();
                            }
						}
						else
						{
							setRed($('#email'));
							$('#emailResult').text("사용중인 이메일입니다.").css('color','red');
							idCheck=0;
							
							disabledEmailConfirm();
						}
					}
				});				
			}
			else
			{
				setRed($('#email'));
				$('#emailResult').text("잘못된 이메일 형식입니다.").css('color','red');
				idCheck=0;
				
				disabledEmailConfirm();
			}
		}
		
		
		//비밀번호와 비밀번호 확인이 같은지 확인
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
						$('#pwResult').text("패스워드 일치").css('color','green');
						pwCheck=1;
					}
					else 
					{
						setRed($('#pw2'));
						$('#pwResult').text("패스워드 불일치").css('color','red');
						pwCheck=0;
					}
				}
			}
			else
			{
				setRed($('#pw'));
				$('#pwRegResult').text("비밀번호는 대문자, 숫자, 특수기호가 들어가고 8자 이상이어야 합니다.").css('color','red');
			}
		}
		
		function nameCheck()
		{
			if(nameReg($('#name')))
			{
				setGreen($('#name'));
				$('#nameCheck').text('');
			}
			else
			{
				setRed($('#name'));
				$('#nameCheck').text('이름은 2글자 이상, 한글, 영문, 숫자만 사용 가능합니다.').css('color','red');
			}
		}
		
		//submit 눌렀을 때, 정규식 확인
		function enroll_validate()
		{
			if(idCheck==1&&pwCheck==1)
			{
				if(pwReg($('#pw'))&&nameReg($('#name'))&&emailReg($('#email')))
				{
					enrollFormSubmit();
				}
				else
				{
					alert("회원가입에 실패하였습니다.");
					$('#enrollFrm').reset();
				}
			}
		}
		
		//enrollForm submit ajax
		function enrollFormSubmit()
		{
			var param={id:$('#id').val(),pw:$('#pw').val(),name:$('#name').val()};
			$.ajax({
				url:"${path}/regist/end",
				data:param,
				type:"post",
				dataType:'json',
				success:function(data){
					if(data!=null)
					{
						alert("회원가입 성공");
						location.href='${path}/';
					}
					else
					{
						alert("회원가입 실패");
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