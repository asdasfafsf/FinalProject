<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_event.css">
<script src="/test/resources/js/common/Alert.js"></script>
<script src="/test/resources/js/common/Confirm.js"></script>
<link rel="stylesheet" href="/test/resources/css/common/Alert.css"/>
<link rel="stylesheet" href="/test/resources/css/common/Confirm.css"/>

<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>

<div id="adminEventPage">
            <div class="adminEPTitle">Event</div>
            <c:if test="${check==0 }">
            <div id="adminEPOptionDiv">
            	<form action="${pageContext.request.contextPath}/admin/event_search" method="get" style="display:inline-block;">
                <input type="text" name="adminSelectEvent_input" value="${searchWord }" required/>
                <button type="submit">검색</button>
                </form>
                <button style="display:inline-block;" onclick="addAdminEvent()">글쓰기</button>
            </div>
            <div id="adminEPBoard">
                    <table id='adminEPTable' >
                            <tr class="adminEPTableHeader">
                               <th style="width:1%"><input type="checkbox" id="eventAllCheck"></th> 
                               <th style="width:4%">No</th>
                               <th style="width:40%">Title</th>
                               <th style="width:6%">Writer</th>
                               <th style="width:8%">Date</th>        
                            </tr>
                            <c:forEach var="e" items="${eventList }">
                            <tr class="adminEPTableContent">
                                 <td><input type="checkbox" value="${e.EVENT_NO }" name="eventCheckbox" class="eventCheck"></td>
                                 <td>${e.NO }</td>
                                 <td style="text-align: left; padding-left: 10px;"><a href='<c:url value='/admin/eventDetail?idx=${e.EVENT_NO }'/>'><이벤트>${e.EVENT_TITLE }</a></td>
                                 <td>관리자</td>
                                 <td><fmt:formatDate value="${e.EVENT_DATE }" pattern="yyyy-MM-dd"/></td>
                            </tr>    
                            </c:forEach>
                         </table>

            </div>
            <div id="adminEPEventState" style="float: left; width: 48.5%; box-sizing: border-box;">
            	<button id="adminEPTableDeleteBtn" onclick="deleteAdminEvent()">삭제</button>
            </div>
            <div style="float: right; width: 48.5%; box-sizing: border-box; text-align:right;">
            	${pageBar }
            </div>
            </c:if>
            <c:if test="${check==1 }">
        	<c:forEach var="ec" items="${eventContent }"> 
        	<div style="padding-top: 10px; margin-bottom: 100px;">
        		<hr>
        		<div style="padding-left: 5px;">
        		<span style="font-size: 18px;font-weight: bold; "><이벤트>${ec.EVENT_TITLE }</span><hr>
        		</div>
        		<div style="padding-left: 10px;">
        		<span style="font-size: 15px;"><img src="${pageContext.request.contextPath}/resources/images/admin/profile.png"> 관리자</span>
        		<span><img src="${pageContext.request.contextPath}/resources/images/admin/calendar.png"> ${ec.EVENT_DATE }</span><br>
        		</div>
        		<div style="padding-top: 20px; padding-left: 20px;">
        			<div>
	        			<img src="${pageContext.request.contextPath}${ec.EVENT_IMAGE_STORED_PATH}" style="max-width: 900px;"/>
	        		</div>
	        		<br>
	        		<div>
        				${ec.EVENT_CONTENT }
        			</div>
        		</div>
        		<br><br> 
        		<hr>
        		<div style="float: left; width: 48.5%; box-sizing: border-box;">
        			<button onclick="location='${pageContext.request.contextPath }/admin/event'">목록</button>
        		</div>
        		<div style="float: right; width: 48.5%; box-sizing: border-box; text-align: right;">
	        		<button onclick="editEvent(this)" value="${ec.EVENT_NO }">수정</button>
	        		<button onclick="deleteEvent(this)" value="${ec.EVENT_NO }">삭제</button>
	        	</div>	 
        	</div>
        	</c:forEach>
        </c:if>
        
        
        <c:if test="${check==2 }">
        <c:if test="${edit==1 }">
        	<form method="post" enctype="multipart/form-data" id="eventForm" action="${pageContext.request.contextPath}/admin/event_registration">
        </c:if>
        <c:if test="${edit==0 }">
        <c:forEach var="e" items="${editEventContent }">
        	<form method="post" enctype="multipart/form-data" id="eventForm" action="${pageContext.request.contextPath}/admin/event_update?idx=${e.EVENT_NO }">
        </c:forEach>
        </c:if>	
        	<div style="padding-top: 15px; text-align: center;">
        		<hr>
        		<div style="padding-top: 5px;">
	        		<span style="font-weight: bold; font-size: 15px;">제목</span>
	        		<c:if test="${edit==0 }">
	        		<c:forEach var="e" items="${editEventContent }">
	        		<input type="text" name="eventTitle" id="eventTitle1" style="width:800px; height: 30px; margin-left: 5px;" value="${e.EVENT_TITLE }" maxlength="37"/>
	        		</c:forEach>
	        		</c:if>
	        		<c:if test="${edit==1 }">
	        		<input type="text" name="eventTitle" id="eventTitle1" style="width:800px; height: 30px; margin-left: 5px;" maxlength="37"/>
	        		</c:if>
	        		
        		</div>
        		<div style="padding-top: 3px;">
	        		<span style="position:relative; bottom:200px; font-weight: bold; font-size: 15px;">내용</span>
	        		<c:if test="${edit==0 }">
	        		<c:forEach var="e" items="${editEventContent }">
	        		<textarea name="eventContent" id="eventContent1" style="resize:none;width:800px;margin-top: 5px; height:350px;margin-left: 5px;">${e.EVENT_CONTENT }</textarea>
	        		</c:forEach>
	        		</c:if>
	        		<c:if test="${edit==1 }">
	        		<textarea name="eventContent" id="eventContent1" style="resize:none; width:800px;margin-top: 5px; height:350px;margin-left: 5px;"></textarea>
					</c:if>
        		</div>
        		<div>
	        		<span style="font-weight: bold; font-size: 15px;">파일</span>
	        		<input type="file" onchange="fileTypeCheck(this)" style="width:800px; height: 30px; margin-left: 5px;" accept=".gif, .jpg, .png" id="eventFile1" name="eventFile"/>	        		
        		
        		</div>
        		<div id="add_adminEvent_right_option">
        			<c:if test="${edit==1 }">
	        		<button type="button" onclick="submitAdminEvent()">저장</button>
	        		</c:if>
	        		<c:if test="${edit==0 }">
        			<c:forEach var="e" items="${editEventContent }">
	        		<button type="button" onclick="updateAdminEvent(this)" value="${e.EVENT_NO }">수정</button>
	        		</c:forEach>
	        		</c:if>
        			<button type="button" onclick="location='${pageContext.request.contextPath }/admin/event'">취소</button>
	        	
	        	</div>
        	</div>
        	<div style="padding-top: 33px;">
        	<hr>
        	</div>
        </form>
        </c:if>
            
        </div>
            
</body>
<script>
	function updateAdminEvent(obj) {
		console.log($('#eventTitle1').val());
		console.log($('#eventContent1').val());
		console.log($('#eventFile1').val());
		var eventTitle=$('#eventTitle1').val();
		var eventContent=$('#eventContent1').val();
		var eventFile=$('#eventFile1').val();
		if(eventTitle.trim().length==0||eventContent.trim().length==0){
			alertBox(function(){},'빈칸을 입력하세요.','알림','확인');
		}
		else if(eventFile.trim().length!=0){
			confirmBox(function(
					
			){
				$('#eventForm').submit();
			},function(){$('#eventFile1').val("");},'사진을 수정하시겠습니까?','알림','확인','취소');
		}
		else{
			confirmBox(function(
					
			){
				$('#eventForm').submit();
			},function(){},'수정하시겠습니까?','알림','확인','취소');
		}
		
	}
	function editEvent(obj) {
		//console.log(obj.value);
		location="${pageContext.request.contextPath}/admin/event_edit?idx="+obj.value;
		
	}
	function deleteEvent(obj){
		confirmBox(function(
						
				){
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/event_delete",
			dataType:"json",
		    traditional:true,
			data:{"noList":obj.value},
			success:function(data){
				console.log("아무거나");
				location="${pageContext.request.contextPath}/admin/event";
			},error:function(error){
				console.log("efef" +error);
			}
	
		});
		},function(){},'정말 삭제하시겠습니까?','알림','삭제','취소');
	}
	function fileTypeCheck(obj) {
		pathpoint = obj.value.lastIndexOf('.');
		filepoint = obj.value.substring(pathpoint+1,obj.length);
		filetype = filepoint.toLowerCase();
		if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg') {
	
		} else {
			alertBox(function(){},'이미지 파일만 첨부할 수 있습니다.','알림','확인');
			obj.value="";
			return false;
		}
	
	}
	function submitAdminEvent() {
		console.log($('#eventTitle1').val());
		console.log($('#eventContent1').val());
		var eventTitle=$('#eventTitle1').val();
		var eventContent=$('#eventContent1').val();
		var eventFile=$('#eventFile1').val();
		/* 
		var formData = new FormData();
		formData.append("eventTitle",eventTitle);
		formData.append("eventContent",eventContent);
		formData.append("eventFile",$('#eventFile')[0].files[0]);
			 */ 
		if(eventTitle.trim().length==0||eventContent.trim().length==0){
			alertBox(function(){},'빈칸을 입력하세요.','알림','확인');
		}
		else if(eventFile.trim().length==0){
			alertBox(function(){},'첨부파일을 등록하여주세요.','알림','확인');
		}
		else{
			confirmBox(function(
					
			){
				$('#eventForm').submit();
			},function(){},'이벤트를 등록하시겠습니까?','알림','확인','취소');
		}
		
		
	}
	$( '#eventAllCheck' ).click( function() {
    	$( '.eventCheck' ).prop( 'checked', this.checked );
  	} );
	function deleteAdminEvent(){
		confirmBox(function(
				
		){
			var checkedEvent=document.getElementsByName('eventCheckbox');
			var checkedEventList=new Array();
			var j=0;
			console.log("ㅇㅇㅇ");
			for(i=0;i<checkedEvent.length;i++){
				if(checkedEvent[i].checked){
					console.log(checkedEvent[i].value);
					checkedEventList[j]=checkedEvent[i].value;
					j++;
				}
			}
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/event_delete",
				dataType:"json",
			    traditional:true,
				data:{"noList":checkedEventList},
				success:function(data){
					console.log("아무거나");
					location.reload();
				},error:function(error){
					console.log("efef" +error);
				}
			});
			
		},function(){},'정말 삭제하시겠습니까?','알림','삭제','취소');
		
	}
	function addAdminEvent() {
		location='${pageContext.request.contextPath }/admin/event_add';
	}
</script>
</html>