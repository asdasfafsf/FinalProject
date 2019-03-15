<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_notice.css">
<script src="/test/resources/js/common/Alert.js"></script>
<script src="/test/resources/js/common/Confirm.js"></script>
<link rel="stylesheet" href="/test/resources/css/common/Alert.css"/>
<link rel="stylesheet" href="/test/resources/css/common/Confirm.css"/>

<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>



<div id="adminNoticePage">
            <div class="adminNPTitle">NOTICE</div>
            <div id="adminNPOptionDiv">
            	<form action="${pageContext.request.contextPath}/admin/notice_search" method="get" style="display:inline-block;">
                	<input type="text" name="adminSelectNotice_input" required/>
                	<button type="submit">검색</button>
                </form>
                <button style="display:inline-block;">글쓰기</button>
            </div>
            <div id="adminNPBoard">
                    <table id='adminNPTable' >
                            <tr class="adminNPTableHeader">
                               <th style="width:1%"><input type="checkbox" id="noticeAllCheck"></th> 
                               <th style="width:4%">No</th>
                               <th style="width:40%">Title</th>
                               <th style="width:6%">Writer</th>
                               <th style="width:8%">Date</th>
                               <th style="width:6%">Views</th>         
                            </tr>
                            <c:forEach var="n" items="${noticeList}">
                            <tr class="adminNPTableContent">
                                 <td><input type="checkbox" value="${n.NOTICE_NO }" name="noticeCheckbox" class="noticeCheck"></td>
                                 <td>${n.NO }</td>
                                 <td style="text-align: left; padding-left: 10px;"><a href="#"><공지>${n.NOTICE_TITLE }</a></td>
                                 <td>관리자</td>
                                 <td><fmt:formatDate value="${n.NOTICE_DATE }" pattern="yyyy-MM-dd" /></td>
                                 <td>1500</td>
                            </tr>   
                            </c:forEach>
                         </table>
            </div>
            <div id="adminNPNoticeState" style="float: left; width: 48.5%; box-sizing: border-box;">
            	<button id="adminNPTableDeleteBtn" onclick="deleteAdminNotice()">삭제</button>
            </div>
                    <div style="float: right; width: 48.5%; box-sizing: border-box; text-align:right;">
					   ${pageBar }
					</div>
        </div>

</body>
<script>
	function deleteAdminNotice(){
		confirmBox(function(
				
		){
			var checkedNotice=document.getElementsByName('noticeCheckbox');
			var checkedNoticeList=new Array();
			var j=0;
			console.log("ㅇㅇㅇ");
			for(i=0;i<checkedNotice.length;i++){
				if(checkedNotice[i].checked){
					console.log(checkedNotice[i].value);
					checkedNoticeList[j]=checkedNotice[i].value;
					j++;
				}
			}
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/notice_delete",
				dataType:"json",
			    traditional:true,
				data:{"noList":checkedNoticeList},
				success:function(data){
					console.log("아무거나");
					location.reload();
				},error:function(error){
					console.log("efef" +error);
				}
			});
			
		},function(){},'정말 삭제하시겠습니까?','알림','삭제','취소');
		
	}
	
        $( '#noticeAllCheck' ).click( function() {
          $( '.noticeCheck' ).prop( 'checked', this.checked );
        } );
</script>
</html>