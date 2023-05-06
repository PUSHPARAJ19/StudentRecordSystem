package com.DAO;

import java.sql.*;
import com.Modal.Admin;
import com.Util.DButil;

public class AdminDAO {
  public static String validateAdmin(String userId,String password)
  {
	  Connection con = DButil.getConnection();
		String query ="select firstName,DOB from admin where adminId=?";
		
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
	  return "success";
  }
  public static Admin getAdminDetails(String userID)
  {
	Admin admin = new Admin();
	Connection con =DButil.getConnection();
	String query = "select firstName,lastName,DOB,YearOfJoining,Email from admin where adminId =?";
	PreparedStatement ps;
	try {
		ps = con.prepareStatement(query);
		ps.setInt(1, Integer.parseInt(userID));
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			admin.setFirstName(rs.getString(1));
			admin.setLastName(rs.getString(2));
			admin.setDOB(rs.getDate(3));
			admin.setYear(rs.getString(4));
			admin.setEmail(rs.getString(5));
		}
		admin.setAdminId(userID);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	return admin;
  }
}
