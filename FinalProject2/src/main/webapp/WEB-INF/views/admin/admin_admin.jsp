<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_admin.css">


<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>

        <div id="adminAdminPage">
            <div class="adminAPTitle">ADMIN</div>
            <div id="adminAPOptionDiv">
                <input type="text"/>
                <button>검색</button>
                <button onclick="">추가</button>
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
            
</body>
</html>