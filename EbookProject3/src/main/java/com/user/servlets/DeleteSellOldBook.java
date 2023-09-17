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
import com.databaseInfo.ConnectionProvider;

/**
 * Servlet implementation class DeleteSellOldBook
 */
public class DeleteSellOldBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSellOldBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		
		int bId=Integer.parseInt(request.getParameter("bId"));
		String email=request.getParameter("email");
		pw.print(email);
		
		HttpSession session=request.getSession();
		
		Connection con=ConnectionProvider.getConnection();
		BooksDao booksDao=new BooksDao(con);
		boolean b=booksDao.oldBookDelete(email, "Old",bId);
		if(b==true)
		{
			session.setAttribute("successMsg", "Old Book Selete Successfully");
			response.sendRedirect("sellOldBook.jsp");
		}
		else
		{
			session.setAttribute("failedMsg", "Something went wrong on Server");
			response.sendRedirect("sellOldBook.jsp");
		}
		
		
		
		
		
	}

}
