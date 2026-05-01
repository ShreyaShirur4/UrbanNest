<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UrbanNest | DisplayServices</title>
<style>
body {
	background-color: #f2f2f2;
}

.bg {
	width: 97%;
	padding: 20px;
	background-size: cover;
	font-family: 'Times New Roman', Times, serif;
	font-size: 20px;
	font-weight: bold;
}

a {
	color: #52ab98;
}

.container {
	display: flex;
	background: #2b6777;
}

.logo {
	display: flex;
	flex: 1;
	margin-right: 10px;
	color: #f2f2f2;
	align-items: center;
}

.logo img {
	border-radius: 50%;
	margin-left: 5px;
}

.site {
	text-align: center;
	font-size: 40px;
	font-family: 'Times New Roman', Times, serif;
	font-weight: bold;
	color: #2b6777;
	margin-top: 10px;
}

td {
	padding: 10px 10px 10px 10px;
	text-align: center;
	background-color: #f2f2f2;
	color: #2b6777;
	border: 2px solid #52ab98;
}

th {
	padding: 10px 10px 10px 10px;
	background-color: #2b6777;
	color: #f2f2f2;
	border: 2px solid #52ab98;
}

.dropbtn {
	background: #f2f2f2;
	color: #52ab98;
	padding: 14px;
	font-size: 14px;
	font-weight: bold;
	border-radius: 12px;
	margin-top: 16px;
	margin-right: 4px;
	height: 50px;
}

.table {
	margin: 25px auto;
	display: table;
	border: 2px solid #2b6777;
}

.foot {
	display: flex;
	margin-top: auto;
	margin-left: 12%;
	padding-top: 30px;;
}

.foottext {
	flex: 25%;
	font-weight: bolder;
	font-size: 20px;
}

.foot a {
	color: #52ab98;
}
</style>
</head>
<body>
	<%@ page import="java.io.*"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	<form>
		<div class="bg">
			<div class="container">
				<div class="logo">
					<img src="img/logo.jpg" height="65px" width="65px">
					<h2>UrbanNest</h2>
				</div>
				<button class="dropbtn">
					<a href="homePage.jsp">Home</a>
				</button>

				<button class="dropbtn">
					<a href="index.jsp">logout</a>
				</button>
			</div>
			<hr color="#2b6777">
			<div class="site">UrbanNest Property Site and Home Service
				Providers</div>

			<div class="table">
				<table id="userService">
					<thead>
						<tr>
							<th>USERNAME</th>
							<th>NAME</th>
							<th>MOBILE NO.</th>
							<th>SERVICE ID</th>
							<th>SERVICE NAME</th>
							<th>CITY</th>
							<th>ADDRESS</th>
							<th>DATE</th>
							<th>HOUSETYPE</th>
						</tr>
					</thead>
					<tbody>
						<% 
try {
	Class.forName("org.postgresql.Driver");
	Connection conn = DriverManager.getConnection("jdbc:postgresql:housedesk","postgres", "rushi");
	PreparedStatement ps1 = conn.prepareStatement("select * from services where email = ? ");
	ps1.setString(1,(String)session.getAttribute("user"));
	ResultSet rs1 = ps1.executeQuery();
	PreparedStatement ps = conn.prepareStatement("select * from customer where email = ?");
	ResultSet rs ;
	while(rs1.next()) {	
		ps.setString(1,rs1.getString("email"));
		rs = ps.executeQuery();
		rs.next();
%>
						<tr>
							<td><%=rs1.getString("email") %></td>
							<td><%= rs.getString("name") %></td>
							<td><%= rs.getString("mobile") %></td>
							<td><%=rs1.getInt("id")%></td>
							<td><%=rs1.getString("name")%></td>
							<td><%=rs1.getString("city")%></td>
							<td><%=rs1.getString("address")%></td>
							<td><%=rs1.getString("date")%></td>
							<td><%=rs1.getString("housetype")%></td>
						</tr>

						<%
}
} catch(Exception e) {
	System.out.print(e);
}
%>
					</tbody>
				</table>
			</div>
			<div class="foot">
				<div class="foottext">
					<a href="aboutus.html">About Us</a>
				</div>
				<div class="foottext">
					<a href="#">Privacy Policy</a>
				</div>
				<div class="foottext">
					<a href="termsconditions.html">Terms & Conditions</a>
				</div>
				<div class="foottext">
					<a href="#">Contact Us</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>