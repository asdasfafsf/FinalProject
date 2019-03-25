/**
 * 
 */

	$(window).scroll(function(e){
		console.log($('html').height());
		console.log();
		
		fixRewardWriteHeader($(window).scrollTop());
	});
	
	function fixRewardWriteHeader(scrollTop) {
		if (typeof scrollTop == 'undefined') {
			scrollTop = $(window).scrollTop();
		}
		
		var header = $('#reward-write-header');
		
		
		if (scrollTop > 337) {
			header.removeClass();
			header.addClass('reward-header-fixed');
			
			$('.reward-section-background').css('margin-top', '70px');
		} else if (scrollTop <= 337){
			header.removeClass();
			header.addClass('reward-header');
			
			$('.reward-section-background').css('margin-top', '0px');
		}
	}
	
	
	
	
  $(function () {
        onBindRewardMenuEvent();
        onBindRewardContentEvent();
        onBindRewardRewardEvent();
        onBindTextLimit();
        onClickRewardContentRewardAddEvent();

        onUploadProjectImg();
        onClickRewardCategory();
        uploadTextEditorImage();
        onInputRewardMCURL()
    })

    $(window).resize(function (e) {
        console.log('d/');
        fixRewardWriteHeader();
       

    })
    
    // 텍스트 편집기에 ajax통신
    function uploadTextEditorImage() {
	  	var callback = function(file) {
	  		var formTag = document.createElement('form');
	  		formTag.enctype="multipart/form-data";
	  		formTag.post = "post";
	  		formTag.action = getContextPath() + '/project/reward/savestoryimage'
	  		
	  		var formData = new FormData(formTag);
	  		formData.append('file',file);
	  		console.log(file);
	  		console.log('되니??????????/');
	  		console.log('양심ㅇㄷ?');
	  		
	  		$.ajax({
	  			url : getContextPath() + '/project/reward/savestoryimage',
	  			processData : false,
	  			contentType : false,
	  			data : formData,
	  			type : 'post',
	  			dataType : 'text',
	  			success : function(data) {
	  				console.log('너는 응답이 오긴 옴?');
	  				console.log(data);
	  				
	  				if (data != "fail") {
	  					document.execCommand('insertImage',false, getContextPath() + data );
	  				}
	  			}, error : function(error) {
	  				console.log('여기서 에러나냐?');
	  				console.log(error);
	  			}
	  		
	  		});
	  	}
	  	
	    TextEditor($('#reward-project-story .reward-content-hide'), callback);  
  	}
  
  	function getTextEditorContentJSONData() {
  		console.log('이게찍혀야 뭘 하던지 하지 않겠니?');
  		
  		var textEditorContent = $('.text-editor-content');
  		
  		console.log('반가워!!!!!!!!!!!!!!!!!!!!!!!!!!');
  		
  		var textEditorChildNodes = textEditorContent[0].childNodes;
  		var storyContents = [];
  		var lastIndex = location.href.lastIndexOf('/');
  		var rewardNo = location.href.substr(lastIndex + 1);
  		
  		console.log(textEditorChildNodes);

  		console.log('여기니????????????????????????/');
  		
  		for (var i = 0; i < textEditorChildNodes.length; i++) {
  			var childNode = textEditorChildNodes[i];
  			console.log($(childNode).html);
  			
  			var storyContent = {};
  			storyContent.index = i;	
  			storyContent.tag = $(childNode).html();
  			storyContent.rewardNo = Number(rewardNo);
  		
  			
  			if (typeof $(childNode).html() == "undefined"){
  				storyContent.tag = $(childNode).text();
  			}
  			
  			storyContents.push(storyContent);
  		}
  		var reward = {};
  		reward.storyContentList = storyContents
  		reward.no = Number(rewardNo);
  		
  		console.log(storyContents);
  		console.log('여기니????????????????????????/');
  		
  		return reward;
  	}
  
    
    // 텍스트 제한 글자 공용 이벤트

    function onBindTextLimit() {
        $('.simple-text').off('keydown input keyup').on('keydown input keyup', function (e) {
            var textLimit = $(this).parent().children('.textLimit');

            if (typeof textLimit != "undefined") {
                $(textLimit).text($(this).val().length + "/" + $(this).attr('maxLength'));
            }
            
            if (typeof $(this).parent().parent().parent().parent().children('.reward-menu-check-icon') != 'undefined') {
            	changeRewardHeaderIcon($(this).parent().parent().parent().parent().children('.reward-menu-check-icon'));  
            }
            changeRewardHeaderIcon();
        });
        
        $('input[type=number]').off('keydown').on('keydown', function(e){
            if(e.keyCode == 69 || e.keyCode == 190 || e.keyCode == 109 || e.keyCode == 189){
                return false;              
            } else if(e.keyCode == 116 || e.keyCode == 37 || e.keyCode == 38 || e.keyCode == 39|| e.keyCode == 40 || e.keyCode == 8 || e.keyCode == 9){
            	return true;
            } 
            
            return Number($(this).val() + e.key) <= Number($(this).attr('max')) && Number(($(this).val() + e.key)) > 0;
        });
        
        $('input[type=number]').off('input').on('input', function(e){
        	console.log('여기는 인풋영역');
        	console.log(e.keys);
        	console.log(e.key);
        });

        $('.reward-textarea').off('click').on('click', function(e){
            e.stopPropagation();
        });


        $('.reward-textarea').off('keydown input keyup').on('keydown input keyup', function (e) {
            var textLimit = $(this).parent().children('.textLimit');

            if (typeof textLimit != "undefined") {
                $(textLimit).text($(this).val().length + "/" + $(this).attr('maxLength'));
            }
            
            changeRewardHeaderIcon();
        });
    }

    // 프로젝트 영역 이벤트 바인딩

    function onUploadProjectImg() {
        $('.reward-img-upload-label').off('click').on('click', function(e){
            e.stopPropagation();
        });
        
        $('.reward-img-upload-label').next().off('change').on('change', function(e){
            var file = this.files[0];

            console.log(file);
            console.log(file.size);

            if (!isImage(file.name)) {
            	if ($(this).prev().attr('id') == "reward-project-photo3" && !isMp4(file.name)) {
            		alertBox(function(){}, '파일은 png,jpg,bmp 확장자를 가진 이미지와 mp4확장자를 가진 영상만 올릴 수 있습니다','알림', '확인');
            	} else if($(this).prev().attr('id') != "reward-project-photo3"){
            		alertBox(function(){}, '파일은 png,jpg,bmp 확장자를 가진 이미지만 올릴 수 있습니다','알림', '확인');
            	}
                return;
            } else if (!isExcessFileCapacity(file)) {
            	alertBox(function(){}, '파일의 용량이 초과되었습니다.','알림', '확인');
                return;
            }

            var label = $(this).prev();
            console.log(label);

            var setBackground = function(url) {
                $(label).css('backgroundImage','url(' + url + ')');
                changeRewardHeaderIcon();
            }


            readFile(file, setBackground);
        });
    }

    function onClickRewardCategory() {
        $('.reward-category-select').off('click').on('click', function(e){
            e.stopPropagation();
            changeRewardHeaderIcon();
        })
    }
    
    function onInputRewardMCURL() {
    	$('.simple-url').off('input keyup keydown').on('input keyup keydown', function(e){
    		changeRewardHeaderIcon();
    	});
    	
    }
    

    

    // 리워드 더하는 부분 얘는 시작할때 한버남ㄴ 더해주면 됨.

    function onClickRewardContentRewardAddEvent() {
        $('#reward-content-reward-add-btn').off('click').on('click', function (e) {
            e.stopPropagation();
            changeRewardHeaderIcon($('.reward-menu-check-icon:eq(7)'));
            appendRewardWrapper();
        });
    }

    function appendRewardWrapper(data) {
        $('.reward-subcontents').append($('<div/>', {
            class: 'reward-content-line'
        }));

        $('.reward-subcontents').append($('<div/>', {
            class: 'reward-content reward-content-active'
        }));

        var rewardContents = $('.reward-subcontents').children('.reward-content');
        var index = rewardContents.length;
        var rewardContent = $('.reward-subcontents').children('.reward-content:eq(' + (index - 1) + ')');

        appendRewardRewardTitle(rewardContent, index);
        appendRewardContentReward(rewardContent, index);
        appendRewardRewardArea(rewardContent, index);
        appendRewardRewardBtn(rewardContent, index);

        onBindRewardContentEvent();
        onBindRewardRewardEvent();
        onBindTextLimit();
    }

    // 리워드 하나하나 각 상품의 타이틀 붙임
    function appendRewardRewardTitle(rewardContent, index) {
        $(rewardContent).append($('<div/>', {
            class: 'icon-upper-arrow'
        }));
        
        $(rewardContent).append($('<div/>', {
            style:'vertical-align:top; width:28px; height:28px; margin-top:5px; margin-right:3px;',
            class:'reward-menu-check-icon reward-menu-no-save'
        }));

        $(rewardContent).append($('<p/>', {
            class: 'title',
            style:'display:inline-block',
            text: '리워드 #' + index
        }));

        $(rewardContent).append($('<p/>', {
            class: 'assist',
            text: '리워드의 상세사항을 적어주세요.'
        }));

        $(rewardContent).append($('<div/>',{
            class:'hidden-data-area',
            html:'<input type="hidden" value="0" class="data">'
        }));

        $(rewardContent).append($('<div/>', {
            class: 'reward-content-hide'
        }));
    }

    // 리워드 실제 내용을 붙임
    function appendRewardContentReward(rewardContent, index) {
        var rewardHide = $(rewardContent).children('.reward-content-hide');

        $(rewardHide).append($('<div/>', {
            class: 'reward-content-reward'
        }));

        console.log('너왜그래?');

    }

    // 리워드에 들어가야하는 요소을 덮는 영역들 더함.. 제목이나 내용 뭐 그런가
    function appendRewardRewardArea(rewardContent, index) {
        var parent = $(rewardContent).children('.reward-content-hide').children('.reward-content-reward');

        console.log(parent);
        console.log('아녕!!');

        $(parent).append($('<div/>', {
            class: 'reward-sequence'
        }));

        $(parent).append($('<div/>', {
            class: 'reward-price-area'
        }));

        $(parent).append($('<div/>', {
            class: 'reward-reward-limit-area'
        }));

        $(parent).append($('<div/>', {
            class: 'reward-title-area'
        }));

        $(parent).append($('<div/>', {
            class: 'reward-detail-area'
        }));

        $(parent).append($('<div/>', {
            class: 'reward-option-area'
        }));

        $(parent).append($('<div/>', {
            class: 'reward-delivery-address-area'
        }));

        $(parent).append($('<div/>', {
            class: 'reward-delivery-price-area'
        }));

        $(parent).append($('<div/>', {
            class: 'reward-delivery-date-area'
        }));

        appendRewardSequence($(parent).children('.reward-sequence'));
        appendRewardPrice($(parent).children('.reward-price-area'))
        appendRewardRewardLimit($(parent).children('.reward-reward-limit-area'));
        appendTitle($(parent).children('.reward-title-area'));
        appendRewardDetail($(parent).children('.reward-detail-area'));
        appendRewardRewardOption($(parent).children('.reward-option-area'));
        appendRewardDeliveryAddress($(parent).children('.reward-delivery-address-area'));
        appendRewardDeliveryPrice($(parent).children('.reward-delivery-price-area'));
        appendRewardDeliveryDate($(parent).children('.reward-delivery-date-area'));
    }

    function appendRewardSequence(parent) {
        $(parent).append($('<p/>', {
            class: 'reward-title',
            text: '리워드 정렬순서'
        }));

        $(parent).append($('<input/>', {
            type: 'number',
            style: 'width:200px',
            class: 'simple-text',
            max:'2000000000'
        }));

        $(parent).append($('<p/>', {
            class: 'unit',
            text: '번째'
        }));
    }

    function appendRewardPrice(parent) {
        $(parent).append($('<p/>', {
            class: 'reward-title',
            text: '리워드 금액'
        }));

        $(parent).append($('<input/>', {
            type: 'number',
            class: 'simple-text',
            max:'2000000000'
        }));

        $(parent).append($('<p/>', {
            class: 'unit',
            text: '원'
        }));
    }

    function appendRewardRewardLimit(parent) {
        $(parent).append($('<p/>', {
            class: 'reward-title',
            text: '리워드 제한수량'
        }));

        $(parent).append($('<input/>', {
            type: 'number',
            class: 'simple-text',
            max:'2000000000'
        }));

        $(parent).append($('<p/>', {
            class: 'unit',
            text: '개'
        }));
    }

    function appendTitle(parent) {
        $(parent).append($('<p/>', {
            class: 'reward-title',
            text: '리워드 제목'
        }));

        $(parent).append($('<input/>', {
            type: 'text',
            style: 'text-align:left;',
            maxLength: '20',
            class: 'simple-text',
        }));

        $(parent).append($('<p/>', {
            class: 'textLimit',
            text: '0/20'
        }));
    }

    function appendRewardDetail(parent) {
        $(parent).append($('<p/>', {
            class: 'reward-title',
            text: '리워드 설명',
            style: 'vertical-align:top'
        }));

        $(parent).append($('<textarea/>', {
            contentEditable: true,
            style: 'text-align:left;',
            maxLength: '60',
            class: 'reward-detail',
        }));

        $(parent).append($('<p/>', {
            class: 'textLimit',
            text: '0/60',
            style: 'vertical-align:bottom'
        }));
    }

    function appendRewardRewardOption(parent) {
        $(parent).append($('<p/>', {
            class: 'reward-title',
            text: '리워드 옵션'
        }));

        $(parent).append($('<div/>', {
            class: 'reward-option-detail-area'
        }));

        var optionDetailArea = $(parent).children('.reward-option-detail-area');

        $(optionDetailArea).append($('<div/>', {
            class: 'reward-option-select'
        }));

        var optionSelect = $(optionDetailArea).children('.reward-option-select');

        $(optionSelect).append($('<label/>', {
            class: 'reward-option-select-btn reward-option-label',
            text: '선택형'
        }));

        $(optionSelect).append($('<p/>', {
            class: 'assist',
            text: '색상, 사이즈 등 선택할 수 있는 옵션이 있다면 추가해주세요.',
            style: 'display:inline-block'
        }));

        $(optionSelect).append($('<div/>', {
            class: 'reward-option-select-hidden',
        }));

        var optionSelectHidden = $(optionSelect).children('.reward-option-select-hidden');

        $(optionSelectHidden).append($('<input/>', {
            type: 'text',
            maxLength: '60',
            class: 'reward-option-text'
        }));

        $(optionSelectHidden).append($('<button/>', {
            type: 'button',
            style: 'width:50px; height:25px; margin-left:3px; vertical-align:middle;',
            class: 'reward-btn-ok reward-option-add',
            text: '추가'
        }));

        $(optionSelectHidden).append($('<ul/>', {
            class: 'reward-option-ul select-ul',
        }));


        $(optionDetailArea).append($('<div/>', {
            class: 'reward-option-input'
        }));

        var optionInput = $(optionDetailArea).children('.reward-option-input');

        $(optionInput).append($('<label/>', {
            class: 'reward-option-input-btn reward-option-label',
            text: '입력형'
        }));

        $(optionInput).append($('<p/>', {
            class: 'assist',
            text: '각인 등 사용자에게 추가 정보를 입력받아야 한다면 추가해주세요!',
            style: 'display:inline-block'
        }));

        $(optionInput).append($('<div/>', {
            class: 'reward-option-select-hidden'
        }));

        var optionInputHidden = $(optionInput).children('.reward-option-select-hidden');

        $(optionInputHidden).append($('<input/>', {
            type: 'text',
            maxLength: '60',
            class: 'reward-option-text'
        }));

        $(optionInputHidden).append($('<button/>', {
            type: 'button',
            style: 'width:50px; height:25px; vertical-align:middle; margin-left:3px; margin-right:3px;',
            class: 'reward-btn-ok reward-option-add',
            text: '추가'
        }));

        $(optionInputHidden).append($('<ul/>', {
            class: 'reward-option-ul input-ul'
        }));



    }

    function appendRewardDeliveryAddress(parent) {
        $(parent).append($('<p/>', {
            class: 'reward-title',
            text: '배송지 여부'
        }));

        $(parent).append($('<label/>', {
            for: 'need-delivery-address',
            class: 'reward-delivery',
            text: '필요함'
        }));

        $(parent).append($('<label/>', {
            for: 'needless-delivery-address',
            class: 'reward-delivery',
            text: '필요없음'
        }));

        $(parent).append($('<input/>', {
            type: 'hidden',
            name: 'needDelivery',
            value: '0'
        }));


    }

    function appendRewardDeliveryPrice(parent) {
        $(parent).append($('<p/>', {
            class: 'reward-title',
            text: '배송비'
        }));

        $(parent).append($('<input/>', {
            type: 'number',
            class: 'simple-text',
            style: 'width:120px;',
            max:'2000000000'
        }));

        $(parent).append($('<p/>', {
            class: 'unit',
            text: '원'
        }));
    }

    function appendRewardDeliveryDate(parent) {
        $(parent).append($('<p/>', {
            class: 'reward-title',
            text: '예상 배송일'
        }));

        $(parent).append($('<p/>', {
            class: 'unit',
            text: '프로젝트 성공 시'
        }));

        $(parent).append($('<input/>', {
            type: 'number',
            class: 'simple-text',
            style: 'width:120px;',
            max:'30'
        }));

        $(parent).append($('<p/>', {
            class: 'unit',
            text: '일 이후부터'
        }));

        $(parent).append($('<input/>', {
            type: 'number',
            class: 'simple-text',
            style: 'width:120px;',
            max:'60'
        }));

        $(parent).append($('<p/>', {
            class: 'unit',
            text: '일 내에 배송됩니다.'
        }));
    }


    // 리워드 관리하는 버튼 만드는거(저장삭제)
    function appendRewardRewardBtn(rewardContent, index) {
        var hide = $(rewardContent).children('.reward-content-hide');

        $(hide).append($('<div/>', {
            class: 'btn-area'
        }));

        $(hide).children('.btn-area').append($('<button/>', {
            type: 'button',
            class: 'reward-content-reward-btn-ok reward-btn-ok',
            style:'margin-right:5px;',
            text: '저장'
        }));

        $(hide).children('.btn-area').append($('<button/>', {
            type: 'button',
            class: 'reward-content-reward-btn-delete reward-btn-cancel',
            text: '삭제'
        }));
    }

    // 리워드 리워드 이벤트 영역

    function onBindRewardRewardEvent() {
        onClickRewardOptionLabel();
        onClickNeedDeliveryAddress();
        onBindOptionInput();
        onClickRewardOptionDelete();
        onBindRewardContent();
        onClickRewardOptionDelete();
        onClickRewardOptionLabel();
        onClickRewardSave();
        onClickRewardDelete();
    }
    
    function onClickRewardSave() {
    	$('.reward-content-reward-btn-ok').off('click').on('click', function(e){
    		e.stopPropagation();    		
    		var btn = this;
    		
    		var okCallBack = function() {
    			rewardItemSaveCallback(btn);
    		};
    		
    		confirmBox(okCallBack, function(){}, '저장하시겠습니까?', '메세지', '확인', '취소');
    		
    		});
    }
    
    function rewardItemSaveCallback(btn) {		
    	var updateFlag = $(btn).parent().parent().parent().children('.hidden-data-area').children('.data').val();
    	var itemNo = $(btn).parent().parent().parent().children('.hidden-data-area').children('.itemNo').val();
    	var btnArea = $(btn).parent().parent().parent().children('.hidden-data-area');
    	var selectUl = $(btn).parent().parent().children('.reward-content-reward').children('.reward-option-area').children('.reward-option-detail-area').children('.reward-option-select').children('.reward-option-select-hidden').children('.reward-option-ul');
    	var inputUl = $(btn).parent().parent().children('.reward-content-reward').children('.reward-option-area').children('.reward-option-detail-area').children('.reward-option-input').children('.reward-option-input-hidden').children('.reward-option-ul');
    	var url;

	if (typeof itemNo == "undefined") {
		url = getContextPath() + "/project/reward/iteminsert";
	} else {
		url = getContextPath() + "/project/reward/itemupdate";
	}

	var index = $(btn).parent().parent().parent().prevAll('.reward-content').length;
	
	var rewardItem = rewardItemToJSON(index, itemNo);


	$.ajax({
		url: url,
		type: "POST",
		dataType:"json",
		contentType:"application/json",
		data: JSON.stringify(rewardItem),
		success: function(data){
			console.log(data);
			
			
			if (data.result == 0) {
				alertBox(function(){},'저장  실패','오류','확인');
				return;
			}
			
			alertBox(function(){},'저장되었습니다.','알림','확인');
			
			$(selectUl).children().remove();
			$(inputUl).children().remove();
			
			for (var i = 0; i < data.inputOptionList.length; i++) {
				var inputOption = data.inputOptionList[i];
				appendRewardOption(inputUl, inputOption.content, inputOption.no);
			}
			
			for (var i = 0; i < data.selectOptionList.length; i++) {
				var selectOption = data.selectOptionList[i];
				appendRewardOption(selectUl, selectOption.content, selectOption.no);
			}
			
			
			$(btnArea).append($('<input/>', {
				type:'hidden',
				value:data.itemNo,
				attr:'value:' + data.itemNo,
				class:'itemNo'
			}));
			
			console.log('머하세요??');
			
			if (isValidateRewardItem(rewardItem)) {
				changeRewardHeaderIconComplete($(btnArea).parent().children('.reward-menu-check-icon'));
			} else {
				changeRewardHeaderIconSave($(btnArea).parent().children('.reward-menu-check-icon'));
			}
			
			if (isValidateRewardReward()) {
				console.log('dho?');
				changeRewardHeaderIconComplete($('.reward-menu-check-icon:eq(7)'));
			} else {
				console.log('dho????');
				changeRewardHeaderIconSave($('.reward-menu-check-icon:eq(7)'));
			}
			
		}, error: function(error) {
			console.log('에러');
			console.log(error);
		}
	});
    	
    }
    
    function rewardItemToJSON(index, itemNo) {
    	var rewardItem = {};
    	var lastIndex = location.href.lastIndexOf('/');
    	var rewardNo = location.href.substr(lastIndex + 1);
    	
    	
    	rewardItem.rewardNo = rewardNo;
    	rewardItem.no = itemNo;
    	rewardItem.index = $('.reward-subcontents .reward-content:eq(' + index + ') .reward-sequence input[type=number]').val();
    	rewardItem.price = $('.reward-subcontents .reward-content:eq(' + index + ') .reward-price-area input[type=number]').val();
    	rewardItem.maxNum = $('.reward-subcontents .reward-content:eq(' + index + ') .reward-reward-limit-area input[type=number]').val();
    	rewardItem.name = $('.reward-subcontents .reward-content:eq(' + index + ') .reward-title-area input[type=text]').val();
    	rewardItem.introduce = $('.reward-subcontents .reward-content:eq(' + index + ') .reward-detail-area textarea').val();
    	
    	if (typeof $('.reward-subcontents .reward-content:eq(' + index + ') .reward-delivery-address-area input[type=hidden]').val() != "undefined") {
    		rewardItem.needAddress = $('.reward-subcontents .reward-content:eq(' + index + ') .reward-delivery-address-area input[type=hidden]').val();
    	}
    	
    	rewardItem.deliveryPrice = $('.reward-subcontents .reward-content:eq(' + index + ') .reward-delivery-price-area input[type=number]').val();
    	rewardItem.deliveryStart = $('.reward-subcontents .reward-content:eq(' + index + ') .reward-delivery-date-area input[type=number]:eq(0)').val();
    	rewardItem.deliveryEnd = $('.reward-subcontents .reward-content:eq(' + index + ') .reward-delivery-date-area input[type=number]:eq(1)').val();
    	rewardItem.selectOptionList = rewardItemSelectOptionListToJSON(index, rewardNo);
    	rewardItem.inputOptionList = rewardItemInputOptionListToJSON(index, rewardNo);
    	
    	return rewardItem;
    }
    
    function rewardItemSelectOptionListToJSON(index, rewardNo) {
    	var pList = $('.reward-subcontents .reward-content:eq(' + index + ')' + ' .select-ul .assist-inline');
    	
    	var rewardItemSelectOptionList = [];
    	
    	for (var i = 0; i < pList.length; i++) {
    		var pTag = pList[i];
    		var selectNo = $('.reward-subcontents .reward-content:eq(' + index + ')' + ' .input-ul li:eq(' + i + ') .selectOptionNo').val();
    		
    		if (typeof selectNo == "undefined") {
    			selectNo = 0;
    		}
    		
    		var rewardItemSelectOption = {};
    		rewardItemSelectOption.rewardNo = rewardNo;
    		rewardItemSelectOption.content = $(pTag).html();
    		rewardItemSelectOption.no = selectNo;
    		rewardItemSelectOptionList.push(rewardItemSelectOption);
    	}
    	
    	return rewardItemSelectOptionList;
    }
    
    function rewardItemInputOptionListToJSON(index, rewardNo) {
    	
    	var pList = $('.reward-subcontents .reward-content:eq(' + index + ')' + ' .input-ul .assist-inline');
    	
    	var rewardItemInputOptionList = [];
    	
    	for (var i = 0; i < pList.length; i++) {
    		var pTag = pList[i];
    		var inputNo = $('.reward-subcontents .reward-content:eq(' + index + ')' + ' .input-ul li:eq(' + i + ') .inputOptionNo').val();
    		
    		if (typeof inputNo == "undefined") {
    			inputNo = 0;
    		}
    		
    		var rewardItemInputOption = {};
    		rewardItemInputOption.rewardNo = rewardNo;
    		rewardItemInputOption.content = $(pTag).html();
    		rewardItemInputOption.no = inputNo;
    		rewardItemInputOptionList.push(rewardItemInputOption);
    	}
    	
    	return rewardItemInputOptionList;
    }
    
    
    function isValidateRewardItem(data) {
    	
    }
    

    function onClickRewardDelete() {
        $('.reward-content-reward-btn-delete').off('click').on('click', function(e){
            e.stopPropagation();
            var updateFlag = $(this).parent().parent().parent().children('.hidden-data-area').children('.data').val();
            var itemNo = $(this).parent().parent().parent().children('.hidden-data-area').children('.itemNo').val();
            var btn = this;
            
            var removeEffect = function() {
                $(btn).parents('.reward-content').trigger('click');
                $(btn).parents('.reward-content').fadeOut(500, function(e){
                    var prev = $(this).prev();
                    $(this).remove();
                    
                    if ($(prev).attr('class') == "reward-content-line") {
                        
                        $(prev).remove();
                    }
                    
					if (isValidateRewardReward()) {
						changeRewardHeaderIconComplete($('.reward-menu-check-icon:eq(7)'));
					}
                });
            }
            
            var okCallback = function(){
            	if (typeof itemNo == "undefined") {
            		removeEffect();
            	} else {
        			$.ajax({
        				url: getContextPath() + '/project/reward/itemdelete',
        				type: "POST",
        				dataType:"text",
        				contentType:"application/json",
        				data: itemNo,
        				success: function(result){
        					console.log(result);
        					
        					alertBox(removeEffect,'삭제가 완료되었습니다.','알림','확인');
        					
        				}
        			});
            	}
            }
            
            confirmBox(okCallback, function(){}, '저장하기를 누르지 않아도 바로 반영됩니다. 정말 삭제하시겠습니까?','메세지', '확인', '취소');
            

     
        });
    }

    // 리워드 내용에 대한 이벤트
    function onBindRewardContent() {
        $('.reward-detail').off('click').on('click', function (e) {
            e.stopPropagation();
        });

        $('.reward-detail').off('keyup input keydown').on('keyup input keydown', function (e) {
            var textLimit = $(this).parent().children('.textLimit');
            $(textLimit).text($(this).val().length + '/' + $(this).attr('maxLength'));
            
            
            changeRewardHeaderIcon($(this).parent().parent().parent().parent().children('.reward-menu-check-icon'));        
            changeRewardHeaderIcon();
        });
    }

    // 배송지 설정 여부 이벤트
    function onClickNeedDeliveryAddress() {
        $('.reward-delivery').off('click').on('click', function (e) {
            e.stopPropagation();

            var parent = $(this).parent();

            $(parent).children('label').removeClass('reward-delivery-active');
            $(this).addClass('reward-delivery-active');
            $(parent).children('input[type=hidden]').val($(this).prevAll().length);
            
            if (typeof $(this).parent().parent().parent().parent().children('.reward-menu-check-icon') != 'undefined') {
            	changeRewardHeaderIcon($(this).parent().parent().parent().parent().children('.reward-menu-check-icon'));
            }
            
            changeRewardHeaderIcon();

        });

    }

    // 추가옵션 보이고 안보이고 이벤트
    function onClickRewardOptionLabel() {
        $('.reward-option-label').off('click').on('click', function (e) {
            e.stopPropagation();
            console.log('왜그러세요?');
            $(this).toggleClass('reward-option-label-active');
            $(this).next().next().slideToggle(250);
        });
    }

    // 옵션 입력이벤트 바인드
    function onBindOptionInput() {
        $('.reward-option-text').off('keyup').on('keyup', function (e) {
            if (e.key == "Enter") {
                console.log($(this).val());

                var ulist = $(this).parent().children('.reward-option-ul');
                appendRewardOption(ulist, $(this).val());
                $(this).val('');
                
         
                if (typeof $(this).parent().parent().parent().parent().parent().parent().parent().children('.reward-menu-check-icon') != 'undefined') {
                	changeRewardHeaderIcon($(this).parent().parent().parent().parent().parent().parent().parent().children('.reward-menu-check-icon'));
                }
                
                changeRewardHeaderIcon();
            }
        });

        $('.reward-option-add').off('click').on('click', function (e) {
            e.stopPropagation();

            var ulist = $(this).parent().children('.reward-option-ul');
            appendRewardOption(ulist, $(this).prev().val());
            $(this).prev().val('');
            
            if (typeof $(this).parent().parent().parent().parent().parent().parent().parent().parent().parent().children('.reward-menu-check-icon') != 'undefined') {
            	changeRewardHeaderIcon($(this).parent().parent().parent().parent().parent().parent().parent().parent().parent().children('.reward-menu-check-icon'));
            }
            
            changeRewardHeaderIcon();
        });
    }
    
    

    // 리워드 옵션 추가하는 함수
    function appendRewardOption(ul, text, optionNo) {
        $(ul).append($('<li/>'));
        var li = $(ul).children('li:eq(' + ($(ul).children().length - 1) + ')');

        if (typeof itemNo != "undefined") {
            $(li).append($('<input/>', {
            	type:'hidden',
                class: 'optionNo',
                value: optionNo
            }));
        }
        
        $(li).append($('<p/>', {
            class: "assist-inline",
            text: text
        }));

        $(li).append($('<button/>', {
            type: 'button',
            class: "reward-btn-cancel reward-option-delete",
            text: '삭제',
            style: 'vertical-align:middle; width:45px; height:20px;'
        }));

        onClickRewardOptionDelete();
    }

    // 리워드 옵션지우는 ㅇ벤트

    function onClickRewardOptionDelete() {
        $('.reward-option-delete').off('click').on('click', function (e) {
            e.stopPropagation();
            
            if (typeof $(this).parent().parent().parent().parent().parent().parent().parent().parent().parent().children('.reward-menu-check-icon') != 'undefined') {
            	changeRewardHeaderIcon($(this).parent().parent().parent().parent().parent().parent().parent().parent().parent().children('.reward-menu-check-icon'));
            }
            
            changeRewardHeaderIcon();
            
            $(this).parent().remove();
        });
    }

    // 리워드 컨텐트들 ㅇ벤트

    function onBindRewardContentEvent() {
        onClickRewardContent();
        onClickRewardContentReward();
        onBindRewardContentChild();
        setRewardDeadline();
    }

    function onBindRewardContentChild() {
        $('.reward-content input').off('click').on('click', function (e) {
            e.stopPropagation();
        });
    }
    
    function onClickRewardContentReward() {
    	$('.reward-content-reward').off('click').on('click', function(e){
    		e.stopPropagation();
    	})
    }

    function onClickRewardContent() {
        $('.reward-content').off('click').on('click', function (e) {
            var child = $(this).children();

            $(child[0]).toggleClass('icon-lower-arrow');
            $(child[child.length - 1]).slideToggle(250);
            $(this).toggleClass('reward-content-active');
            
            try {
            	if ($(this).attr('class').indexOf('reward-subcontents') != -1 || $(this).parent().next().attr('class').indexOf('reward-subcontents') == -1) {
            		return;
            	}
            }catch (e){
            	return;
            }
            
            if ($(this).nextAll().length != 0) {
            	return;
            }

            var nextSiblings = $(this).parent().nextAll();

            for (var i = 0; i < nextSiblings.length; i++) {
                var nextClass = $(nextSiblings[i]).attr('class');
                if (nextClass.indexOf("reward-subcontents") != -1) {
                    $(nextSiblings).children().toggleClass('all-opacity');
                    $(nextSiblings[i]).slideToggle(250);
                }
            }
        });
        
        $('.radiolabel').off('click').on('click', function(e){
        	e.stopPropagation();
        	
        	$('.radiolabel span').removeClass('checked');
        	$('.radiolabel span').addClass('unchecked');
        	$(this).children('span').removeClass('unchecked');
        	$(this).children('span').addClass('checked');
        	
        	$('.pre-open-area > input[type=hidden]').val(($(this).prevAll().length / 2) ^ 1);
        	
        	changeRewardHeaderIcon();
        });
    }
    
    function setRewardDeadline() {
    	var curDate = new Date();
    	var year = curDate.getYear() + 1900;
    	var month = curDate.getMonth() + 1;
    	var date = curDate.getDate();
    	
    	if (month < 10) {
    		month = "0" + month;
    	}
    	
    	if (date < 10) {
    		date = "0" + date;
    	}

    	$('#rewardDeadline').val(year + '-' + month + '-' + date);
    	$('#rewardDeadline').attr('min',year + '-' + month + '-' + date);
    	curDate.setDate(45);
    	year = curDate.getYear() + 1900;
    	month = curDate.getMonth() + 1;
    	date = curDate.getDate();
    	
    	if (month < 10) {
    		month = "0" + month;
    	}
    	
    	if (date < 10) {
    		date = "0" + date;
    	}
    	
    	$('#rewardDeadline').attr('max',year + '-' + month + '-' + date);
    }



    // 메뉴이벤트 영역
    function onBindRewardMenuEvent() {
        onClickRewardMenu();

        $('.reward-menu > li:eq(0)').trigger('click');
    }


    function onClickRewardMenu() {
        var allList = $('.reward-menu > li');

        $('.reward-menu > li').off('click').on('click', function (e) {
            e.stopPropagation();

            var ul = $(this).parent();
            var lists = $(this).prevAll();
            var index = lists.length;
            var li = $(this);


            if ($(this).attr('class') != 'list-selected') {
            

                var movePage = function(){
                	var listIndex = $('.list-selected').prevAll().length;
                	$('.reward-menu > li').removeClass();
                	$(li).addClass('list-selected');

                	$('.reward-content-wrapper:eq(' + listIndex + ')').fadeOut(500, function (e) {
                		$('.reward-content-wrapper:eq(' + index + ')').fadeIn(500, function(e){
            
                    	});
                	});
                }
                
            	if ($('.list-selected .reward-menu-no-save').length != 0) {
            		var listlength = $('.list-selected').prevAll().length;
            		
            		if (listlength == 3) {
                		confirmBox(movePage, function(){}, '리워드의 경우 각 항목별로 개별 저장해야 합니다. 저장하지 않고 이동하시겠습니까?','알림','확인','취소');
            		} else {
                		confirmBox(function(){
                			saveReward(getContextPath(), movePage);
                		}, movePage, '현재 탭의 변경사항을 아직 저장하지 않았습니다. 저장하고 이동하시겠습니까?','알림','확인','취소');
            		}		
     
            	} else {
            		movePage();
            	}
            }
        });

    }
    
    // 스토리 영역재정의
    
    

    // 브라우저 판별

    function isIE() {
        var agent = navigator.userAgent.toLocaleLowerCase();

        return (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1);
    }

    function isEdge() {
        var agent = navigator.userAgent.toLocaleLowerCase();

        return agent.indexOf('edge/') != -1;
    }


    // 파일 읽는 함수

    function readFile(file, callback) {
        var fileReader = new FileReader();

        fileReader.readAsDataURL(file);

        fileReader.onload= function(e) {
            var result = e.target.result;
            
            console.log(result);
            console.log('이거까진 함');
            
            if (typeof callback == "function") {
                callback(result);
            }
        }
    }

    function getExt(fileName) {
        var index = fileName.lastIndexOf('.');

        if (index == -1) {
            return '';
        }

        return fileName.substr(index + 1, fileName.length);
    }

    function isExcessFileCapacity(file){
        console.log(file.size);

        return file.size < 1024 * 8 * 1024 * 10 * 1024;
    }

    function isImage(fileExt) {
        return fileExt.indexOf('.png') != -1 || fileExt.indexOf('.jpg') != -1 || fileExt.indexOf('.bmp') != -1
    }
    
    function isMp4(fileExt) {
    	return fileExt.indexOf('.mp4') != -1;
    }
    
    
    