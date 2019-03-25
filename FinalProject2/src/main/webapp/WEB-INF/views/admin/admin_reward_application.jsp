<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_reward_application.css">
<script src="/test/resources/js/common/Alert.js"></script>
<script src="/test/resources/js/common/Confirm.js"></script>
<link rel="stylesheet" href="/test/resources/css/common/Alert.css"/>
<link rel="stylesheet" href="/test/resources/css/common/Confirm.css"/>

<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>

<div id="adminRewardApplicationPage">
            <div class="adminRAPTitle">REWARD APPLICATION</div>
            <div id="adminRAPOptionDiv">
            	<c:if test="${check==0 }">
	            	<button style="color:black;font-weight: bold;" id="rewardProcessing">처리중</button>
	            	<button id="rewardOpenSchedule">오픈예정</button>
            	</c:if>
            	<c:if test="${check==1 }">
	            	<button id="rewardProcessing">처리중</button>
	            	<button id="rewardOpenSchedule" style="color:black;font-weight: bold;">오픈예정</button>
            	</c:if>
            </div>
            <div id="adminRAPOptionLeftDiv">
            	<select name="adminRAPSort1">
                    <option>전체</option>
                    <option>테크·가전</option>
                    <option>패션·잡화</option>
                    <option>뷰티</option>
                    <option>푸드</option>
                    <option>홈리빙</option>
                    <option>디자인소품</option>
                    <option>여행·레저</option>
                    <option>스포츠·모빌리티</option>
                    <option>반려동물</option>
                    <option>공연·컬쳐</option>
                    <option>소셜·캠페인</option>
                    <option>교육·키즈</option>
                    <option>게임·취미</option>
                    <option>출판</option>
                </select>
            </div>
            <div id="adminRAPOptionRightDiv">
            	<select name="adminRAPSelectOption">
                    <option>제목</option>
                    <option>아이디</option>
                    <option>리워드번호</option>
                </select>
                <input type="text"/>
                <button>검색</button>
            </div>
            <div id="adminRAPBoard">
                    <table id='adminRAPTable' >
                            <tr class="adminRAPTableHeader">
                               <th style="width:1%"><input type="checkbox"></th> 
                               <th style="width:3%">No</th>
                               <th style="width:3%">Category</th>
                               <th style="width:20%">Title</th>
                               <th style="width:6%">Writer</th>
                               <th style="width:4%">Date</th>
                               <th style="width:5%">Status</th>         
                            </tr>
                            <c:forEach var="ra" items="${rewardAppList }">
                            <tr class="adminRAPTableContent">
                                 <td><input type="checkbox"></td>
                                 <td>${ra.REWARD_NO }</td>
                                 <td>${ra.REWARD_CATEGORY_NAME }</td>
                                 <td style="text-align: left; padding-left: 10px;"><a href="#">${ra.REWARD_NAME }</a></td>
                                 <td>${ra.USER_EMAIL }</td>
                                 <td><fmt:formatDate value="${ra.REWARD_ENROLL_DATE }" pattern="yyyy-MM-dd"/> </td>
                                 <c:if test="${check==0 }">
                                 <td>처리중</td>
                                 </c:if>
                                 <c:if test="${check==1 }">
                                 <td>오픈예정</td>
                                 </c:if>
                            </tr>
                            </c:forEach> 
                            
                         </table>

            </div>
            <div id="adminRAPRewardState" style="float: left; width: 48.5%; box-sizing: border-box;">
            	<button id="adminRAPTableDeleteBtn" >삭제</button>
            </div>
            <div style="float: right; width: 48.5%; box-sizing: border-box; text-align: right">
            	${pageBar }
            </div>
        </div>
            
</body>
<script>
	$("#rewardProcessing").on('click',function(){
		location='${pageContext.request.contextPath }/admin/rewardAppList';
	});
	$("#rewardOpenSchedule").on('click',function(){
		location='${pageContext.request.contextPath }/admin/rewardOpenSchedule';
	
	});
</script>
</html>