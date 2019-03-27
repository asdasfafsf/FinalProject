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
            	<select name="adminRAPSort1" id="sort1" onchange="clickCategory()">
                    <option value="0">전체</option>
                    <option value="1">테크·가전</option>
                    <option value="2">패션·잡화</option>
                    <option value="3">뷰티</option>
                    <option value="4">푸드</option>
                    <option value="5">홈리빙</option>
                    <option value="6">디자인소품</option>
                    <option value="7">여행·레저</option>
                    <option value="8">스포츠·모빌리티</option>
                    <option value="9">반려동물</option>
                    <option value="10">공연·컬쳐</option>
                    <option value="11">소셜·캠페인</option>
                    <option value="12">교육·키즈</option>
                    <option value="13">게임·취미</option>
                    <option value="14">출판</option>
                </select>
            </div>
            <div id="adminRAPOptionRightDiv">
            	<select name="adminRAPSelectOption" id="sort2" onchange="checkSort2()">
                    <option value="15">제목</option>
                    <option value="16">아이디</option>
                    <option value="17">리워드번호</option>
                </select>
                <input type="text" id="searchRewardList" value="${searchWord }"/>
                <button onclick="clickCategory()">검색</button>
            </div>
            <div id="adminRAPBoard">
                    <table id='adminRAPTable' >
                            <tr class="adminRAPTableHeader">
                               <th style="width:1%"><input type="checkbox" id="reward2AllCheck"></th> 
                               <th style="width:3%">No</th>
                               <th style="width:10%">Category</th>
                               <th style="width:30%">Title</th>
                               <th style="width:10%">Writer</th>
                               <th style="width:7%">Date</th>
                               <th style="width:4%">Status</th>         
                            </tr>
                            <c:forEach var="ra" items="${rewardAppList }">
                            <tr class="adminRAPTableContent">
                                 <td><input type="checkbox" name="reward2Checkbox" class="reward2Check" value="${ra.REWARD_NO }"></td>
                                 <td>${ra.REWARD_NO }</td>
                                 <td>${ra.REWARD_CATEGORY_NAME }</td>
                                 <c:if test="${check==0 }">
                                 <td style="text-align: left; padding-left: 10px;"><a href="#"><p style="width:350px; overflow: hidden; text-overflow: ellipsis;white-space: nowrap;display: block; ">${ra.REWARD_NAME }</p></a></td>
                                 </c:if>
                                 <c:if test="${check==1 }">
                                 <td style="text-align: left; padding-left: 10px;"><a href='<c:url value='/project/reward/${ra.REWARD_NO }'/>' target="_blank"><p style="width:350px; overflow: hidden; text-overflow: ellipsis;white-space: nowrap;display: block; ">${ra.REWARD_NAME }</p></a></td>
                                 </c:if>
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
            	<c:if test="${check==1 }">
            	<button id="adminRAPTableOpenBtn" style="background-color: rgb(255, 226, 95); color:black;" onclick="openAdminReward()">오픈</button>
            	</c:if>
            	<button id="adminRAPTableDeleteBtn" onclick="deleteAdminReward2()" >삭제</button>
            </div>
            <div style="float: right; width: 48.5%; box-sizing: border-box; text-align: right">
            	${pageBar }
            </div>
        </div>
            
</body>
<script>
	$(document).ready(function() { 
		$("#sort1").val("${sort1Check}");
		$("#sort2").val("${sort2Check}");
	});
	function openAdminReward() {
		confirmBox(function(
				
		){ 
			var checkedReward=document.getElementsByName('reward2Checkbox');
			var checkedRewardList=new Array();
			var j=0;
			console.log("ㅇㅇㅇ");
			for(i=0;i<checkedReward.length;i++){
				if(checkedReward[i].checked){
					console.log(checkedReward[i].value);
					checkedRewardList[j]=checkedReward[i].value;
					j++;
				}
			}
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/reward_open",
				dataType:"json",
			    traditional:true,
				data:{"noList":checkedRewardList},
				success:function(data){
					console.log("아무거나");
					location.reload();
				},error:function(error){
					console.log("efef" +error);
				}
			});
			
		 },function(){},'리워드를 진행시키겠습니까?','알림','삭제','취소'); 
		
	}
	function deleteAdminReward2(){
		confirmBox(function(
				
		){ 
			var checkedReward=document.getElementsByName('reward2Checkbox');
			var checkedRewardList=new Array();
			var j=0;
			console.log("ㅇㅇㅇ");
			for(i=0;i<checkedReward.length;i++){
				if(checkedReward[i].checked){
					console.log(checkedReward[i].value);
					checkedRewardList[j]=checkedReward[i].value;
					j++;
				}
			}
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/reward_delete",
				dataType:"json",
			    traditional:true,
				data:{"noList":checkedRewardList},
				success:function(data){
					console.log("아무거나");
					location.reload();
				},error:function(error){
					console.log("efef" +error);
				}
			});
			
		 },function(){},'리워드를 삭제하시겠습니까?','알림','삭제','취소'); 
		
	}
	$("#reward2AllCheck").click(function(){
		$( '.reward2Check' ).prop( 'checked', this.checked );
	});
	function clickCategory() {
		if(${check==0}){
			console.log($('#sort1 option:selected').val());
			console.log($('#sort2 option:selected').val());
			console.log($('#searchRewardList').val());
			var sort1=$('#sort1 option:selected').val();
			var sort2=$('#sort2 option:selected').val();
			var search=$('#searchRewardList').val();
			location="${pageContext.request.contextPath}/admin/rewardApp_sort?sort1="+sort1+"&sort2="+sort2+"&search="+search;
		}else{
			console.log($('#sort1 option:selected').val());
			console.log($('#sort2 option:selected').val());
			console.log($('#searchRewardList').val());
			var sort1=$('#sort1 option:selected').val();
			var sort2=$('#sort2 option:selected').val();
			var search=$('#searchRewardList').val();
			location="${pageContext.request.contextPath}/admin/rewardOpen_sort?sort1="+sort1+"&sort2="+sort2+"&search="+search;
		}
		
	}
	function checkSort2(){
		if($("#sort2").val()==17){
			$('#searchRewardList').attr('type','number');
			$('#searchRewardList').attr('placeholder','숫자입력');
		}
		else{
			$('#searchRewardList').attr('type','text');
			$('#searchRewardList').attr('placeholder','');
		}
	
	}
	$("#rewardProcessing").on('click',function(){
		location='${pageContext.request.contextPath }/admin/rewardAppList';
	});
	$("#rewardOpenSchedule").on('click',function(){
		location='${pageContext.request.contextPath }/admin/rewardOpenSchedule';
	
	});
</script>
</html>