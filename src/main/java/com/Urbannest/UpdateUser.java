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

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
			String colName = request.getParameter("newdetails");
			Class.forName("org.postgresql.Driver");
			Connection conn = DriverManager.getConnection("jdbc:postgresql:housedesk","postgres", "#shreya_5504#");
			String query = "update customer set "+colName+" = ? where email = ?";
			PreparedStatement ps1 = conn.prepareStatement(query);
			ps1.setString(1,request.getParameter("newvalue"));
			ps1.setString(2,request.getParameter("email"));
			int rs1 = ps1.executeUpdate();

			if(rs1 == 1)
			{
				
				out.println("<script type=\"text/javascript\">"); 
				out.println("alert('Update Successful');"); 
				out.println("location='adminHomePage.jsp';");
				out.println("</script>"); 
			}
			else
			{
				out.println("<script type=\"text/javascript\">"); 
				out.println("alert('Update Unsuccessful');"); 
				out.println("location='adminHomePage.jsp';");
				out.println("</script>"); 
			}
			conn.close();
		}catch(Exception e)
		{}
	}

}
