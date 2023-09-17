package com.dao;

import java.util.List;

import com.entity.BookDetails;

public interface BooksDaoInterface
{
    public boolean addBooks(BookDetails bookDetails);
    public List<BookDetails> getAllBooks();

    public BookDetails getBookById(int id);
    
    public boolean updateEditBooks(BookDetails bookDetails);
    
    public boolean deleteBook(int id);
    
    
    public List<BookDetails> getNewBook();
    public List<BookDetails> getRecentBook();
    public List<BookDetails> getOldBook();
    
    
    public List<BookDetails> getAllRecentBook();
    public List<BookDetails> getAllNewBook();
    public List<BookDetails> getAllOldBook();
    
    
    public List<BookDetails> getBookByOld(String email,String categOld);   
    public boolean oldBookDelete(String email,String categOld,int bId);
    
    
    public List<BookDetails> getBookBySearch(String searchBook);
    
    
    
    
   
}
