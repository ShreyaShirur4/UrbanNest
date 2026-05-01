package com.Urbannest;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn;
		PreparedStatement ps;
		RequestDispatcher rdlogin = null;
		PrintWriter out = response.getWriter();
		try {
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection("jdbc:postgresql:housedesk","postgres","#shreya_5504#");
			String name = request.getParameter("fullname");
			String mobileNo = request.getParameter("mobileno");
			String adharNo = request.getParameter("adhar");
			String Email = request.getParameter("username");
			String Password = request.getParameter("password");
			
			ps = conn.prepareStatement("insert into customer values(?,?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, mobileNo);
			ps.setString(3, adharNo);
			ps.setString(4, Email);
			ps.setString(5,Password);
			int data = ps.executeUpdate();
			
			rdlogin = request.getRequestDispatcher("index.jsp");
			
			if(data == 1) {
				rdlogin.forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			out.println(e);
		}
	}

}
