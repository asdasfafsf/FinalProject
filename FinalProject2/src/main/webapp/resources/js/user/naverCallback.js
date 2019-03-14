var naver_id_login = new naver_id_login("tDmQ7T1QG8MxBJ32rVwy", "http://localhost:9090/3333333/naverCallback");
  // 접근 토큰 값 출력
	  /* alert(naver_id_login.oauthParams.access_token); */
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
   /*  alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('id')); */
    $('#email2',opener.document).val(naver_id_login.getProfileData('email'));
    $('#id2',opener.document).val(naver_id_login.getProfileData('id'));
    $('#nickname2',opener.document).val(naver_id_login.getProfileData('nickname'));
    
    window.close();
  }