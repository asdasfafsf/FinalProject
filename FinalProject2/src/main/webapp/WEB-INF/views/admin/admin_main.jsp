<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/admin/admin_main.css">


<jsp:include page="/WEB-INF/views/admin/common/admin_header.jsp" flush="false"/>
<div id="adminMainPage">
            <div id="adminMainLeft">
                <div class="adminMPContentDiv">
                    <span class="adminMPTitle">Notice</span>
                    <button class="adminMPContentPlusBtn" onclick="location='${pageContext.request.contextPath }/admin_notice'">+</button>
                    <hr>
                    <div class="adminMPContentList">
                        <ul>
                            <li><p><a href="#">첫번째 공지사항입니다~</a></p></li>
                            <li><p><a href="#">두번째 공지사항입니다~</a></p></li>
                            <li><p><a href="#">세번째 공지사항입니다~</a></p></li>
                            <li><p><a href="#">네번째 공지사항입니다~</a></p></li>
                            <li><p><a href="#">다섯번째 공지사항입니다~</a></p></li>
                        </ul>
                    </div>
                </div>
                <div class="adminMPContentDiv">
                    <span class="adminMPTitle">Reward</span>
                    <button class="adminMPContentPlusBtn">+</button>
                    <hr>
                    <div class="adminMPContentList">
                            <ul>
                                <li><p><a href="#">첫번째 리워드입니다~</a></p></li>
                                <li><p><a href="#">두번째 리워드입니다~</a></p></li>
                                <li><p><a href="#">세번째 리워드입니다~</a></p></li>
                                <li><p><a href="#">네번째 리워드입니다~</a></p></li>
                                <li><p><a href="#">다섯번째 리워드입니다~</a></p></li>
                            </ul>
                        </div>
                </div>
            </div>
            <div id="adminMainRight">
                <!-- <div class="adminMPContentDiv">
                    <span class="adminMPTitle">Member</span>
                    <button class="adminMPContentPlusBtn">+</button>
                    <hr>
                    <div class="adminMPContentList">
                            <ul>
                                <li><p><a href="#">사용자1</a></p></li>
                                <li><p><a href="#">사용자2</a></p></li>
                                <li><p><a href="#">사용자3</a></p></li>
                                <li><p><a href="#">사용자4</a></p></li>
                                <li><p><a href="#">사용자5</a></p></li>
                            </ul>
                        </div>
                </div> -->
                <div class="adminMPContentDiv">
                    <span class="adminMPTitle">Report</span>
                    <button class="adminMPContentPlusBtn" onclick="location='${pageContext.request.contextPath }/admin_report'">+</button>
                    <hr>
                    <div class="adminMPContentList">
                            <ul>
                                <li><p><a href="#">첫번째 신고입니다~</a></p></li>
                                <li><p><a href="#">두번째 신고입니다~</a></p></li>
                                <li><p><a href="#">세번째 공지사항입니다~</a></p></li>
                                <li><p><a href="#">네번째 공지사항입니다~</a></p></li>
                                <li><p><a href="#">다섯번째 공지사항입니다~</a></p></li>
                            </ul>
                        </div>
                </div>
            </div>
        </div>
            
</body>
</html>