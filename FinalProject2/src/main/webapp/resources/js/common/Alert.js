/**
 * 
 */

var alertBox = function(confirmCallback, content, title, button) {
    if (typeof content == "undefined") {
        content = '알림 내용을 입력해주세요. 입력하지 않으면 콜백함수가 동작하지 않습니다.';
        confirmCallback = "undefined";
    }

    if (typeof title == "undefined") {
        title = '알림';
    }

    if (typeof button == "undefined") {
        button = '확인';
    }


     var appendElement = function() {
         $('body').append($('<div/>', {
             class: 'alert_background'
         }));

         $('.alert_background').append($('<div/>',{
             class: 'alert_wrapper'
         }));

         $('.alert_wrapper').append($('<header/>', {

         }));

         $('.alert_wrapper > header').append($('<p/>', {
             class:'alert_info',
             text:title
         }));

         $('.alert_wrapper > header').append($('<div/>', {
             class:'alert_close',
         }));

         $('.alert_wrapper').append($('<hr/>', {

         }));

         
         $('.alert_wrapper').append($('<section/>', {

         }));

         $('.alert_wrapper section').append($('<p/>', {
             class:'alert_content',
             text:content
         }));

         $('.alert_wrapper').append($('<footer/>', {

         }));

         $('.alert_wrapper footer').append($('<div/>', {
             class:'alert_ok',
         }));

         $('.alert_wrapper footer .alert_ok').append($('<p/>', {
             class:'alert_ok_text',
             text:button
         }));
     }

     var bindEvent = function() {
         $('.alert_ok').off('click').on('click', function(){
             closeAlertBox();
         });

         $('.alert_close').off('click').on('click', function(){
             closeAlertBox();
         });

         $('body').off('keyup').on('keyup', function(e){
             if(e.key == "Enter" || e.key == "Escape") {
                 closeAlertBox();
                 $(this).off('keyup');
             }
         });

         function closeAlertBox() {
             $('.alert_background').fadeOut(500, function(){
                 $(this.remove());

                 if(typeof confirmCallback == "function") {
                     confirmCallback();
                 }
             });
         }
     }

     var showElement = function() {
         $('.alert_background').fadeIn(500);
     }

     appendElement();
     bindEvent();
     showElement();
 }
