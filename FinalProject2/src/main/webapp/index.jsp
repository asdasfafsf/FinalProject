<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
<a href="${pageContext.request.contextPath }/gaga">gaga</a>
<a href="${pageContext.request.contextPath }/total">전체</a>
<a href="${pageContext.request.contextPath }/main">메인</a>
<a href="${pageContext.request.contextPath }/account_balance_inquiry">잔액조회</a>
<a href="${pageContext.request.contextPath }/account_authorize">계좌인증</a>
<a href="${pageContext.request.contextPath }/account_inquiry">계좌조회</a>
<a href="${pageContext.request.contextPath }/withdrawal_transfer">출금이체</a>
<a href="${pageContext.request.contextPath }/deposit_transfer">입금이체</a>
<a href="${pageContext.request.contextPath }/transactional_information">거래내역</a>
<a href="${pageContext.request.contextPath }/account_close">계좌해지</a>


<!-- 아래쪽에 로그인 관련 test : 페이지만 붙였음. 기능 없음 -->
<br/>
<a href="${pageContext.request.contextPath }/login">로그인</a>
<a href="${pageContext.request.contextPath }/welcome">회원가입</a>

<a href="${pageContext.request.contextPath }/<%-- 여기 고민중.. 내가 참여한 리워드 볼 수 있고, 다른 회원 페이지로 가서 그 사람이 참여한 리워드 볼 수 있음 --%>">
							참여한 리워드</a>
<a href="${pageContext.request.contextPath }/myprofile">내정보수정</a>
<a href="${pageContext.request.contextPath }/logout">로그아웃</a>

</body>

</html>