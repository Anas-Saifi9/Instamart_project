<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ include file="adminHeader.jsp" %>
<%@ include file="../footer.jsp" %>
<html>
<head>
   
    <title>Add New Product</title>
    <style>
        
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f7;
            margin: 0;
            padding: 0;
        }

       
        header, footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
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

       
        form {
            background-color: white;
            padding: 30px;
            margin: 30px auto;
            width: 80%;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h3 {
            color: grey;
        }

        .input-style {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .input-style:focus {
            border-color: #66afe9;
            outline: none;
        }

        .left-div, .right-div {
            margin-bottom: 20px;
            width: 48%;
            float: left;
            padding: 10px;
        }

        .right-div {
            float: right;
        }

        .button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            width: 80%;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #45a049;
        }

        
        

       
        @media (max-width: 768px) {
            .left-div, .right-div {
                width: 100%;
                float: none;
            }

            .button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <% 
    String msg = request.getParameter("msg");
    if("done".equals(msg)) { 
    %>
    <h3 class="alert">Product Added Successfully!</h3>
    <% } %>

    <% 
    if("wrong".equals(msg)) 
    { 
    %>
    <h3 class="alert error">Something went wrong! Try Again!</h3>
    <% }%>
    <% 
    int id = 1;
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select max(id) from product");
        while (rs.next()) {
            id = rs.getInt(1);
            id = id + 1;
        }
    } catch (Exception e) {}
    %>
    <form action="addNewProductAction.jsp" method="post">
        <h3>Product ID: <% out.println(id); %></h3>
        <input type="hidden" name="id" value="<% out.println(id); %>">

       
            <div class="left-div">
                <h3>Enter Name</h3>
                <input class="input-style" type="text" name="name" placeholder="Enter Name" required>
            </div>

            <div class="right-div">
                <h3>Enter Category</h3>
                <input class="input-style" type="text" name="category" placeholder="Enter Category" required>
            </div>
        

        <div class="clearfix">
            <div class="left-div">
                <h3>Enter Price</h3>
                <input class="input-style" type="number" name="price" placeholder="Enter Price" required>
            </div>

            <div class="right-div">
                <h3>Active</h3>
                <select class="input-style" name="active">
                    <option value="Yes">Yes</option>
                    <option value="No">No</option>
                </select>
            </div>
        </div>


       

        <center><button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button></center>
    </form>
</body>
</html>
