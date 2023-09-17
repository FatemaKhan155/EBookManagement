package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.OrderBookDetails;

public class OrderBookDao implements OrderBookInterface
{

	private Connection con;
	
	public OrderBookDao(Connection con)
	{
		this.con=con;
	}
	
	


	public boolean saveOrder(List<OrderBookDetails> orderBookDetails) 
	{
		boolean b=false;
		
		
		try
		{
			String query="insert into bookorderdetails(orderId ,userName,email,address,mobile,bookName,authorName,price,payment) values(?,?,?,?,?,?,?,?,?) ";
		    
			con.setAutoCommit(false);			
			PreparedStatement ps=con.prepareStatement(query);
		    
		    for(OrderBookDetails order:orderBookDetails)
		    {
		    	ps.setInt(1, order.getOrderId());
		    	ps.setString(2, order.getUserName());
		    	ps.setString(3, order.getEmail());
		    	ps.setString(4, order.getAddress());
		    	ps.setString(5, order.getMobile());
		    	ps.setString(6, order.getBookName());
		    	ps.setString(7, order.getAuthorName());
		    	ps.setDouble(8, order.getPrice());
		    	ps.setString(9, order.getPayment());
		    	
		    	ps.addBatch();
		    }
		    
		   int count[]= ps.executeBatch();
		   con.commit();
		   b=true;
		   con.setAutoCommit(true);
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return b;
	}




	public List<OrderBookDetails> getBookOrder(String email)
	{
		List<OrderBookDetails> al=new ArrayList<OrderBookDetails>();
		OrderBookDetails orderBookDetails=null;
		
		try
		{
			String query="select * from bookorderdetails where email=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, email);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				orderBookDetails =new OrderBookDetails();
				orderBookDetails.setId(rs.getInt(1)); 
				orderBookDetails.setOrderId(rs.getInt(2));
				orderBookDetails.setUserName(rs.getString(3));
				orderBookDetails.setEmail(rs.getString(4));
				orderBookDetails.setAddress(rs.getString(5));
				orderBookDetails.setMobile(rs.getString(6));
				orderBookDetails.setBookName(rs.getString(7));
				orderBookDetails.setAuthorName(rs.getString(8));
				orderBookDetails.setPrice(rs.getDouble(9));
				orderBookDetails.setPayment(rs.getString(10));
				
				al.add(orderBookDetails);
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return al;
	}




	public List<OrderBookDetails> getAllBookOrder()
	{
		
		List<OrderBookDetails> al=new ArrayList<OrderBookDetails>();
        OrderBookDetails orderBookDetails=null;
		
		try
		{
			String query="select * from bookorderdetails ";
			PreparedStatement ps=con.prepareStatement(query);
			
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				orderBookDetails =new OrderBookDetails();
				orderBookDetails.setId(rs.getInt(1)); 
				orderBookDetails.setOrderId(rs.getInt(2));
				orderBookDetails.setUserName(rs.getString(3));
				orderBookDetails.setEmail(rs.getString(4));
				orderBookDetails.setAddress(rs.getString(5));
				orderBookDetails.setMobile(rs.getString(6));
				orderBookDetails.setBookName(rs.getString(7));
				orderBookDetails.setAuthorName(rs.getString(8));
				orderBookDetails.setPrice(rs.getDouble(9));
				orderBookDetails.setPayment(rs.getString(10));
				
				al.add(orderBookDetails);
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return al;
	}

}
