// find Id(email)
// $('#btn-search')를 누르면 $('#email')의 val()을 받아서
// db에서 email을 찾음. 없으면 없다는 msg 줌 
// return은 String msg로.

$(function(){
	$('#btn-search').click(function(){
		console.log("눌림");
		if($("#email").val().trim()!=null&&$("#email").val().trim()!="")
		{
			$.ajax({
			url : "/test/find/id.do",
			data : {"email":$("#email").val()},
			dataType : "text",
			success : function(data){
				console.log("하고있음"+data);
				$("#result").text(data);
			},
			error : function(){
				console.log("ㅍㅍ");
				}
			});
		}
	});
});

$(function(){
	$('#btn-search2').click(function(){
		console.log("pw찾기 눌림");
		if($("#email").val().trim()!=null&&$("#email").val().trim()!="")
		{
			$.ajax({
			url : "/test/find/pw.do",
			data : {"email":$("#email").val()},
			dataType : "text",
			success : function(data){
				console.log(data);
				$("#result").text(data);
			},
			error : function(){
				console.log("2");
				}
			});
		}
	});
});