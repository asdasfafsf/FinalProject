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
    console.log($(window).scrollTop());

    var rewardHeader = $('.reward-header');
    var rewardHeaderFixed = $('.reward-header-fixed');

    if($(window).scrollTop() > 120) {
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
    $(".reward-ul > li:eq(0)").off('click').on('click', function(e){
        location.href='rewords.html';
    })

    $(".reward-ul > li:eq(1)").off('click').on('click', function(e){
        location.href='rewardsNotice.html';
    })

    $(".reward-ul > li:eq(2)").off('click').on('click', function(e){
        location.href='rewardComment.html';
    })
}
