/**
 * 
 */

var TextEditor = function (parentNode, callback) {
    var global_baseNode;
    var global_baseOffset;
    var global_extendNode;
    var global_extendOffset;
    const global_rgbColor = [[0, 0, 1], [-1, 0, 0], [0, 1, 0], [0, 0, -1], [1, 0, 0], [0, -1, 0]]; // 바의 위치를 계산해서 어느 색성분을 빼고 더할지의 값 -1 0 1 로 구성된 배열.
    const global_curRgbColor = [[1, 0, 0], [1, 0, 1], [0, 0, 1], [0, 1, 1], [0, 1, 0], [1, 1, 0]]; //바 위치에 따른 현재 컬러.


    if (typeof parentNode != "undefined") {
        console.log('.안녕?')
        if (typeof $('.text-editor-wrapper') == "undefined") {
        	

        $(parentNode).prepend($('<div/>', {
            class: 'text-editor-wrapper'
        }));
        var textEditWrapper = $('.text-editor-wrapper');

        console.log(textEditWrapper);

        $(textEditWrapper).append($('<div/>', {
            class: 'text-editor-select-wrapper',
            id: 'text-editor-fontsize-option'
        }));

        $('#text-editor-fontsize-option').append($('<input/>', {
            type: 'text',
            style: 'width:120px;',
            class: "text-editor-select-input"
        }));



        $('#text-editor-fontsize-option').append($('<div/>', {
            class: "text-editor-select-button"
        }));

        $('#text-editor-fontsize-option').append($('<ul/>', {
            class: "text-editor-select-option",
            html: '<li style="font-size:10pt;">10</li><li style="font-size:12pt;">12</li><li style="font-size:14pt;">14</li><li style="font-size:16pt;">16</li><li style="font-size:20pt;">20</li><li style="font-size:24pt;">24</li><li style="font-size:32pt;">32</li><li style="font-size:40pt;">40</li><li style="font-size:48pt;">48</li><li style="font-size:60pt;">60</li><li style="font-size:72pt;">72</li>'
        }));

        $(textEditWrapper).append($('<div/>', {
            class: 'text-editor-select-wrapper',
            id: 'text-editor-font-option'
        }));

        
        $('#text-editor-font-option').append($('<input/>', {
            type:'text',
            style:'width:120px',
            class:'text-editor-select-input',
            disabled:'true'
        }));

        $('#text-editor-font-option').append($('<div/>', {
            class: "text-editor-select-button"
        }));

        $('#text-editor-font-option').append($('<ul/>', {
            class: "text-editor-select-option"
        }));

        $('#text-editor-font-option .text-editor-select-option').append($('<li/>', {
            style:'font-family:Arial',
            html:'Arial'
        }));

        $('#text-editor-font-option .text-editor-select-option').append($('<li/>', {
            style:'font-family:Arial Black',
            html:'Arial Black'
        }));

        $('#text-editor-font-option .text-editor-select-option').append($('<li/>', {
            style:'font-family:Comic sans ms',
            html:'Comic sans ms'
        }));

        $('#text-editor-font-option .text-editor-select-option').append($('<li/>', {
            style:'font-family:Courier New',
            html:'Courier New'
        }));

        $('#text-editor-font-option .text-editor-select-option').append($('<li/>', {
            style:'font-family:Helvetica',
            html:'Helvetica'
        }));

        $('#text-editor-font-option .text-editor-select-option').append($('<li/>', {
            style:'font-family:Impact',
            html:'Impact'
        }));

        $('#text-editor-font-option .text-editor-select-option').append($('<li/>', {
            style:'font-family:굴림',
            html:'굴림'
        }));

        $('#text-editor-font-option .text-editor-select-option').append($('<li/>', {
            style:'font-family:굴림체',
            html:'굴림'
        }));

        $('#text-editor-font-option .text-editor-select-option').append($('<li/>', {
            style:'font-family:궁서',
            html:'궁서'
        }));

        $('#text-editor-font-option .text-editor-select-option').append($('<li/>', {
            style:'font-family:돋움',
            html:'돋움'
        }));

        $('#text-editor-font-option .text-editor-select-option').append($('<li/>', {
            style:'font-family:돋움체',
            html:'돋움체'
        }));

        $(textEditWrapper).append($('<button/>', {
            class: 'text-editor-button',
            id: 'text-edit-bold',
            style: 'font-weight:bold;',
            html:'B'+ '<input type="hidden" value="bold">'
        }));

        $(textEditWrapper).append($('<button/>', {
            class: 'text-editor-button',
            id: 'text-edit-underline',
            style: 'text-decoration: underline;',
            html:'U'+ '<input type="hidden" value="Underline">'
        }));

        $(textEditWrapper).append($('<button/>', {
            class: 'text-editor-button',
            id: 'text-edit-Italic',
            style: 'font-style:Italic;',
            html:'I'+ '<input type="hidden" value="Italic">'
        }));

        $(textEditWrapper).append($('<button/>', {
            class: 'text-editor-button',
            id: 'text-edit-strike',
            style: 'text-decoration: line-through;',
            html:'S'+ '<input type="hidden" value="strikeThrough">'
        }));

        $(textEditWrapper).append($('<span/>',{
            id:'pallete-wrapper',
            style:'position:relative; text-align:left;'
        }));

        $('#pallete-wrapper').append($('<button/>', {
            class: 'text-editor-button-type2',
            id: 'text-edit-color',
            html:'A'+ '<input type="hidden" value="strikeThrough">'
        }));

        $(textEditWrapper).append($('<button/>', {
            class: 'text-editor-button-type2',
            id: 'text-edit-backgroundColor',             style: 'text-decoration: line-through;',
            html:'A'+ '<input type="hidden" value="strikeThrough">'
        }));

        $(textEditWrapper).append($('<button/>', {
            class: 'text-editor-imageupload',
            id: 'text-edit-imageupload',
            html:'S<input type="hidden" value="superscript"><input type="file" id="text-editor-imageupload" style="display:none;">'
        }));


        $('#pallete-wrapper').append($('<div/>', {
            class: 'text-editor-color-pallete-wrapper',
            style: 'display:none; left:0px;'
        }));

        $('.text-editor-color-pallete-wrapper').append($('<div/>',{
           class:'text-editor-color-pallete' 
        }));

        
        $('.text-editor-color-pallete').append($('<div/>',{
           class:'text-editor-color-pallete2' 
        }));

        $('.text-editor-color-pallete2').append($('<div/>',{
           class:'text-editor-color-dot' 
        }));

        $('.text-editor-color-pallete-wrapper').append($('<div/>',{
           class:'text-editor-color-pallete-bar' 
        }));

        $('.text-editor-color-pallete-bar').append($('<div/>',{
           class:'text-editor-color-pallete-bar-select' 
        }));

        $('.text-editor-color-pallete-bar').append($('<div/>',{
           class:'text-editor-color-pallete-progress' 
        }));

        $('.text-editor-color-pallete-wrapper').append($('<div/>',{
           class:'text-editor-color-wrapper' 
        }));

        $('.text-editor-color-wrapper').append($('<div/>',{
           class:'text-editor-color',
           style:'background-color:rgba(255,255,255,1)'
        }));

        $(textEditWrapper).append($('<div/>',{
            class:'text-editor-content',
            contentEditable:true
        }));
        }
    }





    var onClickTextEditColor = function (callback) {
        $('.text-editor-color').off('click').on('click', function (e) {
            e.stopPropagation();

            if (typeof callback == "function") {
                callback(getColor());
                $(this).parent().parent().slideToggle(250);
            }
        });
    };
    
    function appendUploadImage(url) {
    	console.log('정신좀차려라...');
        document.execCommand('insertImage', false, url);
    }


    var onClickImageUpload = function (callback) {
        var appendImage = function (url) {
        	console.log(getSelection());
            appendUploadImage(url);
        }

        $('#text-edit-imageupload').on('click', function (e) {
            e.stopPropagation();
            console.log('안녕?');
            $('#text-editor-imageupload').trigger('click');
        });

        $('#text-editor-imageupload').on('click', function (e) {
            e.stopPropagation();
        })

        $('#text-editor-imageupload').on('change', function (e) {
            var fileFakePath = $(this).val();

            console.log(fileFakePath);

            
            if (!isImage(fileFakePath)) {
                alertBox(function(){},'확장자가 jpg, png, bmp인 이미지 파일만 업로드 가능합니다!','알림', '확인');
                return;
            }

            console.log(typeof callback);
            console.log(callback);
            console.log('왜전달안받음?');
            if (typeof callback == "function") {
            	callback($(this)[0].files[0]);
            	return;
            }

            readFile($(this)[0].files[0], appendImage);
        });
    }




    //텍스트 에디터에 대한 바인딩

    var onBindTextEditorContent = function () {
        $('.text-editor-content').off('click').on('click', function (e) {
            e.stopPropagation();
            setGlobalWindowSelection();
            setWindowSelection();
        });

        $('.text-editor-content').off('keyup').on('keyup', function (e) {
            
            setGlobalWindowSelection();
            setWindowSelection();
            replaceFontTag();
        });

        $('.text-editor-content').on('input', function (e) {
            console.log('엣지에서 너ㅡㄴㄴ?');
            setGlobalWindowSelection();
            setWindowSelection();
            
            console.log($(this).val());
            console.log($(this).text());
            console.log($(this).html());
            console.log($(this).children());
            console.log($(this));
            console.log(this.childNodes);
        });
        
        $('.text-editor-wrapper').on('click', function(e){
        	e.stopPropagation();
        });
        
        $('.text-editor-select-wrapper').on('click', function(e){
        	e.stopPropagation();
        });
    }

    //셀렉바 보이고 안보이는 이벤트
    var onClickTextEditorSelect = function () {
        $('.text-editor-select-button').off('click').on('click', function (e) {
            e.stopPropagation();
            $('.text-editor-select-option').slideUp(250);

            if ($(this).next().css('display') == "none") {
                $(this).next().slideToggle(250);
            }
        });
    }

    //폰트 관련 설정사항.
    var onClickTextEditorSelectOption = function () {
        $('#text-editor-fontsize-option .text-editor-select-option > li').off('click').on('click', function (e) {

            $(this).parent().slideToggle(250);
            $(this).parent().prev().prev().val($(this).text() + 'pt');

            console.log('IE대체 왜이럼?' + $(this).text());

            setFontSize($(this).text() + 'pt');
        });

        $('#text-editor-font-option .text-editor-select-option > li').off('click').on('click', function (e) {
            e.stopPropagation();

            $(this).parent().slideToggle(250);
            $(this).parent().prev().prev().val($(this).text());

            $(this).parent().prev().prev().css('font-family', $(this).text());

            setFontFamily($(this).text());
        });
    }

    var onClickTextEditorColor = function () {
        $('#text-edit-color').on('click', function (e) {
            e.stopPropagation();
            $('.text-editor-select-option').slideUp(250);
            var left = $('.text-editor-color-pallete-wrapper').css('left').replace("px", "");
            var display = $('.text-editor-color-pallete-wrapper').css('display');

            var callback = function (color) {
                setWindowSelection();
                document.execCommand('foreColor', false, color);
                console.log(window.getSelection());
            }

            onClickTextEditColor(callback);

            if (left > 30) {
                $('.text-editor-color-pallete-wrapper').css('left', '0px');
                if (display == "none") {
                    $('.text-editor-color-pallete-wrapper').slideToggle(250);
                }
            } else {
                $('.text-editor-color-pallete-wrapper').slideToggle(250);
            }


        });
    }

    var onClickTextEditorBackground = function () {
        $('#text-edit-backgroundColor').on('click', function (e) {
            e.stopPropagation();
            $('.text-editor-select-option').slideUp(250);
            var left = $('.text-editor-color-pallete-wrapper').css('left').replace("px", "");
            var display = $('.text-editor-color-pallete-wrapper').css('display');

            var callback = function (color) {
                setWindowSelection();
                document.execCommand('backColor', false, color);
            }

            onClickTextEditColor(callback);
            if (left > 30) {
                $('.text-editor-color-pallete-wrapper').slideToggle(250);
            } else {
                $('.text-editor-color-pallete-wrapper').css('left', '36px');
                if (display == "none") {

                    $('.text-editor-color-pallete-wrapper').slideToggle(1000);
                }
            }
        });
    }

    //폰트 크기 설정하는 이벤트
    function setFontSize(fontSize) {
        if (typeof global_baseNode == "undefined") {
            console.log('너 혹시 항상 여기로오니?');
            $('.text-editor-content').focus();
            setWindowSelection();
            console.log(document.execCommand('fontsize', false, fontSize));
            return;
        }
        console.log(window.getSelection());
        setWindowSelection();
        console.log(window.getSelection());
        document.execCommand('fontsize', false, fontSize);

        replaceFontTag();
    }


    //폰트 설정
    function setFontFamily(fontFamily) {
        if (typeof global_baseNode == "undefined") {
            console.log('너 혹시 항상 여기로오니?');
            $('.text-editor-content').focus();
            setWindowSelection();
            document.execCommand('fontName', true, fontFamily);
            return;
        }

        setWindowSelection();
        document.execCommand('fontName', true, fontFamily);

        replaceFontTag();
    }

    //윈도우 셀렉터의 범위를 전역 변수에 ㅈ장.
    function setGlobalWindowSelection() {
        var ss = window.getSelection();
        global_baseNode = ss.baseNode;
        global_baseOffset = ss.baseOffset;
        global_extendNode = ss.extentNode;
        global_extendOffset = ss.extentOffset;
    }

    //윈도우 셀렉터의 범위를 이전에 입력했던 텍스트 에디터 콘텐트로 바꿈.
    function setWindowSelection() {
        try {
            document.getSelection().setBaseAndExtent(global_baseNode, global_baseOffset, global_extendNode, global_extendOffset);
            //window.getSelection().getRangeAt(0).setStart(global_baseNode, global_baseOffset);
            //window.getSelection().getRangeAt(0).setEnd(global_extendNode, global_extendOffset);  
        } catch (error) {

        }
    }


    //font태그를 지우고 span태그로 바꿈
    function replaceFontTag() {
        var fontTags = $('font');

        for (var i = 0; i < fontTags.length; i++) {
            var fontTag = fontTags[i];
            var size = $(fontTag).attr('size');
            var face = $(fontTag).attr('face');
            var color = $(fontTag).attr('color');

            if (typeof size != "undefined") {
                $(fontTag).css('font-size', $('#text-editor-fontsize-option .text-editor-select-input').val());
                $(fontTag).removeAttr('size');
            }

            if (typeof face != "undefined") {
                $(fontTag).css('font-family', face);
                $(fontTag).removeAttr('face');
            }

            if (typeof color != "undefined") {
                $(fontTag).attr('style', 'color:' + color + ';');
            }

            fontTag.outerHTML = (fontTag.outerHTML.replace('<font', '<span').replace('</font>', '</span>'));
            setWindowSelection();
        }
    }

    var onBindTextEditorButton = function () {
        $('.text-editor-button').on('click', function (e) {
            e.stopPropagation();
            document.execCommand($(this).children().val());
        });
    }

    //색설정하는 동그라미 움직이는 이벤트

    var onBindPalleteDot = function () {
        var prevOffsetX;
        var prevOffsetY;
        var curOffsetX;
        var curOffsetY;
        var subX;
        var subY;

        $('.text-editor-color-dot').on('dragstart', function (e) {
            prevOffsetX = e.offsetX;
            prevOffsetY = e.offsetY;
        });

        $('.text-editor-color-dot').on('drag', function (e) {
            curOffsetX = e.offsetX;
            curOffsetY = e.offsetY;

            subX = curOffsetX - prevOffsetX;
            subY = curOffsetY - prevOffsetY;

            prevOffsetX = curOffsetX;
            prevOffsetY = curOffsetY;

            console.log(subX);
            console.log(subY);

            $(this).css({
                'top': Number($(this).css('top').replace("px", "")) + (subX),
                'left': Number($(this).css('left').replace("px", "")) + (subY)
            });
        });
    }
    //색설정하는 동그라미 움직이는 이벤트
    var onClickPallete = function () {
        var prevX = 0;
        var prevY = 0;

        $('.text-editor-color-pallete2').on('dragstart', function (e) {
            prevX = e.offsetX;
            prevY = e.offsetY;
        });

        $('.text-editor-color-pallete2').on('drag', function (e) {
            e.stopPropagation();

            var curX = e.offsetX;
            var curY = e.offsetY;

            console.log(prevX);
            console.log(prevY);

            if (curX < -3 || curX > 147) {
                curX = prevX;
            }

            if (curY < -3 || curY > 147) {
                curY = prevY;
            }

            prevX = curX;
            prevY = curY;
            $('.text-editor-color-dot').css({
                'top': prevY,
                'left': prevX
            });

            getColor();
        });

        $('.text-editor-color-pallete2').on('click', function (e) {
            e.stopPropagation();
            $('.text-editor-color-dot').css('left', e.offsetX - 3);
            $('.text-editor-color-dot').css('top', e.offsetY - 3);

            var curX = e.offsetX;
            var curY = e.offsetY;
            getColor();
        });
    }

    var onDragPalleteBar = function () {
        var prevX = 0;
        var prevY = 0;
        $('.text-editor-color-pallete-bar').on('dragstart', function (e) {
            prevX = e.offsetX;
            prevY = e.offsetY;
        });

        $('.text-editor-color-pallete-bar').on('drag', function (e) {
            var curX = e.offsetX;
            var curY = e.offsetY;

            if (curY < -3 || curY > 147) {
                curY = prevY;
            }
            prevY = curY;

            $('.text-editor-color-pallete-bar-select').css({
                'top': prevY
            });

            getColor();
        });

        $('.text-editor-color-pallete-bar').on('click', function (e) {
            e.stopPropagation();
            e.stopImmediatePropagation();
            prevY = e.offsetY;

            $('.text-editor-color-pallete-bar-select').css({
                'top': prevY - 3
            });

            getColor();
        });
    }

    function getColor() {
        var selectbarTop = Number($('.text-editor-color-pallete-bar-select').css('top').replace("px", ""));
        var dotTop = Number($('.text-editor-color-dot').css('top').replace("px", ""));
        var dotLeft = Number($('.text-editor-color-dot').css('left').replace("px", ""));
        var dotTopRate = Math.round(dotTop * 100 / 150);
        var dotLeftRate = Math.round(dotLeft * 100 / 150);
        var rgbIndex = Math.floor((selectbarTop + 3) / 25);
        var rgbRate = (selectbarTop + 3) % 25 * 100 / 25;
        var red = 255 * global_curRgbColor[rgbIndex][0] + rgbRate * global_rgbColor[rgbIndex][0];
        var green = 255 * global_curRgbColor[rgbIndex][1] + rgbRate * global_rgbColor[rgbIndex][1];
        var blue = 255 * global_curRgbColor[rgbIndex][2] + rgbRate * global_rgbColor[rgbIndex][2];
        var realRed = red + (255 - red) * ((100 - dotLeftRate) / 100 * (global_curRgbColor[rgbIndex][0] ^ 1));
        var realGreen = green + (255 - green) * ((100 - dotLeftRate) / 100 * (global_curRgbColor[rgbIndex][1] ^ 1));
        var realBlue = blue + (255 - blue) * ((100 - dotLeftRate) / 100 * (global_curRgbColor[rgbIndex][2] ^ 1));

        realRed *= (100 - dotTopRate) / 100;
        realGreen *= (100 - dotTopRate) / 100;
        realBlue *= (100 - dotTopRate) / 100;

        $('.text-editor-color-pallete').css('background', 'rgba(' + red + ',' + green + ',' + blue + ', 1)');
        $('.text-editor-color').css('background', 'rgba(' + realRed + ',' + realGreen + ',' + realBlue + ', 1)');

        if (realRed > 255) {
            realRed = 255;
        }

        if (realGreen > 255) {
            realGreen = 255;
        }

        if (realBlue > 255) {
            realBlue > 255;
        }

        var result = "#" + Math.round(realRed).toString(16) + Math.round(realGreen).toString(16) + Math.round(realBlue).toString(16);

        return result;
    }

    //파일리더로 파일을 읽음.
    function readFile(file, callback) {
        var fileReader = new FileReader();

        fileReader.readAsDataURL(file);
        fileReader.onload = function (e) {
            var src = e.target.result;

            if (typeof callback == "function") {
                callback(src);
            }
        }
    }

    //파일 확장자 얻기
    function getExt(fileFakePath) {
        var index = fileFakePath.lastIndexOf('.');

        return fileFakePath.substr(index + 1);
    }

    //파일이 이미지인지?
    function isImage(fileFakePath) {
        var ext = getExt(fileFakePath);

        return ext == "jpg" || ext == "png" || ext == "bmp";
    }

    onBindTextEditorButton();
    onClickTextEditorSelect();
    onClickTextEditorSelectOption();
    onBindTextEditorContent();
    onClickImageUpload(callback);
    onBindPalleteDot();
    onClickPallete();
    onDragPalleteBar();
    onClickTextEditorColor();
    onClickTextEditorBackground();
    onClickTextEditColor();

}