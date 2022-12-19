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
</style>
<body>
	<body onload="disconnect()">
		<!--  -->
        <div class="d-none">
            <div>
                <input type="text" id="to" placeholder="Choose a nickname"/>
            </div>
            <br />
            <div>
                <button id="connect" onclick="connect()">Connect</button>
                <button id="disconnect" disabled="disabled" onclick="disconnect()">
                    Disconnect
                </button>
            </div>
            <br />
            <div id="conversationDiv">
                <input type="text" id="text" placeholder="Write a message..."/>
                <button id="sendMessage" onclick="sendMessage();">Send</button>
                <p id="response"></p>
            </div>
        </div>
        <!-- * -->

        <div class="container my-2" style="max-width: calc(100vw - 2vw)">
		  <div class="row rounded-lg overflow-hidden shadow">
		    <!-- Users box-->
		    <div class="col-3 px-0">
		      <div class="bg-white">
		        <div class="bg-gray px-4 py-2 bg-light">
		          <p class="h5 mb-0 py-1">Recent</p>
		        </div>
		        <div class="messages-box">
		          <div class="list-group rounded-0">
		          	<c:forEach items="${groupData}" var="item">
		          		<c:choose>
		          			<c:when test="${idGroup != null && idGroup == item.id}">
		            			<a class="list-group-item list-group-item-action active text-white rounded-0">
		          			</c:when>
		          			<c:otherwise>
		          				<a href="${_ctx}/message?id=${item.id}" class="list-group-item list-group-item-action text-white rounded-0">
		          			</c:otherwise>
		          		</c:choose>
		              <div class="media"><img src="https://bootstrapious.com/i/snippets/sn-chat/avatar.svg" alt="user" width="50" class="rounded-circle">
		                <div class="media-body ml-4">
		                  <div class="d-flex align-items-center justify-content-between mb-1">
		                    <h6 class="mb-0">${item.name}</h6><small class="small font-weight-bold text-muted">${item.createdDate}</small>
		                  </div>
		                  <p class="font-italic mb-0 text-small text-muted">${item.content}</p>
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
		      <div class="px-4 py-5 chat-box bg-white">
		      	<c:forEach items="${messageData}" var="item">
		        <!-- Sender Message-->
		        <c:choose>
          			<c:when test="${_userInfo.id == item.idUser}">
		        		<div class="media w-50 ml-auto mb-3">
				          <div class="media-body">
				            <div class="bg-primary rounded py-2 px-3 mb-2">
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
		      <form action="#" class="bg-light">
		        <div class="input-group">
		          <input type="text" placeholder="Type a message" aria-describedby="button-addon2" class="form-control rounded-0 border-0 py-4 bg-light">
		          <div class="input-group-append">
		            <button id="button-addon2" type="submit" class="btn btn-link"> <i class="fa fa-paper-plane"></i></button>
		          </div>
		        </div>
		      </form>

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

        function setConnected(connected) {
            document.getElementById('connect').disabled = connected;
            document.getElementById('disconnect').disabled = !connected;
            document.getElementById('conversationDiv').style.visibility 
              = connected ? 'visible' : 'hidden';
            document.getElementById('response').innerHTML = '';
        }

		function connect() {
            var socket = new SockJS('/ws');
            stompClient = Stomp.over(socket);  
            stompClient.connect({username: '${_userInfo.username}'}, function(frame) {
                setConnected(true);
                stompClient.subscribe('/user/${_userInfo.username}/queue/messages', function(messageOutput) {
                    showMessageOutput(messageOutput);
                });
            });
        }
        
        function disconnect() {
            if(stompClient != null) {
                stompClient.disconnect();
            }
            setConnected(false);
            console.log("Disconnected");
        }
        
        function sendMessage() {
            stompClient.send("/app/chat", {}, {to: "to", content: "content"});
        }
        
        function showMessageOutput(messageOutput) {
        	console.log(messageOutput);
        }            
    </script>
</body>
</html>