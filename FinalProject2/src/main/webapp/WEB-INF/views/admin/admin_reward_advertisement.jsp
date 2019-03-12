<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_reward_advertisement.css">


<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>

<div id="adminRewardAdvertisementPage">
            <div class="adminRADPTitle">REWARD ADVERTISEMENT</div>
            <div id="adminRADPOptionDiv">
                <input type="text"/>
                <button>검색</button>
                <button id="adminRewardAdAddBtn" onclick="addRewardAd()">추가</button>
            </div>
            <div id="adminRADPBoard">
                    <table id='adminRADPTable' >
                            <tr class="adminRADPTableHeader">
                               <th style="width:1%"><input type="checkbox"></th> 
                               <th style="width:3%">No</th>
                               <th style="width:3%">Category</th>
                               <th style="width:20%">Title</th>
                               <th style="width:6%">Writer</th>
                               <th style="width:4%">Start</th>
                               <th style="width:5%">End</th>         
                            </tr>
                            <tr class="adminRADPTableContent">
                                 <td><input type="checkbox"></td>
                                 <td>1512</td>
                                 <td>여행</td>
                                 <td style="text-align: left; padding-left: 10px;"><a href="#">첫번째 리워드.</a></td>
                                 <td>admin</td>
                                 <td>2018.01.12</td>
                                 <td>2018.02.12</td>
                            </tr>
                            <tr class="adminRADPTableContent">
                                <td><input type="checkbox"></td>
                                <td>15155</td>
                                <td>음식</td>
                                <td style="text-align: left; padding-left: 10px;"><a href="#">두번째 리워드.</a></td>
                                <td>qwe1234</td>
                                <td>2018.01.12</td>
                                <td>2018.02.12</td>
                            </tr>    
                            
                         </table>

            </div>
            <div id="adminRADPRewardState">
            	<button id="adminRADPTableDeleteBtn">삭제</button>
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
        		· Reward No : <input type="number"/><br>
        		· Start Date : <input type="date"/><br>
        		· End Date : <input type="date"/>
        	</div>
        	<div id="adminRewardAdAdd_option">
        		<button>추가</button>
        	</div>
    	</div>
            
</body>
<script>
function addRewardAd() {
	$("#adminRewardAdAdd_contents>input").val("");
    document.getElementById('adminRewardAdAdd_main').style.display = 'block';
    document.getElementById('adminRewardAdAdd_main').style.left = "500px";
    document.getElementById('adminRewardAdAdd_main').style.top = "150px";
}
var img_L = 0;
var img_T = 0;
var targetObj;

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