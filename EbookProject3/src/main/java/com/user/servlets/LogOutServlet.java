package com.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogOutServlet
 */
public class LogOutServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogOutServlet() {
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
		       
		       HttpSession session1=request.getSession();
		       session1.removeAttribute("userObj");
		
		       HttpSession session2=request.getSession();
		       session2.setAttribute("successMsg", "LogOut Successfully"); 
		       response.sendRedirect("login.jsp");
		    		   
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}
