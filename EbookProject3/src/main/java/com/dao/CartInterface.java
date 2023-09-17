package com.dao;

import java.util.List;

import com.entity.BookDetails;
import com.entity.CartDetails;

public interface CartInterface
{
    public boolean addCart(CartDetails cartDetails);
    
    public List<CartDetails>  getBookByUser(int userId);
    
    public boolean deleteBook(int bId,int uId,int cId);
    
}
