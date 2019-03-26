/**
 * 
 */


function isValidatePunding() {
	var length = $('.reward-payment-item').length;
	
	return length != 0;
}

function isValidateAddress() {
	
	
}

function isValidateAddrName() {
	return $('[name=deliveryUserName]').val().trim().length != 0;
}

function isValidateAddrPhone() {
	var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	
	return regExp.test($('[name=deliveryUserPhone]').val());
}

function isValidateAddrSearch() {
	
	return $('[name=addressZipNo]').val().length != 0;
}

function isValidateAddressDetail() {
	return $('[name=deliveryAddressDetail]').val().trim().length != 0;
}

function isValidateAccount() {
	return $('#fintech_use_num').val().length != 0;
}


function showValidateMessage() {
	if (!isValidatePunding()) {
		alertBox(function(){},'최소 한 개 이상의 리워드를 선택해주세요.','알림','확인');
		return false;
	} else if (!isValidateAddrName()){
		alertBox(function(){},'수령인을 입력하세요','알림','확인');
		return false;
	} else if (!isValidateAddrPhone()) {
		alertBox(function(){},'연락처를 확인해주세요.','알림','확인');
		return false;
	} else if (!isValidateAddrSearch()) {
		alertBox(function(){},'주소를 설정해주세요.','알림','확인');
		return false;
	} else if (!isValidateAddressDetail()) {
		alertBox(function(){},'상세 주소를 설정해주세요.','알림','확인');
		return false;
	} else if (!isValidateAccount()) {
		alertBox(function(){},'지불 계좌 정보를 설정해주세요.','알림','확인');
		return false;
	}
	
	return true;
	
}


