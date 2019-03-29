var naver_id_login = new naver_id_login("tDmQ7T1QG8MxBJ32rVwy", "http://192.168.20.40:9090/test/mainPage");

// 접근 토큰 값 출력
/*alert(naver_id_login.oauthParams.access_token);*/

// 네이버 사용자 프로필 조회
naver_id_login.get_naver_userprofile("naverSignInCallback()");

// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
function naverSignInCallback() {
	  
	  var email = naver_id_login.getProfileData('email');
	  var nickName = naver_id_login.getProfileData('nickname');
	  var unique = naver_id_login.getProfileData('id');
	  
	  var user = {"email":email, "name":nickName, "unique":unique};

	  loginUser(user);
	  
	  self.close();
}

function loginUser(user){
	$.ajax({
		url : "/test/user/naverlogin",
		data : user,
		type : 'post',
		async : false,
		success : function(data){
			if(data.msg!=null && data.msg!='')
			{
				alertBox(data.msg);
			}
			else if(data.userNo!=null)
			{
				window.opener.location.href='/test/mainPage';
			}
			else
			{
				registUser(user);
			}
		},error : function(){
			alert('로그인 오류! 다시 시도해주세요.');
		}
	});
}

function registUser(user){
	$.ajax({
		url : "/test/user/naver_regist",
		data : user,
		type : 'post',
		async : false,
		success : function(data){
			if(data>0)
			{
				loginUser(user);
			}
			else
			{
				alert('등록 오류! 다시 시도해주세요.');
			}
		},error : function(){
			alert('등록 오류 ! 다시 시도해주세요.');
		}
	});
}
