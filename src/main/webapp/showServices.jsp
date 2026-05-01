<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UrbanNest | Services</title>
<style>
body {
	background-color: #f2f2f2;
	font-family: 'Times New Roman', Times, serif;
}

.main {
	display: flex;
	flex-wrap: wrap;
	background-color: #2b6777;
}

.nav {
	flex: 40%;
	color: #cdc9c6;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 2px;
}

.enditems {
	display: flex;
	flex: 50%;
	margin-top: 10px;
	justify-content: flex-end;
	margin-bottom: 10px;
	margin-right: 4px;
}

.end {
	background-color: #f2f2f2;
	color: #52ab98;
	padding: 14px;
	font-size: 14px;
	font-weight: bold;
	border-radius: 12px;
	margin-left: 2px;
}

.logo {
	display: flex;
	color: #2b6777;
	align-items: center;
	justify-content: center;
}

.logo img {
	border-radius: 50%;
	border: 2px solid #2b6777;
}

.column {
	float: left;
	padding-left: 58px;
	padding-right: 20px;
}

.service {
	height: 300px;
	width: 500px;
	opacity: 1;
	transition: .5 ease;
	backface-visibility: hidden;
	overflow: hidden;
}

.column div {
	opacity: 0;
	visibility: hidden;
	-webkit-transition: visibility 0s, opacity 0.5s linear;
	transition: visibility 0s, opacity 0.5s linear;
}

.column:hover {
	cursor: pointer;
}

.column:hover div {
	visibility: visible;
	opacity: 0.7;
}

.row {
	padding-left: 55px;
}

.text {
	background-color: #2b6777;
	color: #f2f2f2;
	font-weight: bolder;
	font-size: 20px;
	padding: 16px 10px;
	text-align: center;
	margin-bottom: 3px;
}

img {
	margin-top: 3px;
}

.bottom {
	clear: both;
}

.book {
	display: flex;
	flex-wrap: wrap;
	background-color: #2b6777;
	justify-content: center;
}

.bservice {
	background-color: #f2f2f2;
	color: #52ab98;
	padding: 14px;
	font-size: 14px;
	font-weight: bold;
	border-radius: 12px;
	margin-top: 8px;
	margin-bottom: 8px;
	border: #000000;
}

.foot {
	display: flex;
	margin-top: 10px;
	margin-left: 12%;
	margin-bottom: 10px;
}

.foottext {
	/* background-color:#dbf7ff; */
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
	<div class="main">
		<div class="nav">
			<div class="contact">
				<button class="end">Our Phone Number: +91 9876543210</button>
			</div>
		</div>
		<div class="enditems">
			<a href="homePage.jsp"><button class="end">Home</button></a> <a
				href="index.jsp"><button class="end">Logout</button></a>

		</div>
	</div>
	<hr color="#2b6777">
	<div class="logo">
		<img src="img/logo.jpg" height="65px" width="65px">
		<h2>UrbanNest HOME SERVICE PROVIDERS</h2>

	</div>
	<hr color="#2b6777">

	<div class="row">

		<div class="column">
			<img src="img/painting.jpg" alt="Painting" class="service">
			<div class="text">PAINTING SERVICES</div>
		</div>

		<div class="column" id="col2">
			<img src="img/cleaning.jpg" alt="Cleaning" class="service">
			<div class="text">CLEANING SERVICES</div>
		</div>
		<div class="column" id="col3">
			<img src="img/electrical.jpg" alt="Electrical" class="service">
			<div class="text">ELECTRICAL SERVICES</div>
		</div>

	</div>
	<div class="row">
		<div class="column">
			<img src="img/paking.jpeg" alt="packing" class="service">
			<div class="text">PAKING AND MOVERS SERVICES</div>
		</div>
		<div class="column">
			<img src="img/pestcontrol.jpg" alt="pest" class="service">
			<div class="text">PESTCONTROL SERVICES</div>
		</div>
		<div class="column">
			<img src="img/plumbing.jpg" alt="plumbing" class="service">
			<div class="text">PLUMBING SERVICES</div>
		</div>

	</div>
	<div class="row">
		<div class="column">
			<img src="img/flooring.jpg" alt="Painting" class="service">
			<div class="text">FLOORING SERVICES</div>
		</div>
		<div class="column">
			<img src="img/sanitization.jpg" alt="Cleaning" class="service">
			<div class="text">SANITIZATION SERVICES</div>
		</div>
		<div class="column">
			<img src="img/waterproofing.jpg" alt="Electrical" class="service">
			<div class="text">WATERPROOFING SERVICES</div>
		</div>
	</div>
	<div class="bottom">
		<hr color="#2b6777">
		<div class="book">
			<a href="bookServices.jsp"><button class="bservice">BOOK
					NOW</button></a>
		</div>
		<hr color="#2b6777">
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
</body>
</html>