package com.dao;

import com.entity.User;

public interface UserDaoInterface
{

	  
	  public boolean userRegister(User user);
	  public User userLogin(String email,String pass);
	  
	  
	  public boolean checkPassword(int id,String pass);
	  public boolean updateUserProfile(User user);
	  
	  
	  public boolean checkUser(String email);
	  
	  
	  
}
