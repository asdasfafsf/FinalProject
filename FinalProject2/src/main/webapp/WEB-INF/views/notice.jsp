<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_notice.css">
<script src="/test/resources/js/common/Alert.js"></script>
<script src="/test/resources/js/common/Confirm.js"></script>
<link rel="stylesheet" href="/test/resources/css/common/Alert.css"/>
<link rel="stylesheet" href="/test/resources/css/common/Confirm.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_header.css">
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
	<div id="adminNoticePage" style=" margin-bottom: 200px;">
            <div class="adminNPTitle">NOTICE</div>
            <c:if test="${check==0 }">
            <div id="adminNPOptionDiv">
            	<form action="${pageContext.request.contextPath}/notice_search" method="get" style="display:inline-block;">
                	<input type="text" name="adminSelectNotice_input" id="searchNotice" value="${searchWord }" required/>
                	<button type="submit">검색</button>
                </form>
                
            </div>
            <div id="adminNPBoard">
                    <table id='adminNPTable' >
                            <tr class="adminNPTableHeader">
                               <th style="width:4%">No</th>
                               <th style="width:40%">Title</th>
                               <th style="width:6%">Writer</th>
                               <th style="width:8%">Date</th>    
                            </tr>
                            <c:forEach var="n" items="${noticeList}">
                            <tr class="adminNPTableContent">
                                 <td>${n.NO }</td>
                                 <td style="text-align: left; padding-left: 10px;"><a href='<c:url value='/noticeDetail?idx=${n.NOTICE_NO }'/>'><공지>${n.NOTICE_TITLE }</a></td>
                                 <td>관리자</td>
                                 <td><fmt:formatDate value="${n.NOTICE_DATE }" pattern="yyyy-MM-dd" /></td>
                            </tr>   
                            </c:forEach>
                         </table>
            </div>
           
                    <div style="float: right; width: 48.5%; box-sizing: border-box; text-align:right;">
					   ${pageBar }
					</div>
        </div>
        </c:if>
    	<c:if test="${check==1 }">
        	<c:forEach var="no" items="${noticeContent }">
        	<div style="padding-top: 50px; margin-bottom: 150px;">
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
        			<button onclick="location='${pageContext.request.contextPath }/notice'">목록</button>
        		</div>
        	</div>
        	</c:forEach>
        </c:if>
        
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>