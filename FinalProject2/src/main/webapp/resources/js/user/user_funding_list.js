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
	$('#filter').change(function(){
		var path = findPathname();
		var realpath = path+userNo;
		changeFilter(realpath);
	});
});

function findPathname(){

	var str = location.pathname;
	var index = str.lastIndexOf("/");
	var userNo = str.substring(index);
	var pathname = '';

	if(userNo == '/userPage')
	{
		pathname = '';
	}
	else if(userNo == '/like' || userNo=='/made')
	{
		pathname = userNo;
	}
	else
	{
		var pathnameStr = str.substring(0,index);
		var index2 = pathnameStr.lastIndexOf("/");
		userNo = pathnameStr.substring(index2);
		
		if(userNo == '/userPage')
		{
			pathname = '';
		}
		else if(userNo == '/like' || userNo=='/made')
		{
			pathname = userNo;
		}
	}
	
	return pathname;
}	

function changeFilter(path)
{
	$('#filterFrm').attr('action','/test/userPage'+path);
	$('#filterFrm').submit();
}
	
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