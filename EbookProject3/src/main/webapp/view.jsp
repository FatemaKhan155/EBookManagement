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
<title>Insert title here</title>
<%@ include file="allComponents/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2;">
   <%@ include file="allComponents/navbar.jsp" %>
       
         <%
         
                 int id=Integer.parseInt(request.getParameter("Id"));
         
                 Connection con=ConnectionProvider.getConnection();
                 BooksDao booksDao=new BooksDao(con);
                 BookDetails  bookDetails =booksDao.getBookById(id);
                    
         
         %>
   
   <div class="container p-3"> 
        <div class="row p-5">
            <div class="col-md-6 text-center p-5 border bg-white">
                <img alt="" src="books/<%=bookDetails.getPhoto() %>" style="height:150px;width:100px;">
                <h5 class="mt-3">Book Name : <span class="text-success"><%=bookDetails.getBooName()%></span></h5>
                <h5>Author Name : <span class="text-success"><%=bookDetails.getAuthorName() %></h5>
                <h5>Book Category : <span class="text-success"><%= bookDetails.getBookCategory()%></h5>
                
            
            
            </div>
            
            
            <div class="col-md-6  text-center p-5 border border bg-white">
               <h2> <%=bookDetails.getBooName()%></h2>
                   
                      <%
                        if("Old".equals(bookDetails.getBookCategory())){
                        %>
                              <h5 class="text-primary">Contact To Seller</h5>
                              <h5 class="text-primary"><i class="fas fa-envelope"></i>Email : <%=bookDetails.getEmail()%></h5>
                              
                        <% 
                        }
                        %>
               
                 <div class="row">
                    <div class="col-md-4 text-center text-danger p-2"> 
                       <i class="fas fa-money-bill-wave fa-2x"></i>
                        <p>Case on Delivery</p>
                    </div>
                    
                     <div class="col-md-4 text-center text-danger p-2"> 
                         <i class="fas fa-undo-alt fa-2x"></i>
                         <p>Retrun Available</p>
                     </div>
                      <div class="col-md-4 text-center text-danger p-2"> 
                           <i class="fas fa-truck-moving fa-2x"></i>
                           <p>Free Delivery</p>
                      </div>
                    
                 
                 </div>
                 
                 
                 
                      <%
                        if("Old".equals(bookDetails.getBookCategory())){
                        %>
                             <div class="text-center p-3">
                                   <a href="index.jsp" class="btn btn-success"><i class="fas fa-cart-plus"></i>Continue Shopping</a>
                                   <a href="" class="btn btn-danger"><i class="fas fa-rupee-sign"></i> <%=bookDetails.getPrice() %></a>
                     
                 
                           </div>
                        <% 
                        }
                        else
                        {
                        %>
                           <div class="text-center p-3">
                                   <a href="" class="btn btn-primary"><i class="fas fa-cart-plus"></i>Add Cart</a>
                                   <a href="" class="btn btn-danger"><i class="fas fa-rupee-sign"></i> <%=bookDetails.getPrice() %></a>
                     
                 
                           </div>  
                        <%
                        }
                        %>
                 
                 
            
            
            </div>
        
        
        </div>
   
   </div>


</body>
</html>