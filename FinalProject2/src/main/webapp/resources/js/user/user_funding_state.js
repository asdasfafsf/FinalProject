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
});

function clickReward(targ){
	location.href="/test/project/reward/"+$(targ).attr("id");
}
function showReward(targ){
	location.href="/test/project/reward/preview/"+$(targ).attr("id");
}
function editReward(targ){
	location.href="/test/project/reward/update/"+$(targ).attr("id");
}
function checkDetail(targ){
	var no = $(targ).attr("id");
	
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
			
			var results = data.detail;
			
			$.each(results,function(i){
				support+="<div class='detail_support_list'>"
				support+="<div class='supportItem'>"+results[i].REWARD_ITEM_NAME+"</div>";
				support+="<div class='supportItemNum'>"+results[i].REWARD_SUPPORT_NUM+"</div>";
				support+="<div class='selectOptionCon'>"+results[i].REWARD_ITEM_SEL_OPTION_CONTENT+"</div>";
				support+="<div class='inputOptionCon'>"+results[i].REWARD_ITEM_IN_CONTENT+"</div>";
				support+="<div class='rewardPrice'>"+results[i].REWARD_ITEM_PRICE+"</div>";
				support+="</div>";
					console.log(support);
			});
			$('#detail_support').append(support);
			
		},
		error : function(){
			
		}
	});
	
	
}