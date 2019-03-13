var naverLogin=new naver.LoginWithNaverId(
				{
					clientId:'tDmQ7T1QG8MxBJ32rVwy',
					callbackUrl:'http://test/',
					isPopup:false,
					loginButton:{color:'green', type:3, height:60}
				});
		naverLogin.init();
		window.addEventListener('load',function(){
			naverLogin.getLoginStatus(function(status){
				if(status){
					setLoginStatus();
				}
			});
		});
		
		function setLoginStatus(){
			var nickName=naverLogin.user.getNickName();
		}