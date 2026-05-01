package com.Urbannest;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class AddPayment
 */
@WebServlet("/AddPayment")
public class AddPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPayment() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		RequestDispatcher rdlogin = null;
		String activeUser = (String) session.getAttribute("user");
		if(activeUser == null) {
			rdlogin = request.getRequestDispatcher("index.jsp");
			rdlogin.forward(request, response);
			return;
		}
		PreparedStatement ps;
		Connection conn;
		ResultSet rs ;
		try {
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection("jdbc:postgresql:housedesk","postgres", "#shreya_5504#");
			int tranId = 0;
			ps = conn.prepareStatement("select max(transactionid) from payments");
			rs = ps.executeQuery();
			while(rs.next())
				tranId = rs.getInt("max");
			int servId = (int) session.getAttribute("serviceId");
			String cardtype = request.getParameter("cardtype");
			String name = request.getParameter("cardname");
			String cardnum = request.getParameter("cardnumber");
			LocalDate date = LocalDate.now();
			LocalTime time = LocalTime.now();
			ps = conn.prepareStatement("insert into payments values(?,?,?,?,?,?,?,?)");
			ps.setInt(1, tranId + 1);
			ps.setString(2, cardtype);
			ps.setString(3, name);
			ps.setString(4, cardnum);
			ps.setString(5,"500");
			ps.setInt(6, servId);
			ps.setObject(7,time);
			ps.setObject(8,  date);
			int rs1 = ps.executeUpdate();
			
			if(rs1 == 1)
			{
				
				out.println("<script type=\"text/javascript\">"); 
				out.println("alert('Payment Successful');"); 
				out.println("location='homePage.jsp';");
				out.println("</script>"); 
				session.removeAttribute("serviceId");
				
			}
			else
			{
				out.println("<script type=\"text/javascript\">"); 
				out.println("alert('Payment Unsuccessful');"); 
				out.println("location='homePage.jsp';");
				out.println("</script>"); 
				session.removeAttribute("serviceId");
				
			}
		}catch(Exception e) {
			System.out.print(e);
		}
	}

}
