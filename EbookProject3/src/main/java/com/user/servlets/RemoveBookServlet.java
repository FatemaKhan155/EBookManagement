package com.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDao;
import com.databaseInfo.ConnectionProvider;

/**
 * Servlet implementation class RemoveBookServlet
 */
public class RemoveBookServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveBookServlet() {
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
		
		int bId=Integer.parseInt(request.getParameter("bId"));
		int uId=Integer.parseInt(request.getParameter("uId"));
		int cId=Integer.parseInt(request.getParameter("cId"));
		
		
		Connection con=ConnectionProvider.getConnection();
		CartDao cartDao=new CartDao(con);
		
		HttpSession session=request.getSession();
		
		boolean b=cartDao.deleteBook(bId,uId,cId);
		
		if(b==true)
		{
			session.setAttribute("successMsg", "Book is successfully Deleted");
			response.sendRedirect("cartCheckOut.jsp");
		}
		else
		{
			session.setAttribute("failedMsg", "Something went wrong on Server");
			response.sendRedirect("cartCheckOut.jsp");
		}
		
		
		
	}

}
