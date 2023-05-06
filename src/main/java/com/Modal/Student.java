package com.Modal;

import java.sql.Date;

public class Student {
	private String student_id;
	 private String firstName;
	 private String lastName;
	 private String gender;
	 private String email;
	 private Date dob;
	 //private String dob;
	 private Address address;
	 private String mobileNumber;
	 private String year;
	 private String degree;
	 private String department;
	 public Student()
	 {
		 
	 }

public Student(String firstName, String lastName, String gender, String email, Date dob, Address address,
			String mobileNumber, String year, String degree, String department) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
		this.email = email;
		this.dob = dob;
		this.address = address;
		this.mobileNumber = mobileNumber;
		this.year = year;
		this.degree = degree;
		this.department = department;
	}

public Student(String student_id, String firstName, String lastName, String gender, String email, Date dob,
			Address address, String mobileNumber, String year, String degree, String department) {
		super();
		this.student_id = student_id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
		this.email = email;
		this.dob = dob;
		this.address = address;
		this.mobileNumber = mobileNumber;
		this.year = year;
		this.degree = degree;
		this.department = department;
	}

	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	//	public String getDob() {
//		return dob;
//	}
//	public void setDob(String dob) {
//		this.dob = dob;
//	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}

	@Override
	public String toString() {
		return "Student [student_id=" + student_id + ", firstName=" + firstName + ", lastName=" + lastName + ", gender="
				+ gender + ", email=" + email + ", dob=" + dob + ", address=" + address + ", mobileNumber="
				+ mobileNumber + ", year=" + year + ", degree=" + degree + ", department=" + department + "]";
	}
	 
       
	 

}
