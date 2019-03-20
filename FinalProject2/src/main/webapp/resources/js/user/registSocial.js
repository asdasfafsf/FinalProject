 //가입 과정 후 결과 알려줄 메시지
var userEditMsg="";
var isEdited=null;
  
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function

  function naverSignInCallback() {
	  var email = naver_id_login.getProfileData('email');
	  var nickName = naver_id_login.getProfileData('nickname');
	  var unique = naver_id_login.getProfileData('id');
	  var age = naver_id_login.getProfileData('age'); //나중에 회원가입 연령 제한할때 필요할 것 같아 놓음.
	  $('#email').val('email');
	  $('#name').val('nickName');
	  $('#unique').val('unique');
	  $('#userType').val(1);
  }

  $( document ).ready(function() {
	  
	  var naver_id_login = new naver_id_login("tDmQ7T1QG8MxBJ32rVwy", "http://localhost:9090/test/main");
	  // 접근 토큰 값 출력
	  /* alert(naver_id_login.oauthParams.access_token); */
	  // 네이버 사용자 프로필 조회
	  naver_id_login.get_naver_userprofile("naverSignInCallback()");
	  
	  var param_email={"email":$('#email').val().trim()};
	  var param_user={"email":$('#email').val(),"pw":$('#pw').val(),"name":$('#name').val(),"userType":$('#userType').val()};
	  
	  checkEmail();
	  
	  userEditMsg = document.getElementById("userEditMsg").value;
	  isEdited = document.getElementById("isEdited").value;

	  window.close();
});

  
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
				data:param,
				type:"post",
				dataType:'text',
				success:function(data){
					if(data!=null)
					{
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
