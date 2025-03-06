<!DOCTYPE html>
<html lang="en">
<head>
    
    <title>Login</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f1f9ff;
            margin: 0;
            padding: 0;
        }

        #container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100vh;
            padding: 20px;
            box-sizing: border-box;
        }

        .login-container {
            display: flex;
            justify-content: space-between;
            align-items: stretch;
            background-color: #ADD8E6;
            border-radius: 10px;
            padding: 100px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 1000px;
            
        }

        .signup {
            width: 50%;
            padding: 10px;
        }

        .signup input[type="email"],
        .signup input[type="password"] {
            width: 80%;
            padding: 12px;
            margin: 20px 0px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 20px;
        }

        .signup input[type="submit"] {
            width: 80%;
            padding: 20px;
            margin: 20px 0px;
            background-color: #00bfff;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .signup input[type="submit"]:hover {
            background-color: #1e90ff;
        }

        .whysignLogin {
            width: 50%;
            text-align: center;
        }

        .whysignLogin img {
            max-width: 110%;
            height: auto;
            margin-top: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .whysignLogin h1 {
            color: #FF6347;
        }

        .whysignLogin h2 {
            margin: 10px 0;
        }

        .whysignLogin a {
            text-decoration: none;
            color: #1e90ff;
            font-size: 16px;
        }

        .whysignLogin a:hover {
            color: #00bfff;
        }
    </style>
</head>
<body>
    <div id="container">
        <div class="login-container">
            
            <div class="signup">
                <form action="loginAction.jsp" method="post">
                    <center><input type="email" name="email" placeholder="Enter email" required></center>
                    <center><input type="password" name="password" placeholder="Enter password" required></center>
                    <center><input type="submit" value="Login"></center>
                </form>
                 <center><h2><a href="signup.jsp">Sign Up</a></h2></center>
                 <center><h2><a href="forgotPassword.jsp">Forgot Password?</a></h2></center>
            </div>

            <!-- Image Section -->
            <div class="whysignLogin">
                <%
                    // Retrieve the message from request parameter
                    String msg = request.getParameter("msg");
                    if ("notexist".equals(msg)) {
                %>
                    <h1>Incorrect Username or Password</h1>
                <% } %>

                <% if ("invalid".equals(msg)) { %>
                    <h1>Something Went Wrong! Try Again!</h1>
                <% } %>

                <img src="images/shopping1.jpg" alt="Shopping" class="shopping-image">
            </div>
        </div>
    </div>
</body>
</html>



