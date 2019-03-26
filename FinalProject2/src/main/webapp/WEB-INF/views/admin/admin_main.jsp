<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_main.css">


<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>
<div id="adminMainPage">
            <div id="adminMainLeft">
                <div class="adminMPContentDiv" style="height: 200px;">
                    <span class="adminMPTitle">Notice</span>
                    <button class="adminMPContentPlusBtn" onclick="location='${pageContext.request.contextPath }/admin/notice'">+</button>
                    <hr>
                    <div class="adminMPContentList">
                        <ul>
                        	<c:forEach var="n" items="${noticeList }">
                            <li><p><a href='<c:url value='/admin/noticeDetail?idx=${n.NOTICE_NO }'/>'>${n.NOTICE_TITLE }</a></p></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="adminMPContentDiv">
                    <span class="adminMPTitle">Reward</span>
                    <button class="adminMPContentPlusBtn" onclick="location='${pageContext.request.contextPath}/admin/rewardAppList'">+</button>
                    <hr>
                    <div class="adminMPContentList">
                        <ul>
                             <c:forEach var="r" items="${rewardList }">
	                         <li><p><a href="#">${r.REWARD_NAME }</a></p></li>
	                         </c:forEach>
                        </ul>
                        </div>
                </div>
            </div>
            <div id="adminMainRight">
                <!-- <div class="adminMPContentDiv">
                    <span class="adminMPTitle">Member</span>
                    <button class="adminMPContentPlusBtn">+</button>
                    <hr>
                    <div class="adminMPContentList">
                            <ul>
                                <li><p><a href="#">사용자1</a></p></li>
                                <li><p><a href="#">사용자2</a></p></li>
                                <li><p><a href="#">사용자3</a></p></li>
                                <li><p><a href="#">사용자4</a></p></li>
                                <li><p><a href="#">사용자5</a></p></li>
                            </ul>
                        </div>
                </div> -->
                <div class="adminMPContentDiv">
                    <span class="adminMPTitle">Report</span>
                    <button class="adminMPContentPlusBtn" onclick="location='${pageContext.request.contextPath }/admin/report'">+</button>
                    <hr>
                    <div class="adminMPContentList">
                            <ul>
                            	<c:forEach var="r" items="${reportList }">
                                <li><p><a href='<c:url value='/admin/reportDetail?idx=${r.REWARD_REPORT_NO }'/>'>${r.REWARD_REPORT_TITLE }</a></p></li>
                                </c:forEach>
                            </ul>
                        </div>
                </div>
            </div>
        </div>
            
</body>
</html>