<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%-- <%
    String clientId = "tDmQ7T1QG8MxBJ32rVwy";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:9090/3333333/naverCallback", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
%> --%>
<%
	String msg=request.getParameter("msg");
%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너나들이 로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
	/* 폰트 */
	    /* 소제목용 */
	@font-face { font-family: 'NIXGONM-Vb'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/NIXGONM-Vb.woff') format('woff'); font-weight: normal; font-style: normal; }
	    /* 로그인용 */
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
	
	/* 로그인 폼 있는 부분 */
	div#login-container{
	    margin-top:60px;
	    width:430px;
	    text-align: center;
	    display:inline-block;
	    font-family: 'NIXGONM-Vb',바탕;
	}
	div#login-container>h2{
	    text-align:left;
	    margin-bottom:30px;
	}
	div#login-container a{
	    text-decoration: none;
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
	input.loginInput{
	    width:370px;
	    padding-right:15px;
	    padding-left: 15px;
	    height:43px;
	    border-radius: 5px;
	    border:none;
	    font-size:15px;
	}
	input.loginInput:focus{
	    outline: none;
	}
	
	/* 에러(입력창 아래에) 출력 */
	div.displayError{
	    width:400px;
	    text-align: center;
	}
	
	/* 로그인 버튼 */
	div#loginBtn-container{
	    width:400px;
	    display: inline-block;
	    text-align: center;
	    margin-top:10px;
	    margin-bottom:10px;
	    clear:both;
	}
	div.loginBtn{
	    width:392px;
	    height:42px;
	    display:inline-block;
	    text-align: center;
	    line-height: 2.5;
	    margin:3px;
	    border-radius: 5px;
	    /* border:1px solid rgba(0, 0, 0, 0.2); */
	    cursor:pointer;
	    font-family: 'yg-jalnan', 고딕;
	}
	div#loginBtn{
		width:390px;
	    height:40px;
	    background-color: #D0CCE8;
	    border:1px solid rgba(0, 0, 0, 0.2);
	}
	div#loginBtn:hover{
	    background-color: rgb(186, 182, 206);
	    border:1px solid rgb(186, 182, 206);
	}
	div#naver_id_login img{
		width:390px;
	}
</style>
</head>
<body>
	<header>여기에 헤더가 들어가요!</header>
	<nav><!--혹시 있을지 모르는 서브메뉴를 위해--></nav>
	<section>
        <div id='login-container'>

            <h2>로그인</h2>
            
            <div class='inputDiv'>
                <input type='email' id='email' class='loginInput' name='email' placeholder='이메일 아이디'/>
            </div>
            <div id='emailError' class='displayError'></div>

            <div class='inputDiv'>
                <input type='password' id='password' class='loginInput' name='password' placeholder='비밀번호(영문,숫자,특수문자 포함 8자 이상)'/>
            </div>
            <div id='loginError' class='displayError'></div>

            <div style='height:25px; margin: 10px;'>
                <label style='float:left;'><input type="checkbox" id='rememberId' name='rememberId' value='remember'/><small>아이디 저장</small></label>
                <a href='${path }/find/id' style="float: right;"><small>아이디/비밀번호 찾기 ></small></a>
            </div>

            <div id='loginBtn-container'>
                <div id='loginBtn' class='loginBtn'>로그인</div>
                <small>또는</small>
                <div id="naver_id_login"></div>
                <div id='kakaoLogin' class='loginBtn'>카카오 로그인</div>
            </div>

            <div style='margin-top:15px; margin-bottom: 15px;'>
                <small>아직 계정이 없으시다면 <a href='${path }/welcome'>회원가입</a></small>
            </div>
        </div>
	</section>
    <footer></footer>
    <script>
		var naver_id_login = new naver_id_login("tDmQ7T1QG8MxBJ32rVwy", "http://localhost:9090/test/naverCallback");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 3 ,40);
		naver_id_login.setDomain("http://localhost:9090/test");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	</script>
    <script>
    	
    	//input의 focus/blur에 따라, 감싸고 있는 div의 테두리를 변화시킴
        $(function(){
            $('.loginInput').focus(function(){
                $(this).parent().css('border','3px solid #D0CCE8');
                $(this).parent().css('margin','3px');
            });
            $('.loginInput').blur(function(){
                $(this).parent().css('border','1px solid rgba(0, 0, 0, 0.2)');
                $(this).parent().css('margin','5px');
            });
        });
    	
    	
    	$(function(){
    		$('#loginBtn').click(function(){
    			
    			$.ajax({
    				url:"${path}/login/basic",
    				data:{"email":$('#email').val(),"password":$('#password').val()},
    				type:'post',
    				dataType:'json',
    				success:function(responseData){
    					
    					var msg=responseData;
    					console.log(data);
    					console.log(msg);
    					
    					if(msg!=null)
    					{
    						$('#loginError').text(msg).css('color','red');
    						$('#email').val('');
    						$('#password').val('');
    						$('#email').focus();
    					}
    					else
    					{
    						location.href='${path}/login';
    						
    					}
    				}
    			});
    		});
    	});
    	
    	/* $(function(){
    		location.harf='${path}/naver/naverlogin';
				}); */
    </script>
</body>
</html>