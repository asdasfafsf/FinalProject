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
        } else if (index == 1) {
            var taLength = $('.project-synopsis').val().length;

                $(select).next().addClass('content-selected');
                $(select).removeClass('content-selected');
                $('.reward-open-btn').text('펀딩오픈하기');
            
        } else {
           var checkBoxs = $(select).children('input[type=checkbox]');

           for (var i = 0; i < checkBoxs.length; i++) {
               var checkBox = checkBoxs[i];
               if(!checkBox.checked){
                   return;
               }
           } 
           $('#rewardOpenForm').submit();
        }

    } 