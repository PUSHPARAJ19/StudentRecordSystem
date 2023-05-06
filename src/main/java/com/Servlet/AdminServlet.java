package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.AdminDAO;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String formType = request.getParameter("formType");
		if(formType.equals("login"))
		{
			String userId = request.getParameter("userId");
			String password = request.getParameter("password");
			String msg = AdminDAO.validateAdmin(userId, password);
			if(msg.equals("success"))
			{
				HttpSession session = request.getSession();
				session.setAttribute("adminId",userId);
				response.sendRedirect("adminIndex.jsp");
			}
			else
			{
				HttpSession session = request.getSession();
				session.setAttribute("msg",msg);
				response.sendRedirect("AdminLogin.jsp");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
