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
<title>All Recent Books</title>
<%@ include file="allComponents/allCss.jsp" %>

<style>
   
   
   .crd-ho:hover{
   background-color:#f7f7f7;
         
   }
</style>
</head>
<body>


<%@ include file="allComponents/navbar.jsp" %>

    <%
              User user=(User)session.getAttribute("userObj");
              
     
     %>


   <div class="container-fluid">
      <div class="row p-3"> 
          
               
                  <% 
                
                    Connection con=ConnectionProvider.getConnection();
                    BooksDao booksDao=new BooksDao(con);
                    List< BookDetails> al=booksDao.getAllRecentBook();
                    for(BookDetails b:al)
                    {%>
                          <div class="col-md-3">
                           <div class="card crd-ho mt-2">
                             <div class="card-body text-center">
                              <img alt="" src="books/<%=b.getPhoto()%>" style="height:150px;width:100px;" class="img-thumblin">
                                <p><%=b.getBooName() %></p>
                                 <p><%=b.getAuthorName() %></p>
                                  
                                  <%
                                      if(b.getBookCategory().equals("Old"))
                                      {%>
                                          <p><%=b.getBookCategory()%></p>
                                           <div class="row">
  
                                             <a href="view.jsp?Id=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                                              <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %> <i class="fas fa-rupee-sign"></i></a>
                     
                                           </div>
                   
                                      <% 
                                       }
                                      else
                                      { %>
                                      <p><%=b.getBookCategory()%></p>
                                          <div class="row">
                                             <%
                                                   if(user==null)
                                                   {%>
                                                   
                                                      <a href="login.jsp" class="btn btn-danger btn-sm ml-5"><i class="fas fa-cart-plus"></i>Add Cart</a>
                                                   <%}
                                                   else{%>
                                                  
                                                   
                                                       <a href="CartServlet?bId=<%=b.getBookId()%>&&uId=<%=user.getId()%>" class="btn btn-danger btn-sm ml-5"><i class="fas fa-cart-plus"></i>Add Cart</a>
                                                   <%}%>
                                             
                                             
                                             <a href="view.jsp?Id=<%=b.getBookId()%>"  class="btn btn-success btn-sm ml-1">View Details</a>
                                             <a href="" class="btn btn-danger btn-sm ml"><%=b.getPrice() %> <i class="fas fa-rupee-sign"></i></a>
                     
                                         </div>
                   
                                      <%
                                      
                                      }%>
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