<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_reward_index.css">
<script src="/test/resources/js/common/Alert.js"></script>
<script src="/test/resources/js/common/Confirm.js"></script>
<link rel="stylesheet" href="/test/resources/css/common/Alert.css"/>
<link rel="stylesheet" href="/test/resources/css/common/Confirm.css"/>

<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>

<div id="adminRewardIndexPage">
            <div class="adminRIPTitle">REWARD INDEX</div>
            <div id="adminRIPOptionDiv">
            <c:if test="${check==0 }">
            	<button name="rewardStatus" id="rewardContinue" style="color:black;font-weight: bold;">진행중</button>
            	<button name="rewardStatus" id="rewardStop">종료</button>
            </c:if>
            <c:if test="${check==1 }">
            	<button name="rewardStatus" id="rewardContinue">진행중</button>
            	<button name="rewardStatus" id="rewardStop" style="color:black;font-weight: bold;">종료</button>
            </c:if>

           	</div>
           	<c:if test="${check==0 }">
            <div id="adminRIPOptionLeftDiv">
            	<select name="adminRIPSort1" id="sort1" onchange="clickCategory()">
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
            </c:if>
            
            <div id="adminRIPOptionRightDiv">
            	<select name="adminRIPSelectOption" id="sort2" onchange="checkSort2()">
                    <option value="15">제목</option>
                    <option value="16">아이디</option>
                    <option value="17">리워드번호</option>
                </select>
                <input type="text" id="searchRewardList" value="${searchWord }"/>
                <button onclick="clickCategory()">검색</button>
            </div>
            
            <div id="adminRIPBoard">
                    <table id='adminRIPTable' >
                            <tr class="adminRIPTableHeader">
                               <th style="width:1%"><input type="checkbox" id="rewardAllCheck"></th> 
                               <th style="width:3%">Reward</th>
                               <th style="width:10%">Category</th>
                               <th style="width:30%">Title</th>
                               <th style="width:10%">Writer</th>
                               <th style="width:6%">Date</th>
                               <th style="width:6%">Deadline</th>
                               <th style="width:3%">%</th>         
                            </tr>
                            
                            <c:forEach var="r" items="${rewardIndexList}">
                            <c:if test="${r.REWARD_STATE==5}">
	                            <tr class="adminRIPTableContent">
	                                 <td><input type="checkbox" class="rewardCheck" value="${r.REWARD_NO }" name="rewardCheckbox"></td>
	                                 <td>${r.REWARD_NO }</td>
	                                 <td>${r.REWARD_CATEGORY_NAME }</td>
	                                 <td style="text-align: left; padding-left: 10px;"><a href='<c:url value='/project/reward/${r.REWARD_NO }'/>' target="_blank"><p style="width:300px; overflow: hidden; text-overflow: ellipsis;white-space: nowrap;display: block; ">${r.REWARD_NAME }</p></a></td>
	                                 <td>${r.USER_EMAIL }</td>
	                                 <td><fmt:formatDate value="${r.REWARD_ENROLL_DATE }" pattern="yyyy-MM-dd" /></td>
	                                 <td><fmt:formatDate value="${r.REWARD_DEADLINE }" pattern="yyyy-MM-dd" /></td>
	                                 <td>${r.REWARD_ACHIEVEMENT_PERSENT }%</td>
	                            </tr>
                            </c:if>
                            <c:if test="${r.REWARD_STATE==6}">
	                            <tr class="adminRIPTableContent">
	                                 <td><input type="checkbox" class="rewardCheck" value="${r.REWARD_NO }" name="rewardCheckbox"></td>
	                                 <td>${r.REWARD_NO }</td>
	                                 <td>${r.REWARD_CATEGORY_NAME }</td>
	                                 <td style="text-align: left; padding-left: 10px;"><a href='<c:url value='/project/reward/${r.REWARD_NO }'/>' target="_blank"><p style="width:300px; overflow: hidden; text-overflow: ellipsis;white-space: nowrap;display: block; ">${r.REWARD_NAME }</p></a></td>
	                                 <td>${r.USER_EMAIL }</td>
	                                 <td><fmt:formatDate value="${r.REWARD_ENROLL_DATE }" pattern="yyyy-MM-dd" /></td>
	                                 <td><fmt:formatDate value="${r.REWARD_DEADLINE }" pattern="yyyy-MM-dd" /></td>
	                                 <td>성공</td>
	                            </tr>
                            </c:if>
                            <c:if test="${r.REWARD_STATE==7}">
	                            <tr class="adminRIPTableContent">
	                                 <td><input type="checkbox" class="rewardCheck" value="${r.REWARD_NO }" name="rewardCheckbox"></td>
	                                 <td>${r.REWARD_NO }</td>
	                                 <td>${r.REWARD_CATEGORY_NAME }</td>
	                                 <td style="text-align: left; padding-left: 10px;"><a href='<c:url value='/project/reward/${r.REWARD_NO }'/>' target="_blank"><p style="width:300px; overflow: hidden; text-overflow: ellipsis;white-space: nowrap;display: block; ">${r.REWARD_NAME }</p></a></td>
	                                 <td>${r.USER_EMAIL }</td>
	                                 <td><fmt:formatDate value="${r.REWARD_ENROLL_DATE }" pattern="yyyy-MM-dd" /></td>
	                                 <td><fmt:formatDate value="${r.REWARD_DEADLINE }" pattern="yyyy-MM-dd" /></td>
	                                 <td>실패</td>
	                            </tr>
                            </c:if>
                            
                            </c:forEach>
                            
                         </table>

            </div>
            <c:if test="${check==0 }">
            <div id="adminRIPRewardState" style="float: left; width: 48.5%; box-sizing: border-box;">
            	<button id="adminRIPTableStopBtn" onclick="stopAdminReward()">종료</button>
            </div>
            </c:if>
            <c:if test="${check==1 }">
            <!-- <div id="adminRIPRewardState" style="float: left; width: 48.5%; box-sizing: border-box;">
            	<button id="adminRIPTableDeleteBtn" onclick="deleteAdminReward()">삭제</button>
            </div> -->
            </c:if>
            <div style="float: right; width: 48.5%; box-sizing: border-box; text-align:right;">
					   ${pageBar }
					</div>
        </div>
            
</body>
<script>
	$(document).ready(function() { 
		$("#sort1").val("${sort1Check}");
		$("#sort2").val("${sort2Check}");
	});
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
	function clickCategory() {
		if(${check==0}){
			console.log($('#sort1 option:selected').val());
			console.log($('#sort2 option:selected').val());
			console.log($('#searchRewardList').val());
			var sort1=$('#sort1 option:selected').val();
			var sort2=$('#sort2 option:selected').val();
			var search=$('#searchRewardList').val();
			location="${pageContext.request.contextPath}/admin/rewardContinue_sort?sort1="+sort1+"&sort2="+sort2+"&search="+search;
		}else{
			console.log($('#sort2 option:selected').val());
			console.log($('#searchRewardList').val());
			var sort2=$('#sort2 option:selected').val();
			var search=$('#searchRewardList').val();
			location="${pageContext.request.contextPath}/admin/rewardStop_sort?sort2="+sort2+"&search="+search;
		}
		
	}
	function stopAdminReward(){
		 confirmBox(function(
				
		){ 
			var checkedReward=document.getElementsByName('rewardCheckbox');
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
				url:"${pageContext.request.contextPath}/admin/reward_stop",
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
			
		 },function(){},'리워드를 종료시키겠습니까?','알림','종료','취소'); 
		
	}
	function deleteAdminReward(){
		confirmBox(function(
				
		){ 
			var checkedReward=document.getElementsByName('rewardCheckbox');
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
	$("#rewardContinue").on('click',function(){
		location='${pageContext.request.contextPath }/admin/rewardList';
		console.log("진행중");
	});
	$("#rewardStop").on('click',function(){
		
		location='${pageContext.request.contextPath }/admin/rewardStopList';
		console.log("스탑");

	});
	$("#rewardAllCheck").click(function(){
		$( '.rewardCheck' ).prop( 'checked', this.checked );
	});
</script>
</html>