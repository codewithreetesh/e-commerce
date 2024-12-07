<%@ page import="com.model.User" %>
<%
    User user1 = (User) session.getAttribute("current-user");
%>
<link rel="stylesheet" href="css file/style.css">

<ul class="nav custom-bg self">
    <li class="nav-item"><a class="nav-link active" href="#">MyCart</a></li>
    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
    
    <div class="d-flex">
        <div class="dropdown mr-1">
            <button type="button" class="btn btn-secondary dropdown-toggle"
                    id="dropdownMenuOffset" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false" data-offset="10,20">Category1</button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <a class="dropdown-item" href="#">Something else here</a>
                
            </div>
        </div>
        
        <li class="nav-item active"></li>
        <a class="nav-link d-flex align-items-center" href="#"
           data-toggle="modal" data-target="#cart">
            <i class="fa fa-cart-plus" style="font-size: 20px; margin-right: 5px;"></i>
            <span class="cart-items">(0)</span>
        </a>
        
        <% if (user1 == null) { %>
            <li class="nav-item active"><a class="nav-link" href="login.jsp">Login</a></li>
            <li class="nav-item active"><a class="nav-link" href="register.jsp">Register</a></li>
        <% } else { %>
            <li class="nav-item active">
                <% if (user1.getUser_type().equals("ADMIN")) { %>
                    <a class="nav-link" href="admin.jsp"><%= user1.getUser_name() %></a>
                <% } else { %>
                    <a class="nav-link" href="#"><%= user1.getUser_name() %></a>
                <% } %>
            </li>
            <li class="nav-item active"><a class="nav-link" href="AllServlet?page=logout">Logout</a></li>
        <% } %>
    </div>
</ul>
