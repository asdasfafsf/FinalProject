<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_event.css">
<script src="/test/resources/js/common/Alert.js"></script>
<script src="/test/resources/js/common/Confirm.js"></script>
<link rel="stylesheet" href="/test/resources/css/common/Alert.css"/>
<link rel="stylesheet" href="/test/resources/css/common/Confirm.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_header.css">
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>

<div id="adminEventPage" style=" margin-bottom: 200px;">
            <div class="adminEPTitle">Event</div>
            <c:if test="${check==0 }">
            <div id="adminEPOptionDiv">
            	<form action="${pageContext.request.contextPath}/event_search" method="get" style="display:inline-block;">
                <input type="text" name="adminSelectEvent_input" value="${searchWord }" required/>
                <button type="submit">검색</button>
                </form>
                <button style="display:inline-block;" onclick="addAdminEvent()">글쓰기</button>
            </div>
            <div id="adminEPBoard">
                    <table id='adminEPTable' >
                            <tr class="adminEPTableHeader"> 
                               <th style="width:4%">No</th>
                               <th style="width:40%">Title</th>
                               <th style="width:6%">Writer</th>
                               <th style="width:8%">Date</th>
                            </tr>
                            <c:forEach var="e" items="${eventList }">
                            <tr class="adminEPTableContent">
                                 <td>${e.NO }</td>
                                 <td style="text-align: left; padding-left: 10px;"><a href='<c:url value='/eventDetail?idx=${e.EVENT_NO }'/>'><이벤트>${e.EVENT_TITLE }</a></td>
                                 <td>관리자</td>
                                 <td><fmt:formatDate value="${e.EVENT_DATE }" pattern="yyyy-MM-dd"/></td>
                            </tr>    
                            </c:forEach>
                         </table>

            </div>	
            <div style="float: right; width: 48.5%; box-sizing: border-box; text-align:right;">
            	${pageBar }
            </div>
            </c:if>
            <c:if test="${check==1 }">
        	<c:forEach var="ec" items="${eventContent }"> 
        	<div style="padding-top: 50px; margin-bottom: 150px;">
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
        			<button onclick="location='${pageContext.request.contextPath }/event'">목록</button>
        		</div> 
        	</div>
        	</c:forEach>
        </c:if>
        
        
        
            
        </div>
            
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>