<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body><%@ page import="com.google.gson.Gson" %>
<%@ page import="com.model.Product" %>
<%@ page import="java.util.Arrays" %>

<%
    String cartJson = request.getParameter("cart");
    System.out.println("Received Cart JSON: " + cartJson);

    if (cartJson != null) {
        try {
            Gson gson = new Gson(); // Create Gson object
            Product[] products = gson.fromJson(cartJson, Product[].class); // Use the object to parse

            if (products != null) {
                System.out.println("Parsed Products: " + Arrays.toString(products));
                session.setAttribute("cart", products);
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
        } catch (Exception e) {
            System.out.println("Error parsing JSON: " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    } else {
        System.out.println("cartJson is null");
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
    }
%>
</body>
</html>