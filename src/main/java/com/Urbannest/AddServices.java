package com.Urbannest;


import java.io.IOException;
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
 * Servlet implementation class AddServices
 */
@WebServlet("/AddServices")
public class AddServices extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServices() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
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
			int id = 0;
			ps = conn.prepareStatement("select max(id) from services");
			rs = ps.executeQuery();
			while(rs.next())
				id = rs.getInt("max");
			String service = request.getParameter("servicetype");
			String city = request.getParameter("city");
			String add1 = request.getParameter("addr1");
			String add2 = request.getParameter("addr2");
			String add = add1 + add2;
			String date = request.getParameter("date");
			String houseType = request.getParameter("housetype");
			ps = conn.prepareStatement("insert into services values(?,?,?,?,?,?,?)");
			ps.setInt(1, id+1);
			ps.setString(2,service);
			ps.setString(3,city);
			ps.setString(4,add);
			ps.setString(5,date);
			ps.setString(6,houseType);
			ps.setString(7,activeUser);
			int res = ps.executeUpdate();
			if(res == 1) {
				session.setAttribute("serviceId", id+1);
				rdlogin = request.getRequestDispatcher("payment.jsp");
				rdlogin.forward(request, response);
			} else {
				rdlogin = request.getRequestDispatcher("homePage.jsp");
				rdlogin.forward(request, response);
			}

		} catch(Exception e) {
			System.out.print(e);
		}
	}

}
