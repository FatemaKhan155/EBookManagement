<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<%@include file="allComponents/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2;">

<%@include file="allComponents/navbar.jsp" %>
<div class="container p-5">
  <div class="row">
    <div class="col-md-4 offset-md-4">
       <div class="card">
           
          <div class="card-body">
          
               <h2 class="text-center">Register Form</h2>
               
                    <!--yah per hamne JSTL Tag ko use kiya hai -->
                    
                    <c:if test="${not empty success}">
                          <p class="text-center text-success">${success}</p>     
                          <c:remove var="success" scope="session"/>
                     </c:if>
                     
                     <c:if test="${not empty failed}">
                          <p class="text-center text-danger">${failed}</p>
                          <c:remove var="failed" scope="session"/>
                     </c:if>
                     
                 
             <form  action="RegisterServlet" method="post">
                 
                 <div class="form-group">
                    <label for="exampleInputName">Enter Full Name</label>
                    <input type="text" class="form-control" name="name" id="exampleInputName" aria-describedby="emailHelp" required="required" >
                    
                 </div>
             
                  <div class="form-group">
                    <label for="exampleInputEmail1">Enter Email address</label>
                    <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" >
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                 </div>
  
                <div class="form-group">
                  <label for="exampleInputPassword1">Enter Password</label>
                  <input type="password" class="form-control" name="pass" id="exampleInputPassword1" required="required">
               </div>
               
               <div class="form-group">
                  <label for="exampleInputNumber">Enter Mobile Number</label>
                  <input type="number" class="form-control" name="phone" id="exampleInputPhone">
               </div>
               
               <div class="form-group">
                  <label for="exampleInputAddress">Enter Address</label>
                  <input type="text" class="form-control" name="address" id="exampleInputAddress">
               </div>
               
               <div class="form-check">
                  <input type="checkbox" class="form-check-input" name="check" id="exampleCheck1">
                  <label class="form-check-label" for="exampleCheck1">Agree terms & Condition</label>
               </div>
               
               <br>
               <div class="text-center">
                   <button type="submit" class="btn btn-primary">Register</button>
               </div>
               
               
      
             </form>
            
             
          
          </div>
       
       </div>
    
    </div>
  
  </div>


</div>


<%@ include file="allComponents/Footer.jsp" %>

</body>
</html>