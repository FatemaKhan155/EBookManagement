<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.databaseInfo.ConnectionProvider" import="java.sql.*"
    import="com.dao.BooksDao" import="com.entity.BookDetails " import="com.databaseInfo.ConnectionProvider"
    import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
<%@ include file="allComponents/allCss.jsp" %>
</head>
<body style="background-color:#f7f7f7">

<%@ include file="allComponents/navbar.jsp" %>
<h1>Contact Page</h1>







<%@include file="allComponents/Footer.jsp" %>
</body>
</html>