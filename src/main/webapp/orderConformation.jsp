<%@ page import="com.model.Order" %>
<%@ page import="com.model.Product" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%
    Order order = (Order) session.getAttribute("order");
    String message = (String) session.getAttribute("message");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="Alldata/css_js.jsp" %>
    <link rel="stylesheet" href="css/style.css">
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        table {
            width: 50%;
            border-collapse: collapse;
            margin-bottom: 20px; /* Added margin for separation */
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        button {
            margin-top: 20px;
            padding: 10px 20px;
        }
        .star {
            font-size: 30px;
            color: #ccc;
            cursor: pointer;
        }
        .star:hover,
        .star.selected {
            color: gold;
        }
        .order-details {
            margin-top: 100px;
        }
    </style>
</head>
<body>

    <%@ include file="Alldata/navbar.jsp" %>
<%@ page import="com.model.Product" %>
<%@ page import="com.google.gson.Gson" %>

<!DOCTYPE html>
<html lang="en">
<head>

<%
    Product[] cartProducts = (Product[]) session.getAttribute("cart");
    System.out.println(cartProducts);
    if (cartProducts != null) {
        System.out.println("Cart contains " + cartProducts.length+cartProducts + " products.");
    } else {
        System.out.println("Cart is null.");
    }
%>

<h1>Product Confirmation</h1>

<%
    if (cartProducts != null && cartProducts.length > 0) {
%>
    <table>
        <thead>
            <tr>
                <th>Product Id</th>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
            </tr>
        </thead>
        <tbody>
<%
        for (Product product : cartProducts) {
            if (product != null) { // Check if product is not null
                System.out.println("Product details: ID=" + product.getPid() + ", Name=" + product.getPname() +
                                   ", Price=" + product.getPprice() + ", Quantity=" + product.getPquantity());
%>	
                <tr>
                    <td><%= product.getPid() %></td>
                    <td><%= product.getPname() %></td>
                    <td><%= product.getPprice() %></td>
                    <td><%= product.getPquantity() %></td>
                </tr>
<%
            } else {
                System.out.println("Found a null product in cartProducts.");
            }
        }
%>
        </tbody>
    </table>
<%
    } else {
%>
    <p>No items in your order.</p>
<%
    }
%>


        <% if (order != null) { %>
            <h2>Order Information</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Address</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%= order.getoId() %></td>
                        <td><%= order.getName() %></td>
                        <td><%= order.getEmail() %></td>
                        <td><%= order.getAddress() %></td>
                    </tr>
                </tbody>
            </table>
        <% } else { %>
            <p>No order details available.</p>
        <% } %>

        <h2>Feedback Form</h2>
        <form action="AllServlet" method="post">
            <div class="form-group">
                <label for="textfeedback">Feedback on the Product:</label>
                <input type="text" class="form-control" id="textfeedback" name="textfeedback" required>
            </div>
            <div class="form-group">
                <label for="rating">Rate Us:</label>
                <div id="rating" class="rating">
                    <span class="star" data-value="1">★</span>
                    <span class="star" data-value="2">★</span>
                    <span class="star" data-value="3">★</span>
                    <span class="star" data-value="4">★</span>
                    <span class="star" data-value="5">★</span>
                </div>
                <input type="hidden" name="rating" id="rating-value">
            </div>
            <button type="submit" class="btn btn-primary" name="page" value="feedback">Submit</button>
            <button type="button" class="btn btn-secondary" onclick="window.location.href='skip.jsp';">Skip</button>
        </form>
    </div>

    <script>
        const stars = document.querySelectorAll('.star');
        const ratingValue = document.getElementById('rating-value');

        stars.forEach(star => {
            star.addEventListener('click', function() {
                const rating = this.getAttribute('data-value');
                ratingValue.value = rating;

                stars.forEach(s => {
                    s.classList.remove('selected');
                });
                for (let i = 0; i < rating; i++) {
                    stars[i].classList.add('selected');
                }
            });
        });

               
        </script>
</body>
</html>
