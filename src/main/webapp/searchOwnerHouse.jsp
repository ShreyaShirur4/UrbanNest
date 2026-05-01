<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UrbanNest | Search Owner</title>
<style>
body {
	background: #f2f2f2;
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

.delete {
	margin: auto;
	width: 60%;
	padding: 10px;
	height: 300px;
	margin-top: 70px;
	background: #2b6777;
	color: #f2f2f2;
}

a {
	color: #52ab98;
}

input {
	height: 40px;
	width: 280px;
	font-size: larger;
}

input[type="submit"], input[type=text] {
	background-color: #f2f2f2;
	color: #52ab98;
}

.user {
	padding-top: 60px;
	padding-left: 150px;
}

.links {
	background: #f2f2f2;
	color: #52ab98;
	font-weight: bold;
	height: 50px;
	width: 200px;
}

.updateuser {
	padding-top: 70px;
	padding-left: 130px;
}

.foot {
	display: flex;
	margin-top: 60px;
	margin-left: 12%;
	padding-top: 60px;;
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
	<form method="post" action="showUserHousesToAdmin.jsp">
		<div class="bg">
			<div class="container">
				<div class="logo">
					<img src="img/loggedIn.png" height="65px" width="65px">
					<h2>UrbanNest</h2>
				</div>
				<button class="dropbtn">
					<a href="adminHomePage.jsp">Home</a>
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
			<div class="site">UrbanNest Property Site & Home Service
				Providers</div>
			<div class=delete>
				<div class=user>
					Enter Owner Email to Display Properties to DELETE: <input
						type='text' name='user' required><br>
					<div class=updateuser>
						<input type=submit value="Search Properties">
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
	</form>
</body>
</html>