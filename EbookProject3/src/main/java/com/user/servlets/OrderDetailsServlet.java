package com.user.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BooksDao;
import com.dao.CartDao;
import com.dao.OrderBookDao;
import com.databaseInfo.ConnectionProvider;
import com.entity.CartDetails;
import com.entity.OrderBookDetails;

/**
 * Servlet implementation class OrderDetailsServlet
 */
public class OrderDetailsServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDetailsServlet() {
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
			 HttpSession session=request.getSession();
			 response.setContentType("text/html");
			 
			 PrintWriter pw= response.getWriter();
			 int uId=Integer.parseInt(request.getParameter("uId"));
			 String name=request.getParameter("name");
			 String email=request.getParameter("email");
			 String mobile=request.getParameter("mobile");
			 String address=request.getParameter("address");
			 String landmark=request.getParameter("landmark");
			 String city=request.getParameter("city");
			 String state=request.getParameter("state");
			 String pincode=request.getParameter("pincode");
			 String paymentType=request.getParameter("paymentType");
			 
			 String fullAddress=address+" "+landmark+" "+city+" "+state+" "+pincode;
			 
			// pw.println(uId+" "+name+" "+email+" "+mobile+" "+fullAddress+" "+paymentType);
			 
			 Connection con=ConnectionProvider.getConnection();
			 CartDao cartDao=new CartDao(con);
			 List<CartDetails> al=cartDao.getBookByUser(uId);	
			 
			 
			 if(al.isEmpty())
			 {
				 session.setAttribute("failed", "Add Item");
				 response.sendRedirect("cartCheckOut.jsp");
			 }
			 else
			 {

				 Connection con1=ConnectionProvider.getConnection();
				 OrderBookDao orderBookDao=new OrderBookDao(con1);
				 
				  
				 OrderBookDetails orderBookDetails;
				 
				 Random randomNo=new Random();
				 List<OrderBookDetails> oderBook=new ArrayList<OrderBookDetails>();
				 for(CartDetails c:al)
				 {
					 orderBookDetails=new OrderBookDetails();
					 orderBookDetails.setOrderId(randomNo.nextInt(1000));
					 orderBookDetails.setUserName(name);
					 orderBookDetails.setEmail(email);
					 orderBookDetails.setMobile(mobile);
					 orderBookDetails.setAddress(fullAddress);
					 orderBookDetails.setAuthorName(c.getAuthor());
					 orderBookDetails.setBookName(c.getBookName());
					 orderBookDetails.setPrice(c.getPrice());
					 orderBookDetails.setPayment(paymentType);
					 
					 oderBook.add(orderBookDetails);
					 
					 
				 }
				 
				 if("no select".equals(paymentType))
				 {
					    session.setAttribute("failed", "Select Payment Method");
						response.sendRedirect("cartCheckOut.jsp");
				 }
				 else
				 {
					boolean b=orderBookDao.saveOrder(oderBook);
					
					if(b==true)
					{
						session.setAttribute("successMsg", "Order now Success");
						response.sendRedirect("nowOrderSuccess.jsp");
						//System.out.println("order success");
						
					}
					else
					{
						session.setAttribute("failed", "Something went Wrong on Server");
						response.sendRedirect("nowOrderSuccess.jsp");
						//System.out.println("order not success");

					}
				 }
			 }
			 
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
	}

}
