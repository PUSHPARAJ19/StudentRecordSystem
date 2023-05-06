package com.Modal;

import java.sql.Date;
import java.time.Year;

public class Admin {
	private String adminId;
	private String firstName;
	private String lastName;
	private Date DOB;
	private String year;
	private String Email;

	public Admin() {

	}

	public Admin(String adminId, String firstName, String lastName, Date dOB, String year, String email) {
		super();
		this.adminId = adminId;
		this.firstName = firstName;
		this.lastName = lastName;
		DOB = dOB;
		this.year = year;
		Email = email;
	}

	public Admin(String firstName, String lastName, Date dOB, String year, String email) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		DOB = dOB;
		this.year = year;
		Email = email;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
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

	public Date getDOB() {
		return DOB;
	}

	public void setDOB(Date dOB) {
		DOB = dOB;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

}
