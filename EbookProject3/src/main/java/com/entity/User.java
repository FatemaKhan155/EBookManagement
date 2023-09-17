package com.entity;

public class User 
{
	
	
	public User()
	{
		super();
	}
	@Override
	public String toString()
	{
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", pass=" + pass + ", mobile=" + mobile
				+ ", address=" + address + ", landmark=" + landmark + ", city=" + city + ", state=" + state
				+ ", pincode=" + pincode + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	private int id;
	private String name,email,pass,mobile,address,landmark,city,state,pincode;
	private String checkCondi;
	public String getCheckCondi() {
		return checkCondi;
	}
	public void setCheckCondi(String checkCondi) {
		this.checkCondi = checkCondi;
	}

}
