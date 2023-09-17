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
<title>E-Book Home Page</title>
<%@ include file="allComponents/allCss.jsp" %>

<!-- Ye Div Banner ke liye banaya hai css style diya hai -->
<style>
   .back-img{
   
       background:url("img/book10.jpg");
       height:50vh;
       width:100%;
       background-repeat:no-repeat;
       background-size:cover;
   }
   
   .crd-ho:hover{
   background-color:#f7f7f7;
         
   }
</style>

</head>
<body style="background-color:#f7f7f7">

     
     <%
              User user=(User)session.getAttribute("userObj");
              
     
     %>

<%@ include file="allComponents/navbar.jsp" %>

<!-- Ye Div Banner ke liye banaya hai -->

<div class="container-fluid back-img">
      <h2 class="text-center text-success"> E-Book Management System</h2>
</div>


<!-- Container mai hamne Cards/Section ko banaya hai -->
<!-- Start Recent Book -->

<div class="container"> 
    <h3 class="text-center">Recent Book</h3>
      <div class="row">
      
               <% 
                    
                    Connection con=ConnectionProvider.getConnection();
                    BooksDao booksDao=new BooksDao(con);
                    List< BookDetails> al=booksDao.getRecentBook();
                    for(BookDetails b:al)
                    {%>
                    
                       <div class="col-md-4">
                           <div class="card crd-ho">
                             <div class="card-body text-center">
                              <img alt="" src="books/<%=b.getPhoto()%>" style="height:150px;width:150px;" class="img-thumblin">
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
                                                   
                                                	  
                                                   
                                              
                                             
                                             <a href="view.jsp?Id=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
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
    
    <div class="text-center mt-2">
    <a href="recentBook.jsp" class="btn btn-danger btn-sm text-white">View All</a>
    </div>
</div>
<!-- End Recent Book -->



<hr>


<!-- Start New Book -->

<div class="container"> 
    <h3 class="text-center">New Book</h3>
      <div class="row">
         
             
             <%
                   
                    Connection con1=ConnectionProvider.getConnection();
                    BooksDao booksDao1=new BooksDao(con1);
                    List< BookDetails> al1=booksDao1.getNewBook();
                    for(BookDetails b:al1)
                    {%>
                      <div class="col-md-4">
                      <div class="card crd-ho">
                         <div class="card-body text-center">
                            <img alt="" src="books/<%=b.getPhoto() %>" style="height:150px;width:150px;" class="img-thumblin">
                             <p><%=b.getBooName() %></p>
                             <p><%=b.getAuthorName() %></p>
                             <p><%=b.getBookCategory() %></p>
                           <div class="row">
                           
                                     <%
                                        if(user==null)
                                         {%>
                                                   
                                           <a href="login.jsp" class="btn btn-danger btn-sm ml-5"><i class="fas fa-cart-plus"></i>Add Cart</a>
                                          <%}
                                          else{%>
                                                           
                                              <a href="CartServlet?bId=<%=b.getBookId()%>&&uId=<%=user.getId()%>" class="btn btn-danger btn-sm ml-5"><i class="fas fa-cart-plus"></i>Add Cart</a>
                                         <%}%>
                             
                             <a href="view.jsp?Id=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                             <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
                     
                          </div>
                   
                      </div>
                 </div>

      
             </div>
                    <% 	
                    }
                    %> 
         
        </div>
    
        <div class="text-center mt-2">
         <a href="newBook.jsp" class="btn btn-danger btn-sm text-white">View All</a>
        </div>
   </div>


<!-- End New  Book -->

<hr>

<!-- Start Old Book -->

<div class="container"> 
    <h3 class="text-center">Old Book</h3>
      <div class="row">
      
        
        
         <%
                   
                    Connection con2=ConnectionProvider.getConnection();
                    BooksDao booksDao2=new BooksDao(con2);
                    List< BookDetails> al2=booksDao2.getOldBook();
                    for(BookDetails b:al2)
                    {%>
                      <div class="col-md-4">
                      <div class="card crd-ho">
                         <div class="card-body text-center">
                            <img alt="" src="books/<%=b.getPhoto() %>" style="height:150px;width:150px;" class="img-thumblin">
                             <p><%=b.getBooName() %></p>
                             <p><%=b.getAuthorName() %></p>
                             <p><%=b.getBookCategory() %></p>
                           <div class="row">
                             
                             <a href="view.jsp?Id=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                             <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
                     
                          </div>
                   
                      </div>
                 </div>

      
             </div>
                    <% 	
                    }
                    %> 
       
     
         
      </div>
    
    <div class="text-center mt-2">
    <a href="oldBook.jsp" class="btn btn-danger btn-sm text-white">View All</a>
    </div>
</div>
<!-- End Old Book -->


<!-- Start Footer -->

 

<%@include file="allComponents/Footer.jsp" %>




</body>
</html>