/**
 * 
 */


function checkLoginAjax(okCallback, failCallback) {
	$.ajax({
		url:getContextPath() + '/user/loginCheckAjax',
		type:'post',
		success:function(data){
			console.log(data);
			
			if(data == 'true' || data) {
				if (typeof okCallback == 'function') {
				okCallback();
				}
			} else {
				console.log('안녕?');
				
				if (typeof failCallback == 'function'){
					failCallback();
				}
			}
		}, error:function(error){
			console.log(error);
		}
	});
	
}