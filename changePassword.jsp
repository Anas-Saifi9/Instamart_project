
<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    text-align: center;
    margin: 0;
    padding: 0;
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
h3 {
    color: #333;
    font-size: 20px;
}

.alert {
    color: red;
    font-weight: bold;
}

form {
    width: 50%;
    margin: auto;
    padding: 20px;
    border: 2px solid #ddd;
    border-radius: 10px;
    background-color: #f9f9f9;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.input-style {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

.button {
    width: 100%;
    padding: 12px;
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 18px;
}

.button:hover {
    background-color: #218838;
}

</style>

<title>Message Us</title>
</head>
<body>
	<%String msg=request.getParameter("msg");
	if("notMatch".equals(msg))
	{
	%>
	<h3 class="alert">New password and confirm password does not match!</h3>
	<%} %>
	
	<%
	if("notMatch".equals(msg))
	{
	%>
	<h3 class="alert">Your old Password is wrong!</h3>
	<%} %>
	
	<% 
	if("done".equals(msg))
	{%>
	<h3 class="alert">Password change successfully!</h3>
	<%} %>

	<%
	if("invalid".equals(msg))
	{%>
	<h3 class="alert">Some thing went wrong! Try again!</h3>
	<%} %>
<form action="changePasswordAction.jsp" method="post">
<h3>Enter Old Password</h3>
<input class="input-style" type="password" name="oldPassword" placeholder="Enter old password" required>
 
  <hr>
 <h3>Enter New Password</h3>
 <input class="input-style" type="password" name="newPassword" placeholder="Enter old password" required>
 
 <hr>
<h3>Enter Confirm Password</h3>
<input class="input-style" type="password" name="confirmPassword" placeholder="Enter confirm password" required>

<hr>
<button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button>

</form>
</body>
<br><br><br>
</html>