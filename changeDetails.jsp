<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Change Details</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    text-align: center;
    margin: 0;
    padding: 0;
}

h3 {
    color: #333;
    background-color: #fff;
    padding: 10px;
    display: inline-block;
    border-radius: 5px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
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

hr {
    width: 50%;
    border: 1px solid #ccc;
    margin: 20px auto;
}

br {
    line-height: 1.5;
}

</style>
</head>
<body>
<% 
try

{

Connection con=ConnectionProvider.getCon();

Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select *from users where email='"+email+"'");
while(rs.next())
{

%>

<h3>Name: <%=rs.getString(1) %></h3>

<hr>

<h3>Email: <%=rs.getString(2) %></h3>

<hr>

<h3>Mobile Number: <%=rs.getString(3) %></h3>



<hr>
<br>
<br>
<br>
<% 
}
} 
catch(Exception e)
{
System.out.println(e);
}%>
</body>
</html>