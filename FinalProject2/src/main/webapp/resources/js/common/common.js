
//=========================== 비기능 공통 함수 - start ============================
/**
 * 디버그 콘솔 찍기
 */
function dc(msg){
	
	if(console && console.log){
		console.log(msg);
	}
}

/**
 * stringify() wrapper
 * 
 * @param src
 */
function js(src){
	
	return JSON.stringify(src, null, 4); // 4 space formatting included
}

/**
 * 빈 값이면 true를 리턴한다.
 * 
 * @param src
 * @returns {Boolean}
 */
function isEmpty(src){
	
	if(! src){
		return true; 
	}else{
		if(src instanceof String){
			if($.trim(src).length == 0){ return true; } 
		}
	}
	return false;
}
	
/**
 * 빈 값이 아니면 true를 리턴한다.
 * 
 * @param src
 * @returns
 */
function isNotEmpty(src){
	
	return ! isEmpty(src);
}

/**
 * 해당 id를 갖는 html element의 값이 없을 경우 true를 리턴한다.
 * 
 * @param elemId
 * @returns {Boolean}
 */
function isEmptyElem(elemId){
	
	if(isEmpty($('#'+elemId).val())){
		return true;
	}
	return false;
}

/**
 * localStorage 기록
 * 
 * @param key
 * @param val
 */
function setLs(key, val){
	
	appendLsIfAbsent('LS_KEYS', key, '|');
	localStorage.setItem(key, val);
}

/**
 * localStorage 조회
 * 
 * @param key
 * @returns
 */
function getLs(key){
	return localStorage.getItem(key);
}

/**
 * localStorage 요소 삭제
 * 
 * @param o
 */
function removeLs(o){

	if(o instanceof Array){
		for(var i=0; i<o.length; i++){
			localStorage.removeItem(o[i]);
		}
	}else{
		localStorage.removeItem(o);
	}
}

/**
 * itemName을 키로 하는 localStorage 값에 key가 존재하지 않으면 sep를 구분자로 하여 append 한다.
 * 
 * @param itemName key목록을 저장하고자 하는 localStorage 의 키값
 * @param key 관리대상이 되는 localStorage의 키값
 * @param sep localStroage 값은 배열을 관리할 수 없으므로 string join시 사용하는 구분자
 */
function appendLsIfAbsent(itemName, key, sep) {
	
	var lsKeys = localStorage.getItem(itemName);
	dc('## lsKeys before:[' + lsKeys + ']');
	if(isNotEmpty(lsKeys)){
		var lsKeyArr = lsKeys.split(sep);
		if($.inArray(key, lsKeyArr) < 0){
			lsKeyArr.push(key);
			lsKeys = lsKeyArr.join(sep);
		}
	}else{
		lsKeys = key;
	}
	localStorage.setItem(itemName, lsKeys);
	dc('## lsKeys after:[' + lsKeys + ']');
}

/**
 * 서버환경 설정
 * 
 * @returns
 */
function getEnv(){
	
	var win = parent ? parent : self; // index.html 의 location.href 를 참조하기 위해서
	var env = getQueryStringObj(win.location.href)['env'];
	env = env ? env : defaultEnv; // query string 에 env가 없을 경우 기본값 사용
//	dc('## env: '+env);
	return env;
}

/**
 * pageId 획득
 * 
 * @returns
 */
function getPageId(){
	
	var url = location.href;
	var page = url.substring(url.lastIndexOf('/')+1);
	var pageId = page.substring(0, page.indexOf('.html'));
	return pageId;
}

//============================ 비기능 공통 함수 - end ============================


//======================= jQuery ajax global settings - start =======================
$.ajaxSetup({
	contentType: 'application/json; charset=UTF-8',
	dataType: 'json',
	processData: true
});

$(document)
.ajaxSend(function(event, jqXHR, ajaxOptions){
	/*dc('## ajaxSend() > ajaxOptions: ' + js(ajaxOptions));*/
	
	var saveKey = getEnv() + '_' + getPageId();
	var savedData = JSON.parse(getLs(saveKey));
	var frmDataObj = savedData ? savedData : {};
	
	/*dc('## frmDataObj 1: '+js(frmDataObj));*/
	
	var $frmElems = $('input, select');
	$frmElems.each(function(i){
		var elem = this; $elem = $(elem);
		frmDataObj[elem.id] = $elem.val();
	});
	
	/*dc('## frmDataObj 2: '+js(frmDataObj));*/
	
	setLs(saveKey, js(frmDataObj));
	
})
.ajaxSuccess(function(event, jqXHR, ajaxOptions, data){
//	dc('## event: '+js(event));
//	dc('## jqXHR: '+js(jqXHR));
//	dc('## ajaxOptions: '+js(ajaxOptions));
	dc('## ajaxSuccess() > data: '+js(data));
})
.ajaxError(function(event, jqXHR, ajaxOptions, thrownError){
//	dc('## event: '+js(event));
//	dc('## jqXHR: '+js(jqXHR));
//	dc('## ajaxOptions: '+js(ajaxOptions));
	dc('## thrownError: '+js(thrownError));
})
.ajaxComplete(function(event, jqXHR, ajaxOptions){
//	dc('## event: '+js(event));
//	dc('## jqXHR: '+js(jqXHR));
//	dc('## ajaxOptions: '+js(ajaxOptions));
});
//======================= jQuery ajax global settings - end ========================


//======================== bootstrap modal settings - start =======================
/**
 * 화면에 메시지 알림을 띄운다.
 * 
 * @param msg
 */
function showMsg(msg){
	
	var $alert = (parent) ? $('#alertModal', parent.document) : $('#alertModal');
	dc('## msg: '+msg);
	
	var addMsg; // <pre/> 태그에 표시되는 메시지 외에 별도의 추가 설명을 아래쪽에 하고 싶을 때 사용
	var delim = '___';
	var delimIdx = msg.indexOf(delim);
	if(delimIdx >= 0){
		addMsg = msg.substring(delimIdx + 3);
		msg = msg.substring(0, delimIdx);
		dc('## addMsg: '+addMsg);
	}
	
	// msg json format이 html 에도 적용되도록 형태 보존
	msg = '<pre class="alertPre">' + msg + '</pre>';
	
	if(isNotEmpty(addMsg)){
		msg += '<p>' + addMsg + '</p>';
	}
	
	$('#alertContents', $alert).html(msg); // 메시지 바인딩
	
	$alert.modal({
		backdrop: false // 배경 제외
	});
}
//======================== bootstrap modal settings - end ========================


/**
 * constants.js 에서 해당서버환경/API 의 옵션값 객체를 획득하여 리턴한다.
 */
function getDefaultApiOpts(){
	
	return apis[$('#pageTitle').prop('title')].defFrmVal[getEnv()];
}

/**
 * obj 에서 elemId 에 해당하는 요소를 찾아, 페이지의 elemId 엘리먼트 value로 바인딩한다.
 * 
 * @param elemId
 * @param obj
 */
function setElemVal(elemId, obj){
	
	var val = obj[elemId];
	val = decodeURIComponent(val);
	$('#'+elemId).val(val);
}

/**
 * 필드 기본값 채우기 
 */
function setDefaultFieldVal(){
	
	var sfo = getSavedFormObj();
	var dfo = getDefaultApiOpts();
	dc('## sfo: '+js(sfo));
	
	var $inputs = $('input, select');
	$inputs.each(function(i){
		var el = this, $el = $(el), id = el.id, val;
		var savedVal = sfo[id], defVal = dfo[id];
		dc('## id:['+id+'], savedVal:['+savedVal+'], defVal:['+defVal+']');
		
		// (1)  localStorage에 저장된 값이 있으면 그 값을 UI에 바인딩
		// (2) (1)이 존재하지 않을 경우 constants.js 에 저장된 값을 UI에 바인딩
		val = savedVal ? savedVal : defVal;
		
		// (3) 그래도 존재하지 않을 경우 continue
		if(! val){ return true; }
		
		// 엘리먼트에 값 바인딩 (URL디코딩후)
		$('#'+id).val(decodeURIComponent(val));
	});
	
}

/**
 * localStorage에 저장된 폼 데이터를 객체화하여 리턴한다.
 */
function getSavedFormObj(){
	
	var saveKey = getEnv() + '_' + getPageId();
	var savedFrmObjs = getLs(saveKey);
	return savedFrmObjs ? JSON.parse(savedFrmObjs) : {};
}

/**
 * 현재 호출 서버의 base url 리턴
 * 
 * @returns
 */
function getSvrProps(propName){
	
	return svrOpts[getEnv()][propName];
}

/**
 * 현재 호출 서버의 환경정보에서 값을 찾아 폼 데이터에 바인딩한다.
 * 	
 * @param fieldName
 */
function setDefaultValSvr(fieldName){
	
	$('#'+fieldName).val(getSvrProps(fieldName));	
}

/**
 * 레퍼러에서 페이지명만 추출하여 리턴한다. 
 */
function getReferrerPageName(){
	
	var referrer = document.referrer;
	var refererrerPageNm = referrer.substring(referrer.indexOf('/html/')+6);
	return refererrerPageNm.substring(0, refererrerPageNm.indexOf('.html')); // 최초 호출 페이지명 - ex) 'authorize'
}

/**
 * ajax 응답이 Gateway 에러일 경우 메시지창을 출력하고 false를 리턴한다.
 * 
 * @param data
 * @returns {Boolean}
 */
function isGatewayException(data){
	
	if(data 
		&& data.rsp_code 
		&& data.rsp_code.indexOf('A') !== 0 // API업무처리 응답코드를 제외한 응답코드
	){

		var delim = '___';
		var addMsg = delim;
		
		// 오류코드 추출 (메인)
		var rsp_code = data.rsp_code;
//		dc('## rsp_code: '+rsp_code);
		
		var rsp_code_desc = gwRspCode[rsp_code] ? gwRspCode[rsp_code].rsn : '';
		dc('## rsp_code_desc: '+rsp_code_desc);
		addMsg += '<p>' + rsp_code_desc + '</p>';

		// 오류코드 추출 (세부)
		var rsp_message = data.rsp_message;
//		dc('## rsp_message: '+rsp_message);
		
		var rsp_dtl_code, rsp_dtl_code_desc;
		var cdStaIdx = rsp_message.indexOf('(['); 
		var cdEndIdx = rsp_message.indexOf('])'); 
		if(cdStaIdx >= 0){
			rsp_dtl_code = rsp_message.substring(cdStaIdx + 2, cdEndIdx);
			rsp_dtl_code_desc = gwRspDtlCode[rsp_dtl_code] ? gwRspDtlCode[rsp_dtl_code].rsn : '';
			addMsg += '<p>&nbsp;&nbsp;-&nbsp;' + rsp_dtl_code_desc + '</p>';
//			dc('## rsp_dtl_code: '+rsp_dtl_code);
			dc('## rsp_dtl_code_desc: '+rsp_dtl_code_desc);
		}
		
		showMsg(js(data) + ((addMsg == delim) ? '' : addMsg));
		
		return true;
	}
	return false;
}


/**
 * url 에서 query string 을 추출하여 plain object 로 만들어 리턴한다.
 * 
 * @param url
 * @returns
 */
function getQueryStringObj(url){
	
	var queryString = decURI(url.substring(url.indexOf('?')+1)); // URI 디코딩 추가
	var subArr = queryString.split('&');
	var keyValArr;
	var ret = {};
	for(var i=0; i<subArr.length; i++){
		keyValArr = subArr[i].split('=');
		//dc('## ' + JSON.stringify(keyValArr));
		ret[keyValArr[0]] = keyValArr[1];
	}	
	
	return ret;
}

/**
 * decodeURIComponent() 이후 '+' 기호가 남는 문제 보완
 * 
 * @param enc
 */
function decURI(enc){
	
	return decodeURIComponent(enc).replace(/\+/g, ' ');
}

/**
 * 폼 엘리먼트의 정보를 수집하여 파라미터 객체를 만든다.
 * 
 * @param frmId
 * @returns object
 */
function getFormParamObj(frmId){

	var ret = {}, $frm = $('#'+frmId);
	$.each($frm.serializeArray(), function(_, kv){
		if(ret.hasOwnProperty(kv.name)){
			ret[kv.name] = $.makeArray(ret[kv.name]);
			ret[kv.name].push(kv.value);
		}else{
			ret[kv.name] = kv.value;
		}
	});

	// 사용자 인증 계열의 API 호출시 전송되지 말아야 할 항목(ex: client_secret)이 전송되는 것을 방지한다.
	if($frm.hasClass('auth-form')){
		if(ret.hasOwnProperty('client_secret')){ delete ret['client_secret']; }
	}
	
	return ret;
}

/**
 * 해당 id를 갖는 입력폼 엘리먼트의 내용을 클립보드에 복사한다.
 * 
 * @param elemId
 */
function copyClip(elemId){
	
	/*
	 * 윈도우 클립보드에 직접 access 하는 방법
	 * 		- 전역적으로 사용할 수 있으나, chrome 등의 브라우저에서는 보안상의 이유로 javascript paste 등을 금지하고 있다.
	 */
	$('#'+elemId)[0].select();
	try{
		var ret = document.execCommand('copy');
		var msg = ret ? '성공' : '실패';
		dc('클립보드 copy ' + msg);
	}catch(e){
		dc('클립보드 copy 실패');
	}
	
	/*
	 * localStorage에 복사하는 방법
	 * 		- 다른 프로그램에 붙여넣을 수 없다는 단점이 있다.
	 */
/*	var $elem = $('#'+elemId);
	var txt = $elem.val(); 
	setLs('clipboardAlternative', txt);*/
}

/**
 * 해당 id를 갖는 입력폼 엘리먼트의 내용을 클립보드에 복사한다.
 * 
 * @param elemId
 */
//function pasteClip(elemId){
	
	/*
	 * localStorage에서 가져오는 방법
	 * 		- 다른 프로그램에 붙여넣을 수 없다는 단점이 있다.
	 */
//	var txt = getLs('clipboardAlternative');
//	var $elem = $('#'+elemId);
//	$elem.val(txt).select();	
//}

/**
 * 하위 input 엘리먼트 click시 select() 함수를 바인딩한다.
 * 
 * @param pId 부모 엘리먼트의 css selector
 * @param tag select() 처리할 태그
 */
function bindAllChildrenSelect(selector, tag){

	$(selector).on('click', tag, function(e){
		$(e.target).select();
	});
}

/**
 * 이전 요청에 의해 저장된 파라미터를 기반으로 행 추가를 수행한다. (다건 요청 API의 UI 구성시 사용)
 */
function addRowsBySavedData($jo){

	var sfo = getSavedFormObj();
	var savedReqCnt = sfo.req_cnt ? sfo.req_cnt : 1;
	for(var i=0; i<savedReqCnt-1; i++){ addRow($jo); }
}

/**
 * 입력폼 행 추가
 */
function addRow($jo){
	
	var $table = $jo, $tbody = $('tbody', $table), $trs = $('tr', $tbody);
	var $lastTr = $trs.last(); // 마지막 row
	var $newTr = $lastTr.clone(true); // 복제
	var newTrIdx = $trs.size();
	$('input,select', $newTr).each(function(i){
		var input = this, $input = $(input);
		input.id = input.id.substring(0, input.id.lastIndexOf('_')+1) + newTrIdx; // 인덱스에 맞게 id 변경
		input.name = input.name.substring(0, input.name.lastIndexOf('_')+1) + newTrIdx; // 인덱스에 맞게 name 변경
		$input.val(''); //clone한 row의 데이터 삭제 
	}); 
	$('button', $newTr).remove(); // 버튼 삭제
	var $btn = $('button', $newTr);
	var $spanBtn = $('span.glyphicon', $btn);
	$spanBtn.removeClass('glyphicon-plus').addClass('glyphicon-minus'); // 버튼 아이콘 변경
	$btn.on('click', function(e){ delRow(e); }); // 버튼 이벤트핸들러 바인딩
	$tbody.append($newTr);
}

/**
 * 입력폼 행 삭제
 */
function delRow($jo){
	
	var $trs = $('tbody tr', $jo);
	var $rmTr = $trs.last();
	var rmIdx = $trs.size()-1;
	$rmTr.remove(); // 마지막 row 삭제

	// localStorage 에서 요청값 저장 데이터 삭제
	var sfo = getSavedFormObj();
	$('input', $rmTr).each(function(i){
		var input = this, iid = input.id;
		if(sfo.hasOwnProperty(iid)){ delete sfo[iid]; }
	});
	if(sfo.hasOwnProperty('req_cnt')){
		sfo.req_cnt = $trs.size() -1; 
	}
	var saveKey = getEnv() + '_' + getPageId();
	setLs(saveKey, js(sfo));
}

/**
 * access_token 획득 ('grant_type': 'authorization_code')
 */
function getTokenByAuthCode(){

	if(isEmptyElem('code')){
		showMsg('Authorization Code 를 먼저 획득해 주십시오.');
		return;
	}	
	
	$.ajax({
		url: getSvrProps('base_api_uri') + '/oauth/2.0/token',
		type: 'post',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data: {
			'code': $('#code').val(), // auth code 필요
			'client_id': $('#client_id').val(),
			'client_secret': $('#client_secret').val(),
			'redirect_uri': $('#redirect_uri').val(),
			'grant_type': 'authorization_code'
		}
	})
	.done(function(data, textStatus, jqXHR){
		if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
		
		// UI에 결과값 바인딩
		$('#token').val(data.access_token);
		$('#refresh_token').val(data.refresh_token);
		$('#user_seq_no').val(data.user_seq_no);
	});
}

/**
 * access_token 획득 ('grant_type': 'client_credentials')
 */
function getTokenByClientCredentials(){

	$.ajax({
		url: getSvrProps('base_api_uri') + '/oauth/2.0/token',
		type: 'post',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data: {
			'client_id': $('#client_id').val(),
			'client_secret': $('#client_secret').val(),
			'grant_type': 'client_credentials',
			'scope': 'oob'
		}
	})
	.done(function(data, textStatus, jqXHR){
		if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
		
		// UI에 결과값 바인딩
		$('#token').val(data.access_token);
	});
}

/**
 * access_token 획득 ('grant_type': 'refresh_token')
 */
function getTokenByRT(){

	$.ajax({
		url: getSvrProps('base_api_uri') + '/oauth/2.0/token',
		type: 'post',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data: {
			'client_id': $('#client_id').val(),
			'client_secret': $('#client_secret').val(),
			'refresh_token': $('#refresh_token').val(), // refresh token 필요
			'scope': $('#scope').val(),
			'grant_type': 'refresh_token'
		}
	})
	.done(function(data, textStatus, jqXHR){
		if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
		
		// UI에 결과값 바인딩
		$('#token').val(data.access_token);
		$('#refresh_token').val(data.refresh_token);
		$('#user_seq_no').val(data.user_seq_no);
	});
}

/**
 * 사용자정보조회 / 등록계좌조회
 */
function getUserInfo(e){
	
	if(isEmptyElem('token')){
		showMsg('Access Token 을 먼저 획득해 주십시오.');
		return;
	}
	
	var uri = getSvrProps('base_api_uri');
	var option = {};
	switch(e.target.id){
	case 'btnUserMe': uri += '/v1.0/user/me'; 
		break;
	case 'btnAccountList': uri += '/v1.0/account/list';
		option = {
			'include_cancel_yn': $('#include_cancel_yn').val(),	
			'sort_order': $('#sort_order').val()	
		} 
		break;
	}
	$.ajax({
		url: uri,
		type: 'get',
		headers: {
			'Authorization': ('Bearer ' + $('#token').val())
		},
		
		data: $.extend(true, {
			'user_seq_no': $('#user_seq_no').val(),
			'tran_dtime': new Date().format('yyyyMMddHHmmss')
		}, option)
		
	})
	.done(function(data, textStatus, jqXHR){
		if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.
		
		$('#resultTextArea').val(js(data));
	});		
}

/**
 * 입력폼으로 구성된 테이블에서 데이터를 취합하여 json array 를 생성한 후 리턴한다.
 */
function getJsonArrayFromTable($table){
	
	var $tbody = $('tbody', $table), $trs = $('tr', $tbody), reqList = [];
	$trs.each(function(i){
		var tr = this, $tr = $(tr), $inputs = $('input,select', $tr), row = {tran_no: (i+1)};
		$inputs.each(function(k){
			var input = this, $input = $(input), iid = input.id;
			if($input.attr('disabled') == 'disabled'){ return true; } //continue
			var colNm = iid.substring(0, iid.lastIndexOf('_'));
			row[colNm] = $input.val();
		});
		reqList.push(row);
	});
	return reqList;
}

/**
 * API 호출 결과를 출력하는 textarea를 화면 구성에 맞추어 resize 한다.
 */
function resizeResultTextArea(correction){

	var resultTextAreaHeight = Number($('.childWrap').height()) - Number($('#btnResultClear').position().top) - Number(correction);
	dc('## resultTextAreaHeight: '+resultTextAreaHeight);
	$('#resultTextArea').height(resultTextAreaHeight);
}

/**
 * 해당 입력폼에 숫자만 입력 가능하도록 keypress 이벤트 바인딩
 */
function bindValidateNumOnly($o){

	$o.on('keypress', function(e){
		var ret = ((e.charCode >= 48) && (e.charCode <= 57));
		if(! ret){	 showMsg('숫자만 입력하실 수 있습니다.'); }
		return ret;
	});	
}


/**
 * form submit 의 변종 함수
 * 		
 * 		- 해당 form 내의 특정 input element 들을 제외하고 form submit 을 수행한다.
 * 		- 사용자 인증 계열의 API 호출시, 같은 form 내에 있는 client_secret 등이 전송되는 것을 방지할 목적으로 추가한 함수.
 * 
 * @param frmObj
 * @param excludeInputIds 해당 form 내에 있는 input 엘리먼트 중, 값을 전송하지 않을 엘리먼트 id들의 배열
 */
function formSubmitWithExcludeInputs(frmObj, excludeInputIds){

	var ids = excludeInputIds;
	for(var i=0; i<ids.length; i++){
		$('#' + ids[i]).prop('disabled', true);
	}
	
	frmObj.submit();
	
	for(var i=0; i<ids.length; i++){
		id = ids[i];
		$('#' + ids[i]).prop('disabled', false);
	}	
}
