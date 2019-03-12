<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너나들이 회원가입</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
    /* 폰트 */
        /* 소제목용 */
    @font-face { font-family: 'NIXGONM-Vb'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/NIXGONM-Vb.woff') format('woff'); font-weight: normal; font-style: normal; }
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
        border-bottom:1px solid rgba(0, 0, 0, 0.2);
    }
    section{
        display: inline-block;
        width:1000px;
        /* border:1px solid black; */
    }

    /* 회원가입 버튼 있는 부분 */
    div#regist-container{
        margin-top:60px;
        width:430px;
        text-align: center;
        display:inline-block;
        font-family: 'NIXGONM-Vb',바탕;
    }
    div#regist-container>h2{
        text-align:left;
        margin-bottom:20px;
    }
    div#regist-container a{
        text-decoration: none;
    }

    /* 로고 넣었으면 해서 */
    div#logo-container{
        display: inline-block;
        width:400px;
        height:300px;
        line-height: 3;
        border:1px solid rgba(0, 0, 0, 0.2);
    }

    /* 회원가입 버튼 */
    div#registBtn-container{
        width:400px;
        display: inline-block;
        text-align: center;
        margin-top:10px;
        margin-bottom:10px;
        clear:both;
    }
    div#registBtn-container a{
        color:black;
    }
    div.registBtn{
        width:390px;
        height:40px;
        display:inline-block;
        text-align: center;
        line-height: 2.5;
        margin:3px;
        border-radius: 5px;
        border:1px solid rgba(0, 0, 0, 0.2);
        cursor:pointer;
        font-family: 'yg-jalnan', 고딕;
    }
    div#emailRegist{
        background-color: #D0CCE8;
        border:1px solid #D0CCE8;
    }
    div#emailRegist:hover{
        background-color: rgb(186, 182, 206);
        border:1px solid rgb(186, 182, 206);
    }
    div#naver_id_login img{
    	width:390px;
    }
</style>
</head>
<body>
	<header>헤더! 메뉴 들어갈꺼야!</header>
    <nav></nav>
    <section>
        <div id='regist-container'>
            <h2>회원가입</h2>
            <div id='logo-container'>너나들이 로고</div>
            <div id='registBtn-container'>
                <%-- <div id='naverRegist' class='registBtn'><a href='${path }/member/regist/naver'>네이버로 가입</a></div> --%>
                <div id="naver_id_login"></div>
                <div id='kakaoRegist' class='registBtn'>카카오로 가입</div>
                <small>또는</small>
                <div id='emailRegist' class='registBtn' onclick='goEmailRegist();'><a href='${path}/member/regist'>이메일로 가입</a></div>
            </div>
            <div>
                <small>이미 계정이 있으시다면 <a href='${path }/login'>로그인</a></small>
            </div>
        </div>
        <input type='hidden' id='email2'/>
       	<input type='hidden' id='id2'/>
    </section>
    <footer></footer>
	<script>
		function goEmailRegist()
		{
			location.href='${path}/regist/basic';
		}
	</script>
	<script type="text/javascript">
	  	var naver_id_login = new naver_id_login("tDmQ7T1QG8MxBJ32rVwy", "http://localhost:9090/test/naverCallback");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("green", 3,40);
	  	naver_id_login.setDomain("http://localhost:9090/test");
	  	naver_id_login.setState(state);
	  	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
    </script>
</body>
</html>