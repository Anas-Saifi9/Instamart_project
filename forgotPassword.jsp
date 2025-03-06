<!DOCTYPE html>
<html>
<head>
    <title>ForgotPassword</title>
    <style>
        /* General styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        #container {
            display: flex;
            justify-content: space-around;
            align-items: center;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 1200px;
            width: 100%;
        }
        
        /* Styling for the form */
        .signup {
            max-width: 400px;
            width: 100%;
        }

        .signup input,
        .signup select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        .signup input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            border: none;
            font-size: 18px;
        }

        .signup input[type="submit"]:hover {
            background-color: #45a049;
        }

        .signup h2 {
            text-align: center;
            margin-top: 20px;
        }

        .signup h2 a {
            color: #4CAF50;
            text-decoration: none;
            font-size: 16px;
        }

        .signup h2 a:hover {
            text-decoration: underline;
        }

        /* Image styling */
        .shopping-image {
            max-width: 100%;
            height: auto;
            margin-top: 50px;
        }

        .whyforgotPassword {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .whyforgotPassword h1 {
            font-size: 24px;
            color: #333;
        }
        
        /* Additional styles */
        .whyforgotPassword h1 {
            color: #333;
            font-family: 'Arial', sans-serif;
        }

        .whyforgotPassword img {
            max-width: 500px;
            width: 100%;
        }

        /* Styling for error/success messages */
        .message {
            font-size: 18px;
            color: red;
        }
    </style>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="forgotPasswordAction.jsp" method="post">
         <input type="email" name="email" placeholder="Enter Email" required>
         <input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
         
         <input type="password" name="newPassword" placeholder="Enter your new password" required>
         <input type="submit" value="Save">
     </form>
     <h2><a href="login.jsp">Login</a></h2>
  </div>
  
  <div class='whyforgotPassword'>
    <%
        String msg = request.getParameter("msg");
        if ("done".equals(msg)) {
    %>
        <h1>Password Changed Successfully!</h1>
    <%
        } else if ("invalid".equals(msg)) {
    %>
        <h1>Something Went Wrong! Try Again!</h1>
    <%
        }
    %>
    <img src="images/password.jpg" alt="Shopping" class="shopping-image">
  </div>
</div>
</body>
</html>
