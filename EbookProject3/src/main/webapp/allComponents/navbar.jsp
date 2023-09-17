<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>  
<div class="container-fluid" style="height:10px;background-color:#303f9f">
</div>

<!-- Create Container -->

<div  class="container-fluid p-3 bg-light">
    <div class="row">
        <div class="col-md-3 text-success">
             <h3><i class="fas fa-book"></i> E-BookShope</h3>
        </div>
        
        
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0" action="searchBook.jsp" method="post">
                 <input class="form-control mr-sm-2" type="search" name="searchBook" placeholder="Search" aria-label="Search">
                 <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
        
         <c:if test="${not empty userObj}">  
                
            <div class="col-md-3">
            
                   <a href="cartCheckOut.jsp" class="btn btn-primary"> <i class=" fas fa-cart-plus"></i></a>
                   
                   <a href="login.jsp" class="btn btn-success"><i class="fas fa-user-plus"></i> ${userObj.name}</a>
                   
                   <a href="LogOutServlet" class="btn btn-primary text-white"><i class=" fas fa-sign-in-alt"></i> LogOut</a>
                    
            </div>
            
              
         </c:if>
         
         
         
         <c:if test="${empty userObj}">
         
                  <div class="col-md-3">
                  
                    <a href="login.jsp" class="btn btn-success"><i class="fas fa-sign-in-alt"></i> Login</a>
                    <a href="register.jsp" class="btn btn-primary text-white"><i class="fas fa-user-plus"></i> Register</a>
                    
                </div>
                 
         </c:if>
   
    
    </div>
</div>


<!-- Start Navbar -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
  
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="recentBook.jsp"><i class="fas fa-book-open"></i> Recent Book</a>
      </li>
      
       <li class="nav-item active">
        <a class="nav-link" href="newBook.jsp"><i class="fas fa-book-open"></i> New Book</a>
      </li>
      
       <li class="nav-item active">
        <a class="nav-link" href="oldBook.jsp"><i class="fas fa-book-open"></i> Old Book</a>
      </li>
      
    </ul>
    
    <form class="form-inline my-2 my-lg-0 ">
      
      <a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i class="fas fa-cog"></i>Setting</a>
       <a href="contactUs.jsp" class="btn btn-light my-2 my-sm-0 ml-2" type="submit"><i class="fas fa-phone-square-alt"></i>ContactUs</a>
    </form>
    
  </div>
  
</nav>
<!-- End Navbar -->

