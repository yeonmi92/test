<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<script>
	var socket = null;
	function connect(){
	socket = ws;
	var ws = new WebSocket("ws://localhost:8080/together/member/replyEcho");
	ws.onopen = function(){
		console.log('info: connection opened.');
// 		setTimeout( function(){connect();}, 1000); // retry connection
	};
	
	ws.onmessage = function(event){
		console.log(event.data+'\n');
	};
	ws.onclose = function(event){console.log('Info: connection closed.');};
	ws.onerror = function(err){console.log('error : ', err;};
	}
	
	$('#btnSend').on('click', function(evt){
		evt.preventDefault();
		if(socket.readyState !== 1) return;
		let msg = $('input#msg').val();
		ws.send(msg);
		socket.send(msg);
	});
</script>
<body>
	<input type="text" value="1212" id="msg"/>
	<button id="btnSend">전송</button>
</body>
</html>