package com.DAO;

import java.sql.*;

import com.Modal.Address;
import com.Modal.Student;
import com.Util.DButil;

public class StudentDAO {
	public static String validateStudent(String userId,String password)
	{
		Connection con = DButil.getConnection();
		String query ="select FirstName,DOB from student where studentId=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();
			String firstName="";
			Date dob = null;
			while(rs.next())
			{
				firstName = rs.getString(1);
				dob = rs.getDate(2);
			}
			if(!firstName.isEmpty())
			{
				//System.out.println(firstName+"@"+dob.toString().substring(0,4));
				if(password.equals(firstName+"@"+dob.toString().substring(0,4)))
				{
					return "success";
				}
				else
				{
					return "Invalid Password";
				}
			}
			else
			{
				return "Enter a Valid UserId";
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "INVALID";
	}
	public static int addAddress(Address address) throws SQLException
	{
		Connection con = DButil.getConnection();
		String query = "Insert into address(street,city,district,zip) values(?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, address.getStreet());
		ps.setString(2, address.getCity());
		ps.setString(3, address.getDistrict());
		ps.setString(4,address.getPincode());
		int result = ps.executeUpdate();	
		if(result!=0)
		{
			String select_query = "select last_insert_id()";
			ResultSet rs = ps.executeQuery(select_query);
			while(rs.next()) {
					return Integer.parseInt(rs.getString(1));
			}
		}
		
		return -1;
	}

	public static int addStudent(Student student) throws SQLException
	{
	   Address address = student.getAddress();
	   int address_id = addAddress(address);
	   Connection con = DButil.getConnection();
	   
	   String query = "Insert into student(FirstName,LastName,Gender,Email,address_id,MobileNum,year,Degree,Department,DOB) values(?,?,?,?,?,?,?,?,?,?)";
	   PreparedStatement ps = con.prepareStatement(query);
	   ps.setString(1,student.getFirstName());
	   ps.setString(2, student.getLastName());
	   ps.setString(3, student.getGender());
	   ps.setString(4,student.getEmail() );
	   ps.setInt(5,address_id);
	   ps.setString(6,student.getMobileNumber());
	   ps.setString(7, student.getYear());
	   ps.setString(8, student.getDegree());
	   ps.setString(9,student.getDepartment() );
	   ps.setDate(10, (Date) student.getDob());
	   int isInserted = ps.executeUpdate();
	   if(isInserted==1)
	   {
		   ResultSet rs = ps.executeQuery("select last_insert_id()");
		   while(rs.next())
		   {
			   return Integer.parseInt(rs.getString(1));
		   }
	   }
	   return -1;
	}
	public static boolean updateDetails(Student student)
	{
		Address address = student.getAddress();
		Connection con = DButil.getConnection();
		String query = "Update address set street =?,city=?,district=?,zip=? where address_id=?";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, address.getStreet());
			ps.setString(2,address.getCity());
			ps.setString(3,address.getDistrict());
			ps.setString(4,address.getPincode());
		    ps.setInt(5, Integer.parseInt(address.getAddress_id()));
		    if(ps.executeUpdate()!=1)
		    	return false;
		    String query1 = "Update student set FirstName =?,LastName=?,Gender=?,Email=?,MobileNum=?"
		    		+ ",Year=?,Degree=?,Department=?,DOB=? where studentId=?";
		    ps = con.prepareStatement(query1);
		    ps.setString(1,student.getFirstName());
			   ps.setString(2, student.getLastName());
			   ps.setString(3, student.getGender());
			   ps.setString(4,student.getEmail() );
			   ps.setString(5,student.getMobileNumber());
			   ps.setString(6,student.getYear());
			   ps.setString(7, student.getDegree());
			   ps.setString(8,student.getDepartment() );
			   ps.setDate(9, (Date) student.getDob());
			   ps.setInt(10, Integer.parseInt(student.getStudent_id()));
			   if(ps.executeUpdate()!=1)
				   return false;
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return true;
	}
	public static Student displayInfo(String userId) throws SQLException
	{
	    Connection con = DButil.getConnection();
	    Student student = new Student();
	    String query = "Select FirstName,LastName,Gender,Email,DOB,address_id,MobileNum,year,Degree,Department From student where studentId=?";
	    PreparedStatement ps = con.prepareStatement(query);
	    ps.setString(1, userId);
	    ResultSet rs = ps.executeQuery();
	    String address_id = null;
	   while(rs.next())
	    {
	    	student.setFirstName(rs.getString(1));
	    	student.setLastName(rs.getString(2));
	    	student.setGender(rs.getString(3));
	    	student.setEmail(rs.getString(4));
	    	student.setDob(rs.getDate(5));
	    	address_id = rs.getString(6);
	    	student.setMobileNumber(rs.getString(7));
	    	student.setYear(rs.getString(8));
	    	student.setDegree(rs.getString(9));
	    	student.setDepartment(rs.getString(10));	
	    }
	   String query1 = "select street,city,district,zip from address where address_id=?";
	   ps = con.prepareStatement(query1);
	   ps.setString(1, address_id);
	   rs = ps.executeQuery();
	   Address address = new Address();
	   address.setAddress_id(address_id);
	   while(rs.next())
	   {
		   address.setStreet(rs.getString(1));
		   address.setCity(rs.getString(2));
		   address.setDistrict(rs.getString(3));
		   address.setPincode(rs.getString(4));
	   }
	   student.setAddress(address);
	   student.setStudent_id(userId);
	    return student;
	    
	}
	
  //public static void main(String[] args) throws SQLException {
//	  Address address = new Address("North Street","Kumbakonam","Thanjavur","612402");
////	  System.out.println(addAddress(address));
//	  Student stu = new Student("Gokul","R","Male","gokul31@gmail.com", Date.valueOf("2002-10-21"),address,"99987676","III","BE","ECE");
//	   System.out.println(addStudent(stu));
//}
}
