<%@page import="java.util.List"%>
<%@page import="com.entity.OrderBookDetails"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.OrderBookDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.databaseInfo.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Order </title>
<%@include file="allComponents/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2;">

  <c:if test="${empty userObj }">
     <c:redirect url="login.jsp"></c:redirect>
  </c:if>

<%@include file="allComponents/navbar.jsp" %>
              
 <div class="container p-1">
          
    <table class="table table-striped mt-3">
       <h3 class="text-center text-primary">Your Order Details</h3>
       
    
     <thead class="bg-primary text-white">
     <tr>
      <th scope="col">Order Id</th>
      <th scope="col">User Name</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author Name</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>

  <tbody>
  
      <%
       User user=(User)session.getAttribute("userObj");
       Connection con=ConnectionProvider.getConnection();
       OrderBookDao orderBookDao=new OrderBookDao(con);
       List<OrderBookDetails> al=orderBookDao.getBookOrder(user.getEmail());
       for(OrderBookDetails o:al)
       {%>
       
          <tr>
             <th scope="row"><%=o.getOrderId() %></th>
             <td><%=o.getUserName() %></td>
             <td><%=o.getBookName() %></td>
             <td><%=o.getAuthorName() %></td>
             <td><%=o.getPrice() %></td>
             <td><%=o.getPayment() %></td>
         
        </tr>
        
       <%}%>
       
       
      
  </tbody>
</table>
            
            
          </div>

<%@include file="allComponents/Footer.jsp" %>
</body>
</html>