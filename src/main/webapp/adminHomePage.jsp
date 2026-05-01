<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HouseDesk | Admin Home Page</title>
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

.dropbtn {
	background: #f2f2f2;
	color: #52ab98;
	padding: 14px;
	font-size: 14px;
	font-weight: bold;
	border-radius: 12px;
	margin-top: 16px;
	margin-right: 4px;
}

.links {
	background: #f2f2f2;
	color: #52ab98;
	font-weight: bold;
	height: 50px;
	width: 250px;
}

.admin {
	margin: auto;
	width: 60%;
	padding: 10px;
	height: 400px;
	margin-top: 30px;
	background: #2b6777;
	color: #f2f2f2;
}

.column {
	float: left;
	padding-right: 40px;
	padding-left: 105px;
	padding-top: 60px;
}

.column1 {
	float: left;
	padding-right: 40px;
	padding-left: 300px;
	padding-top: 60px;
}

.site {
	text-align: center;
	font-size: 40px;
	font-family: 'Times New Roman', Times, serif;
	font-weight: bold;
	color: #2b6777;
	margin-top: 10px;
}

.foot {
	display: flex;
	margin-top: 60px;
	margin-left: 12%;
}

.foottext {
	/*background-color:#dbf7ff; */
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
	<div class="bg">
		<div class="container">
			<div class="logo">
				<img src="img/logo.jpg" height="65px" width="65px">
				<h2>UrbanNest</h2>
			</div>
			<a href="adminHomePage.jsp"><button class="dropbtn">Home</button></a>
			<a href="index.jsp"><button class="dropbtn">Logout</button></a>

		</div>
		<hr color="#2b6777">
		<div class="site">UrbanNest Property Site & Home Service
			Providers</div>
		<div class=admin>
			<div class=row>
				<div class=column>
					<a href="registration.jsp"><button class="links">ADD
							USER</button></a>
				</div>
				<div class=column>
					<a href="searchDeleteUser.jsp"><button class="links">DELETE
							USER</button></a>
				</div>
			</div>
			<div class=row>
				<div class=column>
					<a href="searchUpdateUser.jsp"><button class="links">UPDATE
							USER</button></a>
				</div>
				<div class=column>
					<a href="searchOwnerHouse.jsp"><button class="links">DELETE
							HOUSE</button></a>
				</div>
			</div>
			<div class=row>
				<div class=column1>
					<a href="displayServiceDetails.jsp"><button class="links">DISPLAY
							SERVICE DETAILS</button></a>
				</div>
			</div>
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
</body>
</html>