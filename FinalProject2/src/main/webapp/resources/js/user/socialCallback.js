var naver_id_login = new naver_id_login("tDmQ7T1QG8MxBJ32rVwy", "http://localhost:9090/test/main");

// 접근 토큰 값 출력
alert(naver_id_login.oauthParams.access_token);

// 네이버 사용자 프로필 조회
naver_id_login.get_naver_userprofile("naverSignInCallback()");

// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
function naverSignInCallback() {
	  
	  var email = naver_id_login.getProfileData('email');
	  var nickName = naver_id_login.getProfileData('nickname');
	  var unique = naver_id_login.getProfileData('id');
	  
	  alert(email+nickName+unique);
	  
	  
	  
	  self.close();
}

