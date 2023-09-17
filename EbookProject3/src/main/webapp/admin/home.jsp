<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home Page</title>

<%@include file="allCss.jsp"%>

<style type="text/css">
  a{
       text-decoration:none;
       color:black;
  }
  a:hover{
      text-decoration:none;
       color:black;
  }
  
</style>
</head>
<body>
  <%@include file="navbar.jsp"%>
  
    <c:if test="${empty adminObj}">
      <c:redirect url="../login.jsp"></c:redirect>
    </c:if>


   <div class="container"> 
      <div class="row p-5">
         <div class="col-md-3">
             <a href="addBooks.jsp">
               <div class="card">
                 <div class="card-body text-center ">
                     <i class="fas fa-plus-square fa-3x text-primary"></i><br>
                       <h5>Add Books</h5>
                         
                 
                 </div>
              
              
                </div>
              </a>
         
         </div>
         
         
         <div class="col-md-3">
          <a href="allBooks.jsp">
              <div class="card">
                 <div class="card-body text-center">
                     <i class="fas fa-book-open fa-3x text-danger"></i><br>
                       <h5>All Books</h5>
                         
                 
                 </div>
              
              
              </div>
           </a>
         
         </div>
         
         
         <div class="col-md-3">
            <a href="orders.jsp">
              <div class="card">
                 <div class="card-body text-center">
                     <i class="fas fa-box-open fa-3x text-warning"></i><br>
                       <h5>Order Books</h5>
                        
                 
                 </div>
              
              
              </div>
             </a>
         </div>
         
         
         
         <div class="col-md-3">
            <a data-toggle="modal" data-target="#exampleModalCenter" >
              <div class="card">
                 <div class="card-body text-center">
                     <i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
                       <h5>LogOut</h5>
                       
                 
                 </div>
              
              
              </div>
         
           </a>
         </div>
        
      
      </div>


  
  </div>

   <!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body">
              <div class="text-center">
                    <h4>Do You Want LogOut</h4>
                    <button type="button" class="btn btn-secondary text-white" data-dismiss="modal">Close</button>
                    <a href="../LogOutServlet" type="button" class="btn btn-primary text-white">LogOut</a>
              
              </div>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>


<!-- End LogOut modal -->
  <div style="margin-top:20pc;">
        <%@include file="Footer.jsp" %>
  </div>
   
</body>
</html>