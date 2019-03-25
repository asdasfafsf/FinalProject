var chatClient = null;
var chatRoomNo = null;
var chatUserPhoto = null;

$(document).ready(function() {
    $('.chat_button').click(function() {
    	$('.modal-chat').show();
    	listChatRooms();
    });
    
    $('.modal-chat button.close').click(function() {
    	$('.modal-chat').hide();
    	if( chatClient != null ) {
			chatClient.disconnect();
			chatClient = null;			
		}
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

function listChatRooms() {
	sendJsonRequest( ctx + '/chat/listChatRooms', {}, listChatRoomsCallback );
}

function listChatRoomsCallback( result ) {
	console.log( result );
	$('#chat-rooms').html('');
	if( result.length > 0 ) {
		$.each( result, function(index, room) {
			var unreadHtml = '';
			if( room.unread > 0 ) {
				var count = room.unread; 
				if( count > 99 )
					count = '99+';
				unreadHtml = '<span class="unread">' + count + '</span>';
			}
			var html = '<li onclick="connectRoom(' + room.chatRoomNo + ',\'' + room.userName + '\',\'' + ctx + room.userPhoto + '\');"><div><div class="avatar"><img src="' + ctx + room.userPhoto + '"/></div>'
				+ '<div class="body"><span class="name">' + room.userName + '</span><span class="lastMsg">' + stripHTML(room.lastMsg) + '</span></div>'
				+ '<div class="tail"><span class="time">' + timestampToHHMM(room.lastChatDate) + '</span>' + unreadHtml + '</div></div></li>';
			$('#chat-rooms').append( html );
		});
	}
}

function returnRooms() {
	$('.chat-rooms').show();
	$('.chat-room').hide();
	$('.chat-room-title').hide();
	$('.form').hide();
	listChatRooms();
	if( chatClient != null ) {
		chatClient.disconnect();
		chatClient = null;			
	}
}

function connectRoom( roomNo, userName, userPhoto ) {
	$('.chat-rooms').hide();
	$('.chat-room').show();
	$('.chat-room-title').show();
	$('.form').show();
	$('.chat-user').text(userName);
	chatUserPhoto = userPhoto;
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
				html += '<li class="to">'
					+ '<div><div class="time"><span>' + timestampToHHMM(msg.chatDate) + '</span></div>'
					+ '<div class="chat">' + msg.chatContent + '</div></div></li>';
			} else {
				html += '<li class="from"><div>'
					+ '<div class="avatar"><img src="' + chatUserPhoto + '"/></div>'
					+ '<div class="user">' + msg.userName + '</div><div class="chat">' + msg.chatContent + '</div>'
					+ '<div class="time"><span>' + timestampToHHMM(msg.chatDate) + '</span></div></div></li>';				
			}
			$('#chat-messages').append(html);
			
		});
		
		$('.chat-room').animate({ scrollTop: $('#chat-messages').height() }, 1000);
	}
}

function showMessage( chat ) {
	console.log('showMessage:' + chat);
	var html = '';
	if( chat.isAdmin ) {
		html += '<li class="to">'
			+ '<div><div class="time"><span>' + timestampToHHMM(chat.chatDate) + '</span></div>'
			+ '<div class="chat">' + chat.msg + '</div></div></li>';
	} else {
		html += '<li class="from"><div>'
			+ '<div class="avatar"><img src="' + chatUserPhoto + '"/></div>'
			+ '<div class="user">' + chat.userName + '</div><div class="chat">' + chat.msg + '</div>'
			+ '<div class="time"><span>' + timestampToHHMM(chat.chatDate) + '</span></div></div></li>';		
	}
	$('#chat-messages').append(html);
	$('.chat-room').animate({ scrollTop: $('#chat-messages').height() }, 1000);
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
			userNo : 0,
			isAdmin : true,
			msg : msg
	};
	chatClient.send("/app/send/message/" + chatRoomNo, {}, JSON.stringify(params));
	$('#chat-message').val('');
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
						userNo : 0,
						isAdmin : true,
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

function stripHTML(dirtyString) {
	return dirtyString.replace(/(<([^>]+)>)/ig,"");
}