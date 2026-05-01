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
 * Servlet implementation class DeleteHouseByAdmin
 */
@WebServlet("/DeleteHouseByAdmin")
public class DeleteHouseByAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteHouseByAdmin() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int houseNo= Integer.parseInt(request.getParameter("houseNo"));
		System.out.print(houseNo);
		PreparedStatement ps;
		Connection conn;
		PrintWriter out = response.getWriter();
        try {
        		
				Class.forName("org.postgresql.Driver");
				conn = DriverManager.getConnection("jdbc:postgresql:housedesk","postgres", "#shreya_5504#");
					    		
	    		ps = conn.prepareStatement("update housedetails set status=? where houseno = ?");
	    		ps.setInt(1,0);
	    		ps.setInt(2, houseNo);
	    		int rs = ps.executeUpdate();

				if(rs == 1)
				{
					
					out.println("<script type=\"text/javascript\">"); 
					out.println("alert('House removed from listing.');"); 
					out.println("location='adminHomePage.jsp';");
					out.println("</script>"); 
				}
				else
				{
					out.println("<script type=\"text/javascript\">"); 
					out.println("alert('Unable to remove house fro listing.');"); 
					out.println("location='adminHomePage.jsp';");
					out.println("</script>");
				}
        }catch(Exception e) {
        	System.out.println(e);
        }
	}

}
