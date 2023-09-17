package com.databaseInfo;

import java.sql.Connection;
import java.sql.DriverManager;

public final class ConnectionProvider
{

	static private Connection con=null;
	
	private ConnectionProvider()
	{
		
	}
	

	public static Connection getConnection()
	{
		
		try
		{
		     if(con==null)
		     {
		    	 Class.forName(DatabaseDetails.driverName);
			     con=DriverManager.getConnection(DatabaseDetails.driverUrl, DatabaseDetails.userName, DatabaseDetails.userPass);
		         //System.out.println(con);
		         return con;
		     }
		   else
		    {
			
			   return con;
		    }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
		
		
	}
	
	
}
