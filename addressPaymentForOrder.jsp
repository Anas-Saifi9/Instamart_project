<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            width: 80%;
            margin: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 20px;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #28a745;
            color: white;
        }
        tr:hover {
            background: #f1f1f1;
        }
        .form-container {
            background: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            width: 60%;
            margin: auto;
        }
        .input-style {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .button {
            width: 100%;
            padding: 12px;
            background: #6f42c1;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .button:hover {
            background: #5a3eaa;
        }
    </style>
</head>
<body>
    <div class="container">
        <table>
            <thead>
                <%
                String email=session.getAttribute("email").toString();
                int total=0;
                int sno=0;
                try {
                    Connection con=ConnectionProvider.getCon();
                    Statement st=con.createStatement();
                    ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
                    while(rs1.next()) {
                        total=rs1.getInt(1);
                    
                %>
                
            </thead>
        </table>

        <div class="form-container">
            <form action="addressPaymentForOrdersAction.jsp" method="post">
                <h3>Enter Address</h3>
                <input class="input-style" type="text" name="address" placeholder="Enter Address" required>

                <h3>Enter City</h3>
                <input class="input-style" type="text" name="city" placeholder="Enter City" required>

                <h3>Enter State</h3>
                <input class="input-style" type="text" name="state" placeholder="Enter State" required>

                <h3>Enter Country</h3>
                <input class="input-style" type="text" name="country" placeholder="Enter Country" required>

                <h3>Select Payment Method</h3>
                <select class="input-style" name="paymentMethod">
                    <option value="Cash on Delivery(COD)">Cash on Delivery(COD)</option>
                    <option value="Online Payment">Online Payment</option>
                </select>
                
                <h3>Enter Transaction ID (if online payment)</h3>
                <input class="input-style" type="text" name="transactionId" placeholder="Enter Transaction ID">

                <h3>Enter Mobile Number</h3>
                <input class="input-style" type="text" name="mobileNumber" placeholder="Enter Mobile Number" required>

                <button class="button" type="submit">Proceed to Generate Bill & Save <i class='far fa-arrow-alt-circle-right'></i></button>
            </form>
            <%
      }    
}
catch(Exception e)
{
	System.out.println(e);
}%>
        </div>
    </div>
</body>
</html>
