package com.dao;

import java.util.List;

import com.entity.OrderBookDetails;

public interface OrderBookInterface
{
	
	
	public boolean saveOrder(List<OrderBookDetails> orderBookDetails);
	
	public List<OrderBookDetails> getBookOrder(String email);
	
	public List<OrderBookDetails> getAllBookOrder();
	

}
