<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.databaseInfo.ConnectionProvider"
    import="java.sql.*" import="com.dao.BooksDao" import="com.entity.BookDetails "%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Books</title>
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
                            <h4 class="text-center p-2">Edit Books</h4>
                               
                          
                              
                              <%
                                   int id=Integer.parseInt(request.getParameter("Id"));
                                   Connection con= ConnectionProvider.getConnection();
                                   BooksDao booksDao=new BooksDao(con);
                                   BookDetails bookDetails = booksDao.getBookById(id);
                              
                              %> 
                        
                          <form  action="../EditBookServlet" method="post">
                 
                              <input type="hidden" name="bookId" value=<%=bookDetails.getBookId() %>>
                              
                              <div class="form-group">
                               <label for="exampleInputName">Book Name</label>
                               <input type="text" class="form-control" name="bookName"  value=<%=bookDetails.getBooName() %> id="exampleInputName" aria-describedby="emailHelp" required="required" >
                    
                              </div>
             
                             <div class="form-group">
                                <label for="exampleInputEmail1">Author Name</label>
                                <input type="text" class="form-control" name="authorName" value=<%=bookDetails.getAuthorName() %> id="exampleInputEmail1" aria-describedby="emailHelp" required="required" >
                               
                            </div>
                            
                              
                           <div class="form-group">
                               <label for="exampleInputPassword1">Price</label>
                              <input type="number" class="form-control" name="price" value=<%=bookDetails.getPrice() %> id="exampleInputPassword1" required="required">
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
                              
                              <% if("Active".equals(bookDetails.getStatus())){
                              %>
                              <option value="Active">Active</option>
                              <option value="InActive">InActive</option>
                              <% 
                              }
                              else
                              {
                              %>
                              <option value="InActive">InActive</option>
                              <option value="Active">Active</option>
                              <%}
                             
                             %>
                 
                               
                             </select>
                         </div>
               
           
                        <br>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Update</button>
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