package com.Urbannest;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class ReportHouse
 */
@WebServlet("/ReportHouse")
public class ReportHouse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportHouse() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int houseNo = Integer.parseInt(request.getParameter("houseNo"));
		PrintWriter out = response.getWriter();
		try {			
			Class.forName("org.postgresql.Driver");
			Connection conn = DriverManager.getConnection("jdbc:postgresql:housedesk","postgres", "#shreya_5504#");
			
			PreparedStatement ps = conn.prepareStatement("select status from housedetails where houseno=?");
			ps.setInt(1, houseNo);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int status = rs.getInt("status");
			status--;
			
			PreparedStatement ps1 = conn.prepareStatement("update housedetails set status = ? where houseno = ?");
			ps1.setInt(1, status);
			ps1.setInt(2, houseNo);
			int rs1 = ps1.executeUpdate();
			if(rs1 == 1)
			{
				
				out.println("<script type=\"text/javascript\">"); 
				out.println("alert('Reported Successful');"); 
				out.println("location='homePage.jsp';");
				out.println("</script>"); 
			}
			else
			{
				out.println("<script type=\"text/javascript\">"); 
				out.println("alert('Report Unsuccessful');"); 
				out.println("location='homePage.jsp';");
				out.println("</script>"); 
			}
			conn.close();
		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
