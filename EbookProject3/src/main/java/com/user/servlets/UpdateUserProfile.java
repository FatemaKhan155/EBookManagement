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
 * Servlet implementation class UpdateUserProfile
 */
public class UpdateUserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter pw=response.getWriter();
		
		int userId=Integer.parseInt(request.getParameter("userId"));
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String pass=request.getParameter("pass");
		
		
		
		User user=new User();
		user.setId(userId);
		user.setName(name);
		user.setEmail(email);
		user.setMobile(mobile);
		
		HttpSession session=request.getSession();
		
		Connection con=ConnectionProvider.getConnection();
		UserDao userDao=new UserDao(con);
		boolean b=userDao.checkPassword(userId, pass);
		
		if(b==true)
		{
			boolean f=userDao.updateUserProfile(user);
			if(f==true)
			{
				session.setAttribute("successMsg", "User profile Update successfully");
				response.sendRedirect("securityAndEditProfile.jsp");
			}
			else
			{
				session.setAttribute("failedMsg", " Something went wrong on Server");
				response.sendRedirect("securityAndEditProfile.jsp");
			}
			
		}
		else
		{
			session.setAttribute("incorrectPassMsg", "Your Password Incorrect");
			response.sendRedirect("securityAndEditProfile.jsp");
		}
		
		
		
		
	}

}
