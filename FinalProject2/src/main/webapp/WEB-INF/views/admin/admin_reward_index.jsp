<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_reward_index.css">


<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>

<div id="adminRewardIndexPage">
            <div class="adminRIPTitle">REWARD INDEX</div>
            <div id="adminRIPOptionDiv">
            	<input type="radio" name="rewardStatus"/>진행중
            	<input type="radio" name="rewardStatus"/>종료
           	</div>
            <div id="adminRIPOptionLeftDiv">
            	<select name="adminRIPSort1">
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
                <select name="adminRIPSort2">
                    <option>최신순</option>
                    <option>마감기한순</option>
                    <option>%순</option>
                </select>
            </div>
            <div id="adminRIPOptionRightDiv">
            	<select name="adminRIPSelectOption">
                    <option>제목</option>
                    <option>아이디</option>
                    <option>리워드번호</option>
                </select>
                <input type="text"/>
                <button>검색</button>
            </div>
            <div id="adminRIPBoard">
                    <table id='adminRIPTable' >
                            <tr class="adminRIPTableHeader">
                               <th style="width:1%"><input type="checkbox"></th> 
                               <th style="width:3%">No</th>
                               <th style="width:3%">Category</th>
                               <th style="width:20%">Title</th>
                               <th style="width:6%">Writer</th>
                               <th style="width:4%">Date</th>
                               <th style="width:4%">Deadline</th>
                               <th style="width:3%">%</th>         
                            </tr>
                            <tr class="adminRIPTableContent">
                                 <td><input type="checkbox"></td>
                                 <td>1512</td>
                                 <td>여행</td>
                                 <td style="text-align: left; padding-left: 10px;"><a href="#">첫번째 리워드.</a></td>
                                 <td>admin</td>
                                 <td>2018.01.12</td>
                                 <td>2018.03.15</td>
                                 <td>15%</td>
                            </tr>
                            <tr class="adminRIPTableContent">
                                <td><input type="checkbox"></td>
                                <td>15155</td>
                                <td>음식</td>
                                <td style="text-align: left; padding-left: 10px;"><a href="#">두번째 리워드.</a></td>
                                <td>qwe1234</td>
                                <td>2018.01.12</td>
                                <td>2018.03.15</td>
                                <td>3%</td>
                            </tr>    
                            
                         </table>

            </div>
            <div id="adminRIPRewardState">
            	<button id="adminRIPTableDeleteBtn">삭제</button>
            </div>
        </div>
            
</body>
</html>