<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>API 로컬테스트 페이지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/ext_lib/bootstrap-3.3.6-dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/ext_lib/bootstrap-3.3.6-dist/css/bootstrap-theme.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/jquery/jquery-2.2.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ext_lib/bootstrap-3.3.6-dist/js/modal.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/common/common.css"><!-- 사용자정의 css -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/constants.js"></script><!-- 상수 js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/common/common.js"></script><!-- 사용자정의 js -->
<script>

/**
 * DOM Content Loaded
 */
$(function(){
	
	getAuthResultFromURI();
});


/**
 * callback 페이지 호출시 파라미터 값을 추출하여, 결과값 UI 바인딩을 하는 곳으로 넘긴다.
 */
function getAuthResultFromURI(){
	
	ret = getQueryStringObj(location.href);
	window.opener.bindAuthResults(ret);
	window.opener.authorizeUser();
	
	// 에러 응답이 없을 경우 프로바이더 페이지 닫음 (프로바이더 페이지를 그대로 보고 싶을 경우에는 주석 처리)
	var err = ret.error, errDesc = ret.error_description;
	if(err && isNotEmpty(err)){
		var errMsg = err + (errDesc ? ('\n(' + errDesc + ')') : '');
		showMsg(errMsg, window);
	}else{
		window.close();
	}
}

</script>

<body>
<!-- ===================== bootstrap modal html - start =====================-->
<!-- 본 페이지 (callback.html) 가 index.html 과 별개로 로딩되기 때문에 단순히 메시지출력 (showMsg()) 을 위해서 추가함 -->
<div id="alertModal" class="modal fade" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<p id="alertContents"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div><!--// modal-content -->
	</div><!--// modal-dialog -->
</div><!--// modal -->
<!-- ===================== bootstrap modal html - start =====================-->
</body>
</html>