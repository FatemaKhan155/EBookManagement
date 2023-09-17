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
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter pw=response.getWriter();
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		String check=request.getParameter("check");
		
		//pw.println(name+""+email+" "+pass+" "+phone+" "+address+" "+check);
		
		User user=new User ();
		user.setName(name);
		user.setEmail(email);
		user.setPass(pass);
		user.setMobile(phone);
		user.setAddress(address);
		user.setCheckCondi(check);
		
		HttpSession session=request.getSession();
		
		
		
		if(check!=null)
		{
			Connection con=ConnectionProvider.getConnection();
			UserDao dao=new UserDao(con);
			boolean b1=dao.checkUser(email);
			if(b1)
			{
				boolean b=dao.userRegister(user);
				if(b)
				{
					//System.out.println("record is inserted");
					session.setAttribute("success", "User Register Successfully");
					response.sendRedirect("register.jsp");
				}
				else
				{
					//System.out.println("record is not inserted");
					session.setAttribute("failed", "Something Went Wrong On Server");
					response.sendRedirect("register.jsp");
				}
				
			}
			else
			{
				//System.out.println("please check condition");
				session.setAttribute("failed", "User Already Register Please Try Again Email Id");
				response.sendRedirect("register.jsp");
			}
			
			
			
			
		}
		else
		{
			//System.out.println("please check condition");
			session.setAttribute("failed", "Please Agree terms & Condition");
			response.sendRedirect("register.jsp");
		}
		
		
		
		
		
	}

}
