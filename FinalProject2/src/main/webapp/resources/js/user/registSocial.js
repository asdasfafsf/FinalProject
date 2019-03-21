var naver_id_login = new naver_id_login("tDmQ7T1QG8MxBJ32rVwy", "http://localhost:9090/test/main");

// 접근 토큰 값 출력
/* alert(naver_id_login.oauthParams.access_token); */

var param_email;
var param_user;

//가입 과정 후 결과 알려줄 메시지
var userEditMsg="";
var isEdited=null;

// 네이버 사용자 프로필 조회
naver_id_login.get_naver_userprofile("naverSignInCallback()");

  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function

  function naverSignInCallback() {
	  
	  var email = naver_id_login.getProfileData('email');
	  var nickName = naver_id_login.getProfileData('nickname');
	  var unique = naver_id_login.getProfileData('id');
	  var age = naver_id_login.getProfileData('age'); //나중에 회원가입 연령 제한할때 필요할 것 같아 놓음.
	  
	  $('#email').val(email);
	  $('#name').val(nickName);
	  $('#unique').val(unique);
	  $('#userType').val(2);
	  
	  param_email={"email":email};
	  param_user={"email": email,"pw":unique,"name":nickName,"userType":2};
	  
	  alert('여기 됨'+email+nickName+unique);
	  alert(param_user.email+param_user.name); //<-object, object로 나옴, 하나씩 접근하면 또 되네.
	  
	  checkEmail();
	  
	  $('#userEditMsg',opener.document).val(userEditMsg);
	  $('#isEdited',opener.document).val(isEdited);
	  
	  self.close();
  }

  
  //이메일 중복 확인
  var checkEmail = function(){
	  
	  $.ajax({
			url:"/test/regist/checkEmail",
			data:param_email,
			type:"get",
			dataType:'json',
			success:function(data){
				if(data.check==0)
				{
					alert('이메일 중복 체크중');
					enrollNaverUser();
				}
				else
				{
					userEditMsg="이미 가입된 이메일입니다. 로그인이나 비밀번호 찾기를 이용해 주세요.";
				}
			}
	  });
  }
  
//화원가입
  var enrollNaverUser = function(){
	  $.ajax({
				url:"/test/registUser",
				data:param_user,
				type:"post",
				dataType:'text',
				success:function(data){
					if(data!=null)
					{
						alert('회원가입중');
						userEditMsg="펀딩스토리 회원이 되신 것을 환영합니다. 로그인해주세요.";
						isEdited = 1;
					}
					else
					{
						userEditMsg="회원가입에 실패하였습니다.";
					}
				}
			});
  }
