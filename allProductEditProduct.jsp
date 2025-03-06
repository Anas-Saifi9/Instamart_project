<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ include file="adminHeader.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
    
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f7fa;
        margin: 0;
        padding: 0;
    }
     div {
        color: white;
        text-align: center;
        font-size: 30px;
        background-color: #4CAF50;
        padding: 20px;
    }

    .alert {
        color: #fff;
        background-color: #4CAF50;
        padding: 10px;
        border-radius: 5px;
        text-align: center;
        font-size: 18px;
        margin: 20px auto;
        width: 70%;
    }

    .alert.error {
        background-color: #f44336;
    }

    /* Table Styling */
    table {
        width: 90%;
        margin: 30px auto;
        border-collapse: collapse;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        background-color: white;
    }

    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
        font-size: 20px;
    }

    th {
        background-color: #4CAF50;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }

    
    a {
        text-decoration: none;
        color: #4CAF50;
        font-weight: bold;
        transition: color 0.3s ease;
    }

    a:hover {
        color: #45a049;
    }

   
    i {
        font-size: 18px;
    }
</style>
</head>
<body>
<div>All Products & Edit Products <i class='fab fa-elementor'></i></div>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Product Successfully Updated!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert error">Something went wrong! Try again!</h3>
<%} %>


<table>
    <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th>Status</th>
            <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
        </tr>
    </thead>
    <tbody>
    <%
    try
    {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from product");
        while(rs.next())
        {
    %>
        <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(4)%></td>
            <td><%=rs.getString(5)%></td>
            <td><a href="editProduct.jsp?id=<%=rs.getString(1)%>">Edit <i class='fas fa-pen-fancy'></i></a></td>
        </tr>
    <%
        }
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
    %>
    </tbody>
</table>

</body>
</html>
