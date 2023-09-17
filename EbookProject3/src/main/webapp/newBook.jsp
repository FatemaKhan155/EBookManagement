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
<title>All New Books</title>
<%@ include file="allComponents/allCss.jsp" %>
<style>
   
   
   .crd-ho:hover{
   background-color:#f7f7f7;
         
   }
   
   
   #toast{
     min-width:300px;
     position:fixed;
     bottom:30px;
     left:50%
     margin-left:-125px;
     background:#333;
     padding:10px;
     color:white;
     text-align:center;
     z-index:1;
     font-size:18px;
     visibility:hidden;
     box-shadow:0px 0px 100px #000; 
     
   
   }
   
   #toast.display{
	 visibility:visible;
	 animation:fadeIn 0.5,fadeOut 0.5s 2.5s;
	 
	
}

@keyframes fadeIn { from {bottom:0;
     opacity:0;
}

to{
	  bottom:30px;
	  opacity:1;
}
}


@keyframes fadeOut { from {bottom:30px;
     opacity:1;
}

to{
	  bottom:0;
	  opacity:0;
}
}
</style>
</head>
<body>

  <c:if test="${not empty addCart }">
      <div id="toast">${addCart}</div>
        
        <script type="text/javascript">
        
                showToast();
                function showToast(content)
                {
                	$('#toast').addClass("display");
                	$('#toast').html(content);
                	setTimeout(()=>{
                		
                		$("#toast").removeClass("display");
                	},2000)
                }
        
        </script>
        
        <c:remove var="addCart" scope="session"/>
        
  </c:if>
  
  
<%@ include file="allComponents/navbar.jsp" %>

         <%
              User user=(User)session.getAttribute("userObj");
         %>

          <div class="container-fluid"> 
               <div class="row p-3">
         
             
                 <%
                    
                    Connection con1=ConnectionProvider.getConnection();
                    BooksDao booksDao1=new BooksDao(con1);
                    List< BookDetails> al1=booksDao1.getAllNewBook();
                    for(BookDetails b:al1)
                    {%>
                      <div class="col-md-3">
                      <div class="card crd-ho mt-2">
                         <div class="card-body text-center">
                            <img alt="" src="books/<%=b.getPhoto() %>" style="height:150px;width:100px;" class="img-thumblin">
                             <p><%=b.getBooName() %></p>
                             <p><%=b.getAuthorName() %></p>
                             <p><%=b.getBookCategory() %></p>
                           <div class="row">
                           
                                    <%
                                        if(user==null)
                                         {%>
                                                   
                                           <a href="login.jsp" class="btn btn-danger btn-sm ml-5"><i class="fas fa-cart-plus"></i>Add Cart</a>
                                          <%}
                                          else{%>
                                                           
                                              <a href="CartServlet?bId=<%=b.getBookId()%>&&uId=<%=user.getId()%>" class="btn btn-danger btn-sm ml-5"><i class="fas fa-cart-plus"></i>Add Cart</a>
                                         <%}%>
                            
                             <a href="view.jsp?Id=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                             <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
                     
                          </div>
                   
                      </div>
                 </div>

      
             </div>
                    <% 	
                    }
                    %> 
         
        </div>
    
      </div>
   
   <%@include file="allComponents/Footer.jsp" %>

</body>
</html>