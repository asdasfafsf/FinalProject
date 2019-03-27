/**
 * 
 */


	function selectWithdrawalUser(rewardNo){
		$.ajax({
			url: getContextPath()+'/selectWithdrawalUser',
			type:'post',
			data:{"rewardNo":rewardNo},
			success:function(data){
				for(var i=0;i<data.length;i++){
					console.log(data);
					
					$.ajax({
						url: 'https://testapi.open-platform.or.kr/transfer/withdraw',
						type: 'post',
						headers: {
							'Authorization': ('Bearer ' + "dbac22af-5c27-48ee-8380-28eb8fb6affc")
						},
						data: js($.extend({},{"fintech_use_num": "199003849057724774090734",
						    "dps_print_content": "통장기재내용",
						    "tran_dtime": new Date().format('yyyyMMddHHmmss'),
						    "tran_amt":"1000"}, {
							// additional parameters
						}))
					})
					.done(function(data, textStatus, jqXHR){
						if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
						console.log(js(data)+" : "+data);
						// UI에 결과값 바인딩
						console.log(js(data));
						if(1){
							/*결제성공*/	
						}
						else{
							/*결제실패*/
						}
						
					});	
					
				}
			}
			
		});
	}

	function withdrawalUserAccount(){
	
		
			
		$.ajax({
			url: 'https://testapi.open-platform.or.kr/transfer/withdraw',
			type: 'post',
			headers: {
				'Authorization': ('Bearer ' + '766572db-924e-45fa-9e13-045008bb4961')
			},
			data: js($.extend({},{"fintech_use_num": "199003849057724774052572",
			    "dps_print_content": "통장기재내용",
			    "tran_dtime": new Date().format('yyyyMMddHHmmss'),
			    "tran_amt": "10000"}, {
				// additional parameters
			}))
		})
		.done(function(data, textStatus, jqXHR){
			if(isGatewayException(data)){ return; } // ajax 응답이 Gateway Exception일 경우 이후 처리를 종료한다.		
			console.log(js(data)+" : "+data);
			// UI에 결과값 바인딩
			$('#resultTextArea4').val(js(data));
		});	
	
	}
	