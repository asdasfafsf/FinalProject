/**
 * 
 */


    function onClickNextBtn(path) {
       
        var index = $('.content-selected').prevAll().length;
        var select = $('.content-selected');

        if (index == 0) {
            var selectVal = $('select[name=rewardCategory]').val();

            if (selectVal == 0) {
            	
            } else {
                $(select).next().addClass('content-selected');
                $(select).removeClass('content-selected');
            }
        } else {
           var checkBoxs = $(select).children('input[type=checkbox]');

           for (var i = 0; i < checkBoxs.length; i++) {
               var checkBox = checkBoxs[i];
               if(!checkBox.checked){
            	   alertBox('','모든 항목을 체크해주세요!','알림','확인');
                   return;
               }
           } 
           $('#rewardOpenForm').submit();
        }

    } 