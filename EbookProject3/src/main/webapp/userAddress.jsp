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
<title>Add Address</title>
<%@ include file="allComponents/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2;">


<%@ include file="allComponents/navbar.jsp" %>

  
    <div class="container">
         <div class="row p-3">
              <div class="col-md-6 offset-3">
                    <div class="card">
                       <div class="card-body text-center">
                          
                       <h2 class="text-center text-primary">Add Address</h2>
                       
                                            
                 <form>

  
                    <div class="form-row">
                      <div class="form-group  col-md-6">
                         <label for="inputAddress">Address</label>
                        <input type="text" class="form-control" id="inputAddress" >
                     </div>
   
                     <div class="form-group  col-md-6">
                       <label for="inputLandmark">LandMark </label>
                       <input type="text" class="form-control"  id="inputLandmark" >
                    </div>
  
                 </div>
  
   
  
             <div class="form-row">
                 <div class="form-group col-md-4">
                   <label for="inputCity">City</label>
                   <input type="text" class="form-control"  id="inputLandmark">
                </div>
    
                <div class="form-group col-md-4">
                  <label for="inputState">State</label>
                  <select id="inputState" class="form-control" >
                  <option selected>Choose...</option>
                  <option>Pune</option>
                 </select>
            </div>
     
            <div class="form-group  col-md-4">
              <label for="inputZip">Pincode</label>
              <input type="text" class="form-control" id="inputZip" >
           </div>
      </div> 
    
   
   
   <div class="text-center">
       
        <button type="submit" class="btn btn-warning text-white" value="Update">Add Address</button>
   </div> 
   
  
</form>
                       
                       
                    </div>
                    
                    
                    
                    </div>
                
              
              
              
              
              </div>
         
         
         
         
         </div>
    
    
    
    </div>
  
  
  
  
</body>
</html>