<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ include file="header.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
     body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 80%;
        margin: auto;
        overflow: hidden;
    }

    .heading {
        text-align: center;
        font-size: 30px;
        color: #333;
        margin: 20px 0;
        font-weight: bold;
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
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background: white;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
    }
    th, td {
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    th {
        background: grey;
        color: white;
    }
    tr:hover {
        background: #f1f1f1;
    }
    .footer {
        text-align: center;
        padding: 20px;
        background: grey;
        color: white;
        position: fixed;
        width: 100%;
        bottom: 0;
    }
    a {
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
    }
    a:hover {
        text-decoration: underline;
    }
    .not-found {
        color: red;
        text-align: center;
        font-size: 24px;
    }
</style>
</head>
<body>

<table>
    <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
        </tr>
    </thead>
    <tbody>
        <%
        int z=0;
        try {
            String search=request.getParameter("search");
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM product WHERE name like '%"+search+"%'or category like '%"+search+"%' and active='Yes'");
            while (rs.next()) {
                z=1;
        %>
        <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%= rs.getString(4) %></td>
            <td><a href="addToCartAction.jsp?id=<%= rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
        </tr>
        <%
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        %>
    </tbody>
</table>
<% if(z==0){ %>
<h1 class="not-found">Nothing to show</h1>
<%} %>

<div class="footer">
    <p>All right reserved</p>
</div>
</body>
</html>