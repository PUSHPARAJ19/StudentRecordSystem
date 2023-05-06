package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.StudentDAO;
import com.Modal.Address;
import com.Modal.Student;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public StudentServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String formType = request.getParameter("formType");
		PrintWriter out = response.getWriter();
		out.print(formType);
		if(formType.equals("register"))
		{
			  
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
		    String gender =request.getParameter("gender");
		    String email=request.getParameter("email");
		    String dob= request.getParameter("dob");
		    String street=request.getParameter("street");
		    String city=request.getParameter("city");
		    String district=request.getParameter("district");
		    String zip=request.getParameter("zip");
		    String mobileNumber=request.getParameter("mobileNumber");
		    String year=request.getParameter("year");
		    String degree=request.getParameter("degree");
		    String department=request.getParameter("department");
		    Address address = new Address(street,city,district,zip);
		    Student student = new Student(firstName,lastName,gender,email,Date.valueOf(dob),address,mobileNumber,year,department,degree);
		   
			 try {
		    	int studentId = StudentDAO.addStudent(student);
				if(studentId!=-1)
				{
					HttpSession session = request.getSession();
					session.setAttribute("userId",studentId);
					response.sendRedirect("StudentLogin.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(formType.equals("login"))
		{
			String userId = request.getParameter("userID");
			String password = request.getParameter("password");
			String msg = StudentDAO.validateStudent(userId, password);
			if(msg.equals("success"))
			{
				HttpSession session = request.getSession();
				session.setAttribute("userId", userId);
				response.sendRedirect("StudentIndex.jsp");
				
			}
			else
			{
				HttpSession session = request.getSession();
				session.setAttribute("message",msg);
				response.sendRedirect("StudentLogin.jsp");
			}
		}
		else if(formType.equals("update"))
		{
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
		    String gender =request.getParameter("gender");
		    String email=request.getParameter("email");
		    String dob= request.getParameter("dob");
		    String street=request.getParameter("street");
		    String city=request.getParameter("city");
		    String district=request.getParameter("district");
		    String zip=request.getParameter("zip");
		    String mobileNumber=request.getParameter("mobileNumber");
		    String year=request.getParameter("year");
		    String degree=request.getParameter("degree");
		    String department=request.getParameter("department");
		    String address_id = request.getParameter("address_id");
		    String student_id = request.getParameter("student_id");
		    Address address = new Address(address_id,street,city,district,zip);
		    Student student = new Student(student_id,firstName,lastName,gender,email,Date.valueOf(dob),address,mobileNumber,year,department,degree);
		   if(StudentDAO.updateDetails(student))
		   {
			    HttpSession session = request.getSession();
				session.setAttribute("userId", student_id);
				response.sendRedirect("StudentIndex.jsp");
		   }
		   
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
