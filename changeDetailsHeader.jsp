<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
 <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f4f4f9;
      margin: 0;
      padding: 0;
    }

   
.topnav h2 {
    color: white;
    margin: 0 auto; 
    font-size: 28px;
    font-weight: bold;
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
    .nav-links {
    display: flex;
    align-items: center;
    gap: 15px;
}

.nav-links a {
    background: #218838;
    color: white;
    padding: 10px 15px;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
    transition: 0.3s;
}

.nav-links a:hover {
    background: #1e7e34;
}

.search-container {
    display: flex;
    align-items: center;
}

.search-container input {
    padding: 10px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    width: 220px; 
}

.search-container button {
    padding: 10px;
    background: white;
    color: #28a745;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
}

.search-container button:hover {
    background: #1e7e34;
    color: white;
}
    

  </style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

</head>
    
    <br>
    <div class="topnav sticky">
            
              <% String email=session.getAttribute("email").toString();%>
            <h2><a href="home.jsp"><i class='fas fa-arrow-circle-left'>Back</i></a></h2>
             <h2><a href=""><%out.println(email); %> <i class='fas fa-user-alt'></i></a></h2>
            <a href="changePassword.jsp">Change Password <i class='fas fa-key'></i></a>
            <a href="">Add or change Address <i class='fas fa-map-marker-alt'></i></a>
            
            <a href="">Change Mobile Number <i class='fas fa-phone'></i></a>
          </div>
           <br>
          