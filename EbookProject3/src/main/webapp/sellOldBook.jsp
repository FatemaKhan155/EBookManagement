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
<title>User:Old Book</title>
<%@ include file="allComponents/allCss.jsp" %>
</head>

<body>

<%@ include file="allComponents/navbar.jsp" %>

 <div class="container mt-5">
 
   <c:if test="${not empty successMsg }">
       <p class="text-center text-success">${successMsg}</p>
       <c:remove var="successMsg" scope="session"/>
   </c:if>
   
   <c:if test="${not empty failedMsg }">
       <p class="text-center text-success">${failedMsg}</p>
       <c:remove var="failedMsg" scope="session"/>
   </c:if>
   
   
         <table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author Name</th>
      <th scope="col">Price</th>
      <th scope="col">BookCategory</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
       
       <%
            User user=(User)session.getAttribute("userObj");
            String email=user.getEmail();
            Connection con=ConnectionProvider.getConnection();
            BooksDao booksDao=new BooksDao(con);
            List<BookDetails> al =booksDao.getBookByOld(email, "Old");
           
            for(BookDetails b:al)
            {%>
            	
            	 <tr>
                     <th scope="row"><%=b.getBooName() %></th>
                     <td><%=b.getAuthorName() %></td>
                     <td><%=b.getPrice() %></td>
                      <td><%=b.getBookCategory() %></td>
                     <td>
       
                       <a href="DeleteSellOldBook?email=<%=email %>&&bId=<%=b.getBookId() %>" class="btn btn-sm btn-danger">Delete</a>
                    </td>
               </tr>
            	
            <%}%>
            
           
       

  </tbody>
</table>
     
     
     
     </div>


<%@include file="allComponents/Footer.jsp" %>

</body>
</html>