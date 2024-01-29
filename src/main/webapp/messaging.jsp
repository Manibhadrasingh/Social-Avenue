<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Social Network</title>
<link href="css/messaging.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <%@include file="navbar.jsp" %>

  <div class="container">
    <div class="friends-box">
      <div class="friend">
        <img src="images/profile.jpg" alt="Friend 1">
        <div class="friend-info">
          <h3>Friend 1</h3>
          <p>Online</p>
        </div>
      </div>
      <div class="friend">
        <img src="images/profile.jpg" alt="Friend 2">
        <div class="friend-info">
          <h3>Friend 2</h3>
          <p>Offline</p>
        </div>
      </div>
      <div class="friend">
        <img src="images/profile.jpg" alt="Friend 2">
        <div class="friend-info">
          <h3>Friend 2</h3>
          <p>Offline</p>
        </div>
      </div>
      <div class="friend">
        <img src="images/profile.jpg" alt="Friend 2">
        <div class="friend-info">
          <h3>Friend 2</h3>
          <p>Offline</p>
        </div>
      </div>
      <div class="friend">
        <img src="images/profile.jpg" alt="Friend 2">
        <div class="friend-info">
          <h3>Friend 2</h3>
          <p>Offline</p>
        </div>
      </div>
      <!-- Add more friend entries here -->
    </div>
    <div class="chat-box">
      <div class="chat">
        <div class="message">Hello! How are you?</div>
        <div class="message from-me">I'm good, thank you!</div>
        <!-- Add more messages here -->
      </div>
      <div class="input-container">
        <input type="text" placeholder="Type your message...">
        <button>Send</button>
      </div>
    </div>
  </div>
</body>
</html>
