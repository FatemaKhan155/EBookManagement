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
<title>Sell Book</title>
<%@ include file="allComponents/allCss.jsp" %>
</head>

<body style="background-color:#f0f1f2;">

  <c:if test="${empty userObj}">
    <c:redirect url="login.jsp"></c:redirect>
  </c:if>

<%@ include file="allComponents/navbar.jsp" %>


    <div class="container">  
         <div class="row p-3">
            <div class="col-md-4 offset-md-4">
            
               <div class="card">
                 <div class="card-body">
                       
                           <h2 class="text-center text-primary">Sell Old Book</h2>
                                
                                 <c:if test="${not empty successMsg}">
                                      <p class="text-center text-success">${successMsg}</p> 
                                      <c:remove var="successMsg" scope="session"/>
                                
                                 </c:if>
                                
                                
                                <c:if test="${not empty failedMsg}">
                                      <p class="text-center text-danger">${failedMsg}</p> 
                                      <c:remove var="failedMsg" scope="session"/>
                                
                                 </c:if>
                                
                                             
                          <form action="AddOldBookSell" method="post" enctype="multipart/form-data">
                              
                              <input type="hidden" value="${userObj.email}" name="userEmail"/>
                          
                              <div class="form-group">
                               <label for="exampleInputName">Book Name</label>
                               <input type="text" class="form-control" name="bookName" id="exampleInputName" aria-describedby="emailHelp" required="required" >
                    
                              </div>
             
                             <div class="form-group">
                                <label for="exampleInputEmail1">Author Name</label>
                                <input type="text" class="form-control" name="authorName" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" >
                               
                            </div>
                            
                              
                           <div class="form-group">
                               <label for="exampleInputPassword1">Price</label>
                              <input type="number" class="form-control" name="price" id="exampleInputPassword1" required="required">
                          </div>
               
                         
               
                        <div class="form-group">
                          <label for="exampleFormControlFile">Upload Photo</label>
                          <input type="file" class="form-control-file" name="fimg" id="exampleInputFile">
                        </div>
               
                      
               
                        <br>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary text-white">Sell</button>
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