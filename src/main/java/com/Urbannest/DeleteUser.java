package com.Urbannest;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
			Class.forName("org.postgresql.Driver");
			Connection conn = DriverManager.getConnection("jdbc:postgresql:housedesk","postgres", "#shreya_5504#");
			PreparedStatement ps1 = conn.prepareStatement("Delete from customer where email = ?");
			ps1.setString(1,request.getParameter("email"));
			int rs1 = ps1.executeUpdate();
			
			if(rs1 == 1)
			{
				
				out.println("<script type=\"text/javascript\">"); 
				out.println("alert('Delete Successful');"); 
				out.println("location='adminHomePage.jsp';");
				out.println("</script>"); 
			}
			else
			{
				out.println("<script type=\"text/javascript\">"); 
				out.println("alert('Delete Unsuccessful');"); 
				out.println("location='adminHomePage.jsp';");
				out.println("</script>"); 
			}
			conn.close();
		}catch(Exception e)
		{}
	}

}
