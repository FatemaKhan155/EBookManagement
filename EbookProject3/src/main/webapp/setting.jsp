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
<title>Setting Page</title>
<%@ include file="allComponents/allCss.jsp" %>

<style type="text/css">

   a{
       text-decoration:none;
       color:black;
   
   }
   
   a:hover{
       text-decoration:none;
       
   }

</style>
</head>
<body style="background-color:#f7f7f7">
  
  <c:if test="${empty userObj}">
     <c:redirect url="login.jsp"></c:redirect>
   
  </c:if>

<%@ include file="allComponents/navbar.jsp" %>


      <div class="container">
         
          <h1 class="text-center">Hello,${userObj.name}</h1>
       
         <div class="row p-5">
            <div class="col-md-4">
                 <a href="sellBook.jsp">
                 
                   <div class="card">
                      <div class="card-body text-center"> 
                          <div class="text-primary "><i class="fas fa-book-open fa-3x"></i></div>
                          
                             <h4>Sell Old Book</h4>
                      
                          
                     </div>
                 
                 
                 </div>
               
                 
                 </a>
            
            
            </div>
            
            
            
            <div class="col-md-4">
                 <a href="sellOldBook.jsp">
                 
                   <div class="card">
                      <div class="card-body text-center"> 
                          <div class="text-primary "><i class="fas fa-book-open fa-3x"></i></div>
                          
                             <h4>Old Book</h4>
                      
                          
                     </div>
                 
                 
                 </div>
               
                 
                 </a>
            
            
            </div>
         
         
         
         
         <div class="col-md-4">
                 <a href="securityAndEditProfile.jsp">
                 
                   <div class="card">
                      <div class="card-body text-center"> 
                          <div class="text-primary "><i class="fas fa-edit fa-3x"></i></div>
                          
                             <h4>Edit Profile</h4>
                      
                          
                     </div>
                 
                 
                 </div>
             
                 
                 
                 
                 
                 </a>
            
            
            </div>
            
            
            
           
         <div class="col-md-6 mt-3">
                 <a href="myOrder.jsp">
                 
                   <div class="card">
                      <div class="card-body text-center"> 
                          <div class="text-danger"><i class="fas fa-box-open fa-3x"></i></div>
                          
                             <h4>My Order</h4>
                             <p>Track your Order</p>
                      
                          
                     </div>
                 
                 
                 </div>
             
                 
                 
                 
                 
                 </a>
            
            
            </div>
         
         
         
          <div class="col-md-6 mt-3">
                 <a href="helpCenter.jsp">
                 
                   <div class="card">
                      <div class="card-body text-center"> 
                          <div class="text-primary"><i class="fas fa-user-circle fa-3x"></i></div>
                          
                             <h4>Help Center</h4>
                             <p>24 * 7 Services</p>
                      
                          
                     </div>
                 
                 
                 </div>
             
                 
                 
                 
                 
                 </a>
            
            
            </div>
         
         
         </div>
      
      
      </div>
      
      
      

<%@include file="allComponents/Footer.jsp" %>


</body>
</html>