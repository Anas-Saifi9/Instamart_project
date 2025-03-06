<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ include file="adminHeader.jsp" %>

<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Edit Product</title>
<style>
   
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f7fa;
        margin: 0;
        padding: 0;
    }

    .back {
        color: white;
        margin-left: 2.5%;
        font-size: 20px;
    }

    h2 a {
        text-decoration: none;
        color: white;
        background-color: #4CAF50;
        padding: 10px 15px;
        border-radius: 5px;
    }

    h2 a:hover {
        background-color: #388E3C;
    }

    /* Form Styling */
    form {
        width: 60%;
        background: white;
        margin: 10px auto;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
    }

    .left-div, .right-div {
        width: 48%;
        display: inline-block;
        vertical-align: top;
        padding: 10px;
    }

    h3 {
        color: #333;
        font-size: 18px;
    }

    .input-style {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    select {
        width: 100%;
    }

    hr {
        margin-top: 10px;
        border: 0.5px solid #ddd;
    }

    
    .image-upload {
        margin: 20px 0;
        text-align: center;
    }

    .image-upload input {
        display: none;
    }

    .upload-btn {
        background-color: #6B8E23;
        color: white;
        padding: 10px 15px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
    }

    .upload-btn:hover {
        background-color: #228B22;
    }


    .button {
        background-color: #4CAF50;
        color: white;
        padding: 10px 10px;
        border: none;
        cursor: pointer;
        font-size: 18px;
        border-radius: 5px;
        display: block;
        width: 100%;
    }

.button-container {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

    .button:hover {
        background-color: #388E3C;
    }
</style>
</head>
<body>

<h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'></i> Back</a></h2>

<%
String id=request.getParameter("id");
try
{
    Connection con=ConnectionProvider.getCon();
    Statement st= con.createStatement();
    ResultSet rs=st.executeQuery("select *from product where id='"+id+"'");
    while(rs.next())
    {
%>

<form action="editProductAction.jsp" method="post" >
    <input type="hidden" name="id" value="<% out.println(id); %>">

    <div class="left-div">
        <h3>Enter Name</h3>
        <input class="input-style" type="text" name="name" value="<%=rs.getString(2)%>" required>
        <hr>
    </div>

    <div class="right-div">
        <h3>Enter Category</h3>
        <input class="input-style" type="text" name="category" value="<%=rs.getString(3)%>" required>
        <hr>
    </div>

    <div class="left-div">
        <h3>Enter Price</h3>
        <input class="input-style" type="number" name="price" value="<%=rs.getString(4)%>" required>
        <hr>
    </div>

    <div class="right-div">
        <h3>Active</h3>
        <select class="input-style" name="active">
            <option value="Yes" <% if(rs.getString(5).equals("Yes")){ %> selected <% } %>>Yes</option>
            <option value="No" <% if(rs.getString(5).equals("No")){ %> selected <% } %>>No</option>
        </select>
        <hr>
    </div>

    
        <div class="button-container">
    <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</div>
    </div>

</form>

<%
    }
}
catch(Exception e)
{
    System.out.println(e);
}
%>

</body>
</html>
