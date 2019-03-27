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
                <select name="adminMPSort1" id="sort1" onchange="clickCategory()">
                	<c:if test="${sort1Check==1 }">
                    <option value="1" selected>가입날짜순</option>
                    <option value="2">이름순</option>
                    <option value="3">정지회원</option>
                    </c:if>
                    <c:if test="${sort1Check==2 }">
                    <option value="1">가입날짜순</option>
                    <option value="2" selected>이름순</option>
                    <option value="3">정지회원</option>
                    </c:if>
                    <c:if test="${sort1Check==3 }">
                    <option value="1">가입날짜순</option>
                    <option value="2">이름순</option>
                    <option value="3" selected>정지회원</option>
                    </c:if>
                </select>
            </div>
            <div id="adminMPOptionRightDiv">
                <select name="adminMPSelectOption" id="sort2" onchange="placeholder(this)">
                	<c:if test="${sort2Check==4 }">
                    <option value="4" selected>아이디</option>
                    <option value="5">이름</option>
                    <option value="6">타입</option>
                    <option value="7">주소</option>
                    <option value="8">전화번호</option>
                    </c:if>
                    <c:if test="${sort2Check==5 }">
                    <option value="4">아이디</option>
                    <option value="5" selected>이름</option>
                    <option value="6">타입</option>
                    <option value="7">주소</option>
                    <option value="8">전화번호</option>
                    </c:if>
                    <c:if test="${sort2Check==6 }">
                    <option value="4">아이디</option>
                    <option value="5">이름</option>
                    <option value="6" selected>타입</option>
                    <option value="7">주소</option>
                    <option value="8">전화번호</option>
                    </c:if>
                    <c:if test="${sort2Check==7 }">
                    <option value="4">아이디</option>
                    <option value="5">이름</option>
                    <option value="6">타입</option>
                    <option value="7" selected>주소</option>
                    <option value="8">전화번호</option>
                    </c:if>
                    <c:if test="${sort2Check==8 }">
                    <option value="4">아이디</option>
                    <option value="5">이름</option>
                    <option value="6">타입</option>
                    <option value="7">주소</option>
                    <option value="8" selected>전화번호</option>
                    </c:if>
                </select>
                <input type="text" id="searchMember" value="${searchWord }"/>
                <button onclick="clickCategory()">검색</button>
            </div>
            <div id="adminMPBoard">
                    <table id='adminMPTable' style="z-index: 50" >
                            <tr class="adminMPTableHeader">
                                <th style="width:1%"><input type="checkbox" id="memberAllCheck"></th> 
                               <th style="width:3%">No</th>
                               <th style="width:15%">Id</th>
                               <th style="width:7%">Name</th>
                               <th style="width:7%">Type</th>
                               <th style="width:14%">Address</th>
                               <th style="width:16%">Phone Number</th>
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
                                 <td><p class="memberAddress" onclick="memberAddressDetail(event,this)" value="${m.ADRESS_WHOLE}" style="width:200px; overflow: hidden; text-overflow: ellipsis;white-space: nowrap;display: block; margin-left:17px;">${m.ADRESS_WHOLE }</p> </td>                            
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
        <div id="displayAddress" style="position:relative; display:none;padding-bottom:23px; box-shadow: 0 3px 7px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); border : 1px solid black; text-align:center; border-radius:10px; width: 400px; height: auto; z-index: 1000; font-size:13px; background-color: white;"></div>
            
</body>
<script>
	$('html').click(function(e) {
		if(!$(e.target).hasClass("memberAddress")) 
		{ $('#displayAddress').css('display','none'); }
	}); 

	function memberAddressDetailOut(obj) {
		$('#displayAddress').css('display','none');

	}
	function memberAddressDetail(e,obj) {
		console.log($(obj).html());
		var address=$(obj).html();
		var x = e.pageX;
		var y = e.pageY;
		console.log(x+""+y);
	    document.getElementById('displayAddress').style.top = y-350+"px";
		document.getElementById('displayAddress').style.left = x+"px";
		$('#displayAddress').css('display','block');
		$('#displayAddress').html(address);
	} 
	
	function placeholder(obj) {
		var index=$("#sort2 option:selected").val();
		console.log(index);
		if(index==6){
		//if($(obj">option"))
		$( '#searchMember' ).attr( 'placeholder', '1:회원 2:네이버 3:카카오' );}
		else {
			$( '#searchMember' ).attr( 'placeholder', '' );
		}
	}

	function clickCategory(category) {
		console.log($('#sort1 option:selected').val());
		console.log($('#sort2 option:selected').val());
		console.log($('#searchMember').val());
		var sort1=$('#sort1 option:selected').val();
		var sort2=$('#sort2 option:selected').val();
		var search=$('#searchMember').val();
		location="${pageContext.request.contextPath}/admin/member_sort?sort1="+sort1+"&sort2="+sort2+"&search="+search;
	}
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