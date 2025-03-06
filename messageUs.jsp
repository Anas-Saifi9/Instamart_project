<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <title>Message Us</title>
    <style>
       body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
    text-align: center;
}
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color:#ccc;
   color:black;
   text-align: center;
}
.heading {
        text-align: center;
        font-size: 30px;
        color: #333;
        margin: 20px 0;
        font-weight: bold;
    }
h3 {
    color: #333;
}

form {
    background: white;
    padding: 20px;
    width: 40%;
    margin: 20px auto;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

.input-style {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

textarea.input-style {
    height: 100px;
    resize: none;
}

.button {
    background-color: #28a745;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-size: 18px;
    cursor: pointer;
    transition: 0.3s;
}

.button:hover {
    background-color: #218838;
}

    </style>
</head>
<body>
    <div class="container">
        <h2>Message Us <i class='fas fa-comment-alt'></i></h2>
        <% String msg=request.getParameter("msg"); %>
        <% if("valid".equals(msg)){ %>
            <h3 style="color:yellow;">Message successfully sent. Our team will contact you soon!</h3>
        <% } else if("invalid".equals(msg)){ %>
            <h3 style="color:red;">Something went wrong! Try again!</h3>
        <% } %>
        <form action="messageUsAction.jsp" method="post">
            <input class="input-style" name="subject" type="text" placeholder="Subject" required>
            <textarea class="input-style" name="body" placeholder="Enter your message" required></textarea>
            <button class="button" type="submit">Send <i class="far fa-arrow-alt-circle-right"></i></button>
        </form>
    </div>
</body>
</html>