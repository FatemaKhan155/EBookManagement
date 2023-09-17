<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.OrderBookDetails"%>
<%@page import="com.dao.OrderBookDao"%>
<%@page import="com.databaseInfo.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>         
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="allCss.jsp"%>
</head>
<body>


 <c:if test="${empty adminObj }">
     <c:redirect url="../login.jsp"></c:redirect>
  </c:if>

<%@include file="navbar.jsp"%>
<h1 class="text-center p-2">Orders Book</h1>

   <table class="table table-striped ">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Phone No</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  
  <tbody>
  
   <%
       User user=(User)session.getAttribute("adminObj");
       Connection con=ConnectionProvider.getConnection();
       OrderBookDao orderBookDao=new OrderBookDao(con);
       List<OrderBookDetails> al=orderBookDao.getAllBookOrder();
       for(OrderBookDetails o:al)
       {%>
       
          <tr>
             <th scope="row"><%=o.getOrderId() %></th>
             <td><%=o.getUserName() %></td>
             <td><%=o.getEmail() %></td>
             <td><%=o.getAddress() %></td>
             <td><%=o.getMobile() %></td>
             <td><%=o.getBookName() %></td>
             <td><%=o.getAuthorName() %></td>
             <td><%=o.getPrice() %></td>
             <td><%=o.getPayment() %></td>
         
        </tr>
        
       <%}%>
  
    
    
    
  </tbody>
</table>

<div style="margin-top:20pc;">
        <%@include file="Footer.jsp" %>
  </div>
</body>
</html>