<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_admin.css">


<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>

        <div id="adminAdminPage">
            <div class="adminAPTitle">ADMIN</div>
            <div id="adminAPOptionDiv">
                <input type="text"/>
                <button>검색</button>
                <button onclick="addAdminAccount()">추가</button>
            </div>
            <div id="adminAPBoard">
                    <table id='adminAPTable' >
                            <tr class="adminAPTableHeader">
                               <th style="width:3%">No</th>
                               <th style="width:15%">Id</th>
                               <th style="width:6%">Name</th>
                               <th style="width:7%">EnrollDate</th>
                               <th style="width:10%">Option</th>         
                            </tr>
                            <tr class="adminAPTableContent">
                                 <td>1</td>
                                 <td>admin1@naver.com</td>
                                 <td>관리자</td>
                                 <td>2018.01.12</td>
                                 <td>-</td>
                            </tr>
                            <tr class="adminAPTableContent">
                                    <td>1</td>
                                    <td>admin1@naver.com</td>
                                    <td>관리자</td>
                                    <td>2018.01.12</td>
                                    <td><button class="adminAPTableDeleteBtn">삭제</button></td>
                            </tr>
                            <tr class="adminAPTableContent">
                                    <td>1</td>
                                    <td>admin1@naver.com</td>
                                    <td>관리자</td>
                                    <td>2018.01.12</td>
                                    <td><button class="adminAPTableDeleteBtn">삭제</button></td>
                            </tr>        
                            
                         </table>

            </div>
        </div>
        <div id="adminAccountAdd_main" class="">

        	<div id="adminAccountAdd_status" onmousedown="startDrag(event, document.getElementById('adminAccountAdd_main'))">
            	<button id="adminAccountAdd_close" onclick="document.getElementById('adminAccountAdd_main').style.display='none';"> x
            	</button>
        	</div>
        	<div id="adminAccountAdd_title">
        		ADD ACCOUNT
        	</div>
        	<div id="adminAccountAdd_contents">
        		이름 <br><input type="text" name=""/>
        		이메일 <br><input  placeholder="abc@abc.abc" type="email" name=""/></br>	
        		비밀번호 <br><input type="password" name="" id="admin_pw"/><br>
        		비밀번호확인 <br><input type="password" name="" id="admin_pw2" disabled/><br>
        		 
        	</div>
        	<div id="adminAccountAdd_option">
        		<button>ADD</button>
        	</div>
    	</div>
            
</body>
<script>
	function addAdminAccount(){
		$("#adminAccountAdd_contents>input").val("");
	    document.getElementById('adminAccountAdd_main').style.display = 'block';
	    document.getElementById('adminAccountAdd_main').style.left = "500px";
	    document.getElementById('adminAccountAdd_main').style.top = "150px";
		
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
	$('#admin_pw').keyup(function(){
		console.log("키업");
		if(('#admin_pw').val().length<1){
			$('#admin_pw2').attr("disabled", true);}
		else{
			$('#admin_pw2').attr("disabled", false);
		}

	});
	

</script>
</html>