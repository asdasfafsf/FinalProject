<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<form method='post' id='user'>
	<input type='hidden' name='email' id='email'/>
	<input type='hidden' name='nickname' id='nickname'/>
	<input type='hidden' name='id' id='id'/>
</form>

<script type="text/javascript">
  var naver_id_login = new naver_id_login("tDmQ7T1QG8MxBJ32rVwy", "http://localhost:9090/3333333/naverCallback");
  // 접근 토큰 값 출력
	  /* alert(naver_id_login.oauthParams.access_token); */
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
   /*  alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('id')); */
    $('#email2',opener.document).val(naver_id_login.getProfileData('email'));
    $('#id2',opener.document).val(naver_id_login.getProfileData('id'));
    $('#nickname2',opener.document).val(naver_id_login.getProfileData('nickname'));
    
    window.close();
  }
</script>
  </body>
</html>