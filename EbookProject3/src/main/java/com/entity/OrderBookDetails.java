package com.entity;

public class OrderBookDetails
{
	
	private int id ; 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	@Override
	public String toString() {
		return "OrderBookDetails [id=" + id + ", orderId=" + orderId + ", userName=" + userName + ", email=" + email
				+ ", address=" + address + ", mobile=" + mobile + ", bookName=" + bookName + ", authorName="
				+ authorName + ", price=" + price + ", payment=" + payment + "]";
	}
	private int orderId ; 
	private String userName ; 
	private String email ; 
	private String address;
	private String mobile ; 
	private String bookName;
	private String authorName; 
	private double price ; 
	private String payment ;

}
