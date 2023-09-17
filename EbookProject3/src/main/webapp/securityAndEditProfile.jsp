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
<title>Edit Profile</title>
<%@ include file="allComponents/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2;">

 <c:if test="${empty userObj }">
    <c:redirect url="login.jsp"></c:redirect>
    
    
 </c:if>


<%@ include file="allComponents/navbar.jsp" %>


   
   <div class="container">
       <div class="row p-3">
          <div class="col-md-4 offset-md-4">
              <div class="card">
                  <div class="card-body">
                  
                     <h2 class="text-center text-primary"> Edit Profile</h2>
                     
                     
                     <c:if test="${not empty successMsg}">
                        <p class="text-center text-success">${successMsg}</p>
                        <c:remove var="successMsg" scope="session"/>
                     
                     </c:if>
                     
                     
                     <c:if test="${not empty failedMsg}">
                        <p class="text-center text-danger">${failedMsg}</p>
                        <c:remove var="failedMsg" scope="session"/>
                     
                     </c:if>
                     
                     
                     <c:if test="${not empty incorrectPassMsg}">
                        <p class="text-center text-danger">${incorrectPassMsg}</p>
                        <c:remove var="incorrectPassMsg" scope="session"/>
                     
                     </c:if>
                     
                  
                     <form action="UpdateUserProfile"  method="post">
                 
                        <input type="hidden" value="${userObj.id}" name="userId" />
                   
                  <div class="form-group">
                    <label for="exampleInputName">Enter Full Name</label>
                    <input type="text" class="form-control" name="name" value="${userObj.name }" id="exampleInputEmail1" aria-describedby="emailHelp"  required="required">
                   
                 </div>
                 
                
                <div class="form-group">
                  <label for="exampleInputEmail">Email Address</label>
                  <input type="email" class="form-control" name="email" value="${userObj.email}" id="exampleInputEmail" required="required">
               </div>
  
                            
  
                <div class="form-group">
                  <label for="exampleInputAddress">Address</label>
                  <input type="text" class="form-control" name="address" value="${userObj.address}" id="exampleInputPassword1" required="required">
               </div>
               
               
               
               <div class="form-group">
                    <label for="exampleInputPhone">Phone Number</label>
                    <input type="number" class="form-control" name="mobile" value="${userObj.mobile}" id="exampleInputEmail1" aria-describedby="emailHelp"  required="required">
                   
                 </div>
  
          
               <div class="form-group">
                  <label for="exampleInputPassword1">Password</label>
                  <input type="password" class="form-control" name="pass"  id="exampleInputPassword1" required="required">
               </div>
               
                <br>
               <div class="text-center">
                   <button type="submit" class="btn btn-primary text-white" value="Edit">Update Profile</button>
               </div>
   
                
             </form>
             
             
                  
                  </div>
              
              
              
              
              </div>
          
          
          
          
          </div>
       
       
       
       
       </div>
   
   
   
   
   </div>
   
   
<%@include file="allComponents/Footer.jsp" %>
</body>
</html>