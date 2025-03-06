<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f4f4f9;
      margin: 0;
      padding: 0;
    }

    h2 {
      color: #444;
      font-size: 2.5em;
      margin: 0;
      font-family: 'Roboto', sans-serif;
    }

    .topnav {
      background-color: #4CAF50;
      overflow: hidden;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .topnav a {
      float: left;
      display: block;
      color: white;
      text-align: center;
      padding: 14px 20px;
      text-decoration: none;
      font-size: 18px;
      transition: background-color 0.3s ease, color 0.3s ease;
    }

    .topnav a:hover {
      background-color: #45a049;
      color: #fff;
    }

    .topnav a:active {
      background-color: #367c39;
    }

    .topnav .logo {
      font-size: 2em;
      color: white;
      text-align: center;
      flex: 1;
    }

    

    .topnav a i {
      margin-left: 8px;
    }

    .sticky {
      position: -webkit-sticky;
      position: sticky;
      top: 0;
      z-index: 100;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
    }

    .topnav a {
      padding: 12px 16px;
    }

  </style>
</head>
<body>
  <!--Header-->
  <div class="topnav sticky">
    <div class="logo">


      <h2>INSTAMART</h2>
    </div>
    <% String email = session.getAttribute("email").toString(); %>
    <a href="addNewProduct.jsp">Add New Product <i class='fas fa-plus-square'></i></a>
    <a href="allProductEditProduct.jsp">All Products & Edit Products <i class='fab fa-elementor'></i></a>
    <a href="#">Messages Received <i class='fas fa-comment-alt'></i></a>
    <a href="#">Orders Received <i class="fas fa-archive"></i></a>
    <a href="#">Cancel Orders <i class='fas fa-window-close'></i></a>
    <a href="#">Delivered Orders <i class='fas fa-dolly'></i></a>
    <a href="../logout.jsp">Logout <i class='fas fa-share-square'></i></a>
  </div>
  
  <br>
  <!--table-->
</body>
</html>
