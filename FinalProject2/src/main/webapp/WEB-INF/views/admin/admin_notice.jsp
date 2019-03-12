<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_notice.css">


<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>

<div id="adminNoticePage">
            <div class="adminNPTitle">NOTICE</div>
            <div id="adminNPOptionDiv">
                <input type="text"/>
                <button>검색</button>
                <button>글쓰기</button>
            </div>
            <div id="adminNPBoard">
                    <table id='adminNPTable' >
                            <tr class="adminNPTableHeader">
                               <th style="width:1%"><input type="checkbox"></th> 
                               <th style="width:4%">No</th>
                               <th style="width:40%">Title</th>
                               <th style="width:6%">Writer</th>
                               <th style="width:8%">Date</th>
                               <th style="width:6%">Views</th>         
                            </tr>
                            <tr class="adminNPTableContent">
                                 <td><input type="checkbox"></td>
                                 <td>1</td>
                                 <td style="text-align: left; padding-left: 10px;"><a href="#">첫번째 공지사항입니다.</a></td>
                                 <td>admin</td>
                                 <td>2018.01.12</td>
                                 <td>1500</td>
                            </tr>
                            <tr class="adminNPTableContent">
                                <td><input type="checkbox"></td>
                                <td>2</td>
                                <td style="text-align: left; padding-left: 10px;"><a href="#">두번째 공지사항입니다.</a></td>
                                <td>admin</td>
                                <td>2018.01.12</td>
                                <td>3</td>
                            </tr>    
                            
                         </table>

            </div>
            <div id="adminNPNoticeState">
            	<button id="adminNPTableDeleteBtn">삭제</button>
            </div>
        </div>
            
</body>
</html>