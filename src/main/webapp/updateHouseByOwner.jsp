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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

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
	background-color: green;
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
		ps1 = conn.prepareStatement("select * from housedetails where houseno = ?");
		ps1.setInt(1,Integer.parseInt(request.getParameter("houseNo")));
		rs1 = ps1.executeQuery();	
		if(rs1.next()) {
			
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
		<h3>NEW HOUSE DETAILS</h3>
		<form method="post" action="UpdateHouseByOwner">
			<input type=hidden name=houseno
				value="<%=request.getParameter("houseNo")%>">
			<div class=column1>
				<select name="newdetails" id="updateValues">
					<option value="">--Please select a new value to update--</option>
					<option value="apttype">Apartment Type</option>
					<option value="propage">Property Age</option>
					<option value="nooffloor">No of floor</option>
					<option value="bhktype">Bhk Type</option>
					<option value="builtuparea">Build Area</option>
					<option value="address">Address</option>
					<option value="pincode">Pincode</option>
					<option value="city">City</option>
					<option value="rentorlease">Rent or Lease</option>
					<option value="maintenance">Maintenance</option>
					<option value="rent">Rent Amount</option>
					<option value="deposit">Deposit Amount</option>
					<option value="price">Selling Price</option>
					<option value="tenants">Preferred Tenants</option>
					<option value="furnishing">Furnishing</option>
					<option value="parking">Available Parking</option>
					<option value="watersupply">Available Watersupply</option>
					<option value="status">Change Availability</option>
				</select>
			</div>

			<div class="container">
				<div id="item propdet">
					<div class="item_aptype" id="i1">
						Apartment Type* <br> <select name="apttype">
							<option value="Apartment">Apartment</option>
							<option value="Independent House">Indpendent House</option>
							<option value="Villa">Villa</option>
						</select>
					</div>
					<div class="propage" id="i2">
						Property Age* <br> <select name="propage">
							<option value="less than 1 year">Less than a Year</option>
							<option value=" 1 to 3 Years">1 to 3 Years</option>
							<option value="3 to 5 Years">3 to 5 Years</option>
							<option value="5 to 10 Years">5 to 10 Years</option>
							<option value="More than 10 years">More than 10 Years</option>
						</select>
					</div>
					<div class="floor" id="i3">
						Floor*<br> <select name="nooffloor">
							<option value="gnd">Ground</option>
							<option value="floor 1">1</option>
							<option value="floor 2">2</option>
							<option value="floor 3">3</option>
							<option value="floor 4">4</option>
							<option value="floor 5">5</option>
							<option value="floor 6">6</option>
							<option value="floor 7">7</option>
							<option value="floor 8">8</option>
							<option value="floor 9">9</option>
							<option value="10 and Above">10 and Above</option>
						</select>
					</div>
					<div class="bhktype" id="i4">
						BHK Type* <br> <select name="bhktype">
							<option value="1 RK">1 RK</option>
							<option value="1 BHK">1 BHK</option>
							<option value="2 BHK">2 BHK</option>
							<option value="3 BHK">3 BHK</option>
							<option value="4 BHK">4 BHK</option>
							<option value="5+ BHK">5+ BHK</option>
						</select>
					</div>
					<div class="builtarea" id="i5">
						Built Up Area*<br> <input type="number" name="builtuparea"
							placeholder=" In Sq.ft">
					</div>
				</div>
				<div id="item locality">
					<div class="locality">
						<div class="address1" id="i6">
							Address line 1* <br>
							<input type="text" name="address"
								placeholder="eg. House name and area"><br>
						</div>
						<div class="pincode" id="i7" style="display: none;">
							Pincode* <br> <input type="number" name="pincode">
						</div>
						<div class="city" id="i8">
							City* <br> <select name="city">
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
							</select>
						</div>
					</div>
				</div>
				<div id="item rentdet">
					<div class="rentdet">
						<div class="availfor" id="i9">
							Property availabel for* <br> <select name="rentorlease"
								id="availblefor">
								<option value="Rent">Rent</option>
								<option value="Sell">Sell</option>
								<option value="Rent & Sell">both</option>
							</select>
						</div>
						<div class="maintenance" id="i10">
							Monthly Maintenance <br> <select name="maintenance">
								<option value="Maintenance Included">Maintenance
									Included</option>
								<option value="Maintenance Extra">Maintenance Extra</option>
							</select>
						</div>
						<div class="price" id="i11">
							Expected Price* <br> <input type="number" name="price"
								placeholder="Rs.Enter Amount ">
						</div>
						<div class="expectedrent" id="i12">
							Expected Rent* <br> <input type="number" name="rent"
								placeholder="Rs.Enter Amount /Month">
						</div>
						<div class="expecteddeposit" id="i13">
							Expected Deposit: <br> <input type="number" name="deposite"
								placeholder="Rs.Enter Amount   ">
						</div>
						<div class="prefferedtenants" id="i14">
							Preferred Tenants* <br> <select name="tenants">
								<option value="Does not matter">Doesn't Matter</option>
								<option value="Family">Family</option>
								<option value="Bachelors">Bachelors</option>
								<option value="Company">Company</option>
							</select>
						</div>
						<div class="funrnished" id="i15">
							Furnishing* <br> <select name="funishing">
								<option value="Fully Furnished">Fully furnished</option>
								<option value="Semi-Furnished">Semi-furnished</option>
								<option value="Unfurnished">Unfurnished</option>
							</select>
						</div>
						<div class="parking" id="i16">
							Parking* <br> <select name="parking">
								<option value="Bike">Bike</option>
								<option value="Car">Car</option>
								<option value="Bike & Car">Both</option>
								<option value="No Parking available">None</option>
							</select>
						</div>
						<div class="watersupply" id="i17">
							Water Supply* <br> <select name="watersupply">
								<option value="Corporation">Corporation</option>
								<option value="Borewell">Borewell</option>
								<option value="Corporation & Borewell">Both</option>
							</select>
						</div>
						<div class="status" id="i18">
							Available ? <br> <input type="radio" name="status" value="3">Available
							Now <br> <input type="radio" name="status" value="0">Not
							Available <br>
						</div>
					</div>

					<button class=dropbtn1 id="submitbtn">
						<input type=submit value="Update">
					</button>
				</div>

			</div>

		</form>
		<% 		
		} 
	}catch(ClassNotFoundException | SQLException  e) {   
 	out.println(e);
 }
%>
	</div>
	<script>
	$(document).ready(function(){
		$("#submitbtn").hide();
		for(i=0;i<19;i++)
			$("#i"+i).hide();
		$("#updateValues").change(function() {
			sel = $(this).val();
			$("#submitbtn").show();
			for(i=0;i<19;i++)
				$("#i"+i).hide();
			if(sel == 'apttype') {
				$("#i1").show();	
			}else if(sel == 'propage'){
				$("#i2").show();
			}else if(sel == 'nooffloor') {			
				$("#i3").show();
			}else if(sel === 'bhktype') {			
				$("#i4").show();
			}else if(sel === 'builtuparea') {			
				$("#i5").show();
			}else if(sel === 'address') {
				$("#i6").show();
			}else if(sel === 'pincode') {			
				$("#i7").show();
			}else if(sel === 'city') {			
				$("#i8").show();
			}else if(sel === 'rentorlease') {			
				$("#i9").show();
			}else if(sel === 'maintenance') {			
				$("#i10").show();
			}else if(sel === 'price') {		
				$("#i11").show();
			}else if(sel === 'rent') {			
				$("#i12").show();
			}else if(sel === 'deposit') {			
				$("#i13").show();
			}else if(sel === 'tenants') {			
				$("#i14").show();
			}else if(sel === 'furnishing') {
				$("#i15").show();
			}else if(sel === 'parking') {			
				$("#i16").show();
			}else if(sel === 'watersupply') {			
				$("#i17").show();
			}else if(sel === 'status') {			
				$("#i18").show();
			}
		});
	});
	
</script>
</body>
</html>