package com.Urbannest;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PreparedStatement ps;
		Connection conn;
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
        try {
        		
				Class.forName("org.postgresql.Driver");
				conn = DriverManager.getConnection("jdbc:postgresql:housedesk","postgres", "#shreya_5504#");
				String username = request.getParameter("uname");
	    		String userpass = request.getParameter("upass");
	    		
	    		ps = conn.prepareStatement("Select name from admin where email=? and password=?");
	    		ps.setString(1, username);
				ps.setString(2, userpass);
				ResultSet rs = ps.executeQuery();
				if(rs.next()) {
					session.setAttribute("admin", username );
					session.setAttribute("adminName",rs.getString("name"));
					RequestDispatcher rd = request.getRequestDispatcher("adminHomePage.jsp");
		    		rd.forward(request, response);
				} else {
					ps = conn.prepareStatement("Select name from customer where email=? and password=?");
					ps.setString(1, username);
					ps.setString(2, userpass);
					rs = ps.executeQuery();
					if(rs.next()) {
						session.setAttribute("user", username );
						session.setAttribute("userName",rs.getString("name"));
						RequestDispatcher rd = request.getRequestDispatcher("homePage.jsp");
			    		rd.forward(request, response);
					}else {
						out.println("<script type=\"text/javascript\">"); 
						out.println("alert('Login Unsuccessful. Invalid Credentials.');"); 
						out.println("location='index.jsp';");
						out.println("</script>"); 
					}
				}
				
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

}
