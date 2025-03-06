
<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<html>
<head>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f4f4f4;
    }
   .topnav {
    background-color: #28a745; 
    display: flex;
    align-items: center;
    justify-content: space-between; 
    padding: 15px 30px;
    border-radius: 10px;
    height: 70px;
}
.topnav h2 {
    color: white;
    margin: 0 auto; 
    font-size: 28px;
    font-weight: bold;
}


    
    h3 {
        color: #333;
    }
    .left-div, .right-div, .right-div-right {
        display: inline-block;
        width: 30%;
        margin: 10px 1%;
        padding: 10px;
        background: #fff;
        border-radius: 5px;
        box-shadow: 0px 0px 5px rgba(0,0,0,0.2);
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background: #fff;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }
    th {
        background: grey;
        color: white;
    }
    .button {
        display: inline-block;
        padding: 20px 20px;
        margin: 10px;
        border: none;
        background: #28a745;
        color: white;
        cursor: pointer;
        border-radius: 5px;
        text-decoration: none;
    }
    .button:hover {
        background: #218838;
    }
    .right-button {
        background: #dc3545;
    }
    .right-button:hover {
        background: #c82333;
    }
</style>
<title>Bill</title>
</head>
<body>
<% 
String email=session.getAttribute("email").toString();

try{
int total=0;
int sno=0;
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select sum(total) from cart where email='"+email+"'and status='bill'");
	while(rs.next())
	{
	total=rs.getInt(1);
	}
	ResultSet rs2=st.executeQuery("select *from users inner join cart where cart.email='"+email+"' and cart.status='bill'");
	while(rs2.next())
	{
	%>
	<div class="topnav sticky">
<h2>Bill Details</h2>
</div>

<hr>

<div class="right-div-right"><h3>Email:<%out.println(email); %>  </h3></div>
<div class="right-div"><h3>Mobile Number:  <%=rs2.getString(18) %> </h3></div>  

<div class="left-div"><h3>Order Date: <%=rs2.getString(20) %>  </h3></div>
<div class="right-div-right"><h3>Payment Method:  <%=rs2.getString(21) %> </h3></div>
<div class="right-div"><h3>Expected Delivery:  <%=rs2.getString(19) %> </h3></div> 

<div class="left-div"><h3>Transaction Id:  <%=rs2.getString(24) %> </h3></div>
<div class="right-div-right"><h3>City:  <%=rs2.getString(15) %> </h3></div> 
<div class="right-div"><h3>Address: <%=rs2.getString(14) %>  </h3></div> 

<div class="left-div"><h3>State: <%=rs2.getString(16) %>  </h3></div>
<div class="right-div-right"><h3>Country: <%=rs2.getString(17) %>  </h3></div>  

<hr>

<%break;} %>
	
	<br>
	
<table id="customers">
<div class="topnav sticky">
<h2>Product Details</h2>
</div>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%
  ResultSet rs1=st.executeQuery("select *from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.status='bill'");
  	while(rs1.next())
  	{
  	sno=sno+1;
  	
  	%>
  <tr>
    <td><%out.println(sno); %></td>
    <td><%=rs1.getString(18) %></td>
    <td><%=rs1.getString(19) %></td>
    <td><%=rs1.getString(20) %></td>
    <td><%=rs1.getString(3) %></td>
     <td><%=rs1.getString(5) %></td>
  </tr>
  <tr>
<%} %>
</table>
<h2>Total: <%out.println(total); %></h2>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<%
}
catch(Exception e)
{
	System.out.println(e);
	}%>
</body>
</html>
</body>
</html>