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

/**
 * Servlet implementation class DeleteBookServlet
 */
public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		
		int id=Integer.parseInt(request.getParameter("Id"));
		
		Connection con=ConnectionProvider.getConnection();
		BooksDao booksDao=new BooksDao(con);
		boolean b=booksDao.deleteBook(id);
		
		HttpSession session=request.getSession();
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

}
