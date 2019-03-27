<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_reward_payment.css">
<script src="/test/resources/js/common/Alert.js"></script>
<script src="/test/resources/js/common/Confirm.js"></script>
<link rel="stylesheet" href="/test/resources/css/common/Alert.css"/>
<link rel="stylesheet" href="/test/resources/css/common/Confirm.css"/>

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/jquery/jquery-2.2.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/bootstrap-3.3.6-dist/js/modal.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/etc/ext_util.js"></script><!-- 외부 유틸 js -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/constants.js"></script><!-- 상수 js -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/common.js"></script><!-- 사용자정의 js -->
	
<script src="/test/resources/js/common/context.js"></script>
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextPath","${pageContext.request.contextPath}");
</script>

<script src="/test/resources/js/common/withdrawalUserAccount.js"></script>
<script src="/test/resources/js/common/depositUserAccount.js"></script>


<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>
	<div id="adminRewardPaymentPage">
            <div class="adminRPPTitle">REWARD PAYMENT</div>
            
            
            <div id="adminRPPBoard" style="margin-top: 35px;">
                    <table id='adminRPPTable' >
                            <tr class="adminRPPTableHeader">
                               <th style="width:3%">No</th>
                               <th style="width:10%">Category</th>
                               <th style="width:18%">Title</th>
                               <th style="width:10%">Writer</th>
                               <th style="width:7%">DeadLine</th>
                               <th style="width:13%">Payment</th>
                               <th style="width:15%">Status</th>         
                            </tr>
                            <c:forEach var="ra" items="${rewardPaymentList }">
                            <tr class="adminRPPTableContent">
                                 <td>${ra.REWARD_NO }</td>
                                 <td>${ra.REWARD_CATEGORY_NAME }</td>
                                 <td style="text-align: left; padding-left: 10px;"><a href='<c:url value='/project/reward/${ra.REWARD_NO }'/>' target="_blank"><p style="width:300px; overflow: hidden; text-overflow: ellipsis;white-space: nowrap;display: block; ">${ra.REWARD_NAME }</p></a></td>
                                 <td>${ra.USER_EMAIL }</td>
                                 <td><fmt:formatDate value="${ra.REWARD_DEADLINE }" pattern="yyyy-MM-dd"/> </td>
                                 <td>${ra.REWARD_PRESENT_COLLECTION }/${ra.REWARD_GOAL }</td>
                                 <td>
                                 
	                                 <table id="depositInputTable" class="table table-condensed multiInputTable">
		                                 
											<td><input type="text" class="input-sm" id="fintech_use_num_0" name="fintech_use_num_0"/></td>
											<td><input type="text" class="input-sm" id="print_content_0" name="print_content_0" value="리워드 펀딩금"/></td>
											<td><input type="text" class="input-sm ar" id="tran_amt_0" name="tran_amt_0" value="${ra.REWARD_PRESENT_COLLECTION }"/></td>
										
									</table>
                                 	<button style="margin-right: 1.5px;" onclick="selectWithdrawalUser(${ra.REWARD_NO});">결제확인</button>
                                 	<button style="margin-left: 1.5px;" onclick="depositUserAccount(this,${ra.REWARD_NO});">결제완료</button>
                                 </td>
                            </tr>
                            </c:forEach>
                            
                         </table>

            </div>
            
            <div style="float: right; width: 48.5%; box-sizing: border-box; text-align: right">
            	${pageBar }
            </div>
        </div>

</body>
<script>

</script>
</html>