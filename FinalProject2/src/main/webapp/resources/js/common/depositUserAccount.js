/**
 * 
 */


function depositUserAccount(targ,rewardNo){
	
	$.ajax({
		url: getContextPath()+'/selectDepositUser',
		type:'post',
		data:{"rewardNo":rewardNo},
		success:function(data){
			console.log(data);
			
			$(targ).siblings('table').children('tbody').children('tr').children().first().children().val(data[0].FIN_NO);
			
			$.ajax({
				url: 'https://testapi.open-platform.or.kr/oauth/2.0/token',
				type: 'post',
				contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				data: {
					'client_id': 'l7xx6d3f293ff0434fe688e43049b3b0b0a8',
					'client_secret': 'cde4c721f31040f4a98e7f44ca4613d7',
					'grant_type': 'client_credentials',
					'scope': 'oob'
				}
			})
			.done(function(data, textStatus, jqXHR){
				if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
				
				
				
				//입금처리 
				$.ajax({
					url: 'https://testapi.open-platform.or.kr/transfer/deposit',
					type: 'post',
					headers: {
						'Authorization': ('Bearer ' + data.access_token)
					},
					data: js($.extend({}, {"wd_pass_phrase":"NONE","wd_print_content":"출금인자 01","name_check_option":"on","tran_dtime":new Date().format('yyyyMMddHHmmss'),"req_cnt":getJsonArrayFromTable($(targ).siblings('table')).length}, {
						req_list: getJsonArrayFromTable($(targ).siblings('table'))
					}))
				})
				.done(function(data, textStatus, jqXHR){
					if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
					
					// UI에 결과값 바인딩
					console.log(js(data));
					if(data.rsp_message==""){
						alertBox("",data.res_list[0].account_holder_name+"님의 "+data.res_list[0].bank_name+" "+data.res_list[0].account_num_masked+"로 "+data.res_list[0].print_content+" "+data.res_list[0].tran_amt+"원 입금되었습니다.");
					}else{
						alertBox("","입금 실패하였습니다");
					}
				});
			
			});
		}
	});
	

	
}