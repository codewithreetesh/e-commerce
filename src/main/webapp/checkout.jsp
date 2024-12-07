<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Order Details</title>
    <%@ include file="Alldata/css_js.jsp"%>
    <link rel="stylesheet" href="css/style.css">
</head>
<style>
	.product{
		margin:ml-10;
	}
</style>
<body>
    <%@ include file="Alldata/navbar.jsp"%>
    <%
        User user = (User) session.getAttribute("current-user");

        if (user == null) {
            session.setAttribute("message", "You are not logged in. Please log in first.");
            response.sendRedirect("login.jsp");
            return;
        } 
    %>

    <div class="container">
        <div class="row mt-5 ml-5 mb-5">
            <div class="col-md-8  mt-5">
                <div class="card">
                    <div class="card-body">
                        <div class="card">
                            <div class="cart-body">
                                <!-- Add cart content here -->
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mt-5">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center mb-5">Your Details for Order</h3>
                        <form action="AllServlet" method="post">
                            <fieldset>
                                <legend>Contact Information</legend>
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter User name" required />
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter User email" required />
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <input type="text" class="form-control" id="inputAddress" name="address" placeholder="1234 Main St" />
                                </div>
                            </fieldset>
                            <button type="submit" class="btn btn-primary" name="page" value="order" onclick='conformOrder()'>Order Now</button>
                            <button type="button" class="btn btn-secondary" onclick="window.location.href='index.jsp'">Continue Shopping</button>
                        </form>
                    </div>
                </div>	
            </div>
        </div>
    </div>

   	
</body>
</html>
