package com.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BooksDao;
import com.dao.CartDao;
import com.databaseInfo.ConnectionProvider;
import com.entity.BookDetails;
import com.entity.CartDetails;

/**
 * Servlet implementation class CartServlet
 */
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			 
			
			   response.setContentType("text/html");
		       PrintWriter pw=response.getWriter();
		       pw.print("hiiiiiiii");
		       
		       int bookId=Integer.parseInt(request.getParameter("bId"));
		       int userId=Integer.parseInt(request.getParameter("uId"));
		       
//		       pw.println(bId+" "+uId);
		       
		       Connection con= ConnectionProvider.getConnection();
		       BooksDao booksDao=new BooksDao(con);
		       BookDetails bookDetails =booksDao.getBookById(bookId);
		       
		       CartDetails cartDetails=new CartDetails();
		       cartDetails.setBookId(bookId);
		       cartDetails.setUserId(userId);
		       cartDetails.setBookName(bookDetails.getBooName());
		       cartDetails.setAuthor(bookDetails .getAuthorName());
		       cartDetails.setPrice(bookDetails.getPrice());
		       cartDetails.setTotalPrice((bookDetails.getPrice()));
		       
		       HttpSession session=request.getSession();
		       
		       Connection con1= ConnectionProvider.getConnection();
		       CartDao cartDao=new CartDao(con1);
		       boolean b=cartDao.addCart(cartDetails);
		       
		       if(b==true)
		       {
		    	   session.setAttribute("addCart", "Book Added to Cart");
		    	   response.sendRedirect("newBook.jsp");
		       }
		       else
		       {
		    	   session.setAttribute("failed", "Something went wrong on server");
		    	   response.sendRedirect("newBook.jsp");
		       }
		       
		      
		       
		       
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
