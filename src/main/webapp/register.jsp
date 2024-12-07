<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Registration</title>
    <%@ include file="Alldata/css_js.jsp" %> <!-- Ensure this file exists and is correctly referenced -->
</head>
<body>
    <%@ include file="Alldata/navbar.jsp" %> <!-- Ensure this file exists and is correctly referenced -->
    <div class="container-fluid mt-5">
        <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
                <%@ include file="message.jsp" %> <!-- Ensure this file exists and is correctly referenced -->
          	<div class="card-mt-5"></div>
          		<div class="card-header  bg-color="blue" text-white" >
               <h2 class="text-center my-3">Sign Up Here</h2>
                </div>
                <div class="card-body">
                <form method="Get" action="AllServlet" enctype="multipart/form-data"> <!-- Changed method to POST and added enctype for file uploads -->
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter User name" required />
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter User email" required />
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter User password" required />
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter phone number" required />
                    </div>

                    <div class="form-group">
                        <label for="pic">Image</label>
                        <input type="file" class="form-control" id="pic" name="pic" />
                    </div>
                    
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" class="form-control" id="inputAddress" name="address" placeholder="1234 Main St" />
                    </div>
                    
                    <a href="login.jsp" class="text-center d-block mb-2">Alreday Register click here</a>
								
                    <input type="hidden" name="page" value="register" />
                    
                    <button type="submit" class="btn btn-primary">Register</button>
                    
                    <button type="reset" class="btn btn-secondary">Reset</button> <!-- Changed button style for reset -->
                </form>
                </div>
            </div>
            
        </div>
    </div>
</body>
</html>