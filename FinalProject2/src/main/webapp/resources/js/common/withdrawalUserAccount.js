/**
 * 
 */


	function selectWithdrawalUser(rewardNo){
		var reward_support_no;
		
		$.ajax({
			url: getContextPath()+'/selectWithdrawalUser',
			type:'post',
			data:{"rewardNo":rewardNo},
			async : false,
			success:function(data){
				for(var i=0;i<data.length;i++){
					console.log(data);
					reward_support_no=data[i].REWARD_SUPPORT_NO;
					$.ajax({
						url: 'https://testapi.open-platform.or.kr/transfer/withdraw',
						type: 'post',
						async : false,
						headers: {
							'Authorization': ('Bearer ' + data[i].ACCESS_TOKEN)
						},
						data: js($.extend({},{"fintech_use_num": data[i].FIN_NO,
						    "dps_print_content": "통장기재내용",
						    "tran_dtime": new Date().format('yyyyMMddHHmmss'),
						    "tran_amt":data[i].USER_AMOUNT_DUE}, {
							// additional parameters
						}))
					})
					.done(function(data2, textStatus, jqXHR){
						if(isGatewayException(data2)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
						console.log(js(data2)+" : "+data2);
						// UI에 결과값 바인딩
						if(data2.rsp_message==""){
							alert(data2.account_holder_name+"님의 "+data2.bank_name+" "+data2.account_num_masked+"에서  "+data2.tran_amt+"원 출금되었습니다.");
							$.ajax({
								url:getContextPath()+'/updateSuccessWithdrawalUser',
								type: 'post',
								async : false,
								data:{'reward_support_no':reward_support_no},
								success:function(){
									
								}
							});
						}else{
							alertBox(
								function(){
									$.ajax({
										url:getContextPath()+'/updateFailWithdrawalUser',
										type: 'post',
										async : false,
										data:{'reward_support_no':reward_support_no},
										success:function(){
											
										}
									});
								},
								"출금 실패하였습니다");
						}
						
						
					});	
					
				}
			}
			
		}).done(function(){
			location.reload();
		});
	}


	