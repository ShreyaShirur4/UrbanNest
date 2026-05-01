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

@WebServlet("/houseDetailsRegisterServlet")
public class houseDetailsRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public houseDetailsRegisterServlet() {
        super();
        
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		RequestDispatcher rdlogin = null;
		PrintWriter out = response.getWriter();
		String activeUser = (String) session.getAttribute("user");
		if(activeUser == null) {
			rdlogin = request.getRequestDispatcher("index.jsp");
			rdlogin.forward(request, response);
			return;
		}
		PreparedStatement ps;
		Connection conn;
		try {
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection("jdbc:postgresql:housedesk","postgres", "#shreya_5504#");
			
			//retrive all the fields of house register form
			String aptType = request.getParameter("aptype");
			String propertyAge = request.getParameter("propertyage");
			String noOfFloors = request.getParameter("floor");
			String bhkType = request.getParameter("bhktype");
			String builtUpArea = (request.getParameter("builtuparea"));
			String addLine1= request.getParameter("addline1");
			String addLine2= request.getParameter("addline2");
			String pincode = (request.getParameter("pincode"));
			String city= request.getParameter("city");
			String rentOrLease= request.getParameter("availablefor");
			String maintainance= request.getParameter("maintenance");
			if(maintainance == null) maintainance = "-";
			String rent = (request.getParameter("rent"));
			if(rent == null) rent = "-";
			String deposit = (request.getParameter("deposite"));
			if(deposit == null) deposit = "-";
			String tenants= request.getParameter("tenants");
			String furnishing= request.getParameter("funishing");
			String parking= request.getParameter("parking");
			String waterSupply= request.getParameter("watersupply");
			String price = (request.getParameter("price"));
			if(price == null) price = "-";
			//retrive last house
			ps = conn.prepareStatement("select max(houseno) from housedetails");
			ResultSet rs = ps.executeQuery();
			int houseNo = 0;
			while(rs.next()) {
				houseNo = rs.getInt("max");
			}
			 
			ps = conn.prepareStatement("insert into housedetails values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1,houseNo + 1);
			ps.setString(2,aptType);
			ps.setString(3,propertyAge);
			ps.setString(4,noOfFloors);
			ps.setString(5,bhkType);
			ps.setString(6,(String)builtUpArea);
			ps.setString(7,addLine1 +", " + addLine2);
			ps.setString(8,pincode);
			ps.setString(9,city);
			ps.setString(10,rentOrLease);
			ps.setString(11,maintainance);
			ps.setString(12,(String)rent);
			ps.setString(13,(String)deposit);
			ps.setString(14,tenants);
			ps.setString(15,furnishing);
			ps.setString(16,parking);
			ps.setString(17,waterSupply);
			ps.setString(18, price);
			ps.setString(19,activeUser);
			//status
			ps.setInt(20,3);
			
			int res = ps.executeUpdate();
						
			if(res == 1) {
				rdlogin = request.getRequestDispatcher("houseImgs.jsp");
				rdlogin.forward(request, response);
			} else {
				rdlogin = request.getRequestDispatcher("homePage.jsp");
				rdlogin.forward(request, response);
			}
			
	    }catch(ClassNotFoundException | SQLException e) {
	    	out.println(e);
		}
	}
	
}
