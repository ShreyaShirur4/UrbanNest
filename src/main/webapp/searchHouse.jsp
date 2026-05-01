<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UrbanNest | Houses</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background: #2b6777;
	font-size: 1;
	line-height: 24px;
	color: #f2f2f2;
	display: flex;
	justify-content: center;
	font-family: Times New Roman;
}

.house {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 90%;
	margin-top: 64px;
	background: #f2f2f2;
}

.details {
	display: grid;
	margin-top: 16px;
	margin-bottom: 16px;
	border: 2px solid;
	width: 80%;
	grid-template-columns: 2fr 1fr;
	background: #2b6777;
}

.add {
	grid-column-start: 1;
	grid-column-end: 3;
	margin: 16px;
	display: flex;
	justify-content: space-between;
}

.reportbtn {
	border-radius: 8px;
	width: 120px;
	background: transparent;
	color: whitesmoke;
	border: 4px solid;
	height: 50px;
	margin-left: 10px;
}

.ownerbtn {
	width: 180px;
	background-color: #52ab98;
	color: whitesmoke;
	border: 4px solid;
	border-radius: 8px;
	height: 50px;
	margin-right: 10px;
	margin-left: 4px;
}

.row1 {
	display: flex;
	flex-direction: row;
	grid-row-start: 2;
	grid-row-end: 4;
	grid-column-start: 1;
	grid-column-end: 3;
	justify-content: space-between;
	align-content: center;
	margin: 6px;
}

.row1>span {
	width: 24%;
	display: flex;
	justify-content: space-evenly;
	border: 2px solid;
}

.slider {
	margin: 8px;
	width: 500px;
	height: 308px;
	padding: 16px;
	grid-row-start: 4;
	grid-row-end: 6;
	overflow: hidden;
	padding-left: 24px;
}

.col2 {
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
}

.col2>span {
	width: 90%;
	display: flex;
	justify-content: space-evenly;
	border: 2px solid;
	margin-top: 8px;
}

.row2 {
	display: flex;
	flex-direction: row;
	grid-row-start: 6;
	grid-row-end: 7;
	grid-column-start: 1;
	grid-column-end: 3;
	justify-content: space-between;
	align-content: center;
	margin: 6px;
}

.row2>span {
	width: 30%;
	display: flex;
	justify-content: space-evenly;
	border: 2px solid;
	margin: 8px;
}

form {
	display: flex;
	justify-content: space-evenly;
}

.outerOwnerDetails {
	float: right;
	background: #2b6777;
	font-size: 1;
	line-height: 24px;
	top: 50%;
	left: 50%;
	position: absolute;
	transform: translate(-50%, -50%);
	width: 600px;
	height: 400px;
	display: flex;
	justify-content: center;
	border-radius: 16px;
}

.mainOwnerDetails {
	color: #2b6777;
	top: 50%;
	left: 50%;
	position: absolute;
	transform: translate(-50%, -50%);
	background: #52ab98;
	width: 400px;
	height: 200px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	border-radius: 16px;
}

.mainOwnerDetails>.btn>input[type='button'] {
	margin-top: 8px;
	border: 2px solid;
	width: 80px;
	color: #f2f2f2;
	background: #52ab98;
	font-size: 2;
	border-radius: 8px;
}

.unavailable {
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 8px;
	flex-direction: column;
}

.modal-content {
	color: black;
}

.container1 {
	display: flex;
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
	margin-bottom: 10px;
}

.dropbtn {
	background: #f2f2f2;
	color: #52ab98;
	padding: 14px;
	font-size: 14px;
	font-weight: bold;
	border-radius: 12px;
	margin-top: 5px;
	margin-right: 4px;
	margin-bottom: 10px;
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

.container2 {
	display: flex;
	justify-contents: space-between;
	width: 1370px;
	border: 1px solid;
	padding-top: 10px;
	background: #2b6777;
}
</style>
</head>
<body>

	<div class="house">
		<div class=container2>
			<div class="logo">
				<img src="img/logo.jpg" alt="HouseDesk Logo" height="65px"
					width="65px">
				<h2>UrbanNest</h2>
			</div>

			<a href="homePage.jsp"><button class="dropbtn">Home</button></a> <a
				href="showServiceDetailsUser.jsp"><button class="dropbtn">My
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
		<%@ page import="java.io.*"%>
		<%@ page import="java.sql.*"%>
		<%@ page import="java.util.*"%>
		<%
	PreparedStatement ps1,ps2,ps3;
	Connection conn;
	ResultSet rs1,rs2,rs3;
	Set<String> imgs = new TreeSet<String>();
	String img = null;
	try {
		Class.forName("org.postgresql.Driver");
		conn = DriverManager.getConnection("jdbc:postgresql:housedesk","postgres", "rushi");
		ps1 = conn.prepareStatement("select * from housedetails where city = ? and status <> 0");
		ps1.setString(1,request.getParameter("city"));
		rs1 = ps1.executeQuery();
		if(rs1.isBeforeFirst()) {		
		while(rs1.next()) {
			
			ps2 = conn.prepareStatement("select imgname from houseimages where houseno = ?");
			ps2.setInt(1,rs1.getInt("houseno"));
			rs2 = ps2.executeQuery();
			imgs.clear();
			while(rs2.next()) {
				imgs.add(rs2.getString("imgname"));
				

			
			} 
			ps3 = conn.prepareStatement("select * from customer where email = ?");
			ps3.setString(1, rs1.getString("email"));
			rs3 = ps3.executeQuery();
			rs3.next();
			%>

		<div class="details">
			<div class="add">
				<h3><%= rs1.getString("bhktype") + ", " +rs1.getString("address") +", " +rs1.getString("city") +", " +rs1.getString("pincode") %>
				</h3>


				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#ownerModal<%=rs1.getInt("houseno")%>">
					Get Owner Details</button>
				<!-- Modal -->
				<div class="modal fade" id="ownerModal<%=rs1.getInt("houseno")%>"
					tabindex="-1" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Owner
									Details</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								Owner Name :
								<%= rs3.getString("name") %>
								<br> Mobile No : +91
								<%= rs3.getString("mobile") %>
								<br> Email Id :
								<%= rs3.getString("email") %><br>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#reportModal<%=rs1.getInt("houseno")%>">
					Report House</button>
				<div class="modal fade" id="reportModal<%=rs1.getInt("houseno")%>"
					tabindex="-1" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Report House</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form method="post" action="ReportHouse">
									<input type="hidden" name="houseNo"
										value="<%=rs1.getInt("houseno") %>"> <input type=radio
										name="reportReason">Not Available<br> <input
										type=radio name="reportReason">Wrong House Details<br>
									<input type=radio name="reportReason">Wrong Owner
									Details<br> <input type="submit" value="Report House">
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row1">
				<span class="apttype"> House Type<br> <%= rs1.getString("apttype") %>
				</span> <span class="bhktype"> No of Bedrooms <br> <%= rs1.getString("bhktype") %>
				</span> <span class="builtup"> Built Up Area <br> <%= rs1.getString("builtuparea") %>
					Sq.ft
				</span> <span class="furnishing"> Furnishig <br> <%= rs1.getString("furnishing") %>
				</span>
			</div>
			<div class="slider">
				<div id="carouselExampleControls<%=rs1.getInt("houseno") %>"
					class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-inner">

						<% 
					Iterator<String> itr = imgs.iterator();
					boolean flag = true;
					while(itr.hasNext()) {
							String imgName = itr.next(); 
							if(flag) {
						%>
						<div class="carousel-item active">
							<img src="HouseDesk_Images/<%=imgName %>" class="d-block w-100"
								alt="...">
						</div>
						<% flag = false;
							} else {
						%>
						<div class="carousel-item">
							<img src="HouseDesk_Images/<%=imgName %>" class="d-block w-100"
								alt="...">
						</div>
						<% 	
							}
					}
				%>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleControls<%= rs1.getInt("houseno") %>"
						data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleControls<%= rs1.getInt("houseno") %>"
						data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			<div class="col2">
				<span class="floors"> Floor No <br> <%= rs1.getString("nooffloor") %>
				</span> <span class="propage"> Property Age <br> <%= rs1.getString("propage") %>
				</span> <span class="rentorsell"> Property Available for <br> <%= rs1.getString("rentorlease") %>
				</span> <span class="tenants"> Preferred Tenants <br> <%= rs1.getString("tenants") %>
				</span> <span class="maintenance"> Maintenance <br> <%= rs1.getString("maintenance") %>
				</span>
			</div>
			<div class="row2">
				<span class="rent"> Expected Rent <br> Rs. <%= rs1.getString("rent") %>
				</span> <span class="deposit"> Expected Deposit <br> Rs. <%= rs1.getString("deposit") %>
				</span> <span class="parking"> Available Parking <br> <%= rs1.getString("parking") %>
				</span> <span class="water"> Available Water Suppy <br> <%= rs1.getString("watersupply") %>
				</span>
			</div>
		</div>

		<% 
			
		} 
	} else {
%>
		<div class="unavailable">
			<h2>Our Serive is currently not available in this area.</h2>
			<h3>We are sorry for your inconvenience !</h3>
			<input type="button" value="Go Back !" onclick="history.back()"
				style="border-radius: 8px;">
		</div>
		<% 
	}
	
	}catch(ClassNotFoundException | SQLException  e) {   
 	out.println(e);
 }
%>
	</div>
</body>
</html>