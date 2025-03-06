<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>
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
    .alert {
        text-align: center;
        font-size: 18px;
        font-weight: bold;
        padding: 10px;
        border-radius: 5px;
        margin: 10px auto;
        width: 50%;
    }

    .alert-success {
        background-color: #4CAF50;
        color: white;
    }

    .alert-warning {
        background-color: #ff9800;
        color: white;
    }

    .alert-danger {
        background-color: #f44336;
        color: white;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background: white;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: grey;
        color: white;
        font-weight: bold;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    a {
        text-decoration: none;
        color: white;
        background-color: #28a745;
        padding: 8px 12px;
        border-radius: 5px;
        font-size: 14px;
        transition: 0.3s;
    }

    a:hover {
        background-color: #218838;
    }
</style>
</head>
<body>

<div class="container">
    <div class="heading">Home <i class="fa fa-institution"></i></div>

    <%
    String msg = request.getParameter("msg");
    if ("added".equals(msg)) {
    %>
    <h3 class="alert alert-success">Product added successfully!</h3>
    <% } %>

    <%
    if ("exist".equals(msg)) {
    %>
    <h3 class="alert alert-warning">Product already exists in your cart! Quantity increased!</h3>
    <% } %>

    <%
    if ("invalid".equals(msg)) {
    %>
    <h3 class="alert alert-danger">Something went wrong! Try again!</h3>
    <% } %>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th><i class="fa fa-inr"></i> Price</th>
                <th>Add to cart <i class='fas fa-cart-plus'></i></th>
            </tr>
        </thead>
        <tbody>
            <%
            try {
                Connection con = ConnectionProvider.getCon();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM product WHERE active='Yes'");
                while (rs.next()) {
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
</div>

</body>
</html>
