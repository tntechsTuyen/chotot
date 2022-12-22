<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/jsp/user/common/head.jsp" %>
</head>
<style>
	::-webkit-scrollbar {
	  width: 5px;
	}

	::-webkit-scrollbar-track {
	  width: 5px;
	  background: #f5f5f5;
	}

	::-webkit-scrollbar-thumb {
	  width: 1em;
	  background-color: #ddd;
	  outline: 1px solid slategrey;
	  border-radius: 1rem;
	}

	.text-small {
	  font-size: 0.9rem;
	}

	.messages-box,
	.chat-box {
	  height: calc(100vh - 70px);
	  overflow-y: scroll;
	}

	.rounded-lg {
	  border-radius: 0.5rem;
	}

	input::placeholder {
	  font-size: 0.9rem;
	  color: #999;
	}

	.btn-back:hover{
		cursor: pointer;
	}
</style>
<body>
	<body onload="disconnect()">
        <div class="container my-2" style="max-width: calc(100vw - 2vw)">
		  <div class="row rounded-lg overflow-hidden shadow">
		    <!-- Users box-->
		    <div class="col-3 px-0">
		      <div class="bg-white">
		        <div class="bg-gray px-4 py-2 bg-light">
		          <p class="h5 mb-0 py-1">Tin nhắn</p>
		        </div>
		        <div class="messages-box">
		          <div class="list-group rounded-0">
		          	<c:forEach items="${groupData}" var="item">
		          		<c:choose>
		          			<c:when test="${idGroup != null && idGroup == item.id}">
		            			<a id="group-${item.id}" class="list-group-item list-group-item-action active rounded-0 bg-info">
		          			</c:when>
		          			<c:otherwise>
		          				<a id="group-${item.id}" class="list-group-item list-group-item-action rounded-0" href="${_ctx}/message?id=${item.id}" >
		          			</c:otherwise>
		          		</c:choose>
		              	<div class="media"><img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">
			                <div class="media-body ml-4">
			                  	<div class="d-flex align-items-center justify-content-between mb-1">
				                    <h6 class="mb-0">${item.name}</h6>
				                    <small class="small font-weight-bold text-muted lasted-time">
				                    	${item.createdDate}
				                	</small>
			                  	</div>
			                  	<p class="lasted-message" class="font-italic mb-0 text-small text-muted">
			                  		<small>
			                  		<c:choose>
					          			<c:when test="${item.idUser == _userInfo.id}">
					            			Tôi:
					          			</c:when>
					          			<c:otherwise>
					          				${item.name}:
					          			</c:otherwise>
					          		</c:choose>
			                  		${item.content}
			                  		</small>
			                  	</p>
			                </div>
		              	</div>
		            </a>
		        	</c:forEach>
		          </div>
		        </div>
		      </div>
		    </div>
		    <!-- Chat Box-->
		    <div class="col-9 px-0">
		      <div class="px-4 py-5 chat-box bg-white" id="chat-box">
		      	<c:forEach items="${messageData}" var="item">
		        <!-- Sender Message-->
		        <c:choose>
          			<c:when test="${_userInfo.id == item.idUser}">
		        		<div class="media w-50 ml-auto mb-3">
				          <div class="media-body">
				            <div class="bg-info rounded py-2 px-3 mb-2">
			            		<h6>${item.name}</h6>
				              <p class="text-small mb-0 text-white">${item.content}</p>
				            </div>
				            <p class="small text-muted">${item.createdDate}</p>
				          </div>
				        </div>
          			</c:when>
          			<c:otherwise>
		        		<div class="media w-50 mb-3">
				        	<img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">
				          	<div class="media-body ml-3">
				            	<div class="bg-light rounded py-2 px-3 mb-2">
				            		<h6>${item.name}</h6>
					              	<p class="text-small mb-0 text-muted">${item.content}</p>
				            	</div>
				            	<p class="small text-muted">${item.createdDate}</p>
				          	</div>
				        </div>
          			</c:otherwise>
          		</c:choose>
		    	</c:forEach>
		        <!-- Reciever Message-->
		      </div>

		      	<!-- Typing area -->
		        <div class="input-group">
		          <input type="text" placeholder="Type a message" aria-describedby="button-addon2" class="form-control rounded-0 border-0 py-4 bg-light" id="ip-message">
		          <div class="input-group-append">
		            <button id="btn-send" class="btn btn-info"> <i class="fa fa-paper-plane"></i></button>
		          </div>
		        </div>

		    </div>
		  </div>
		</div>

    </body>

    <script src="${_ctx}/static/plugins/jquery/jquery.slim.min.js"></script>
    <script src="${_ctx}/static/js/bootstrap.bundle.min.js"></script>
    <script src="${_ctx}/static/js/sockjs.min.js"></script>
    <script src="${_ctx}/static/js/stomp.min.js"></script>
    <script>
        var stompClient = null;
        $(document).ready(function(){
        	connect()
        	$('#chat-box').scrollTop($('#chat-box')[0].scrollHeight);
        })

		function connect() {
            var socket = new SockJS('/ws');
            stompClient = Stomp.over(socket);  
            stompClient.connect({id: '${_userInfo.id}'}, function(frame) {
                stompClient.subscribe('/user/${_userInfo.id}/queue/messages', function(messageOutput) {
                    showMessage(JSON.parse(messageOutput.body))
                });
            });

        }
        
        function disconnect() {
            if(stompClient != null) {
                stompClient.disconnect();
            }
        }

        function showMessage(data){
        	var itemHtml = "";
        	var nameUserMess = "Tôi: "
        	if(data.idUser == ${_userInfo.id}){
        		itemHtml = `
        		<div class="media w-50 ml-auto mb-3">
		          <div class="media-body">
		            <div class="bg-info rounded py-2 px-3 mb-2">
            			<h6>`+data.name+`</h6>
		              	<p class="text-small mb-0 text-white">`+data.content+`</p>
		            </div>
		            <p class="small text-muted">`+new Date(data.createdDate).format("yyyy/MM/dd HH:mm:ss")+`</p>
		          </div>
		        </div>`
        	}else{
        		nameUserMess = data.name+": "
        		itemHtml = `
        		<div class="media w-50 mb-3">
		        	<img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">
		          	<div class="media-body ml-3">
		            	<div class="bg-light rounded py-2 px-3 mb-2">
		            		<h6>`+data.name+`</h6>
			              	<p class="text-small mb-0 text-muted">`+data.content+`</p>
		            	</div>
		            	<p class="small text-muted">`+new Date(data.createdDate).format("yyyy/MM/dd HH:mm:ss")+`</p>
		          	</div>
		        </div>`
        	}
        	$(`#group-`+data.idGroup).find(".lasted-message").html(nameUserMess+data.content)
        	$(`#group-`+data.idGroup).find(".lasted-time").html(new Date(data.createdDate).format("yyyy/MM/dd HH:mm:ss"))
        	$("#chat-box").append(itemHtml)
        	$('#chat-box').scrollTop($('#chat-box')[0].scrollHeight);
        }

        function sendMessage() {
            var mess = $("#ip-message").val()
            stompClient.send("/app/chat", {}, JSON.stringify({idUser: ${_userInfo.id}, idGroup: ${idGroup}, content: mess}));
            $("#ip-message").val("")
        }

        $("#btn-send").click(function(){
        	sendMessage()
        })

        $("#ip-message").keypress(function(e){
        	var key = e.which;
		    if(key == 13) {
		        $("#btn-send").click()
		    }
        })
    </script>
</body>
</html>