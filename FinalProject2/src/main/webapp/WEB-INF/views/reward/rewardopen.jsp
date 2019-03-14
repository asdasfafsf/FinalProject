<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/reward/RewardOpen.css">
   <script src="${pageContext.request.contextPath }/resources/js/reward/RewardOpen.js"></script>
   <script src="/test/resources/js/common/context.js"></script>
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextPath","${pageContext.request.contextPath}");
</script>
   
   <jsp:include page="/WEB-INF/views/common/util.jsp" flush="true">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>


<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
	<form id="rewardOpenForm" method="post" action="${pageContext.request.contextPath }/project/reward/rewardwrite">
	 <div class="reward-open-container">
        <div class="reward-open-content content-selected">
        <p class="reward-open-title">어떤 프로젝트를 시작할 건가요?</p>
        <p class="reward-open-sub">프로젝트 카테고리를 선택해주세요! 나중에 수정할 수 있습니다.</p>

        <select name="rewardCategory" class="reward-open-category">
            <option value="0">카테고리를 선택해주세요.</option>
                <c:forEach var="item" items="${category }" step="1" varStatus="status">
                    <option value="${item.CATEGORYNO }">${item.CATEGORYNAME }</option>
                </c:forEach>
        </select>
        </div>
   

    <div class="reward-open-content">
            <p class="reward-open-title">진행할 프로젝트를 간단히 소개해주세요!</p>
            <p class="reward-open-sub">펀딩을 통해 무엇을 만들고 싶은지, 목표는 무엇인지 알려주세요</p>

            <textarea name="rewardProjectSynopsis" class='project-synopsis'>

            </textarea>
    </div>
    <div class="reward-open-content">
            <p class="reward-open-title">마지막으로, 몇 가지 세부사항을 확인하세요!</p>
            <p class="reward-open-sub">프로젝트를 진행하기 전, 몇가지 심사기준 항목을 체크하세요!</p>

            <input type="checkbox" id="ck1">
            <label for="ck1"><span>　　</span>펀딩 진행중에는 제공할 리워드를 다른 곳에서 판매하지 않습니다.</label>

            <br>
            <input type="checkbox" id="ck2">
            <label for="ck2"><span>　　</span>제공할 리워드는 현금, 지분 등의 수익이 아닌 제품이나 서비스입니다.</label>
            <br>
            <input type="checkbox" id="ck3">
            <label for="ck3"><span>　　</span>진행할 프로젝트가 지적 재산권을 침해하지 않습니다.</label>
            <br>
            <input type="checkbox" id="ck4">
            <label for="ck4"><span>　　</span>서포터에게 프로젝트 진행 과정을 안내하고 배송 약속을 지킬 수 있습니다.</label>
    
    </div>
    
       <div class="btn-area">
            <button type="button" class="reward-open-btn" onclick="onClickNextBtn()">
               	 다음 단계로
            </button>
        </div>
</div>	
</form>
     

<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>