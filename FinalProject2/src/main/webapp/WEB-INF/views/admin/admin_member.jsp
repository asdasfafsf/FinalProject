<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_member.css">


<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>

        <div id="adminMemberPage">
            <div id="adminMPTitle">MEMBER</div>
            <div id="adminMPOptionleftDiv">
                <select name="adminMPSort1">
                    <option>가입날짜순</option>
                    <option>이름순</option>
                    <option>정지회원</option>
                    <option>탈퇴회원</option>
                </select>
            </div>
            <div id="adminMPOptionRightDiv">
                <select name="adminMPSelectOption">
                    <option>아이디</option>
                    <option>이름</option>
                    <option>주소</option>
                    <option>계좌</option>
                </select>
                <input type="text"/>
                <button>검색</button>
            </div>
            <div id="adminMPBoard">
                    <table id='adminMPTable' >
                            <tr class="adminMPTableHeader">
                                <th style="width:1%"><input type="checkbox"></th> 
                               <th style="width:3%">No</th>
                               <th style="width:15%">Id</th>
                               <th style="width:5%">Name</th>
                               <th style="width:5%">Type</th>
                               <th style="width:15%">Address</th>
                               <th style="width:15%">Account Number</th>
                               <th style="width:6%">EnrollDate</th>
                               <th style="width:3%">Status</th>         
                            </tr>
                            <tr class="adminMPTableContent">
                                <td><input type="checkbox"></td>
                                 <td>1</td>
                                 <td>user1@naver.com</td>
                                 <td>홍길동</td>
                                 <td>회원</td>
                                 <td>경기도 의정부시 오목로 11길</td>
                                 <td>농협 123-15451654-74</td>
                                 <td>2018.02.21</td>
                                 <td>-</td>
                            </tr>
                            <tr class="adminMPTableContent">
                                    <td><input type="checkbox"></td>
                                <td>1</td>
                                 <td>asdf12345@naver.com</td>
                                 <td>홍길동</td>
                                 <td>네이버</td>
                                 <td></td>
         
                                 <td>기업 123-15451654-74</td>
                                 <td>2018.02.21</td>
                                 <td>정지</td>
                            </tr>
                            <tr class="adminMPTableContent">
                                <td><input type="checkbox"></td>
                                 <td>1</td>
                                 <td>user1@naver.com</td>
                                 <td>홍길동</td>
                                 <td>회원</td>
                                 <td>경기도 의정부시 오목로 11길</td>
                                 <td>농협 123-15451654-74</td>
                                 <td>2018.02.21</td>
                                 <td>-</td>
                            </tr>    
                            
                         </table>

            </div>
            <div id="adminMPMemberState">
                <button id="adminMPTableOutBtn">탈퇴</button>
                <button id="adminMPTableSuspendBtn">정지</button>
                <button id="adminMPTableSuspendCancelBtn">정지취소</button>

            </div>
        </div>
            
</body>
</html>