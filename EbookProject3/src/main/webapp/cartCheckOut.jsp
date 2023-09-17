<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.CartDetails"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.databaseInfo.ConnectionProvider"%>
<%@page import="com.dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@ include file="allComponents/allCss.jsp" %>
</head>
<body style="background-color:#f7f7f7">

<%@include file="allComponents/navbar.jsp" %>

   <c:if test="${empty userObj }">
       <c:redirect url="login.jsp"></c:redirect>
    
   </c:if>
  
  
   <c:if test="${not empty successMsg }">
       <div class="alert alert-success text-center" role="alert">
           ${successMsg}
       </div>
       <c:remove var="successMsg" scope="session"/>
   </c:if>
   
   
   
   <c:if test="${not empty failedMsg }">
       <div class="alert alert-danger text-center" role="alert">
           ${failedMsg}
       </div>
       <c:remove var="failedMsg" scope="session"/>
   </c:if>
   
   
   <c:if test="${not empty failed }">
       <div class="alert alert-danger text-center" role="alert">
           ${failed}
       </div>
       <c:remove var="failed" scope="session"/>
   </c:if>
  
  
   <div class="container">
      <div class="row p-2">
         <div class="col-md-6">
            
              
              <div class="card bg-white">
                  <h3 class="text-center text-success mt-2">Your Selected Item</h3>
                   <div class="card-body">
                   
                         <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author Name</th>
      <th scope="col">Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
   
       <%
         
         User user=(User)session.getAttribute("userObj");
         Connection con=ConnectionProvider.getConnection();
         CartDao cartDao=new CartDao(con);
         List<CartDetails> al=cartDao.getBookByUser(user.getId());
         double totalPrice=0;
         for(CartDetails c:al){
        	 totalPrice=c.getTotalPrice();
         %>
             <tr>
                <th scope="row"><%=c.getBookName() %></th>
                <td><%=c.getAuthor()%></td>
                <td><%=c.getPrice() %></td>
                <td>
                
                  <a href="RemoveBookServlet?bId=<%=c.getBookId()%>&&uId=<%=c.getUserId() %>&&cId=<%=c.getCartId() %>" class="btn btn-sm btn-danger ">Remove</a>
                </td>
             </tr>
    
           
         
         <%} %>
         <hr>
          <tr> 
             <td>Total Price</td>
             <td></td>
             <td><%=totalPrice%></td>
         </tr> 
         
         
         
   
   
  
        
  </tbody>
</table>
                   </div>
              
              
              </div>
               
         
         </div>
         
         
      
      
   <div class="col-md-6"> 
       <div class="card">
           <div class="card-body">
                  
               <h3 class="text-center text-success">Your Details for Order</h3>   
  <form action="OrderDetailsServlet" method="post">
  
  
   <input type="hidden" name="uId" value="${userObj.id}"/>
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputName">Name</label>
      <input type="text" class="form-control" name="name" vaule="${userObj.name }" id="inputName" required="required">
    </div>
    <div class="form-group col-md-6">
      <label for="inputEmail">Email</label>
      <input type="email" class="form-control" name="email" vaule="${userObj.email }" id="inputEmail" required="required">
    </div>
  </div>
  
   <div class="form-row">
  <div class="form-group  col-md-6">
    <label for="inputMobile">Mobile No</label>
    <input type="number" class="form-control" name="mobile" vaule="${userObj.mobile }" id="inputMobile" required="required">
  </div>
   
   <div class="form-group  col-md-6">
    <label for="inputAddress">Address </label>
    <input type="text" class="form-control" name="address" vaule="${userObj.address }" id="inputAddress" required="required" >
  </div>
  
  </div>
  
   
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputLandmark">Landmark</label>
      <input type="text" class="form-control" name="landmark" vaule="${userObj.landmark }" id="inputLandmark" required="required" >
    </div>
    
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" name="city" vaule="${userObj.city }" id="inputCity" required="required" >
    </div>
   </div> 
    
    
    
    <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputState">State</label>
      <select id="inputState" class="form-control"  name="state" vaule="${userObj.state}" required="required">
        <option value="Select">--Select--</option>
        <option value="Indore">Indore</option>
        <option value="Delhi">Delhi</option>
        
      </select>
    </div>
     
      <div class="form-group  col-md-6">
      <label for="inputZip">Pincode</label>
      <input type="text" class="form-control" name="pincode" vaule="${userObj.pincode}" id="inputZip" required="required">
    </div>
    </div>
    
    <div class="form-group">
       <label>Payment Mode</label><br>
       <select class="form-control" name="paymentType" required="required">
         <option value="no select">--Select--</option>
         <option>Cash On Delivery</option>
         <option>Debit On Cradit Card</option>
         
       </select>
    
    
    </div>
   
   <div class="text-center">
       <button type="submit" class="btn btn-warning">Order Now</button>
        <button type="index.jsp" class="btn btn-success">Continue Shopping</button>
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