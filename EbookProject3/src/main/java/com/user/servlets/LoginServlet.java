package com.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.databaseInfo.ConnectionProvider;
import com.entity.User;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
			Connection con=ConnectionProvider.getConnection();
			
			HttpSession session=request.getSession();
		
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		String check=request.getParameter("check");
		
		//pw.println(email+" "+pass+" "+check);
		
		User user=new User();
		user.setName(email);
		user.setPass(pass);
		user.setCheckCondi(check);
		
		if("admin@gmail.com".equals(email) && "admin".equals(pass))
		{
			User us1=new User();
			us1.setName("Admin");
			session.setAttribute("adminObj", us1);
			response.sendRedirect("admin/home.jsp");
		}
		else
		{
			
			UserDao dao=new UserDao (con);
			User us2=dao.userLogin(email, pass);
			if(us2!=null)
			{
				session.setAttribute("userObj", us2);
				response.sendRedirect("index.jsp");
			}
			else
			{
				session.setAttribute("failed", "Email & Password Invalid");
				response.sendRedirect("login.jsp");
			}
			
			
			
		}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		 
		
		
	}

}
