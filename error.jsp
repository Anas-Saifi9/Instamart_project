<%@page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
    text-align: center;
}

h1 {
    color: #d9534f;
    font-size: 24px;
}

a {
    text-decoration: none;
    color: #007bff;
    font-size: 20px;
    font-weight: bold;
}

a:hover {
    text-decoration: underline;
}

.error-container {
    background: white;
    padding: 20px;
    width: 40%;
    margin: 50px auto;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error</title>
</head>
<body>
<h1>Some thing went Wrong!</h1>
<h1>So go for login! Try again!</h1>
<h1><a href="login.jsp">login</a></h1>
</body>
</html>