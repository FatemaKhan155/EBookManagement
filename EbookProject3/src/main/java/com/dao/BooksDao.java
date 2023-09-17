package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;

public class BooksDao implements BooksDaoInterface
{
     private Connection con;
     
     public BooksDao( Connection con)
     {
    	 this.con=con;
     }
	
     
     //1) Database mai Books ki details ko store karne keliye PreparedStatement query ko chalaya hai
	public boolean addBooks(BookDetails bookDetails)
	{
		boolean b=false;
		try
		{
			
			String query="insert into bookdetails(booName,authorName,email,price,bookCategory,status,photo) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, bookDetails.getBooName());
			ps.setString(2, bookDetails.getAuthorName());
			ps.setString(3, bookDetails.getEmail());
			ps.setDouble(4, bookDetails.getPrice());
			ps.setString(5, bookDetails.getBookCategory());
			ps.setString(6, bookDetails.getStatus());
			ps.setString(7, bookDetails.getPhoto());
			int i=ps.executeUpdate();
			if(i>0)
			{
				b=true;
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return b;
	}

	
	//2) Database mai Books ki details ko nikaal ke display karne keliye PreparedStatement query ko chalaya hai

//	bookId 
//	booName 
//	authorName 
//	email 
//	price  
//	bookCategory 
//	status 
//	photo
	
	public List<BookDetails> getAllBooks()
	{
		List<BookDetails> al=new ArrayList<BookDetails>();
		BookDetails bookDetails=null;
		try
		{
				
			String query="select * from bookdetails ";
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				bookDetails=new BookDetails();
				
				bookDetails.setBookId(rs.getInt(1));
				bookDetails.setBooName(rs.getString(2));
				bookDetails.setAuthorName(rs.getString(3));
				bookDetails.setEmail(rs.getString(4));
				bookDetails.setPrice(rs.getDouble(5));
				bookDetails.setBookCategory(rs.getString(6));
				bookDetails.setStatus(rs.getString(7));
				bookDetails.setPhoto(rs.getString(8));
				
				al.add(bookDetails);
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return al;
	}


	//3) Database mai aik/particular Book ki details ko nikaal ke display karne keliye PreparedStatement query ko chalaya hai

	public BookDetails getBookById(int id)
	{
		BookDetails bookDetails=null;
		try
		{
			 String query="select * from bookdetails where bookId=?";
			 PreparedStatement ps=con.prepareStatement(query);
			 ps.setInt(1, id);
			 
			 ResultSet rs=ps.executeQuery();
			 while(rs.next())
			 {
				    bookDetails=new BookDetails();
				    bookDetails.setBookId(rs.getInt(1));
					bookDetails.setBooName(rs.getString(2));
					bookDetails.setAuthorName(rs.getString(3));
					bookDetails.setEmail(rs.getString(4));
					bookDetails.setPrice(rs.getDouble(5));
					bookDetails.setBookCategory(rs.getString(6));
					bookDetails.setStatus(rs.getString(7));
					bookDetails.setPhoto(rs.getString(8));
			 }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return bookDetails;
	}


	//4) Database mai aik/particular Book ki details ko update karne ke keliye PreparedStatement query ko chalaya hai

	public boolean updateEditBooks(BookDetails bookDetails) 
	{
		boolean b=false;
		try
		{
		
			 String query="update bookdetails set booName=?,authorName=?,price=?,status=? where bookId=?";
			 PreparedStatement ps=con.prepareStatement(query);
			 
			 ps.setString(1, bookDetails.getBooName());
			 ps.setString(2, bookDetails.getAuthorName());
			 ps.setDouble(3, bookDetails.getPrice());
			 ps.setString(4, bookDetails.getStatus());
			 ps.setInt(5, bookDetails.getBookId());
			 
			 int i=ps.executeUpdate();
			 if(i>0)
			 {
				 b=true;
			 }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return b;
	}


	//5) Database mai aik/particular Book ki details ko delete  karne keliye PreparedStatement query ko chalaya hai

	public boolean deleteBook(int id)
	{
		boolean b=false;
		try
		{
			String query="delete from bookdetails where bookId=?"; 
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i>0)
			{
				b=true;
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
		return b;
	}


	//6) Database mai aik/particular New Book ki details nikaalke hamne  PreparedStatement query ko chalaya hai

	public List<BookDetails> getNewBook()
	{
		List<BookDetails> al=new ArrayList<BookDetails>();
		BookDetails bookDetails=null;
		try
		{
			String query="select * from bookdetails  where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,"New");
			ps.setString(2,"Active");
			
			int i=1;
			ResultSet rs=ps.executeQuery();
			while(rs.next() && i<=3)
			{
				    bookDetails=new BookDetails();
				    bookDetails.setBookId(rs.getInt(1));
					bookDetails.setBooName(rs.getString(2));
					bookDetails.setAuthorName(rs.getString(3));
					bookDetails.setEmail(rs.getString(4));
					bookDetails.setPrice(rs.getDouble(5));
					bookDetails.setBookCategory(rs.getString(6));
					bookDetails.setStatus(rs.getString(7));
					bookDetails.setPhoto(rs.getString(8));
					al.add(bookDetails);
					i++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return al;
	}


	//7) Database mai aik/particular Recent Book ki details ko update karne ke keliye PreparedStatement query ko chalaya hai

	public List<BookDetails> getRecentBook()
	{
		List<BookDetails> al=new ArrayList<BookDetails>();
		BookDetails bookDetails=null;
		try
		{
			String query="select * from bookdetails where  status=? order by bookId DESC";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,"Active");
			
			int i=1;
			ResultSet rs=ps.executeQuery();
			while(rs.next() && i<=3)
			{
				    bookDetails=new BookDetails();
				    bookDetails.setBookId(rs.getInt(1));
					bookDetails.setBooName(rs.getString(2));
					bookDetails.setAuthorName(rs.getString(3));
					bookDetails.setEmail(rs.getString(4));
					bookDetails.setPrice(rs.getDouble(5));
					bookDetails.setBookCategory(rs.getString(6));
					bookDetails.setStatus(rs.getString(7));
					bookDetails.setPhoto(rs.getString(8));
					al.add(bookDetails);
					i++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return al;
		
	}


	public List<BookDetails> getOldBook()
	{
		
		List<BookDetails> al=new ArrayList<BookDetails>();
		BookDetails bookDetails=null;
		try
		{
			String query="select * from bookdetails  where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,"Old");
			ps.setString(2,"Active");
			
			int i=1;
			ResultSet rs=ps.executeQuery();
			while(rs.next() && i<=3)
			{
				    bookDetails=new BookDetails();
				    bookDetails.setBookId(rs.getInt(1));
					bookDetails.setBooName(rs.getString(2));
					bookDetails.setAuthorName(rs.getString(3));
					bookDetails.setEmail(rs.getString(4));
					bookDetails.setPrice(rs.getDouble(5));
					bookDetails.setBookCategory(rs.getString(6));
					bookDetails.setStatus(rs.getString(7));
					bookDetails.setPhoto(rs.getString(8));
					al.add(bookDetails);
					i++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return al;
		
	}


	public List<BookDetails> getAllRecentBook()
	{
		List<BookDetails> al=new ArrayList<BookDetails>();
		BookDetails bookDetails=null;
		try
		{
			String query="select * from bookdetails where  status=? order by bookId DESC";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,"Active");
			
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				    bookDetails=new BookDetails();
				    bookDetails.setBookId(rs.getInt(1));
					bookDetails.setBooName(rs.getString(2));
					bookDetails.setAuthorName(rs.getString(3));
					bookDetails.setEmail(rs.getString(4));
					bookDetails.setPrice(rs.getDouble(5));
					bookDetails.setBookCategory(rs.getString(6));
					bookDetails.setStatus(rs.getString(7));
					bookDetails.setPhoto(rs.getString(8));
					al.add(bookDetails);
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return al;
	}


	
	
	
	public List<BookDetails> getAllNewBook() 
	{
		
		List<BookDetails> al=new ArrayList<BookDetails>();
		BookDetails bookDetails=null;
		try
		{
			String query="select * from bookdetails  where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,"New");
			ps.setString(2,"Active");
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				    bookDetails=new BookDetails();
				    bookDetails.setBookId(rs.getInt(1));
					bookDetails.setBooName(rs.getString(2));
					bookDetails.setAuthorName(rs.getString(3));
					bookDetails.setEmail(rs.getString(4));
					bookDetails.setPrice(rs.getDouble(5));
					bookDetails.setBookCategory(rs.getString(6));
					bookDetails.setStatus(rs.getString(7));
					bookDetails.setPhoto(rs.getString(8));
					al.add(bookDetails);
					
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return al;
		
	}

	
	
	
	


	public List<BookDetails> getAllOldBook() 
	{
		
		List<BookDetails> al=new ArrayList<BookDetails>();
		BookDetails bookDetails=null;
		try
		{
			String query="select * from bookdetails  where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,"Old");
			ps.setString(2,"Active");
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				    bookDetails=new BookDetails();
				    bookDetails.setBookId(rs.getInt(1));
					bookDetails.setBooName(rs.getString(2));
					bookDetails.setAuthorName(rs.getString(3));
					bookDetails.setEmail(rs.getString(4));
					bookDetails.setPrice(rs.getDouble(5));
					bookDetails.setBookCategory(rs.getString(6));
					bookDetails.setStatus(rs.getString(7));
					bookDetails.setPhoto(rs.getString(8));
					al.add(bookDetails);
					
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return al;
		
	}


	public List<BookDetails> getBookByOld(String email, String categOld)
	{
		
		List<BookDetails> al=new ArrayList<BookDetails>();
		
		BookDetails bookDetails=null;
		try
		{
			String query="select * from bookdetails where email=? and bookCategory=? ";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,email);
			ps.setString(2,categOld);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				bookDetails=new BookDetails();
				bookDetails.setBookId(rs.getInt(1));
				bookDetails.setBooName(rs.getString(2));
				bookDetails.setAuthorName(rs.getString(3));
				bookDetails.setEmail(rs.getString(4));
				bookDetails.setPrice(rs.getDouble(5));
				bookDetails.setBookCategory(rs.getString(6));
				bookDetails.setStatus(rs.getString(7));
				bookDetails.setPhoto(rs.getString(8));
				al.add(bookDetails);
				
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return al;
	}


	public boolean oldBookDelete(String email, String categOld,int bId) 
	{
		boolean b=false;
		try
		{
			String query="delete from bookdetails where email=? and bookCategory=? and bookId=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, categOld);
			ps.setInt(3, bId);
			
			int i=ps.executeUpdate();
			if(i>0)
			{
				b=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return b;
	}


	public List<BookDetails> getBookBySearch(String searchBook) 
	{
        List<BookDetails> al=new ArrayList<BookDetails>();
		
		BookDetails bookDetails=null;
		try
		{
			String query="select * from bookdetails where booName like? or authorName like? or bookCategory like ? and status=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,"%"+searchBook+"%");
			ps.setString(2,"%"+searchBook+"%");
			ps.setString(3,"%"+searchBook+"%");
			ps.setString(4,"Active");
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				bookDetails=new BookDetails();
				bookDetails.setBookId(rs.getInt(1));
				bookDetails.setBooName(rs.getString(2));
				bookDetails.setAuthorName(rs.getString(3));
				bookDetails.setEmail(rs.getString(4));
				bookDetails.setPrice(rs.getDouble(5));
				bookDetails.setBookCategory(rs.getString(6));
				bookDetails.setStatus(rs.getString(7));
				bookDetails.setPhoto(rs.getString(8));
				al.add(bookDetails);
				
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return al;
	}


	


}
