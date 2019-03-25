<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_reward_advertisement.css">
<script src="/test/resources/js/common/Alert.js"></script>
<script src="/test/resources/js/common/Confirm.js"></script>
<link rel="stylesheet" href="/test/resources/css/common/Alert.css"/>
<link rel="stylesheet" href="/test/resources/css/common/Confirm.css"/>

<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>

<div id="adminRewardAdvertisementPage">
            <div class="adminRADPTitle">REWARD ADVERTISEMENT</div>
            <div id="adminRADPOptionDiv">
                
                <button id="adminRewardAdAddBtn" onclick="addRewardAdScreen()">추가</button>
            </div>
            <div id="adminRADPBoard">
                    <table id='adminRADPTable' >
                            <tr class="adminRADPTableHeader">
                               <th style="width:1%"><input type="checkbox" id="rewardAdAllCheck"></th> 
                               <th style="width:3%">No</th>
                               <th style="width:3%">Reward</th>
                               <th style="width:5%">Category</th>
                               <th style="width:18%">Title</th>
                               <th style="width:6%">Writer</th>
                               <th style="width:5%">Start</th>
                               <th style="width:5%">End</th>         
                            </tr>
                            <c:forEach var="ad" items="${rewardAdList }" varStatus="vs">
                            <tr class="adminRADPTableContent">
                                <td><input type="checkbox" value="${ad.REWARD_NO }" name="rewardAdCheckbox" class="rewardAdCheck"></td>
                            	<c:if test="${pageNo==1 }">   
                                 	<td>${vs.count }</td>
                            	</c:if>
                            	<c:if test="${pageNo>1 }">   
                                 	<td>${vs.count+(pageNo-1)*10 }</td>
                            	</c:if>
                                <td>${ad.REWARD_NO }</td>
                                <td>${ad.REWARD_CATEGORY_NAME }</td>
                                <td style="text-align: left; padding-left: 10px;"><a href="#">${ad.REWARD_NAME }</a></td>
                                <td>${ad.USER_EMAIL }</td>
                                <td><fmt:formatDate value="${ad.REWARD_AD_START_DATE }" pattern="yyyy-MM-dd"/></td>
                                <td><fmt:formatDate value="${ad.REWARD_AD_END_DATE }" pattern="yyyy-MM-dd"/></td>
                            </tr>    
                            </c:forEach>
                         </table>

            </div>
            <div id="adminRADPRewardState" style="float: left; width: 48.5%; box-sizing: border-box;">
            	<button id="adminRADPTableDeleteBtn" onclick="deleteAdminRewardAd()">삭제</button>
            </div>
            <div style="float: right; width: 48.5%; box-sizing: border-box; text-align:right;">
					   ${pageBar }
			</div>
        </div>
        
        <div id="adminRewardAdAdd_main" class="">

        	<div id="adminRewardAdAdd_status" onmousedown="startDrag(event, document.getElementById('adminRewardAdAdd_main'))">
            	<button id="adminRewardAdAdd_close" onclick="document.getElementById('adminRewardAdAdd_main').style.display='none';"> x
            	</button>
        	</div>
        	<div id="adminRewardAdAdd_title">
        		ADD ADVERTISEMENT
        	</div>
        	<div id="adminRewardAdAdd_contents">
        		· Reward No<br><input type="number" name="rewardNo"/><br>
        		· Start Date<br><input type="date" name="startDate"/><br>
        		· End Date<br><input type="date" name="endDate"/>
        	</div>
        	<div id="adminRewardAdAdd_option">
        		<button onclick="addRewardAdAdd()">추가</button>
        	</div>
    	</div>
            
</body>
<script>
	function deleteAdminRewardAd(){
		confirmBox(function(
				
		){ 
		var checkedRewardAd=document.getElementsByName('rewardAdCheckbox');
		var checkedRewardAdList=new Array();
		var j=0;
		console.log("ㅇㅇㅇ");
		for(i=0;i<checkedRewardAd.length;i++){
			if(checkedRewardAd[i].checked){
				console.log(checkedRewardAd[i].value);
				checkedRewardAdList[j]=checkedRewardAd[i].value;
				j++;
			}
		}
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/rewardAd_delete",
			traditional:true,
			data:{"noList":checkedRewardAdList},
			success:function(data){
				console.log("아무거나");
				location.reload();
			},error:function(error){
				console.log("efef" +error);
			}
		}); 
		},function(){},'광고를 삭제하시겠습니까?','알림','삭제','취소'); 
	}
	$( '#rewardAdAllCheck' ).click( function() {
        $( '.rewardAdCheck' ).prop( 'checked', this.checked );
      } );
	function addRewardAdScreen() {
		$("#adminRewardAdAdd_contents>input").val("");
	    document.getElementById('adminRewardAdAdd_main').style.display = 'block';
	    document.getElementById('adminRewardAdAdd_main').style.left = "500px";
	    document.getElementById('adminRewardAdAdd_main').style.top = "150px";
	}
	var img_L = 0;
	var img_T = 0;
	var targetObj;
	
	function addRewardAdAdd(){
		
		var rewardNo=$("#adminRewardAdAdd_contents>input[type='number']").val();
		var startDate=$("#adminRewardAdAdd_contents>input[name='startDate']").val();
		var endDate=$("#adminRewardAdAdd_contents>input[name='endDate']").val();
		var startArr=startDate.split('-');
		var endArr=endDate.split('-');
		var start_date=new Date(startArr[0],startArr[1],startArr[2]);
		var end_date=new Date(endArr[0],endArr[1],endArr[2]);
		var today=new Date();
		if(rewardNo==""||startDate==""||endDate==""){
			alertBox(function(){},'빈칸을 입력하세요.','알림','확인');
		}
		else if(start_date.getTime()>end_date.getTime()){
			alertBox(function(){},'종료날짜가 시작날짜보다 빠릅니다.','알림','확인');
		}
		else if(start_date.getTime()<today.getTime()){
			alertBox(function(){},'시작날짜가 현재날짜보다 느립니다.','알림','확인');
		}
		else{
			confirmBox(function(
					
			){
			console.log("리워드"+rewardNo);
			console.log("시작시간"+startDate);
			console.log("시작시간"+endDate);
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/rewardAd_add",
				data:{"rewardNo":rewardNo,"startDate":startDate,"endDate":endDate},
				success:function(data){
					console.log("성공");
					location.reload();
				},
				error:function(error){
					alert("error"+error);
				}
			});
		},function(){},'광고를 등록하시겠습니까?','알림','확인','취소');
		}

		
	}
	function getLeft(o) {
	    return parseInt(o.style.left.replace('px', ''));
	}
	function getTop(o) {
	    return parseInt(o.style.top.replace('px', ''));
	}
	
	// 이미지 움직이기
	function moveDrag(e) {
	    var e_obj = window.event ? window.event : e;
	    var dmvx = parseInt(e_obj.clientX + img_L);
	    var dmvy = parseInt(e_obj.clientY + img_T);
	    targetObj.style.left = dmvx + "px";
	    targetObj.style.top = dmvy + "px";
	    return false;
	}
	
	// 드래그 시작
	function startDrag(e, obj) {
	    targetObj = obj;
	    var e_obj = window.event ? window.event : e;
	    img_L = getLeft(obj) - e_obj.clientX;
	    img_T = getTop(obj) - e_obj.clientY;
	
	    document.onmousemove = moveDrag;
	    document.onmouseup = stopDrag;
	    if (e_obj.preventDefault) e_obj.preventDefault();
	}
	
	// 드래그 멈추기
	function stopDrag() {
	    document.onmousemove = null;
	    document.onmouseup = null;
	}
</script>
</html>