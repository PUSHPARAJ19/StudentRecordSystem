package com.Modal;

public class Address {
	private String address_id;
  private String street;
  private String city;
  private String district;
  private String pincode;
  public Address()
  {
	  
  }
public Address(String address_id, String street, String city, String district, String pincode) {
	super();
	this.address_id = address_id;
	this.street = street;
	this.city = city;
	this.district = district;
	this.pincode = pincode;
}
public Address(String street, String city, String district, String pincode) {
	super();
	this.street = street;
	this.city = city;
	this.district = district;
	this.pincode = pincode;
}

public String getAddress_id() {
	return address_id;
}
public void setAddress_id(String address_id) {
	this.address_id = address_id;
}
public String getStreet() {
	return street;
}
public void setStreet(String street) {
	this.street = street;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getDistrict() {
	return district;
}
public void setDistrict(String district) {
	this.district = district;
}
public String getPincode() {
	return pincode;
}
public void setPincode(String pincode) {
	this.pincode = pincode;
}
  
}
