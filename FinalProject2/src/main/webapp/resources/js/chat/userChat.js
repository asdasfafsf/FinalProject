var chatClient = null;
var chatRoomNo = null;

$(document).ready(function() {
    $('.chat_button').click(function() {
    	$('.modal-chat').show();
    	getChatRoom();
    });
    
    $('.modal-chat button.close').click(function() {
    	$('.modal-chat').hide();
    });
    
	$('#chat-message').keydown(function( event ) {
		if( event.which == 13 ) {
			event.preventDefault();
			sendMessage();
		}
	});
	
	$('#chatFile').change(function() {
		uploadChatFile();
	});
});

function getChatRoom() {
	sendJsonRequest( ctx + '/chat/getChatRoom', {}, getChatRoomCallback );
}

function getChatRoomCallback( roomNo ) {
	connectRoom( roomNo );
}

function connectRoom( roomNo ) {
	console.log( 'connectRoom roomNo:' + roomNo );
	chatRoomNo = roomNo;
	var socket = new SockJS(ctx + '/socket');
	chatClient = Stomp.over(socket);
	chatClient.connect({}, function(frame) {
        console.log('Connected: ' + frame);
        chatClient.subscribe('/chat/' + chatRoomNo, function(message){
        	console.log('message: ' + message.body);
        	showMessage(JSON.parse(message.body));
        });
        sendJsonRequest( ctx + '/chat/listChatMsgs', { roomNo: chatRoomNo }, listChatMsgsCallback );
    });
}

function listChatMsgsCallback( msgs ) {
	console.log( 'listChatMsgsCallback', msgs );
	$('#chat-messages').html('');
	if( msgs.length > 0 ) {
		$.each(msgs, function(index, msg) {
			var html = '';
			if( msg.isAdmin == 'Y' ) {
				html += '<li class="from"><div>'
					+ '<div class="avatar"></div>'
					+ '<div class="user">관리자</div><div class="chat">' + msg.chatContent + '</div>'
					+ '<div class="time"><span>' + timestampToHHMM(msg.chatDate) + '</span></div></div></li>';
			} else {
				html += '<li class="to">'
					+ '<div><div class="user">' + msg.userName + '</div><div class="time"><span>' + timestampToHHMM(msg.chatDate) + '</span></div>'
					+ '<div class="chat">' + msg.chatContent + '</div></div></li>';
			}
			$('#chat-messages').append(html);
			
		});
		
		$('.chat-room').animate({ scrollTop: $('#chat-messages').height() }, 1000);
	}
}

function sendMessage() {
	var msg = $('#chat-message').val();
	if( msg.trim().length == 0 ) {
		alert('대화 내용을 입력해 주세요.');
		return false;
	}
	if( msg.trim().length > 1000) {
		alert('대화 내용이 너무 깁니다. 1000자 이내로 작성해 주세요.');
		return false;
	}
	var params = {
			userNo : $('#chatUserNo').val(),
			isAdmin : false,
			msg : msg
	};
	chatClient.send("/app/send/message/" + chatRoomNo, {}, JSON.stringify(params));
	$('#chat-message').val('');
}

function showMessage( chat ) {
	console.log('showMessage:' + chat);
	var html = '';
	if( chat.isAdmin ) {
		html += '<li class="from"><div>'
			+ '<div class="avatar"></div>'
			+ '<div class="user">관리자</div><div class="chat">' + chat.msg + '</div>'
			+ '<div class="time"><span>' + timestampToHHMM(chat.chatDate) + '</span></div></div></li>';
	} else {
		html += '<li class="to">'
			+ '<div><div class="user">' + chat.userName + '</div><div class="time"><span>' + timestampToHHMM(chat.chatDate) + '</span></div>'
			+ '<div class="chat">' + chat.msg + '</div></div></li>';
	}
	$('#chat-messages').append(html);
	$('.chat-room').animate({ scrollTop: $('#chat-messages').height() }, 1000);
}

function showFileUpload() {
	$('#chatFile').trigger('click');
}

function uploadChatFile() {
	var form = new FormData(document.getElementById('uploadForm'));
	$.ajax({ 
		url: ctx + '/chat/uploadChatFile',
		data: form, 
		dataType: 'json', 
		processData: false, 
		contentType: false, 
		type: 'POST', 
		success: function (response) {
			console.log(response); 
			if( response.result ) {
				var isImage = false;
				var arr = [ "jpeg", "jpg", "gif", "png" ];
				var ext = response.filePath.substring(response.filePath.lastIndexOf(".")+1);
				console.log('ext',ext);
				if($.inArray(ext,arr) >= 0) {
					isImage = true;
				}
				console.log('isImage',isImage);
				var filename = response.filePath.replace(/^.*(\\|\/|\:)/, '');
				console.log('filename',filename);
				var msgHtml = '<a href="' + ctx + response.filePath + '" target="_blank">' + filename + '</a>';
				if( isImage )
					msgHtml = '<a href="' + ctx + response.filePath + '" target="_blank"><img src="' + ctx + response.filePath + '"></a>';
				console.log('msgHtml',msgHtml);
				var params = {
						userNo : $('#chatUserNo').val(),
						isAdmin : false,
						msg : msgHtml
				};
				chatClient.send("/app/send/message/" + chatRoomNo, {}, JSON.stringify(params));
			} else {
				alert('파일 업로드를 실패했습니다. 다시 시도해 주세요.');
			}
			$('#chatFile').val('');
		},
		error: function (jqXHR, textStatus, errorThrown) {
			console.log('error');
			console.log('jqXHR', jqXHR);
			console.log('textStatus', textStatus);
		} 
	});
}

function sendJsonRequest(url, params, doneCallback) {
	var deferredObj = $.ajax({
		url : url,
		type : "POST",
		dataType : "json",
		cache : false,
		data : params,
		traditional: true
	});
	deferredObj.done(function(data, textStatus, jqXHR) {
		doneCallback(data);
	});
	return deferredObj;
}

function timestampToHHMM( timestamp ) {
	if(timestamp==null) {
		return "-";
	}
	var dt = new Date( parseInt( timestamp ) );
	var hour = ( dt.getHours() < 10 ) ? "0" + dt.getHours() : dt.getHours();
	var min = ( dt.getMinutes() < 10 ) ? "0" + dt.getMinutes() : dt.getMinutes();
	var dtStr = hour + ":" + min;
	return dtStr;
}