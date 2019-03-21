<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_member.css">
<script src="/test/resources/js/common/Alert.js"></script>
<script src="/test/resources/js/common/Confirm.js"></script>
<link rel="stylesheet" href="/test/resources/css/common/Alert.css"/>
<link rel="stylesheet" href="/test/resources/css/common/Confirm.css"/>


<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>

        <div id="adminMemberPage">
            <div id="adminMPTitle">MEMBER</div>
            <div id="adminMPOptionleftDiv">
                <select name="adminMPSort1">
                    <option>가입날짜순</option>
                    <option>이름순</option>
                    <option>정지회원</option>
                </select>
            </div>
            <div id="adminMPOptionRightDiv">
                <select name="adminMPSelectOption">
                    <option>아이디</option>
                    <option>이름</option>
                    <option>타입</option>
                    <option>주소</option>
                    <option>계좌</option>
                </select>
                <input type="text"/>
                <button>검색</button>
            </div>
            <div id="adminMPBoard">
                    <table id='adminMPTable' >
                            <tr class="adminMPTableHeader">
                                <th style="width:1%"><input type="checkbox" id="memberAllCheck"></th> 
                               <th style="width:3%">No</th>
                               <th style="width:15%">Id</th>
                               <th style="width:5%">Name</th>
                               <th style="width:5%">Type</th>
                               <th style="width:15%">Address</th>
                               <th style="width:15%">Phone Number</th>
                               <th style="width:6%">EnrollDate</th>
                               <th style="width:3%">Status</th>         
                            </tr>
                            <c:forEach var="m" items="${memberList }" varStatus="vs">
                            
                            <tr class="adminMPTableContent">
                                <td><input type="checkbox" name="memberCheckbox" class="memberCheck" value="${m.USER_NO }"></td>
                            <c:if test="${pageNo==1 }">   
                                 <td>${vs.count }</td>
                            </c:if>
                            <c:if test="${pageNo>1 }">   
                                 <td>${vs.count+(pageNo-1)*10 }</td>
                            </c:if>
                                 <td>${m.USER_EMAIL }</td>
                                 <td>${m.USER_NAME }</td>
                            <c:if test="${m.USER_LINK_TYPE==1 }">
                                 <td>회원</td>
                            </c:if>
                            <c:if test="${m.USER_LINK_TYPE==2 }">
                                 <td>네이버</td>
                            </c:if>
                            <c:if test="${m.USER_LINK_TYPE==3 }">
                                 <td>카카오</td>
                            </c:if>
                            
                            <c:if test="${empty m.ADRESS_WHOLE }">
                                 <td>-</td>                            
                            </c:if>
                            <c:if test="${not empty m.ADRESS_WHOLE }">
                                 <td>${m.ADRESS_WHOLE }</td>                            
                            </c:if>
                            
                            <c:if test="${empty m.ADDRESS_PHONE }">
                                 <td>-</td>                            
                            </c:if>
                            <c:if test="${not empty m.ADDRESS_PHONE }">
                                 <td>${m.ADDRESS_PHONE }</td>
                            </c:if>
                                 <td><fmt:formatDate value="${m.USER_ENROLLDATE }" pattern="yyyy-MM-dd"/> </td>
                            <c:if test="${m.USER_TYPE==1 }">
                                 <td>-</td>
                            </c:if>
                            <c:if test="${m.USER_TYPE==3 }">
                                 <td>정지</td>
                            </c:if>
                            </tr>
                            </c:forEach>
                            
                         </table>

            </div>
            <div id="adminMPMemberState" style="float: left; width: 48.5%; box-sizing: border-box;">
                <button id="adminMPTableOutBtn" onclick="outAdminMember()">탈퇴</button>
                <button id="adminMPTableSuspendBtn" onclick="suspendAdminMember()">정지</button>
                <button id="adminMPTableSuspendCancelBtn" onclick="suspendCancelAdminMember()">정지취소</button>

            </div>
            <div style="float: right; width: 48.5%; box-sizing: border-box;text-align:right;">
            	${pageBar }
            </div>
        </div>
            
</body>
<script>
	function outAdminMember(){
		confirmBox(function(
				
		){
		var checkedMember=document.getElementsByName('memberCheckbox');
		var checkedMemberList=new Array();
		var j=0;
		console.log("ㅇㅇㅇ");
		for(i=0;i<checkedMember.length;i++){
			if(checkedMember[i].checked){
				console.log(checkedMember[i].value);
				checkedMemberList[j]=checkedMember[i].value;
				console.log(checkedMemberList[j]);
				j++;
			}
		}
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/member_withdrawal",
			dataType:"json",
		    traditional:true,
			data:{"noList":checkedMemberList},
			success:function(data){
				console.log("아무거나");
				location.reload();
			},error:function(error){
				console.log("efef" +error);
			}
		});
		},function(){},'회원을 탈퇴시키겠습니까?','알림','확인','취소'); 

	}
	function suspendAdminMember(){
		confirmBox(function(
				
		){
		var checkedMember=document.getElementsByName('memberCheckbox');
		var checkedMemberList=new Array();
		var j=0;
		console.log("ㅇㅇㅇ");
		for(i=0;i<checkedMember.length;i++){
			if(checkedMember[i].checked){
				console.log(checkedMember[i].value);
				checkedMemberList[j]=checkedMember[i].value;
				console.log(checkedMemberList[j]);
				j++;
			}
		}
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/member_suspend",
			dataType:"json",
		    traditional:true,
			data:{"noList":checkedMemberList},
			success:function(data){
				console.log("아무거나");
				location.reload();
			},error:function(error){
				console.log("efef" +error);
			}
		});
		},function(){},'회원를 정지시키겠습니까?','알림','확인','취소'); 

	}
	function suspendCancelAdminMember(){
		confirmBox(function(
				
		){
		var checkedMember=document.getElementsByName('memberCheckbox');
		var checkedMemberList=new Array();
		var j=0;
		console.log("ㅇㅇㅇ");
		for(i=0;i<checkedMember.length;i++){
			if(checkedMember[i].checked){
				console.log(checkedMember[i].value);
				checkedMemberList[j]=checkedMember[i].value;
				console.log(checkedMemberList[j]);
				j++;
			}
		}
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/member_suspendCancel",
			dataType:"json",
		    traditional:true,
			data:{"noList":checkedMemberList},
			success:function(data){
				console.log("아무거나");
				location.reload();
			},error:function(error){
				console.log("efef" +error);
			}
		});
		},function(){},'정지를 해지하시겠습니까?','알림','확인','취소'); 

	}
	
	$( '#memberAllCheck' ).click( function() {
	    $( '.memberCheck' ).prop( 'checked', this.checked );
	  } );
</script>
</html>