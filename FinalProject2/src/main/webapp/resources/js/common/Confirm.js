/**
 * 
 */


    var confirmBox = function(okCallback, cancelCallback ,content, title, okButton, cancelButton) {
    	if (typeof $('.confirm_background') != "undefined") {
    		return;
    	}
    	
        if (typeof content == "undefined") {
            content = '알림 내용을 입력해주세요. 입력하지 않으면 콜백함수가 동작하지 않습니다.';
            okCallback = "undefined";
            cancelCallback = "undefined";
        }
 
        if (typeof title == "undefined") {
            title = '알림';
        }
 
        if (typeof okButton == "undefined") {
            okButton = '확인';
        }
 
        if (typeof cancelButton == "undefined") {
            cancelButton = '취소';
        }

        var isActive = false;
 
 
         var appendElement = function() {
            if(isActive) {
                return;
            }

            isActive = true;

             $('body').prepend($('<div/>', {
                 class: 'confirm_background'
             }));
 
             $('.confirm_background').append($('<div/>',{
                 class: 'confirm_wrapper'
             }));
 
             $('.confirm_wrapper').append($('<header/>', {
 
             }));
 
             $('.confirm_wrapper > header').append($('<p/>', {
                 class:'confirm_info',
                 text:title
             }));
 
             $('.confirm_wrapper > header').append($('<div/>', {
                 class:'confirm_close',
             }));
 
             $('.confirm_wrapper').append($('<hr/>', {
 
             }));
 
             
             $('.confirm_wrapper').append($('<section/>', {
 
             }));
 
             $('.confirm_wrapper section').append($('<p/>', {
                 class:'confirm_content',
                 text:content
             }));
 
             $('.confirm_wrapper').append($('<footer/>', {
 
             }));
 
             $('.confirm_wrapper footer').append($('<div/>', {
                 class:'confirm_ok',
             }));
 
             $('.confirm_wrapper footer .confirm_ok').append($('<p/>', {
                 class:'confirm_ok_text',
                 text:okButton
             }));
 
 
             
             $('.confirm_wrapper footer').append($('<div/>', {
                 class:'confirm_cancel',
             }));
 
             $('.confirm_wrapper footer .confirm_cancel').append($('<p/>', {
                 class:'confirm_cancel_text',
                 text:cancelButton
             }));
         }
 
         var bindEvent = function() {
             $('.confirm_ok').off('click').on('click', function(){
                 closeConfirmBox(okCallback);
             });
 
             $('.confirm_cancel').off('click').on('click', function(){
                 closeConfirmBox(cancelCallback)
             });
 
             $('.confirm_close').off('click').on('click', function(){
                 closeConfirmBox(cancelCallback);
             });
 
             $('body').off('keyup').on('keyup', function(e){
 
                 if(e.key == "Enter") {
                     closeConfirmBox(okCallback);
                     $(this).off('keyup');
                 } else if (e.key == "Escape") {
                     closeConfirmBox(cancelCallback);
                     $(this).off('keyup');

                 }
             });

             $('.confirm_background').off('click').on('click', function(e){
                 e.preventDefault();
                 e.stopPropagation();
                 e.stopImmediatePropagation();
                 
             });
 
             function closeConfirmBox(callback) {
                 $('.confirm_background').fadeOut(300, function(e){
                     $(this.remove());
 
                     if(typeof callback == "function") {
                         callback();
                     }
                     isActive = false;
                 });
             }
         }
 
         var showElement = function() {
             $('.confirm_background').fadeIn(300);
         }
 
         appendElement();
         bindEvent();
         showElement();
     }