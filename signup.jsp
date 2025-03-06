<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f1f9ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        .container {
         background-color: #ADD8E6; 
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 80%;
            max-width: 1100px;
           font-size: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            overflow: hidden;
        }

        .form-container, .image-container {
            width: 50%; 
            max-width: 500px;
            padding: 20px;
            font-size: 20px;
        }

        

        h3{
            text-align: center;
            color: red;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        label {
            font-size: 14px;
            color: #333;
            margin-bottom: 5px;
            display: block;
        }

        input, textarea {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        input:focus, textarea:focus {
            border-color: #00bfff;
            outline: none;
        }

        textarea {
            resize: vertical;
            height: 80px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #00bfff;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #1e90ff;
        }

        .message {
            text-align: center;
            margin-top: 10px;
            padding: 10px;
            border-radius: 8px;
        }

        .success {
            background-color: #32CD32;
            color: white;
        }
.whysign {
color:blue;
            width: 50%;
            text-align: center;
        }
        .error {
            background-color: #FF6347;
            color: white;
        }

        .shopping-image {
            width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                align-items: center;
                padding: 20px;
            }

            .form-container, .image-container {
                width: 100%;
                max-width: 90%;
                margin-bottom: 20px;
            }

            .shopping-image {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
       
        <div class="form-container">
            <h1><center>Sign Up</center></h1>
            
            

            <form action="signAction.jsp" method="POST">
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" required>
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
                
                <label for="mobileNumber">Mobile Number:</label>
                <input type="number" id="mobileMumber" name="mobileNumber" required>
                
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                <button type="submit">Sign Up</button>
            </form>
            <h4><center>Already have an account?<a href="login.jsp">Login</a></center></h4>
        </div>
<div class='whysign'>
<% 
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h1>Successfully Registered</h1>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 style="color:red;">Account already exists, please Login!</h3>
<%} %>
 <img src="images/shopping2.png" class="shopping-image" alt="Shopping Image">
</div>
</div>

</body>
</html>

              





