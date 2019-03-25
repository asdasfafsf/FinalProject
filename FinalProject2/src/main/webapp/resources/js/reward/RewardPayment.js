/**
 * 
 */


$(function(){
        onClickRewardPaymentReward();
        onInputRewardItemNum();
        onInputInputOption();
        onInputSelectOption();
        onInputAddtionalDonation();
        onInputDeliveryUserAddressDetail();
        onInputDeliveryUserPhone();
    })


    //리워드 선택하는 이벤트


    function onClickRewardPaymentReward() {
        $('.reward-payment-reward').off('click').on('click', function(e){
            var parent = $(this);
            $(this).toggleClass('reward-payment-active');
            $(this).children('.reward-payment-reward-left').children('.reward-payment-check-icon').toggleClass('payment-no-check');        
            $(this).children('.reward-payment-reward-left').children('.reward-payment-check-icon').toggleClass('payment-check');

            $(this).children('.reward-payment-reward-right').children('.reward-payment-hidden-area').slideToggle(300 , function(e){

            if ($(parent).children('.reward-payment-reward-left').children('.payment-no-check').length != 0) {
                console.log('지워여함');

                removeRewardItem($(parent).children('[name=itemNo]').val());
            } else if($(parent).children('.reward-payment-reward-left').children('.payment-check').length != 0){
                console.log('추가해야함');

                appendRewardItem(parent);
            }

            });




            console.log($(this).children('[name=itemNo]').val());
        });
    }
    

    function appendRewardItem(parent) {
        if (typeof parent == 'undefined') {
            return;
        }

        var itemNo = $(parent).children('[name=itemNo]').val();
        var index = $('.reward-payment-item').length;

        console.log(index);

        $('.reward-payment-item-list').append($('<div/>', {
            class:'reward-payment-item'
        }));  

        $('.reward-payment-item:eq(' + index +')').append($('<input/>',{
            type:'hidden',
            name:'itemNo',
            value:itemNo
        }));

        $('.reward-payment-item:eq(' + index +')').append($('<div/>',{
            class:'reward-payment-item-name',
            text: $(parent).children('.reward-payment-reward-right').children('.reward-payment-name').text()
        }));

        $('.reward-payment-item:eq(' + index +')').append($('<div/>',{
            class:'reward-payment-item-introduce',
            text: $(parent).children('.reward-payment-reward-right').children('.reward-payment-introduce').text()
        }));

        if($(parent).children('.reward-payment-reward-right').children('.reward-payment-hidden-area').children('.reward-payment-num-area').children('.reward-payment-num-right').length != 0) {
            var right = $(parent).children('.reward-payment-reward-right').children('.reward-payment-hidden-area').children('.reward-payment-num-area').children('.reward-payment-num-right');

            console.log($(right).children('select').val());   
            console.log($(right).children('select').text()); 

            $('.reward-payment-item:eq(' + index +')').append($('<div/>',{
                class:'reward-payment-select-option',
            }));

            
            $('.reward-payment-item:eq(' + index +') .reward-payment-select-option').append($('<div/>',{
                class:'reward-payment-select-option-title',
                text : '선택한 옵션 : ',
                style:'margin-right:5px;'
            }));

            $('.reward-payment-item:eq(' + index +') .reward-payment-select-option').append($('<div/>',{
                class:'reward-payment-select-option-content',
                text : ' ' + $(right).children('select')[0].options[$(right).children('select')[0].selectedIndex].text
            }));
        }

        if($(parent).children('.reward-payment-reward-right').children('.reward-payment-hidden-area').children('.reward-input-option-area').length != 0) {
            var inputOptions = $(parent).children('.reward-payment-reward-right').children('.reward-payment-hidden-area').children('.reward-input-option-area').children('.reward-input-option');

            console.log($(right).children('select').val());   
            console.log($(right).children('select').text()); 

            $('.reward-payment-item:eq(' + index +')').append($('<div/>',{
                class:'reward-payment-input-option',
            }));

            
            $('.reward-payment-item:eq(' + index +') .reward-payment-input-option').append($('<div/>',{
                class:'reward-payment-select-option-title2',
                text : '입력한 옵션'
            }));

            for(var i = 0; i < inputOptions.length; i++) {
                var inputOption = inputOptions[i];

                $('.reward-payment-item:eq(' + index +') .reward-payment-input-option').append($('<div/>',{
                    class:'reward-payment-input-option-title',
                    text : $(inputOption).text()
                }));

                $('.reward-payment-item:eq(' + index +') .reward-payment-input-option').append($('<div/>',{
                    class:'reward-payment-input-option-content',
                    text : $(inputOption).next().val()
                }));
                
                $('.reward-payment-item:eq(' + index +') .reward-payment-input-option').append($('<br/>',{
                  
                }));
            }
        }


        $('.reward-payment-item:eq(' + index +')').append($('<div/>',{
            class:'reward-item-result',
        }));

        
        $('.reward-payment-item:eq(' + index +') .reward-item-result').append($('<div/>',{
            class:'reward-item-nums',
            html:'수량&nbsp;'
        }));

        var itemNum = $(parent).children('.reward-payment-reward-right').children('.reward-payment-hidden-area').children('.reward-payment-num-area').children('.reward-payment-num-left').children('[type=number]').val();
        var itemPrice = $(parent).children('.reward-payment-reward-right').children('.reward-payment-price').children('.itemPrice').val();

        $('.reward-payment-item:eq(' + index +') .reward-item-result').append($('<div/>',{
            class:'reward-item-real-num',
            text:itemNum 
        }));

        $('.reward-payment-item:eq(' + index +') .reward-item-result').append($('<div/>',{
            class:'reward-item-unit',
            html:'&nbsp;개&nbsp;'
        }));

        $('.reward-payment-item:eq(' + index +') .reward-item-result').append($('<div/>',{
            class:'reward-item-prices',
            text : itemPrice * itemNum
        }));

        $('.reward-payment-item:eq(' + index +') .reward-item-result').append($('<div/>',{
            class:'reward-item-unit',
            html:'&nbsp;원'
        }));

        setDeliveryPrice();
        setSumOfPayment();
 
    }

    function setDeliveryPrice() {
        var delivery = $('.reward-payment-active .reward-payment-delivery-prices');
        var sum = 0;
        for (var i = 0; i < delivery.length; i++) {
            var del = delivery[i];
            var prices = Number($(del).text());

            sum += prices;
        }

        $('.reward-payment-delivery-price > div:eq(1)').text(sum + ' 원');
    }

    function removeRewardItem(itemNo) {
        var itemList = $('.reward-payment-item');

        for (var i = 0; i < itemList.length; i++) {
            var itemNoVal = $(itemList[i]).children('[name=itemNo]').val();

            if (itemNo == itemNoVal) {
                $(itemList[i]).remove();
                
                setDeliveryPrice();
                setSumOfPayment();
                return;
            }
        }

        setDeliveryPrice();
        setSumOfPayment();
    }

    function onInputAddtionalDonation() {
        $('#addtional-donation').on('keydown', function(e){
            if(e.keyCode == 69 || e.keyCode == 190 || e.keyCode == 109 || e.keyCode == 189){
                return false;              
            } else if(e.keyCode == 116 || e.keyCode == 37 || e.keyCode == 38 || e.keyCode == 39|| e.keyCode == 40 || e.keyCode == 8 || e.keyCode == 9){
            	return true;
            } 
            
            return Number($(this).val() + e.key) <= Number($(this).attr('max')) && Number(($(this).val() + e.key)) > 0;

        });

        $('#addtional-donation').on('input', function(e){
            
            if ($(this).val().length == 0) {
                value = 0;
                $(this).val(0);
            } else if ($(this).val() < 1) {
                value = 0;
                $(this).val(0);
            }

            $('.reward-payment-addtional-support > div:eq(1)').text($(this).val() + ' 원');
            setSumOfPayment();
        });
    }

    function onInputRewardItemNum() {
        $('.reward-payment-num-left > input[type=number]').on('click', function(e){
            e.stopPropagation();
        });

        $('.reward-payment-num-left > input[type=number]').off('keydown').on('keydown', function(e){
            if(e.keyCode == 69 || e.keyCode == 190 || e.keyCode == 109 || e.keyCode == 189){
                return false;              
            } else if(e.keyCode == 116 || e.keyCode == 37 || e.keyCode == 38 || e.keyCode == 39|| e.keyCode == 40 || e.keyCode == 8 || e.keyCode == 9){
            	return true;
            } 
            
            return Number($(this).val() + e.key) <= Number($(this).attr('max')) && Number(($(this).val() + e.key)) > 0;
        });

        $('.reward-payment-num-left > input[type=number]').on('input', function(e){
            var value = $(this).val();
            console.log(value);

            var parent = $(this).parent().parent().parent().parent().parent();
            var itemNo = $(parent).children('[name=itemNo]').val();
            var price = $(parent).children('.reward-payment-reward-right').children('.reward-payment-price').children('.itemPrice').val();

            console.log(itemNo + '안녕');

            if ($(this).val().length == 0) {
                value = 1;
                $(this).val(1);
            } else if ($(this).val() < 1) {
                value = 1;
                $(this).val(1);
            }

            setRewardItemNum(itemNo, value, price);
            setSumOfPayment();
        });
    }

    function setRewardItemNum(itemNo, itemNum, price) {
        var itemList = $('.reward-payment-item');

        for (var i = 0; i < itemList.length; i++) {
            var itemNoVal = $(itemList[i]).children('[name=itemNo]').val();

            if (itemNo == itemNoVal) {
                $(itemList[i]).children('.reward-item-result').children('.reward-item-real-num').text(itemNum);
                $(itemList[i]).children('.reward-item-result').children('.reward-item-prices').text(itemNum * price);
             }
        }   

        setSumOfPayment();
    }

    function onInputInputOption() {
        $('.reward-input-option-area > input[type=text]').on('click', function(e){
            e.stopPropagation();
        });

        $('.reward-input-option-area > input[type=text]').on('input', function(e){
            var parent = $(this).parent().parent().parent().parent(); 
            var itemNo = $(parent).children('[name=itemNo]').val();
            var content = $(this).val();
            var index = Math.ceil(($(this).prevAll().length - 2) / 3);
            
            setRewardInputOption(itemNo, index, content);
        });
    }
    
    

    function setRewardInputOption(itemNo, index, content) {
        var itemList = $('.reward-payment-item');

        for (var i = 0; i < itemList.length; i++) {
            var itemNoVal = $(itemList[i]).children('[name=itemNo]').val();

            if (itemNo == itemNoVal) {
                console.log($(itemList[i]));
                console.log($(itemList[i]).children('.reward-payment-input-option').children('.reward-payment-input-option-content:eq(' + index +')').text(content));
            }
        }  
    }

    function onInputSelectOption(){
        $('.reward-payment-num-right select').on('click', function(e){
            e.stopPropagation();
        });

        $('.reward-payment-num-right select').on('change', function(e){
            var parent = $(this).parent().parent().parent().parent().parent();
            var itemNo = $(parent).children('[name=itemNo]').val();

            var index = $(this)[0].selectedIndex;
            
            

            setRewardSelectOption(itemNo, $(this)[0].options[index].text);
            
        });
    }

    function setRewardSelectOption(itemNo, text) {
        var itemList = $('.reward-payment-item');

        for (var i = 0; i < itemList.length; i++) {
            var itemNoVal = $(itemList[i]).children('[name=itemNo]').val();

            if (itemNo == itemNoVal) {
                $(itemList[i]).children('.reward-payment-select-option').children('.reward-payment-select-option-content').text(text);
                return;
            }
        }  
    }

    function setSumOfPayment() {
        var rewardItemPrices = $('.reward-item-prices');
        var addtional = $('#addtional-donation').val();
        var delivery = $('.reward-payment-delivery-price > div:eq(1)').text().trim().replace('원','');

        var itemPriceSum = 0;

        for (var i = 0; i < rewardItemPrices.length; i++) {
            var value = Number($(rewardItemPrices[i]).text());
            itemPriceSum += value;
        }

        console.log(itemPriceSum);
        console.log(addtional);
        console.log(delivery);

        var sum = 0;
        sum += Number(itemPriceSum);
        sum += Number(delivery);

        if (typeof addtional =='Number'){
            sum+=addtional;
        }

        console.log(sum);

        $('.reward-payment-all-price > div:eq(1)').text(sum + ' 원');
    }
    
    function getSupportJSONMainData() {
      	var lastIndex = location.href.lastIndexOf('/');
	  	var rewardNo = location.href.substr(lastIndex + 1);
    	var data = {};
    	
    	data.rewardNo = rewardNo;
    	data.addDonation = $('#addtional-donation').val();
    	
    	data.itemList = getSupportJSONData();
    	data.delivery = getDeliveryJSONData();
    	
    	console.log(data);
    	
    	return data;
    }
    
    function requestSupportAjax() {
    	$.ajax({
    		url:getContextPath() + '/project/reward/requestsupport',
    		data : JSON.stringify(getSupportJSONMainData()),
    		contentType:'application/json',
    		type : 'post',
    		dataType : 'json',
    		success : function(data) {
    			console.log('가긴감');
    		}, error : function(data) {
    			console.log('에러넹');
    		}
    		
    	});
    }
    
    function getDeliveryJSONData() {
    	var address = {};
    	
    	address.zipNo = $('[name=addressZipNo]').val();
    	address.whole = $('[name=addressWhole]').val();
    	address.phone = $('[name=addressPhone]').val();
    	address.detail = $('[name=addressDetail]').val();
    	address.receiverName = $('[name=addressReceiverName]').val();
    	address.request = $('[name=deliveryRequest]').val();
    	
    	return address;
    }
    
    
    function getSupportJSONData() {
      	var lastIndex = location.href.lastIndexOf('/');
	  	var rewardNo = location.href.substr(lastIndex + 1);
    	var active = $('.reward-payment-active');
    	
    	var itemList = [];
    	
    	for (var i = 0; i < active.length; i++) {
    		var rewardItem = {};
    		
    		rewardItem.rewardNo = rewardNo;
    		
    		var itemNo = $('.reward-payment-active:eq(' + i + ') [name=itemNo]').val();
    		rewardItem.rewardItemNo = itemNo;
    		
    		var itemNum = $('.reward-payment-active:eq(' + i + ') .reward-payment-num-left input[type=number]').val();
    		rewardItem.num = itemNum;
    		
    		var data = $('.reward-payment-active:eq(' + i + ') .reward-payment-num-right').length;
    		
    	    if (data != 0) {
    	    	var select =  $('.reward-payment-active:eq(' + i + ') .reward-payment-reward-right select');
    	    	var selIndex = select[0].selectedIndex;
    	    	var selVal = select[0].options[selIndex].value;
    	    	var selText = select[0].options[selIndex].text; 
    	    		
    	    	rewardItem.rewardItemSelectOptionNo = selVal;
    	    }
    	    
    
    	    var roop = $('.reward-payment-active:eq(' + i + ') .reward-input-option-area [name=inputOptionText]').length;
    	    var supportInputOptionList = [];
    	    
    	    for (var j = 0; j < roop; j++) {
    	    	var supportInputOption = {};
    	    	
    	    	var inputOptionNo = $('.reward-payment-active:eq(' + i + ') .reward-input-option-area [name=inputOptionNo]:eq(' + j + ')').val();
    	    	var inputOptionContent= $('.reward-payment-active:eq(' + i + ') .reward-input-option-area [name=inputOptionText]:eq(' + j + ')').val();
    	    	
    	    	supportInputOption.inputOptionNo = inputOptionNo;
    	    	supportInputOption.inputContent = inputOptionContent;
    	    	supportInputOption.rewardItemNo = itemNo;
    	    	
    	    	supportInputOptionList.push(supportInputOption);
    	    }
    	    
    	    rewardItem.inputOptionList = supportInputOptionList;
    	    
    	    itemList.push(rewardItem);
    	    
    	}
    	
    	console.log(itemList);
    	
    	return itemList;
    }	
    
    function onInputDeliveryUserName() {
    	$('[name=deliveryUserName]').on('input', function(e){
    		$('[name=addressReceiverName]').val($(this).val());
    	});
    }
    
    function onInputDeliveryUserPhone() {
    	$('[name=deliveryUserPhone]').on('input', function(e){
    		$('[name=addressPhone]').val($(this).val());
    	});
    }
    
    function onInputDeliveryAddressDetail() {
    	
    }
    
    function onInputDeliveryRequest() {}
    
    



    function onClickPlusBtn() {
        $('.reward-payment')
    }

    function onClickMinusBtn() {

    }

    
    //var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
    function findAddress() {
        new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.

            console.log(data);
            
            $('[name=addressZipNo]').val(data.zonecode);
            $('[name=addressWhole]').val(data.roadAddress);

        }
    }).open();
    }
