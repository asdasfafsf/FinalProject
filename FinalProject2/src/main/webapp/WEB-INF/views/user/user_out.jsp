<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/user/user_out.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common/Alert.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common/Confirm.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/test/resources/js/user/user_out.js"></script>
<script src='/test/resources/js/common/Alert.js'></script>
<script src='/test/resources/js/common/Confirm.js'></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div class='user_full_screen_background_min'>
	<div class='user_full_screen'>
		<div class='user_contents_big'>
			<div id='outPage-container'>
	            <h1>회원탈퇴</h1>
	            <br/>
				<form id='outUserFrm' class='user'>
		            <div id='outPage-terms-container'>
		                <h3>탈퇴 전 꼭 확인하세요!</h3>
		                <h4>탈퇴전, 아래의 사항을 꼭 확인해주세요!</h4>
		                <div class='terms' id='firstTerm'>
		                    <table id='tbl_firstTerm'>
		                        <tr>
		                            <td>
		                                탈퇴 후 3개월 내 재가입 불가
		                                <br/>
		                                <small>탈퇴 후 3개월 내 동일 이메일로 재가입 불가</small>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td>
		                                탈퇴 후 개인정보 일괄 삭제
		                                <br/>
		                                <small>참여한, 찜한, 개설중인 프로젝트 및 저장된 주소록, 등록한 계좌 등 개인정보 일괄 삭제</small>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td>
		                                탈퇴 후 작성한 게시물은 삭제 불가
		                                <br/>
		                                <small>게시글, 댓글 등 삭제 불가</small>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td><label><input type="checkbox" value='first' id='agree'>탈퇴시 유의사항을 확인하였습니다.</label></td>
		                        </tr>
		                    </table>
		                </div>
		               
		            </div>
		            <div id='outPage-reason-container'>
		                <h3>어떤 점이 불편하셨나요?</h3>
		                <h4>이용하시면서 불편하셨던 점을 말씀해주시면, 앞으로의 서비스 개선에 <br/> 참고하도록 하겠습니다.</h4>
		                <select id='reason' name='reason' required>
		                    <option selected disabled="disabled">탈퇴 이유는 무엇인가요?</option>
		                    <option value='1. 재가입을 위해'>1. 재가입을 위해</option>
		                    <option value='2. 펀딩서비스 불만족'>2. 펀딩서비스 불만족</option>
		                    <option value='3. 개인정보 노출 우려'>3. 개인정보 노출 우려</option>
		                    <option value='4. 고객센터 불만족'>4. 고객센터 불만족</option>
		                    <option value='5. 기타'>5.기타</option>
		                </select>
		                <textarea id='reason5' rows="10" cols="60" placeholder="이유를 입력해 주세요"></textarea>
		            </div>
		            <div class='btn-conatainer'>
			            <button class='submitBtn' type='submit' id='firstSubmit'>확인</button>
		            </div>
				</form>
				<form id='userOutKeyFrm' class='user'>
		            <div id='outPage-number-container'>
		                <h3>본인확인</h3>
		                <h4>마지막으로, 안전한 탈퇴를 위해 본인인증절차를 진행합니다. <br/>브라우저 창을 끄지 마시고, 이메일을 확인하여 인증번호를 입력해 주세요.</h4>
		                <input type ='email' id='email' class='textField' placeholder="등록하신 이메일을 입력해 주세요"/>
		                <input type = 'hidden' id='getEmail' value='${email }'/> 
		                <br/>
		                <button class='submitBtn' id='sendOutEmail'>이메일 전송</button>
		                <br/>
		                <input type='text' id='number' class='textField' required placeholder="인증번호"/>
		                <button type='submit' class='confirm'>확인</button>
		            </div>
	                <button class='submitBtn' id='finallyOut'>회원 탈퇴</button>
				</form>
            </div>
        </div>
	</div>
</div>
</body>
</html>