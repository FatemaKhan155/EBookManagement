package com.admin.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BooksDao;
import com.databaseInfo.ConnectionProvider;
import com.entity.BookDetails;

/**
 * Servlet implementation class EditBookServlet
 */
public class EditBookServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
		      response.setContentType("text/html");
		      PrintWriter pw=response.getWriter();
		      pw.println("editBookServlet");
		
		      int bookId=Integer.parseInt(request.getParameter("bookId"));
		      String bookName=request.getParameter("bookName");
		      String authorName=request.getParameter("authorName");
		      double price=Double.parseDouble(request.getParameter("price"));
		      String bookType=request.getParameter("bookType");
		      String bookStatus=request.getParameter("bookStatus");
		
		      BookDetails bookDetails =new BookDetails();
		      bookDetails.setBookId(bookId);
		      bookDetails.setBooName(bookName);
		      bookDetails.setAuthorName(authorName);
		      bookDetails.setPrice(price);
		      bookDetails.setBookCategory(bookType);
		      bookDetails.setStatus(bookStatus);
		      
		      HttpSession session=request.getSession();
		      
		      Connection con=ConnectionProvider.getConnection();
		      BooksDao booksDao=new BooksDao(con);
		      boolean b= booksDao.updateEditBooks(bookDetails);  
		      if(b==true)
		      {
		    	  session.setAttribute("successMsg", "Book Update Successfully");
		    	  response.sendRedirect("admin/allBooks.jsp");
		    	  
		      }
		      else
		      {
		    	  session.setAttribute("failedMsg", "Something went wrong on server");
		    	  response.sendRedirect("admin/allBooks.jsp");
		      }
		      
		      
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
