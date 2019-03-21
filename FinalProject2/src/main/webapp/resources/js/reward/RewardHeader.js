/**
 * 
 */

$(window).scroll(function(e) {
    fixRewardHeader(this);
});

$(window).resize(function(e){
    fixRewardHeader(this);
})

$(function(){
    onBindHeaderEvent();
});


function fixRewardHeader(window) {
	var scrollTop = $(window).scrollTop();
	
    console.log(scrollTop);

    var rewardHeader = $('.reward-header');
    var rewardHeaderFixed = $('.reward-header-fixed');

    if(scrollTop > 180) {
        $(rewardHeader).removeClass();
        $(rewardHeader).addClass('reward-header-fixed');
        $('.reward-section').css('margin-top','58px');
      
    } else {
        $(rewardHeaderFixed).removeClass();
        $(rewardHeaderFixed).addClass('reward-header');
        $('.reward-section').css('margin-top','0px');
    }
}

function onBindHeaderEvent() {
	var lastIndex = location.href.lastIndexOf('/');
	var rewardNo = location.href.substr(lastIndex + 1);
	
    $(".reward-ul > li:eq(0)").off('click').on('click', function(e){
        location.href=getContextPath() + '/project/reward/' + rewardNo;
    })

    $(".reward-ul > li:eq(1)").off('click').on('click', function(e){
        location.href=getContextPath() + '/proejct/reward/notice/' + rewardNo;
    })

    $(".reward-ul > li:eq(2)").off('click').on('click', function(e){
        location.href= getContextPath() + '/project/reward/comment/' + rewardNo;
    })
}



