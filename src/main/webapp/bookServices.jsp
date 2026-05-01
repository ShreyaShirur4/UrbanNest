<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UrbanNest | BookServices</title>
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

.book {
	margin: auto;
	width: 60%;
	border: 3px solid #2b6777;
	padding: 10px;
	height: 400px;
	margin-top: 50px;
}

.column {
	float: left;
	padding-right: 38px;
	padding-left: 210px;
}

.column1 {
	float: right;
	padding-right: 480px;
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

.book {
	background: #2b6777;
	color: #f2f2f2;
}

.book input {
	height: 40px;
	width: 220px;
}

.book select {
	height: 40px;
	width: 240px;
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

.foot {
	display: flex;
	margin-top: 70px;
	margin-left: 12%;
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
<script>
        $(document).ready(function(){
            var todaysDate = new Date();    // Get today's date.
            document.getElementById(today).setAttribute(min,todaysDate);
            
        });

    </script>
</head>
<body>
	<div class="main">
		<div class="nav">
			<div class="contact">
				<button class="end">our phone number: +917387682804</button>
			</div>
		</div>
		<div class="enditems">
			<a href="homePage.jsp"><button class="end">Home</button></a> <a
				href="index.jsp"><button class="end">logout</button></a>

		</div>
	</div>
	<hr color="#2b6777">
	<div class="logo">
		<img src="img/logo.jpg" height="65px" width="65px">
		<h2>UrbanNest HOME SERVICE PROVIDERS</h2>
	</div>
	<hr color="#2b6777">


	<form method="post" action="AddServices">
		<div class=book>
			<div class=row>
				<div class=column>
					<h3>SELECT YOUR SERVICE:</h3>
					<select name="servicetype">
						<option value="Painting">PAINTING</option>
						<option value="Cleaning">CLEANING</option>
						<option value="Electrical">ELECTRICAL</option>
						<option value="Packing & Movers">PACKING AND MOVERS</option>
						<option value="Pestcontrol">PEST CONTROL</option>
						<option value="Plumbing">PLUMBING</option>
						<option value="Flooring">FLOORING</option>
						<option value="Sanitization">SANITIZATION</option>
						<option value="Waterproofing">WATER PROOFING</option>
					</select>
				</div>
				<div class=column>
					<h3>SELECT YOUR CITY:</h3>
					<select name="city">
						<option value="Banglore">Banglore</option>
						<option value="Mumbai">Mumbai</option>
						<option value="Pune">Pune</option>
						<option value="Chennai">Chennai</option>
						<option value="Gurgaon">Gurgaon</option>
						<option value="Hyderabad">Hyderabad</option>
						<option value="Delhi">Delhi</option>
						<option value="Noida">Noida</option>
						<option value="Gaziabad">Gaziabad</option>
						<option value="Faridabad">Faridabad</option>
					</select>
				</div>
			</div>
			<div class=row>
				<div class=column>
					<h3>ENTER ADDRESS LINE 1:</h3>
					<input type=text name=addr1>
				</div>
				<div class=column>
					<h3>ENTER ADDRESS LINE 2:</h3>
					<input type=text name=addr2>
				</div>
			</div>
			<div class=row>
				<div class=column>
					<h3>ENTER DATE*:</h3>
					<input type=date id=today name=date required>
				</div>
				<div class=column>
					<h3>SELECT HOUSE TYPE:</h3>
					<select name=housetype>
						<option value="1 RK">1 RK</option>
						<option value="1 Bhk">1 BHK</option>
						<option value="2 Bhk">2 BHK</option>
						<option value="3 Bhk">3 BHK</option>
					</select>
				</div>
			</div>
			<div class=row>
				<div class=column1>
					<button class=dropbtn type="submit">PAY DEPOSITE</button>
				</div>
			</div>

		</div>
	</form>
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