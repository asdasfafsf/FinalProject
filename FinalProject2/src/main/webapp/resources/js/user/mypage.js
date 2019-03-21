//누구 페이지 들어왔나 확인
var global_userNo=0;
var global_url="";

$(document).ready(function() {
		var locationStr = location.href;
		var index1 = locationStr.lastIndexOf('/'); // 유저 번호
		var index2 = locationStr.lastIndexOf('/',index1+1); //type? 참여한건지 좋아요 한건지..
		var tempString = locationStr.substring(index1+1);
		
		if(tempString=='userPage'||tempString=='made'||tempString=='like')
		{
			global_url = "";
		}
		else
		{
			global_url = "/"+tempString;
		}
});
//참여한 reward 가져오기(기본) : userPage/[{userNo}]
$(function(){
	
	$('#join').click(function(){
		location.href="/test/userPage"+global_url;
		/*
		$.ajax({
			url : '/text/userPage/'+global_userNo,
			data : {'ORDER' : $('#order').val()},
			dataType : 'post',
			type : 'text',
			success : function(data){
				location.href="/test/"+data;
			},
			error : function(){
				alert("잠시후 다시 시도해주세요.");
				sleep(5*1000);
				history.go(0);
			}
		});*/
	});
});
//진행하는 reward 가져오기 : userPage/made/[{userNo}]
$(function(){
	$('#made').click(function(){
		location.href="/test/userPage/made"+global_url;
	});
});
//좋아하는 reward 가져오기 : userPage/like/[{userNo}]
$(function(){
	$('#like').click(function(){
		location.href="/test/userPage/like"+global_url;
	});
});


//각 페이지에서 select onchange 되었을 때, 
//페이지 구분 , select : order 보내기
/*$(function(){
	$('#order').change(function(){
		$.ajax({
			url : '/text/userPage/'+global_url;
			data : {'ORDER' : $('#order').val()},
			dataType : 'post',
			type : 'text',
			success : function(Map){
				location.href="/test/"+data;
			},
			error : function(){
				alert("잠시후 다시 시도해주세요.");
				sleep(5*1000);
				history.go(0);
			}
		});
	});
});*/