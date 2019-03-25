<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_report.css">

<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>
        <div id="adminReportPage">
            <div class="adminRPTitle">REPORT</div>
            <div id="adminRPOptionDiv1">
            	<c:if test="${check==0 }">
	            	<button style="color:black;font-weight: bold;" id="reportProcessing">처리중</button>
	            	<button id="reportOk">완료</button>
            	</c:if>
            	<c:if test="${check==1 }">
	            	<button id="reportProcessing">처리중</button>
	            	<button id="reportOk" style="color:black;font-weight: bold;">완료</button>
            	</c:if>
            </div>
            <!-- <div id="adminRPOptionDiv">
                <input type="text"/>
                <button>검색</button>
            </div> -->
            <div id="adminRPBoard">
                    <table id='adminRPTable' >
                            <tr class="adminRPTableHeader">
                               <th style="width:4%">No</th>
                               <th style="width:4%">Reward</th>
                               <th style="width:35%">Title</th>
                               <th style="width:10%">Writer</th>
                               <th style="width:8%">Date</th>
                               <th style="width:6%">Confirm</th>         
                            </tr>
                            <c:forEach var="r" items="${reportList }">
                            <tr class="adminRPTableContent">
                                 <td>1</td>
                                 <td><a href="#">${r.REWARD_NO }</a></td>
                                 <td style="text-align: left; padding-left: 10px;"><a href="#">${r.REWARD_REPORT_TITLE }</a></td>
                                 <td>${r.USER_EMAIL }</td>
                                 <td><fmt:formatDate value="${r.REWARD_REPORT_DATE }" pattern="yyyy-MM-dd"/> </td>
                                 <c:if test="${r.REWARD_REPORT_STATE==1 }">
                                 <td>X</td>
                                 </c:if>
                                 <c:if test="${r.REWARD_REPORT_STATE==2 }">
                                 <td>O</td>
                                 </c:if>
                                 <c:if test="${r.REWARD_REPORT_STATE==3 }">
                                 <td>-</td>
                                 </c:if>
                            </tr>
                            </c:forEach>
                            <!-- <tr class="adminRPTableContent">
                                <td>2</td>
                                <td><a href="#">3</td>
                                <td style="text-align: left; padding-left: 10px;"><a href="#">신고합니다!</a></td>
                                <td>qwer123</td>
                                <td>2018.01.12</td>
                                <td>O</td>
                            </tr>   -->  
                            
                         </table>

            </div>
            <div style="float: right; width: 48.5%; box-sizing: border-box; text-align:right;">
					   ${pageBar }
			</div>
        </div>
            
</body>
<script>
	$("#reportProcessing").on('click',function(){
		location='${pageContext.request.contextPath }/admin/report';
		console.log("진행중");
	});
	$("#reportOk").on('click',function(){
		
		location='${pageContext.request.contextPath }/admin/report_complete';
		console.log("스탑");
	
	});
</script>
</html>