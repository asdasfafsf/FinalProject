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
			
		},
		error : function(){
			
		}
	});
}