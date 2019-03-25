//시작시 스크롤500이상가면 맨위로가는버튼 생성, 클릭시 맨위로 가기
$(document).ready(function(){
		  $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('.move_top_button').fadeIn();
            } else {
                $('.move_top_button').fadeOut();
            }
        }); 
        
        $(".move_top_button").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
});
