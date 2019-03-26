<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_report.css">
<script src="/test/resources/js/common/Alert.js"></script>
<script src="/test/resources/js/common/Confirm.js"></script>
<link rel="stylesheet" href="/test/resources/css/common/Alert.css"/>
<link rel="stylesheet" href="/test/resources/css/common/Confirm.css"/>
<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>
        <div id="adminReportPage">
            <div class="adminRPTitle">REPORT</div>
            <c:if test="${check==0 }">
            <div id="adminRPOptionDiv1">
            	<c:if test="${status==0 }">
	            	<button style="color:black;font-weight: bold;" id="reportProcessing">처리중</button>
	            	<button id="reportOk">완료</button>
            	</c:if>
            	<c:if test="${status==1 }">
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
                                 <td>${r.REWARD_NO }</td>
                                 <td style="text-align: left; padding-left: 10px;"><a href='<c:url value='/admin/reportDetail?idx=${r.REWARD_REPORT_NO }'/>'>${r.REWARD_REPORT_TITLE }</a></td>
                                 <td>${r.USER_EMAIL }</td>
                                 <td><fmt:formatDate value="${r.REWARD_REPORT_DATE }" pattern="yyyy-MM-dd"/> </td>
                                 <c:if test="${r.REWARD_REPORT_STATE==1 }">
                                 <td>X</td>
                                 </c:if>
                                 <c:if test="${r.REWARD_REPORT_STATE==2 }">
                                 <td>중지</td>
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
			</c:if>
			<c:if test="${check==1 }">
        	<c:forEach var="r" items="${reportList }"> 
        	<div style="padding-top: 10px; margin-bottom: 100px;">
        		<hr>
        		<div style="padding-left: 5px;">
        		<span style="font-size: 18px;font-weight: bold; ">
        			<c:if test="${r.REWARD_REPORT_STATE==1 }">
        				<처리중>
	        		</c:if>
	        		<c:if test="${r.REWARD_REPORT_STATE==2 }">
	        			<리워드 중지>
	        		</c:if>
	        		<c:if test="${r.REWARD_REPORT_STATE==3 }">
	        			<신고 취소>
	        		</c:if>${r.REWARD_REPORT_TITLE }</span><hr>
        		</div>
        		<div style="padding-left: 10px;">
        		<span style="font-size: 15px;"><img src="${pageContext.request.contextPath}/resources/images/admin/profile.png"> 관리자</span>
        		<span><img src="${pageContext.request.contextPath}/resources/images/admin/calendar.png"> ${r.REWARD_REPORT_DATE }</span><br>
        		<hr>
        		</div>
        		<div style="padding-left: 20px;padding-top: 20px;">
        			<a href="#">리워드</a>
        		</div>
        		<div style="padding-top: 20px; padding-left: 20px;">
        			
	        		<div>
	        		
        				${r.REWARD_REPORT_CONTENT }
        			</div>
        		</div>
        		<br><br> 
        		<hr>
        		<div style="float: left; width: 48.5%; box-sizing: border-box;">
        		<c:if test="${r.REWARD_REPORT_STATE==1 }">
        			<button onclick="location='${pageContext.request.contextPath }/admin/report'">목록</button>
        		</c:if>
        		<c:if test="${r.REWARD_REPORT_STATE==2 }">
        			<button onclick="location='${pageContext.request.contextPath }/admin/report_complete'">목록</button>
        		</c:if>
        		<c:if test="${r.REWARD_REPORT_STATE==3 }">
        			<button onclick="location='${pageContext.request.contextPath }/admin/report_complete'">목록</button>
        		</c:if>
        		</div>
        		<div style="float: right; width: 48.5%; box-sizing: border-box; text-align: right;">
        		<c:if test="${r.REWARD_REPORT_STATE==1 }">
	        		<button onclick="comfirmReport(this)" value="${r.REWARD_REPORT_NO }">리워드 중지</button>
	        		<button onclick="ignoreReport(this)" value="${r.REWARD_REPORT_NO }">신고 취소</button>
	        	</c:if>
	        	<c:if test="${r.REWARD_REPORT_STATE==2 }">
        			<button onclick="deleteReport(this)" value="${r.REWARD_REPORT_NO }">삭제</button>
        		</c:if>
        		<c:if test="${r.REWARD_REPORT_STATE==3 }">
        			<button onclick="deleteReport(this)" value="${r.REWARD_REPORT_NO }">삭제</button>
        		</c:if>
	        	</div>	 
        	</div>
        	</c:forEach>
        </c:if>
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
	function ignoreReport(obj) {
		console.log(obj.value);
		confirmBox(function(
				
		){
		location="${pageContext.request.contextPath}/admin/report_ignore?idx="+obj.value;
		},function(){},'신고를 무시하시겠습니까?','알림','확인','취소');
	}
	function deleteReport(obj) {
		confirmBox(function(
				
		){
		location="${pageContext.request.contextPath}/admin/report_delete?idx="+obj.value;
		},function(){},'신고를 삭제하시겠습니까?','알림','확인','취소');
	}
	function comfirmReport(obj) {
		confirmBox(function(
				
		){
		location="${pageContext.request.contextPath}/admin/report_confirm?idx="+obj.value;
		},function(){},'해당 리워드를 중지하시겠습니까?','알림','확인','취소');
	}
</script>
</html>