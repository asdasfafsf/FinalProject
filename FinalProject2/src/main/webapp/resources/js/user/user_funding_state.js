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
			$('#supportItem').text(data.item.reward_item_name);
		},
		error : function(){
			
		}
	});
	
	
}