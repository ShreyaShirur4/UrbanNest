<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HouseDesk | Houses</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background: #f2f2f2;
	font-size: 1;
	line-height: 24px;
	color: #f2f2f2;
	display: flex;
	justify-content: center;
}

.house {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 90%;
	margin-top: 64px;
	background: #2b6777;
}

.details {
	display: grid;
	margin-top: 16px;
	margin-bottom: 16px;
	border: 2px solid;
	width: 80%;
	grid-template-columns: 2fr 1fr;
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
	background-color: grey;
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
	background: #212131;
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
	color: #abaacd;
	top: 50%;
	left: 50%;
	position: absolute;
	transform: translate(-50%, -50%);
	background: #313142;
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
	color: #abaacd;
	background: #212131;
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

#avlable {
	font: bold;
}
</style>
</head>
<body>
	<div class="house">
		<%@ page import="java.io.*"%>
		<%@ page import="java.sql.*"%>
		<%@ page import="java.util.*"%>
		<%
	PreparedStatement ps1,ps2;
	Connection conn;
	ResultSet rs1,rs2;
	Set<String> imgs = new TreeSet<String>();
	String img = null;
	try {
		Class.forName("org.postgresql.Driver");
		conn = DriverManager.getConnection("jdbc:postgresql:housedesk","postgres", "rushi");
		ps1 = conn.prepareStatement("select * from housedetails where email = ?");
		ps1.setString(1,request.getParameter("user"));
		rs1 = ps1.executeQuery();
		if(rs1.isBeforeFirst()) {		
		while(rs1.next()) {
			
			ps2 = conn.prepareStatement("select imgname from houseimages where houseno = ?");
			ps2.setInt(1,rs1.getInt("houseno"));
			rs2 = ps2.executeQuery();
			imgs.clear();
			while(rs2.next()) {
				imgs.add(rs2.getString("imgname"));
			} %>

		<div class="details">
			<div class="add">
				<h3><%= rs1.getString("bhktype") + ", " +rs1.getString("address") +", " +rs1.getString("city") +", " +rs1.getString("pincode") %>
				</h3>
				<form method="post">
					<input type="hidden" name="houseNo"
						value="<%=rs1.getInt("houseno") %>"> <label id=avlable>
						<% 					 if(rs1.getInt("status") > 0) 
		                	out.println("Listed on Website");
		                else 
		                	out.println("Not listed On Website");
%>
					</label> <input type="submit" class="ownerbtn" Value="Delete House"
						onclick="form.action='DeleteHouseByAdmin'">
				</form>
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
				</span> <span class="price"> Expected Price <br> Rs. <%= rs1.getString("price") %>
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