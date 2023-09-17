package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDetails;
import com.entity.CartDetails;

public class CartDao implements CartInterface
{

	private Connection con;
	
	public CartDao(Connection con)
	{
		this.con=con;
	}
	 
	
//1)Add cart mai Books ko add karne keliye hamne PreparedStatement query ko likha hai
	
	public boolean addCart(CartDetails cartDetails)
	{
		boolean b=false;
		try
		{
			
			String query="insert into carttable(bookId,userId,bookName,author,price,totalPrice)values(?,?,?,?,?,?)";
		    PreparedStatement ps= con.prepareStatement(query);
		    ps.setInt(1, cartDetails.getBookId());
		    ps.setInt(2, cartDetails.getUserId());
		    ps.setString(3, cartDetails.getBookName());
		    ps.setString(4, cartDetails.getAuthor());
		    ps.setDouble(5, cartDetails.getPrice());
		    ps.setDouble(6, cartDetails.getTotalPrice());
		    
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
	
	
	
	
	//2)User ki Id ke thorugh hamne User ki saari details ko Database ke under se nikaalke hamne PreparedStatement query ko likha hai
	
	public List<CartDetails>  getBookByUser(int userId)
	{
		List<CartDetails> al=new ArrayList<CartDetails>();
		
		CartDetails cartDetails =null;
		double totalPrice=0;
		try
		{
			String query="select * from carttable where userId=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1,userId);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				cartDetails =new CartDetails();
				cartDetails.setCartId(rs.getInt(1));
				cartDetails .setBookId(rs.getInt(2));
				cartDetails.setUserId(rs.getInt(3));
				cartDetails.setBookName(rs.getString(4));
				cartDetails.setAuthor(rs.getString(5));;
				cartDetails.setPrice(rs.getDouble(6));
				
				totalPrice=totalPrice+rs.getDouble(7);
				cartDetails.setTotalPrice(totalPrice);
				al.add(cartDetails);
				
				
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return al;
	}

	
	
	//3) Book ki Id ke through hamne add to card ke under se book ko delete karne keliye hamne prepared statement query ko likha hai
	
	public boolean deleteBook(int bId,int uId,int cId) 
	{
		boolean b=false;
		try
		{
			String query="delete from carttable where bookId=? and userId=? and cartId=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, bId);
			ps.setInt(2, uId);
			ps.setInt(3, cId);
			
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

}
