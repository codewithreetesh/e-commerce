<%@page import="com.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Normal Page</title>
    <%@ include file="Alldata/css_js.jsp" %>
</head>
<body>

<%@ include file="Alldata/navbar.jsp" %>
<%@ include file="message.jsp" %>

<%
    User user = (User) session.getAttribute("current-user");

    if (user == null) {
        session.setAttribute("message", "You are not logged in. Please log in first.");
        response.sendRedirect("login.jsp");
        return;
    } else if (user.getUser_type().equals("ADMIN")) {
        session.setAttribute("message", "You are not a normal user. Access to this page is restricted.");
        response.sendRedirect("login.jsp"); // Redirect to an error page instead
        return;
    }
%>

<%@ include file="Alldata/common_model.jsp" %>
</body>
</html>
