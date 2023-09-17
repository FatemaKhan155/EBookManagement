package com.admin.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.BooksDao;
import com.databaseInfo.ConnectionProvider;
import com.entity.BookDetails;

/**
 * Servlet implementation class AddBookServlet
 */
@MultipartConfig
public class AddBookServlet extends HttpServlet 
{
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			response.setContentType("text/html");
		    PrintWriter pw=response.getWriter();
		    
		    String bookName=request.getParameter("bookName");
		    String authorName=request.getParameter("authorName");
		    double price=Double.parseDouble(request.getParameter("price"));
		    String bookType=request.getParameter("bookType");
		    String bookStatus=request.getParameter("bookStatus");
		    //String fname=request.getParameter("fimg");
		   
		    Part part=request.getPart("fimg");
		    String fname=part.getSubmittedFileName();
		    
//		    pw.println(bookName+" "+authorName+" "+price+" "+bookType+" "+bookStatus+" "+fname);
//		    System.out.println(bookName+" "+authorName+" "+price+" "+bookType+" "+bookStatus+" "+fname);
		    
		     String path="D:\\CoreOnlineSession\\EbookProject\\src\\main\\webapp\\books";
		    
		    //getServletContext() method se hamne path ko get kiya jaha per hame image ko store karwana hai
		    //fir File class ke constructor mai hamne is path ko dediya hai to is path pe meri file ko store/upload karna hai
		    //fir mujhe write karna hai to hame Part interface ke write()method ke parameter mai hamne
		    //path dena hai jaha per hame file ko store karwana hai fir hame space dena hai to islye hamne
		    //File class ke static constant ko use kiya hai separate karne keliye fir hamne
		    //file ke naam ko concate kardiya hai
		    
		    
		    // String path= getServletContext().getRealPath("")+"\\src\\main\\webapp\\books\\";
		    //System.out.println(path+"\\src\\main\\webapp\\books");
		    //System.out.println(path);
		    File file=new File(path);
		    part.write(path+File.separator+fname);
		    
		    BookDetails book=new BookDetails();
		    book.setBooName(bookName);
		    book.setAuthorName(authorName);
		    book.setEmail("admin@gmail.com");
		    book.setPrice(price);
		    book.setBookCategory(bookType);
		    book.setStatus(bookStatus);
		    book.setPhoto(fname);
		    
		    HttpSession session=request.getSession();
		    
		    Connection con= ConnectionProvider.getConnection();
		    BooksDao booksDao=new BooksDao(con);
		    boolean b=booksDao.addBooks(book);
		    if(b==true)
		    {
		    	session.setAttribute("successMsg", "Book Add Successfully");
		    	response.sendRedirect("admin/addBooks.jsp");
		    }
		    else
		    {
		    	session.setAttribute("failedMsg", "Something wrong on server");
		    	response.sendRedirect("admin/addBooks.jsp");
		    }
		    
		    
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
