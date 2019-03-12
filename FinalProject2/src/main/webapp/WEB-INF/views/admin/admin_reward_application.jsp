<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_reward_application.css">


<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>

<div id="adminRewardApplicationPage">
            <div class="adminRAPTitle">REWARD APPLICATION</div>
            <div id="adminRAPOptionDiv">
            	<input type="radio" name="rewardApplicationStatus"/>처리중
            	<input type="radio" name="rewardApplicationStatus"/>오픈예정
            	<input type="radio" name="rewardApplicationStatus"/>오픈불가
            </div>
            <div id="adminRAPOptionLeftDiv">
            	<select name="adminRAPSort1">
                    <option>전체</option>
                    <option>테크·가전</option>
                    <option>패션·잡화</option>
                    <option>뷰티</option>
                    <option>푸드</option>
                    <option>홈리빙</option>
                    <option>디자인소품</option>
                    <option>여행·레저</option>
                    <option>스포츠·모빌리티</option>
                    <option>반려동물</option>
                    <option>공연·컬쳐</option>
                    <option>소셜·캠페인</option>
                    <option>교육·키즈</option>
                    <option>게임·취미</option>
                    <option>출판</option>
                </select>
                <select name="adminRAPSort2">
                    <option>최신순</option>
                    <option>오픈예정</option>
                    <option>불합격</option>
                </select>
            </div>
            <div id="adminRAPOptionRightDiv">
            	<select name="adminRAPSelectOption">
                    <option>제목</option>
                    <option>아이디</option>
                    <option>리워드번호</option>
                </select>
                <input type="text"/>
                <button>검색</button>
            </div>
            <div id="adminRAPBoard">
                    <table id='adminRAPTable' >
                            <tr class="adminRAPTableHeader">
                               <th style="width:1%"><input type="checkbox"></th> 
                               <th style="width:3%">No</th>
                               <th style="width:3%">Category</th>
                               <th style="width:20%">Title</th>
                               <th style="width:6%">Writer</th>
                               <th style="width:4%">Date</th>
                               <th style="width:5%">Status</th>         
                            </tr>
                            <tr class="adminRAPTableContent">
                                 <td><input type="checkbox"></td>
                                 <td>1512</td>
                                 <td>여행</td>
                                 <td style="text-align: left; padding-left: 10px;"><a href="#">첫번째 리워드.</a></td>
                                 <td>admin</td>
                                 <td>2018.01.12</td>
                                 <td>오픈예정</td>
                            </tr>
                            <tr class="adminRAPTableContent">
                                <td><input type="checkbox"></td>
                                <td>15155</td>
                                <td>음식</td>
                                <td style="text-align: left; padding-left: 10px;"><a href="#">두번째 리워드.</a></td>
                                <td>qwe1234</td>
                                <td>2018.01.12</td>
                                <td>-</td>
                            </tr>    
                            
                         </table>

            </div>
            <div id="adminRAPRewardState">
            	<button id="adminRAPTableDeleteBtn">삭제</button>
            </div>
        </div>
            
</body>
</html>