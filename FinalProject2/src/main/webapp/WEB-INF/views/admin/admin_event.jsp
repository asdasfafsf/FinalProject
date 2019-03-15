<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_event.css">


<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>

<div id="adminEventPage">
            <div class="adminEPTitle">Event</div>
            <div id="adminEPOptionDiv">
            	<form action="${pageContext.request.contextPath}/admin/event_search" method="get" style="display:inline-block;">
                <input type="text" name="adminSelectEvent_input" required/>
                <button type="submit">검색</button>
                </form>
                <button style="display:inline-block;">글쓰기</button>
            </div>
            <div id="adminEPBoard">
                    <table id='adminEPTable' >
                            <tr class="adminEPTableHeader">
                               <th style="width:1%"><input type="checkbox" id="eventAllCheck"></th> 
                               <th style="width:4%">No</th>
                               <th style="width:40%">Title</th>
                               <th style="width:6%">Writer</th>
                               <th style="width:8%">Date</th>
                               <th style="width:6%">Views</th>         
                            </tr>
                            <c:forEach var="e" items="${eventList }">
                            <tr class="adminEPTableContent">
                                 <td><input type="checkbox" name="eventCheckbox" class="eventCheck"></td>
                                 <td>${e.NO }</td>
                                 <td style="text-align: left; padding-left: 10px;"><a href="#"><이벤트>${e.EVENT_TITLE }</a></td>
                                 <td>관리자</td>
                                 <td><fmt:formatDate value="${e.EVENT_DATE }" pattern="yyyy-MM-dd"/></td>
                                 <td>1500</td>
                            </tr>    
                            </c:forEach>
                         </table>

            </div>
            <div id="adminEPEventState" style="float: left; width: 48.5%; box-sizing: border-box;">
                <button id="adminEPTableStopBtn">중지</button>
            	<button id="adminEPTableDeleteBtn" onclick="deleteAdminEvent()">삭제</button>
            </div>
            <div style="float: right; width: 48.5%; box-sizing: border-box; text-align:right;">
            	${pageBar }
            </div>
        </div>
            
</body>
<<script>
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
</script>
</html>