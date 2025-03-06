<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ include file="header.jsp" %>
<%@ include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
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
    .cart-container {
        width: 80%;
        margin: auto;
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    h3.alert {
        background-color: lavender;
        color: #333;
        padding: 10px;
        text-align: center;
        border-radius: 5px;
        font-weight: bold;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background: white;
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

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .total-row {
        font-size: 18px;
        font-weight: bold;
        background-color: #ffeb3b;
    }

    .btn {
        background: #28a745;
        color: white;
        padding: 8px 12px;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
        display: inline-block;
        transition: 0.3s;
    }

    .btn:hover {
        background: #218838;
    }

    .icon-btn {
        color: #28a745;
        font-size: 18px;
        margin: 0 5px;
    }

    .icon-btn:hover {
        color: #1e7e34;
    }

    .remove-btn {
        color: red;
        font-weight: bold;
    }

    .remove-btn:hover {
        color: darkred;
    }
</style>


</head>
<body>
<div style="color: green; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg))
{
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%} %>

<%
if("inc".equals(msg))
{
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%} %>

<%
if("dec".equals(msg))
{
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%} %>

<%
if("removed".equals(msg))
{
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%} %>
<table>
<thead>
<%
int total=0;
int sno=0;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
	while(rs1.next())
	{
		total=rs1.getInt(1);
	}

%>
          <tr>
            <th scope="col" style="background-color: grey;">Total: <i class="fa fa-inr"></i><%out.println(total);%></th>
            <%if(total>0){ %><th scope="col"><a href="addressPaymentForOrder.jsp" style="color: pink;">Proceed to order</a></th><%} %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      <%
      ResultSet rs=st.executeQuery("select *from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
      while(rs.next())
      {
      %>
          <tr>
			<%sno=sno+1; %>
           <td><%out.println(sno); %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3)%></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(4)%> </td>
            <td><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a><%=rs.getString(8)%>  <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(10)%> </td>
            <td><a href="removeFromCart.jsp?id=<%=rs.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
<%
      }
}
catch(Exception e)
{
	
}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>