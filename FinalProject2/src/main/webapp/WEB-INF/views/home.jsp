<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>


<html>
<head>

<title>Home</title>
<jsp:include page="/WEB-INF/views/common/util.jsp" flush="true">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>

<script src="/test/resources/js/common/jquery-3.3.1.js"></script>

</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${path } </P>
</body>

<script>
var ok = function() {
    console.log('ok를 누름');
}

var cancel = function() {
    console.log('cancel을 누름');
}


confirmBox(ok, cancel,'정말 ** 하시겠습니까');

</script>
</html>
