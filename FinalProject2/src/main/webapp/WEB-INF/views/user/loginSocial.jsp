<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>로그인</title>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/test/respurces/js/user/naverCallback.js"></script>
</head>
<body>
<form method='post' id='user'>
	<input type='hidden' name='email' id='email'/>
	<input type='hidden' name='unique' id='unique'/>
	<input type='hidden' name='type' id='type'/>
</form>
  </body>
</html>