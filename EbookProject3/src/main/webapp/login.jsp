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
               <h2 class="text-center">Login </h2>
                  
                   <c:if test="${not empty failed }">
                       <h5 class="text-center text-danger">${failed}</h5>
                       <c:remove var="failed" scope="session"></c:remove>
                       
                   </c:if>
                   
                   
                   <c:if test="${not empty successMsg }">
                       <h5 class="text-center text-success">${successMsg}</h5>
                       <c:remove var="successMsg" scope="session"></c:remove>
                       
                   </c:if>
                   
               
               
             <form  action="LoginServlet"  method="post">
                 
        
                  <div class="form-group">
                    <label for="exampleInputEmail1">Enter Email address</label>
                    <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp"  required="required">
                   
                 </div>
  
                <div class="form-group">
                  <label for="exampleInputPassword1">Enter Password</label>
                  <input type="password" class="form-control" name="pass" id="exampleInputPassword1" required="required">
               </div>
               
               
               <div class="form-check">
                  <input type="checkbox" class="form-check-input" name="check" id="exampleCheck1">
                  <label class="form-check-label" for="exampleCheck1">Agree terms & Condition</label>
               </div>
               
                <br>
               <div class="text-center">
                   <button type="submit" class="btn btn-primary" value="Login">Login</button>
               </div>
              
               
               <div class="text-center">
                   <a href="register.jsp">Create New Account</a>
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