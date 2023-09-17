<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color:#f0f2f2;">

 <%@include file="navbar.jsp"%>
   
   <c:if test="${empty adminObj}">
      <c:redirect url="../login.jsp"></c:redirect>
    </c:if>
   
       
       <div class="container">  
           <div class="row p-5">
               <div class="col-md-4 offset-md-4">
                   <div class="card">
                       <div class="card-body">
                            <h4 class="text-center p-2">Add Books</h4>
                               
                               <c:if test="${not empty successMsg}">
                                  <p class="text-center text-success">${successMsg}</p>
                                  <c:remove var="successMsg" scope="session"/>
                               </c:if>
                               
                               <c:if test="${not empty failedMsg}">
                                  <p class="text-center text-danger">${failedMsg}</p>
                                  <c:remove var="failedMsg" scope="session"/>
                               </c:if>
                               
                               
                        
                          <form  action="../AddBookServlet" method="post" enctype="multipart/form-data">
                 
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
                             <label for="exampleInputNumber">Book Categories</label>
                             <select id="inputBookType" name="bookType" class="form-control">
                               <option selected>--Select--</option>
                               <option value="New">New Book</option>
                               <option value="Old">Old Book</option>
                               
                               
                             </select>
                         </div>
                         
                         
                         <div class="form-group">
                             <label for="exampleInputNumber">Book Status</label>
                             <select id="inputState" name="bookStatus" class="form-control">
                               <option selected>--Select--</option>
                               <option value="Active">Active</option>
                               <option value="InActive">InActive</option>
                               
                             </select>
                         </div>
               
                        <div class="form-group">
                          <label for="exampleFormControlFile">Upload Photo</label>
                          <input type="file" class="form-control-file" name="fimg" id="exampleInputFile">
                        </div>
               
                      
               
                        <br>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Add</button>
                     </div>
               
               
      
             </form>
            
                       
                       </div>
                   
                   
                   
                   </div>
               
               
               </div>
           
           
           </div>
       
       
       
       </div>
  
 <div>
        <%@include file="Footer.jsp" %>
  </div>
</body>
</html>