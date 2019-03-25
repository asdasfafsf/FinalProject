<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_notice.css">
<script src="/test/resources/js/common/Alert.js"></script>
<script src="/test/resources/js/common/Confirm.js"></script>
<link rel="stylesheet" href="/test/resources/css/common/Alert.css"/>
<link rel="stylesheet" href="/test/resources/css/common/Confirm.css"/>

<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>



<div id="adminNoticePage">
            <div class="adminNPTitle">NOTICE</div>
            <c:if test="${check==0 }">
            <div id="adminNPOptionDiv">
            	<form action="${pageContext.request.contextPath}/admin/notice_search" method="get" style="display:inline-block;">
                	<input type="text" name="adminSelectNotice_input" id="searchNotice" value="${searchWord }" required/>
                	<button type="submit">검색</button>
                </form>
                <button style="display:inline-block;" onclick="addAdminNotice()">글쓰기</button>
            </div>
            <div id="adminNPBoard">
                    <table id='adminNPTable' >
                            <tr class="adminNPTableHeader">
                               <th style="width:1%"><input type="checkbox" id="noticeAllCheck"></th> 
                               <th style="width:4%">No</th>
                               <th style="width:40%">Title</th>
                               <th style="width:6%">Writer</th>
                               <th style="width:8%">Date</th>
                               <th style="width:6%">Views</th>         
                            </tr>
                            <c:forEach var="n" items="${noticeList}">
                            <tr class="adminNPTableContent">
                                 <td><input type="checkbox" value="${n.NOTICE_NO }" name="noticeCheckbox" class="noticeCheck"></td>
                                 <td>${n.NO }</td>
                                 <td style="text-align: left; padding-left: 10px;"><a href='<c:url value='/admin/noticeDetail?idx=${n.NOTICE_NO }'/>'><공지>${n.NOTICE_TITLE }</a></td>
                                 <td>관리자</td>
                                 <td><fmt:formatDate value="${n.NOTICE_DATE }" pattern="yyyy-MM-dd" /></td>
                                 <td>1500</td>
                            </tr>   
                            </c:forEach>
                         </table>
            </div>
            <div id="adminNPNoticeState" style="float: left; width: 48.5%; box-sizing: border-box;">
            	<button id="adminNPTableDeleteBtn" onclick="deleteAdminNotice()">삭제</button>
            </div>
                    <div style="float: right; width: 48.5%; box-sizing: border-box; text-align:right;">
					   ${pageBar }
					</div>
        </div>
        </c:if>
        <c:if test="${check==1 }">
        	<c:forEach var="no" items="${noticeContent }">
        	<div style="padding-top: 10px;  margin-bottom: 100px;">
        		<hr>
        		<div style="padding-left: 5px;">
        		<span style="font-size: 18px;font-weight: bold; "><공지>${no.NOTICE_TITLE }</span><hr>
        		</div>
        		<div style="padding-left: 10px;">
        		<span style="font-size: 15px;"><img src="${pageContext.request.contextPath}/resources/images/admin/profile.png"> 관리자</span>
        		<span><img src="${pageContext.request.contextPath}/resources/images/admin/calendar.png"> ${no.NOTICE_DATE }</span><br>
        		</div>
        		<div style="padding-top: 20px; padding-left: 20px;">
	        		${no.NOTICE_CONTENT }
        		
        		
        		</div>
        		 <br><br>
        		<hr>
        		<div style="float: left; width: 48.5%; box-sizing: border-box;">
        			<button onclick="location='${pageContext.request.contextPath }/admin/notice'">목록</button>
        		</div>
        		<div style="float: right; width: 48.5%; box-sizing: border-box; text-align: right;">
	        		<button onclick="editNotice(this)" value="${no.NOTICE_NO }">수정</button>
	        		<button onclick="deleteNotice(this)" value="${no.NOTICE_NO }">삭제</button>
	        	</div>	 
        	</div>
        	</c:forEach>
        </c:if>
        <c:if test="${check==2 }">
        	<div style="padding-top: 15px; text-align: center;">
        		<hr>
        		<div style="padding-top: 5px;">
	        		<span style="font-weight: bold; font-size: 15px;">제목</span>
	        		<c:if test="${edit==0 }">
	        		<c:forEach var="e" items="${editNoticeContent }">
	        		<input type="text" id="noticeTitle" style="width:800px; height: 30px; margin-left: 5px;" value="${e.NOTICE_TITLE }"/>
	        		</c:forEach>
	        		</c:if>
	        		<c:if test="${edit==1 }">
	        		<input type="text" id="noticeTitle" style="width:800px; height: 30px; margin-left: 5px;"/>
	        		</c:if>
	        		
        		</div>
        		<div style="padding-top: 3px;">
	        		<span style="position:relative; bottom:200px; font-weight: bold; font-size: 15px;">내용</span>
	        		<c:if test="${edit==0 }">
	        		<c:forEach var="e" items="${editNoticeContent }">
	        		<textarea id="noticeContent" style="resize:none;width:800px;margin-top: 5px; height:350px;margin-left: 5px;">${e.NOTICE_CONTENT }</textarea>
	        		</c:forEach>
	        		</c:if>
	        		<c:if test="${edit==1 }">
	        		<textarea id="noticeContent" style="resize:none;width:800px;margin-top: 5px; height:350px;margin-left: 5px;"></textarea>
					</c:if>
        		</div>
        		<div id="add_adminNotice_right_option">
        			<c:if test="${edit==1 }">
	        		<button onclick="submitAdminNotice()">저장</button>
	        		</c:if>
	        		<c:if test="${edit==0 }">
        			<c:forEach var="e" items="${editNoticeContent }">
	        		<button onclick="updateAdminNotice(this)" value="${e.NOTICE_NO }">수정</button>
	        		</c:forEach>
	        		</c:if>
        			<button onclick="location='${pageContext.request.contextPath }/admin/notice'">취소</button>
	        	
	        	</div>
        	</div>
        	<div style="padding-top: 33px;">
        	<hr>
        	</div>
        
        </c:if>

</body>
<script>

	function submitAdminNotice(){
		console.log($('#noticeTitle').val());
		console.log($('#noticeContent').val());
		var noticeTitle=$('#noticeTitle').val();
		var noticeContent=$('#noticeContent').val()
		if(noticeTitle.trim().length==0||noticeContent.trim().length==0){
			alertBox(function(){},'빈칸을 입력하세요.','알림','확인');
		}
		else{
			confirmBox(function(
					
			){
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/notice_registration",
				data:{"noticeTitle":noticeTitle,"noticeContent":noticeContent},
				success:function(data){
					console.log("성공");
					location='${pageContext.request.contextPath }/admin/notice';
				},
				error:function(error){
					alert("error"+error);
				}
			});
			},function(){},'공지사항을 등록하시겠습니까?','알림','확인','취소');
		}
	}
	function addAdminNotice() {
		location='${pageContext.request.contextPath }/admin/notice_add';
	}
	function editNotice(obj) {
		console.log(obj.value);
		location="${pageContext.request.contextPath}/admin/notice_edit?idx="+obj.value;
		
	}
	function updateAdminNotice(obj) {
		console.log($('#noticeTitle').val());
		console.log($('#noticeContent').val());
		var noticeTitle=$('#noticeTitle').val();
		var noticeContent=$('#noticeContent').val()
		var noticeNo=obj.value;
		if(noticeTitle.trim().length==0||noticeContent.trim().length==0){
			alertBox(function(){},'빈칸을 입력하세요.','알림','확인');
		}
		confirmBox(function(
				
		){
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/notice_update",
			data:{"noticeTitle":noticeTitle,"noticeContent":noticeContent,"noticeNo":noticeNo},
			success:function(data){
				console.log("성공");
				location='${pageContext.request.contextPath }/admin/notice';
			},
			error:function(error){
				alert("error"+error);
			}
		});
		},function(){},'수정하시겠습니까?','알림','확인','취소');
	}
	function deleteNotice(obj){
		confirmBox(function(
						
				){
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/notice_delete",
			dataType:"json",
		    traditional:true,
			data:{"noList":obj.value},
			success:function(data){
				console.log("아무거나");
				location="${pageContext.request.contextPath}/admin/notice";
			},error:function(error){
				console.log("efef" +error);
			}

		});
		},function(){},'정말 삭제하시겠습니까?','알림','삭제','취소');
	}
	function deleteAdminNotice(){
		confirmBox(function(
				
		){
			var checkedNotice=document.getElementsByName('noticeCheckbox');
			var checkedNoticeList=new Array();
			var j=0;
			console.log("ㅇㅇㅇ");
			for(i=0;i<checkedNotice.length;i++){
				if(checkedNotice[i].checked){
					console.log(checkedNotice[i].value);
					checkedNoticeList[j]=checkedNotice[i].value;
					j++;
				}
			}
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/notice_delete",
				dataType:"json",
			    traditional:true,
				data:{"noList":checkedNoticeList},
				success:function(data){
					console.log("아무거나");
					location.reload();
				},error:function(error){
					console.log("efef" +error);
				}
			});
			
		},function(){},'정말 삭제하시겠습니까?','알림','삭제','취소');
		
	}
	
        $( '#noticeAllCheck' ).click( function() {
          $( '.noticeCheck' ).prop( 'checked', this.checked );
        } );
</script>
</html>