<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_report.css">


<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>
        <div id="adminReportPage">
            <div class="adminRPTitle">REPORT</div>
            <div id="adminRPOptionDiv">
                <input type="text"/>
                <button>검색</button>
            </div>
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
                            <tr class="adminRPTableContent">
                                 <td>1</td>
                                 <td><a href="#">1</a></td>
                                 <td style="text-align: left; padding-left: 10px;"><a href="#">신고합니다.</a></td>
                                 <td>asdf</td>
                                 <td>2018.01.12</td>
                                 <td>X</td>
                            </tr>
                            <tr class="adminRPTableContent">
                                <td>2</td>
                                <td><a href="#">3</td>
                                <td style="text-align: left; padding-left: 10px;"><a href="#">신고합니다!</a></td>
                                <td>qwer123</td>
                                <td>2018.01.12</td>
                                <td>O</td>
                            </tr>    
                            
                         </table>

            </div>
        </div>
            
</body>
</html>