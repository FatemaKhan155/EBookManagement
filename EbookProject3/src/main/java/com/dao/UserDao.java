package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.databaseInfo.ConnectionProvider;
import com.entity.User;

public class UserDao implements UserDaoInterface
{

	
	private Connection con;
	public UserDao(Connection con) 
	{
		this.con=con;
		
	}
	
	//1) Database mai aik/particular Book ki details ko nikaal ke check karke keliye PreparedStatement query ko chalaya hai

	public User userLogin(String email,String pass)
	{
		User user=null;
		
		try
		{
		    String query="select * from  usertable where email=? and pass=?";
		    PreparedStatement ps=con.prepareStatement(query);
		    ps.setString(1, email);
		    ps.setString(2, pass);
		    ResultSet rs=ps.executeQuery();
		    while(rs.next())
		    {
		    	user=new User();
		    	user.setId(rs.getInt("id"));
		    	user.setName(rs.getString("name"));
		    	user.setEmail(rs.getString("email"));
		    	user.setPass(rs.getString("pass"));
		    	user.setMobile(rs.getString("mobile"));
		    	user.setAddress(rs.getString("address"));
		    	user.setLandmark(rs.getString("landmark"));
		    	user.setCity(rs.getString("city"));
		    	user.setState(rs.getString("state"));
		    	user.setPincode(rs.getString("pincode"));
		    }
		    
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return user;
	}
	
	
	
	
	//2) Database mai aik/particular user ki details ko Database mai store karwane keliye PreparedStatement query ko chalaya hai

	
	public boolean userRegister(User user)
	{
		boolean b=false;
		
	     
		try
		{
			con=ConnectionProvider.getConnection();
			//System.out.println(con);
			
			String query="insert into usertable(name,email,pass,mobile,address)values(?,?,?,?,?) ";
			
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPass());
			ps.setString(4, user.getMobile());
			ps.setString(5, user.getAddress());
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				b=true;
				System.out.println("record is inserted");
			}
			else
			{
				System.out.println("record is not inserted");
			}
			
		
		
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		
		return b;
	}

	public boolean checkPassword(int id,String pass)
	{
		boolean b=false;
		try
		{
			String query="select * from usertable where id=? and pass=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, id);
			ps.setString(2, pass);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
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

	public boolean updateUserProfile(User user)
	{
		boolean b=false;
		
	     
		try
		{
			con=ConnectionProvider.getConnection();
			//System.out.println(con);
			
			String query="update usertable set name=?,email=?,mobile=? where id=?";
			
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getMobile());
			ps.setInt(4, user.getId());
			
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				b=true;
				
			}
			
		
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return b;
	}

	
	
	public boolean checkUser(String email) 	
	{
		boolean b=true;
		
		try
		{
           
			String query="select * from usertable where email=? ";
			
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, email);
			
			
			ResultSet rs=ps.executeQuery();	
			while(rs.next())
			{
				b=false;
				
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return b;
	}
	
	
	
	

}
