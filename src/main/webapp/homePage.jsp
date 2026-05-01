<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UrbanNest | HomePage</title>
<style>
body {
	background: #f2f2f2;
}

.bg {
	width: 97%;
	border: 3px solid #fff;
	padding: 20px;
	background-size: cover;
	font-family: 'Times New Roman', Times, serif;
	font-size: 20px;
	font-weight: bold;
	background: #f2f2f2;
	/* background-image: linear-gradient(#52ab98,#f2f2f2,#52ab98); */
}

.container {
	display: flex;
	border-radius: 12px;
	background-color: #2b6777;
}

.container1 {
	display: flex;
	margin-left: 2%;
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

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #52ab98;
	min-width: 120px;
	box-shadow: 0px 8px 16px 0px rgba(232, 223, 223, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 12px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #2b6777;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #2b6777;
}

.site {
	text-align: center;
	font-size: 40px;
	font-family: 'Times New Roman', Times, serif;
	font-weight: bold;
	color: #2b6777;
	margin-top: 3%;
}

input[type=text] {
	width: 500px;
	height: 45px;
	font-size: 15px;
	font-family: 'Courier New';
	font-weight: bold;
	background-color: whitesmoke;
	color: rgb(0, 0, 0);
}

select {
	width: 170px;
	height: 51px;
	border-radius: 50px;
	font-size: 15px;
	font-family: 'Courier New';
	font-weight: bold;
	background-color: whitesmoke;
	color: black;
	padding-left: 16px;
}

.search {
	margin-top: 4%;
	margin-left: 30%;
	align-items: center;
}

input[type=submit] {
	width: 170px;
	height: 45px;
	border-radius: 12px;
	background-color: #52ab98;
	color: white;
	font-size: 20px;
}

.submit {
	margin-top: 2%;
	margin-left: 45%;
	align-items: center;
}

.line {
	margin-top: 5%;
	width: 35%;
}

.dot {
	height: 25px;
	width: 25px;
	background-color: #2b6777;
	border-radius: 50%;
	display: inline-block;
	margin-top: 5%;
}

.why {
	margin-top: 4%;
	margin-left: 2%;
	margin-right: 2%;
	font-size: 38px;
	font-family: 'Times New Roman', Times, serif;
	font-weight: bold;
	color: #2b6777;
}

.image-row {
	display: flex;
}

.image {
	margin-top: 3%;
	margin-left: 11%;
	flex: 33.3%;
	padding: 5px;
}

.text-row {
	display: flex
}

.image-text {
	margin-left: 9%;
	flex: 33.3%;
	padding: 5px;
	color: rgb(255, 102, 102);
}

a {
	text-decoration: none;
}

.foot {
	display: flex;
	margin-top: 3%;
	margin-left: 12%;
	padding: 5px;
}

.text {
	flex: 33.3%;
	padding: 5px;
}

.foot a {
	color: #2b6777;
}

h3 {
	color: #2b6777;
}

.searchbox {
	border-radius: 50px;
	padding-left: 16px;
}

.currentUser {
	display: grid;
	height: 50px;
	grid-template-columns: 1fr 2fr;
	align-items: center;
	padding-right: 6px;
	padding-left: 6px;
	column-gap: 0px;
	justify-content: center;
	background: #f2f2f2;
	border-radius: 12px;
	margin-right: 4px;
	margin-top: 16px;
}

.userName {
	color: black;;
}
</style>
</head>
<body>
	<div class="bg">
		<div class="container">
			<div class="logo">
				<img src="img/logo.jpg" alt="HouseDesk Logo" height="65px"
					width="65px">
				<h2>UrbanNest</h2>
			</div>
			<div class="currentUser">
				<img alt="loggedIn" src="img/loggedIn.png" height="32px"><label
					class="userName"> ${ userName } </label>
			</div>
			<a href="showServiceDetailsUser.jsp"><button class="dropbtn">My
					Bookings</button></a> <a href="showUserHouses.jsp"><button class="dropbtn">For
					Property Owners</button></a>
			<div class="dropdown">
				<button class="dropbtn">Menu</button>
				<div class="dropdown-content">
					<a href="houseDetails.jsp">PostProperty</a> <a
						href="showServices.jsp">Services</a>
				</div>
			</div>
			<a href="index.jsp"><button class="dropbtn">Logout</button></a>
		</div>
		<hr color="#2b6777">
		<div class="site">UrbanNest Property Site</div>
		<form method="post" action="searchHouse.jsp">
			<div class="search">
				<select name="city" required>
					<option disabled>- Select your CitY -</option>
					<option value="Ahmedabad">Ahmedabad</option>
					<option value="Bangalore">Bangalore</option>
					<option value="Chandigarh">Chandigarh</option>
					<option value="Chennai">Chennai</option>
					<option value="Delhi">Delhi</option>
					<option value="Gurgaon">Gurgaon</option>
					<option value="Hyderabad">Hyderabad</option>
					<option value="Kolkatta">Kolkatta</option>
					<option value="Mumbai">Mumbai</option>
					<option value="Noida">Noida</option>
					<option value="Pune">Pune</option>
				</select> <input type="text" class="searchbox" name="area"
					placeholder="search localities or landmarks">
			</div>
			<div class=submit>
				<input type="submit" value=search>
			</div>
		</form>
		<div class="container1">
			<div class="line">
				<hr color="#2b6777">
			</div>
			<div class="dot"></div>
			<div class="why">Why Use UrbanNest?</div>
			<div class="dot"></div>
			<div class="line">
				<hr color="#2b6777">
			</div>
		</div>
		<div class="image-row">
			<div class="image">
				<img src="img/avoidBroker.png" height="110px" alt="broker">
			</div>
			<div class="image">
				<img src="img/freeListing.png" alt="freelisting" height="110px">
			</div>
			<div class="image">
				<img src="img/shortlistWithoutVisit.png"
					alt="shortlist without visit" height="110px">
			</div>
		</div>
		<div class="text-row">
			<div class="image-text">
				<h3>AVOID BROKER</h3>
				we directly connect you to verified owners to save brokerage
			</div>
			<div class="image-text">
				<h3>FREE LISTING</h3>
				Easy Listing Process
			</div>
			<div class="image-text">
				<h3>SHORTLIST WITHOUT VISIT</h3>
				Extensive information makes it easy
			</div>
		</div>
		<hr color="#2b6777">
		<div class="foot">
			<div class="text">
				<a href="#">About Us</a>
			</div>
			<div class="text">
				<a href="#">Privacy Policy</a>
			</div>
			<div class="text">
				<a href="termsconditions.html">Terms & Conditions</a>
			</div>
			<div class="text">
				<a href="#">Contact Us</a>
			</div>
		</div>
	</div>
</body>
</html>