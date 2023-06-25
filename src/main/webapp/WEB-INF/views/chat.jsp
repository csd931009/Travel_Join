<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <script src="https://code.jquery.com/jquery-3.7.0.js"
            integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <link href="/css/chat.css" rel="stylesheet" type="text/css">
</head>
<body>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>


<div id="chatbox" class="animate">
    <div id="friendslist">

        <div id="topmenu">
            <span class="chats"></span>
        </div>

        <c:forEach var="room" items="${rooms}">
            <div id="friends">

                <div class="friend" data-roomId="${room.roomId}">
                    <img src="/profile/default_profile.png"/>
                    <p>
                        <strong>채팅방${room.roomId}</strong><br>
                        <span>마지막 채팅</span>
                    </p>
                    <div class="status available"></div>
                </div>

            </div>
        </c:forEach>

    </div>

    <div id="chatview" class="p1">
        <div id="profile">

            <div id="close">
                <div class="cy"></div>
                <div class="cx"></div>
            </div>

            <p>채팅방 제목</p>

        </div>

        <div id="chat-messages">
            <label>2023-06-25</label>

            <div class="message">
                <span class="nick">닉네임</span>
                <span class="timestamp">20:54</span>
                <span class="unread">3</span>
                <img src="/profile/default_profile.png"/>
                <div class="bubble">
                    채팅 샘플 메세지ㅣ이이이ㅣㅣ
                </div>
            </div>

            <div class="message right">
                <img src="/profile/default_profile.png"/>
                <div class="bubble">
                    학원가기 싫다ㅏㅏㅏㅏㅏㅏㅏㅏ
                    <span class="timestamp">20:54</span>
                    <span class="unread">3</span>
                </div>
            </div>

        </div>



        <div id="sendmessage">
            <input type="text" value="메세지를 입력하세요"/>
            <button id="send"></button>
        </div>

    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/js/chat.js"></script>
</body>
</html>
