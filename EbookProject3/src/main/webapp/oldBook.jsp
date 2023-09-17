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
<title>All Old Books</title>
<%@ include file="allComponents/allCss.jsp" %>
<style>
   
   
   .crd-ho:hover{
   background-color:#f7f7f7;
         
   }
</style>
</head>
<body>

<%@ include file="allComponents/navbar.jsp" %>

   <div class="container-fluid">
     <div class="row p-3">
         
             
             <%
                   
                    Connection con1=ConnectionProvider.getConnection();
                    BooksDao booksDao1=new BooksDao(con1);
                    List< BookDetails> al1=booksDao1.getAllOldBook();
                    for(BookDetails b:al1)
                    {%>
                      <div class="col-md-3">
                      <div class="card crd-ho mt-2">
                         <div class="card-body text-center">
                            <img alt="" src="books/<%=b.getPhoto() %>" style="height:150px;width:100px;" class="img-thumblin">
                             <p><%=b.getBooName() %></p>
                             <p><%=b.getAuthorName() %></p>
                             <p><%=b.getBookCategory() %></p>
                           <div class="row">
                             
                             <a href="view.jsp?Id=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                             <a href="" class="btn btn-danger btn-sm ml-2"><%=b.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
                     
                          </div>
                   
                      </div>
                 </div>

      
             </div>
                    <% 	
                    }
                    %> 
         
        </div>
    </div>
    
    <%@include file="allComponents/Footer.jsp" %>
</body>
</html>