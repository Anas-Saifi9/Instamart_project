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
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
    text-align: center;
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

table {
    width: 80%;
    margin: 20px auto;
    border-collapse: collapse;
    background: white;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    overflow: hidden;
}

table th, table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
}

table th {
    background-color: #28a745;
    color: white;
    font-weight: bold;
}

table tr:nth-child(even) {
    background-color: #f2f2f2;
}

table tr:hover {
    background-color: #ddd;
}

div {
    color: white;
    text-align: center;
    font-size: 30px;
    padding: 10px;
    background: #28a745;
    border-radius: 5px;
    width: 100%;
    margin: auto;
}

</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Orders <i class='fab fa-element'></i></div>

 <table>
	<thead>

		<tr>
			<th scope="col">S.No</th>
			<th scope="col">Product Name</th>
			<th scope="col">category</th>
 			<th scope="col">Quantity</th>

			<th scope="col"><i class="fa fa-inr"></i> Price</th>

			<th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
			 <th scope="col">Order Date</th>
			<th scope="col">Expected Delivery Date</th>
			<th scope="col">Payment Method</th>
			
			<th scope="col">Status</th>
		</tr>

	</thead>
	<tbody>
	<% 
	int sno=0;
	try{
		Connection con= ConnectionProvider.getCon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select *from cart inner join product where cart.product_id =product.id and cart.email='"+email+"' and cart.orderDate is not Null");
		while(rs.next()) {
			sno=sno+1;
	%>
	<tr>
<td><%out.println(sno); %></td>
<td><%=rs.getString(18) %></td>
<td><%=rs.getString(19) %></td>
<td><%=rs.getString(3) %></td>
<td><i class="fa fa-inr"></i> <%=rs.getString(20) %></td>
<td><i class="fa fa-inr"></i> <%=rs.getString(5) %></td>
<td><%=rs.getString(11) %></td>
<td><%=rs.getString(12) %></td>
<td><%=rs.getString(13) %></td>
<td><%=rs.getString(15) %></td>
</tr>
<%
}
			 	} catch(Exception e)
			 	{
			 	System.out.println(e);
			 	}%>
			 	
		</tbody>
	  </table>
	  <br>
	  <br>
	  <br>	 	
</body>
</html>