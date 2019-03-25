$(function(){
	
	userNo = findUserNo();
	
	$('#join').click(function(){
		location.href = "/test/userPage"+userNo;
	});
	$('#made').click(function(){
		location.href = "/test/userPage/made"+userNo;
	});
	$('#like').click(function(){
		location.href = "/test/userPage/like"+userNo;
	});
});
	
	
function findUserNo()
{
	var str = location.pathname;
	var index = str.lastIndexOf("/");
	var userNo = str.substring(index);
	
	if(userNo == '/userPage' || userNo == '/like' || userNo=='/made')
	{
		userNo = "";
	}
	
	return userNo;
}

function clickReward(targ){
	location.href="/test/project/reward/"+$(targ).attr("id");
}