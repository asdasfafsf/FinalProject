<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_admin.css">
<script src="/test/resources/js/common/Alert.js"></script>
<script src="/test/resources/js/common/Confirm.js"></script>
<link rel="stylesheet" href="/test/resources/css/common/Alert.css"/>
<link rel="stylesheet" href="/test/resources/css/common/Confirm.css"/>

<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>

        <div id="adminAdminPage">
            <div class="adminAPTitle">ADMIN</div>
            <div id="adminAPOptionDiv">
                <input type="text" id="adminSelectAdmin_input" value="${searchWord }" placeholder="ID"/>
                <button onclick="searchAdmin()">검색</button>
                <button onclick="addAdminAccount()">추가</button>
            </div>
            <div id="adminAPBoard">
                    <table id='adminAPTable' >
                            <tr class="adminAPTableHeader">
                               <th style="width:3%">No</th>
                               <th style="width:15%">Id</th>
                               <th style="width:6%">Name</th>
                               <th style="width:7%">EnrollDate</th>
                               <th style="width:10%">Option</th>         
                            </tr>
                            <c:forEach var="a" items="${adminList }">
                            <tr class="adminAPTableContent">
                                 <td>1</td>
                                 <td>${a.USER_EMAIL }</td>
                                 <td>${a.USER_NAME }</td>
                                 <td><fmt:formatDate value="${a.USER_ENROLLDATE }" pattern="yyyy-MM-dd"/> </td>
                                 <c:if test="${a.USER_NO==-1 }">
                                 	<td>-</td>
                                 </c:if>
                                 <c:if test="${a.USER_NO!=-1 }">
                                 	<td><button class="adminAPTableDeleteBtn" onclick="deleteAdmin(this)" value="${a.USER_NO }">삭제</button></td>
                                 </c:if>
                                 
                            </tr>      
                            </c:forEach>
                         </table>
            </div>
            <div style="float: right; width: 48.5%; box-sizing: border-box; text-align:right;">
            	${pageBar }
            </div>
						
        </div>
        <div id="adminAccountAdd_main" class="">
			<form action="${pageContext.request.contextPath}/admin/admin_registration" method="post" id="addAdminForm" >
        	<div id="adminAccountAdd_status" onmousedown="startDrag(event, document.getElementById('adminAccountAdd_main'))">
            	<button type="button" id="adminAccountAdd_close" onclick="document.getElementById('adminAccountAdd_main').style.display='none';"> x
            	</button>
        	</div>
        	<div id="adminAccountAdd_title">
        		ADD ACCOUNT
        	</div>
        	<div id="adminAccountAdd_contents">
        		이름 <br><input type="text" name="userName" id="admin_name"/>
        		이메일 <br><input  style="width: 235px;" placeholder="abc@abc.abc" type="email" id="admin_email" name="userEmail"/>
        		<div style="color: blue; position: relative; display:none;text-align: right:; width: 60px; right: 66px;" id="checkId">사용가능</div>
        		<button type="button" style="position:absolute; right:12px; width: 80px; bottom:170px;" onclick="checkId()">중복확인</button><br>
        		비밀번호 <br><input type="password" name="userPW" id="admin_pw"/><br>
        		비밀번호확인 <br><input type="password" name="userPW2" id="admin_pw2" disabled/><br>
        		<div style="color: red; position: relative; bottom: 30px; left: 215px; text-align: right; display: none; width: 100px;" id="checkPw" >
        		비밀번호 불일치
        		</div>
        		 
        	</div>
        	<div id="adminAccountAdd_option">
        		<button type="button" onclick="adminSubmit()" id="addAdminBtn" >ADD</button>
        	</div>
        	</form>
    	</div>
            
</body>
<script>
	function searchAdmin() {
		var search=$('#adminSelectAdmin_input').val();
		location="${pageContext.request.contextPath}/admin/admin_search?adminSelectAdmin_input="+search;
	}
	var pwCheck=0;
	var emailCheck=0;
	function adminSubmit() {
		var name=$('#admin_name').val();
		var email=$('#admin_email').val();
		var pw=$('#admin_pw').val();
		if(name.trim().length==0||email.trim().length==0||pw.trim().length==0){
			alertBox(function(){},'빈칸을 입력해주세요.','알림','확인');
		}
		else if(pwCheck==0){
			alertBox(function(){},'비밀번호를 확인해주세요.','알림','확인');
		}
		else if(emailCheck==0){
			alertBox(function(){},'아이디 중복확인을 해주세요.','알림','확인');
		}
		else{
			$('#addAdminForm').submit();
		}
		
	}
	function deleteAdmin(obj) {
		confirmBox(function(
				
		){
		console.log(obj.value);
		var userNo=obj.value;
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/admin_delete",
			data:{"userNo":userNo},
			success:function(data){
				location='${pageContext.request.contextPath }/admin/admin';
			},
			error:function(error){
				alert("error"+error);
			}
		});
		},function(){},'관리자를 삭제하시겠습니까?','알림','확인','취소');

	}
	function addAdminAccount(){
		$("#adminAccountAdd_contents>input").val("");
	    document.getElementById('adminAccountAdd_main').style.display = 'block';
	    document.getElementById('adminAccountAdd_main').style.left = "500px";
	    document.getElementById('adminAccountAdd_main').style.top = "150px";
		
	}
	var img_L = 0;
	var img_T = 0;
	var targetObj;

	function getLeft(o) {
	    return parseInt(o.style.left.replace('px', ''));
	}
	function getTop(o) {
	    return parseInt(o.style.top.replace('px', ''));
	}

	// 이미지 움직이기
	function moveDrag(e) {
	    var e_obj = window.event ? window.event : e;
	    var dmvx = parseInt(e_obj.clientX + img_L);
	    var dmvy = parseInt(e_obj.clientY + img_T);
	    targetObj.style.left = dmvx + "px";
	    targetObj.style.top = dmvy + "px";
	    return false;
	}

	// 드래그 시작
	function startDrag(e, obj) {
	    targetObj = obj;
	    var e_obj = window.event ? window.event : e;
	    img_L = getLeft(obj) - e_obj.clientX;
	    img_T = getTop(obj) - e_obj.clientY;

	    document.onmousemove = moveDrag;
	    document.onmouseup = stopDrag;
	    if (e_obj.preventDefault) e_obj.preventDefault();
	}

	// 드래그 멈추기
	function stopDrag() {
	    document.onmousemove = null;
	    document.onmouseup = null;
	}
	$('#admin_pw').keyup(function(){
		console.log($('#admin_pw').val());
		var pw=$('#admin_pw').val();
		var str_space = /\s/;  // 공백체크
			var pw1=$('#admin_pw').val();
			var pw2=$('#admin_pw2').val();
		if(str_space.exec($('#admin_pw').val())) { //공백 체크
		        alertBox(function(){},'공백을 사용할수 없습니다.','알림','확인');
				$('#admin_pw').focus();
		        $('#admin_pw').val(''); // 공백제거
				$('#admin_pw2').val('');
				$('#admin_pw2').attr("disabled", true);
				$('#checkPw').css('display','none');
				pwCheck=0;
		    }
		else if(pw.trim().length==0){
			$('#admin_pw2').attr("disabled", true);
			$('#checkPw').css('display','none');
			$('#admin_pw2').val('');
			pwCheck=0;
		}	
		else{
			$('#admin_pw2').attr("disabled", false);
			if(pw1!=""||pw2!=""){
				if(pw1==pw2){
					$('#checkPw').html('비밀번호 일치');
					$('#checkPw').css('color','blue');
					$('#checkPw').css('display','block');
					pwCheck=1;
				}
				else{
					$('#checkPw').html('비밀번호 불일치');
					$('#checkPw').css('color','red');
					$('#checkPw').css('display','block');
					pwCheck=0;
				}
			}
		}

	});
	$('#admin_pw2').keyup(function(){
		var pw1=$('#admin_pw').val();
		var pw2=$('#admin_pw2').val();
		if(pw1!=""||pw2!=""){
			if(pw1==pw2){
				$('#checkPw').html('비밀번호 일치');
				$('#checkPw').css('color','blue');
				$('#checkPw').css('display','block');
				pwCheck=1;
			}
			else{
				$('#checkPw').html('비밀번호 불일치');
				$('#checkPw').css('color','red');
				$('#checkPw').css('display','block');
				pwCheck=0;
			}
		}
		
	});
	$('#admin_email').keyup(function() {
		emailCheck=0;
		$('#checkId').css('display','none');
	});
	function checkId() {
		var email=$('#admin_email').val();
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			if(exptext.test(email)==false){
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
			alertBox(function(){},'올바른 이메일 형식이 아닙니다.','알림','확인');
			return false;
		}
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/admin_checkEmail",
			data:{"email":email},
			success:function(data){
				console.log(data);
				if(data==0){
					alertBox(function(){},'사용가능한 이메일 입니다.','알림','확인');
					emailCheck=1;
					$('#checkId').css('display','inline-block');
					
				}
				else{
					alertBox(function(){},'중복된 아이디 입니다.','알림','확인');
					emailCheck=0;
				}
			},error:function(error){
				alert("error"+error);
			}
		});
	}
	

</script>
</html>