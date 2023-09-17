package com.entity;

public class BookDetails 
{
	private int bookId;
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	private double price;
	public BookDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getBooName() {
		return booName;
	}
	public void setBooName(String booName) {
		this.booName = booName;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBookCategory() {
		return bookCategory;
	}
	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	private String booName,authorName,email,bookCategory ,status,photo;
	
	@Override
	public String toString() {
		return "BookDetails [bookId=" + bookId + ", price=" + price + ", booName=" + booName + ", authorName="
				+ authorName + ", email=" + email + ", bookCategory=" + bookCategory + ", status=" + status + ", photo="
				+ photo + "]";
	}
	
	
	
}
