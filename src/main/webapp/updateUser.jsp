<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UrbanNest | UpdateUser</title>
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
	background-color: #f2f2f2;
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

.dropbtn1 {
	background: #f2f2f2;
	padding: 10px;
	width: 100px;
	height: 50px;
}

.display {
	margin: auto;
	width: 60%;
	padding: 10px;
	height: 550px;
	margin-top: 50px;
	background: #2b6777;
	color: #f2f2f2;
}

.display1 {
	margin: auto;
	width: 60%;
	padding: 10px;
	height: 300px;
	margin-top: 50px;
	background: #2b6777;
	color: #f2f2f2;
}

h3 {
	padding-left: 290px;
}

.display1 h2 {
	padding-left: 260px;
	padding-top: 50px;
}

.column {
	float: left;
	padding-left: 115px;
	padding-top: 15px;
}

.col {
	float: left;
	padding-left: 350px;
	padding-top: 80px;
}

a {
	color: #52ab98;
}

.links {
	background: #f2f2f2;
	color: #52ab98;
	font-weight: bold;
	height: 50px;
	width: 250px;
}

.button {
	height: 40px;
	width: 110px;
}

.column h3 {
	padding-left: 200px;
}

.column1 {
	float: left;
	padding-left: 275px;
	padding-top: 15px;
}

select {
	height: 50px;
	width: 300px;
	padding-left: 30px;
	background-color: #f2f2f2;
	color: #52ab98;
	font-weight: bold;
}

input[type="text"] {
	height: 45px;
	width: 250px;
	background-color: #f2f2f2;
	color: #52ab98;
	font-weight: bold;
	font-size: 15px;
}

.foot {
	display: flex;
	margin-left: 12%;
	padding-top: 10px;
}

.foot1 {
	display: flex;
	margin-left: 12%;
	padding-top: 80px;
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
	<%

try {
	Class.forName("org.postgresql.Driver");
	Connection conn = DriverManager.getConnection("jdbc:postgresql:housedesk","postgres", "rushi");
	PreparedStatement ps1 = conn.prepareStatement("select * from customer where email = ?");
	ps1.setString(1,request.getParameter("name"));
	ResultSet rs1 = ps1.executeQuery();
	if(rs1.next()) {
		
%>

	<form method=post action="UpdateUser">
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
					<a href="registration.jsp">Sign Up</a>
				</button>
				<button class="dropbtn">
					<a href="index.jsp">login</a>
				</button>
				<button class="dropbtn">
					<a href="index.jsp">logout</a>
				</button>
			</div>
			<hr color="#2b6777">
			<div class="site">UrbanNest Property Site and Home Service
				Providers</div>
			<div class=display>
				<h3>UPDATE USER DETAILS</h3>
				<div class=row>
					<div class=column>
						<button class="links" disabled>
							NAME:
							<%= rs1.getString("name") %></button>
					</div>
					<div class=column>
						<button class="links" disabled>
							MOBILE NO.:
							<%= rs1.getString("mobile") %></button>
					</div>
					<div class=column>
						<button class="links" disabled>
							AADHAR NO.:
							<%= rs1.getString("adhar") %></button>
					</div>
					<div class=column>
						<button class="links" disabled>
							USERNAME :
							<%= rs1.getString("email") %></button>
					</div>
					<div class=column>
						<button class="links" disabled>
							PASSWORD :
							<%= rs1.getString("password") %></button>
					</div>
					<div class=column>

						<h3>NEW USER DETAILS</h3>
					</div>
					<div class=column1>
						<select name="newdetails" required>
							<option value="">--Please select a new value to update--</option>
							<option value="name">Name</option>
							<option value="mobile">Mobile No.</option>
							<option value="adhar">Aadhar No.</option>
							<option value="email">Email</option>
							<option value="password">Password</option>
						</select>
					</div>
					<div class=column>
						<button class="links" disabled>Enter new value to update
							:</button>
						<input type="text" name="newvalue" required>
						<button class=dropbtn1>
							<input type=submit value="Update">
						</button>
					</div>

				</div>
			</div>
		</div>
		<input type="hidden" name="email" value=<%= rs1.getString("email") %>>
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
	</form>
	<%
		}
	else
	{%>
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
				<a href="registration.jsp">Sign Up</a>
			</button>
			<button class="dropbtn">
				<a href="index.jsp">login</a>
			</button>
			<button class="dropbtn">
				<a href="index.jsp">logout</a>
			</button>
		</div>
		<hr color="#2b6777">
		<div class="site">UrbanNest Property Site and Home Service
			Providers</div>
		<div class="display1">
			<h3>UPDATE USER DETAILS</h3>
			<h2>ENTER VALID MAIL ID</h2>
			<div class=row>
				<div class=col>
					<div class=dropbtn2>
						<input type="button" class="button" onclick="history.back()"
							value="Close">
					</div>
				</div>
			</div>
		</div>
		<div class="foot1">
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
	<%}
	} catch(Exception e) {}
%>
</body>
</html>