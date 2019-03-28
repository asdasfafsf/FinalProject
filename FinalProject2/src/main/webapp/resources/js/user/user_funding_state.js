$(function(){
	$('#support').click(function(){
		location.href='/test/myreward/list/support';
	});
	$('#made').click(function(){
		location.href='/test/myreward/list/made';
	});
	$('#funding-made-filter').change(function(){
		$('#funding-made-filter').attr('action','/test/myreward/list/made');
		$('#funding-made-filter').submit();
	});
	$('#funding-detail').hide();
	$('#reset').click(function(e){
		e.preventDefault();
		reset();
	});
});

function clickReward(targ){
	location.href="/test/project/reward/"+$(targ).attr("id");
}
function clickReward2(num){
	location.href="/test/project/reward/"+num;
}
function showReward(targ){
	location.href="/test/project/reward/preview/"+$(targ).attr("id");
}
function editReward(targ){
	location.href="/test/project/reward/update/"+$(targ).attr("id");
}

var global_reward_no = null;
var global_reward_support_no = null;

function reset(){
	$.ajax({
		url:'/test/myreward/list/support/delete/'+global_reward_support_no,
		type:'post',
		success : function(data){
			alertBox(function(){location.href='/test/myreward/list/support'},"후원이 취소되었습니다.");
		}
	});
}

function checkDetail(targ){
	var no = $(targ).attr("id");
	$('#detail_support').html('');
	$('#funding-detail').show();
	$.ajax({
		url : '/test/myreward/list/support/detail/'+no,
		type :'post',
		success : function(data){
			$('#detail_photo').attr("src",$(targ).children('.reward-photo').attr("src"));
			$('#detail_title').text($(targ).children('.reward-name').text());
			$('#detail_state').text($(targ).children('.reward-state').text());
			$('#detail_deadline').text($(targ).children('.reward-end').text());
			$('#detail_mc_name').text($(targ).children('.reward-mc').text());
			
			var support = "";
			global_reward_no = $(targ).children('.rewardNo').attr("id");
			global_reward_support_no = no;
			
			$('#detail_title').attr('onclick','clickReward2("'+global_reward_no+'");');
			$('#detail_photo').attr('onclick','clickReward2("'+global_reward_no+'");');
			
			$.each(data,function(i){
					support+="<div class='detail_support_list' style='border : 1px solid rgba(0,0,0,0.4); margin : 3px; padding : 5px;'>";
				if(data[i].REWARD_ITEM_NAME !=null && data[i].REWARD_ITEM_NAME != 'undefined')
				{
					support+="<div class='supportItem' style='display : inline-block;'>"+data[i].REWARD_ITEM_NAME+"</div>";
				}
				if(data[i].REWARD_SUPPORT_NUM !=null && data[i].REWARD_SUPPORT_NUM != 'undefined')
				{
					support+="<div class='supportItemNum' style='display : inline-block;'>&nbsp;"+data[i].REWARD_SUPPORT_NUM+"개</div>";
				}
				if(data[i].REWARD_ITEM_SEL_OPTION_CONTENT !=null && data[i].REWARD_ITEM_SEL_OPTION_CONTENT != 'undefined')
				{
					support+="<div class='selectOptionCon' >"+data[i].REWARD_ITEM_SEL_OPTION_CONTENT+"</div>";
				}
				if(data[i].REWARD_ITEM_IN_CONTENT !=null && data[i].REWARD_ITEM_IN_CONTENT != 'undefined')
				{
					support+="<div class='inputOptionCon'>"+data[i].REWARD_ITEM_IN_CONTENT+"</div>";
				}
				if(data[i].REWARD_ITEM_PRICE !=null && data[i].REWARD_ITEM_PRICE != 'undefined')
				{
					support+="<div class='rewardPrice'>"+data[i].REWARD_ITEM_PRICE+"원</div>";
				}
				if(data[0].REWARD_SUPPORT_ADD_DONATION !=null && data[0].REWARD_SUPPORT_ADD_DONATION != 'undefined')
				{
					support+="<div class='detail_del_price'>"+"배송비 : "+data[0].REWARD_ITEM_DELIVERY_PRICE+"원</div>";
				}
					support+="</div>";
			});
			$('#detail_support').append(support);
			if(data[0].REWARD_SUPPORT_ADD_DONATION !=null && data[0].REWARD_SUPPORT_ADD_DONATION != 'undefined')
			{
				$('#detail_support_add').text("추가 후원 금액 : "+data[0].REWARD_SUPPORT_ADD_DONATION+"원");
			}
			if(data[0].REWARD_SUPPORT_ZIP_NO !=null && data[0].REWARD_SUPPORT_ZIP_NO != 'undefined')
			{
				$('#addressZip').text(data[0].REWARD_SUPPORT_ZIP_NO);
				$('#addressWhole').text(data[0].REWARD_SUPPORT_ADDRESS_WHOLE);
				$('#addressDetail').text(data[0].REWARD_SUPPORT_ADDRESS_DETAIL);
				$('#addressReceiver').text(data[0].REWARD_SUPPORT_RECEIVER_NAME);
				$('#phone').text(data[0].REWARD_SUPPORT_ADDRESS_PHONE);
			}
			
			$('#account-no').text(data[0].ACCOUNT_NO);
			$('#bank-name').text(data[0].BANK_NAME);
			$('#account-user-name').text(data[0].ACCOUNT_USER_NAME);
		},
		error : function(){
			
		}
	});
	
	
}