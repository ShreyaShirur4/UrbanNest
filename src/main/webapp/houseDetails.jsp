<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UrbanNest | Register House</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	list-style: none;
}

body {
	background: #2b6777;
	font-size: 1;
	line-height: 24px;
}

.wrapper {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: #313142;
	width: 800px;
	height: 680px;
	display: flex;
	border-radius: 16px;
}

.wrapper .wrapper_left {
	width: 250px;
	background: #52ab98;
	padding: 0 25px;
	display: flex;
	align-items: center;
	border-top-left-radius: 15px;
	border-bottom-left-radius: 15px;
	box-shadow: 10px 0 13px 0px rgba(41, 41, 57, 0.7);
}

.wrapper .wrapper_left ul li {
	background: #313142;
	margin-bottom: 25px;
	border-radius: 3px;
	padding: 12px 25px;
	text-transform: uppercase;
	font-weight: 500;
	position: relative;
	width: 200px;
	letter-spacing: 2px;
	transition: all 0.4s ease;
	cursor: pointer;
	overflow: hidden;
}

.wrapper .wrapper_left ul li p {
	color: #f2f2f2;
	position: relative;
}

.wrapper .wrapper_left ul li:before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 5px;
	height: 100%;
	background: #2b6777;
	/*background: linear-gradient(
                126deg,
                rgba(2,0,36,1) 0%,
                rgba(123,90,231,1) 0%,
                rgba(88,54,206,1) 100%
                ); */
	border-radius: 5px;
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
	transition: all 0.4s ease;
}

.wrapper .wrapper_left ul li:last-child {
	margin-bottom: 0;
}

.wrapper .wrapper_left ul li.active {
	width: 250px;
}

.wrapper .wrapper_left ul li.active p {
	columns: #fff;
}

.wrapper .wrapper_left ul li.active:before {
	width: 100%;
	transition: all 0.2s ease;
}

.wrapper_right {
	width: 550px;
	padding: 30px 50px;
	background: #f2f2f2;
	border-radius: 10px;
}

.wrapper_right .title {
	font-size: 24px;
	text-align: center;
	font-weight: 700;
	color: #2b6777;
	margin-bottom: 20px;
}

.item.propdet {
	display: grid;
	grid-template-columns: 1fr 1fr;
	grid-row-gap: 40px;
	grid-column-gap: 20px;
	justify-items: center;
	align-items: center;
	color: #2b6777;
	font-size: large;
}

.item.locality .locality {
	display: grid;
	grid-template-columns: 1fr 1fr;
	grid-row-gap: 20px;
	grid-column-gap: 20px;
	justify-items: center;
	align-items: center;
	color: #2b6777;
	font-size: large;
}

.item.rentdet .rentdet {
	display: grid;
	grid-template-columns: 1fr 1fr;
	grid-row-gap: 40px;
	grid-column-gap: 20px;
	justify-items: flex-start;
	align-items: center;
	color: #2b6777;
	font-size: large;
}

.price, .empty {
	display: none;
}

input, select {
	border-radius: 8px;
	height: 30px;
	margin-top: 8px;
}

.builtarea {
	grid-column-start: 1;
	grid-column-end: 3;
}

.container {
	position: absolute;
	top: 30%;
	left: 40%;
}

.buttons {
	display: grid;
	grid-template-columns: 1fr 1fr;
	justify-items: center;
	align-items: center;
}

input[type="submit"], input[type="reset"] {
	margin-right: 8px;
	margin-left: 8px;
	width: 100px;
	color: #2b6777;
	background-color: transparent;
}

input[type="submit"] {
	width: 200px;
	border: 2px solid #2b6777;
	height: 40px;
	font-size: 15px;
}

input[type="reset"] {
	width: 100px;
	border: 2px solid #2b6777;
	height: 40px;
	font-size: 16px;
}
</style>
</head>
<body>
	<form method="post" action="houseDetailsRegisterServlet">
		<div class="wrapper">
			<div class="wrapper_left">
				<ul>
					<li data-li="propdet" class="active">
						<p>Property Details</p>
					</li>
					<li data-li="locality">
						<p>Locality Details</p>
					</li>
					<li data-li="rentdet">
						<p>Rental Details</p>
					</li>
				</ul>
			</div>
			<div class="wrapper_right">
				<div class="title">House Registration From</div>
				<div class="container">
					<div class="item propdet">
						<div class="item_aptype">
							Apartment Type* <br> <select name="aptype">
								<option value="Apartment">Apartment</option>
								<option value="Independent House">Indpendent House</option>
								<option value="Villa">Villa</option>
							</select>
						</div>
						<div class="propage">
							Property Age* <br> <select name="propertyage">
								<option value="less than 1 year">Less than a Year</option>
								<option value=" 1 to 3 Years">1 to 3 Years</option>
								<option value="3 to 5 Years">3 to 5 Years</option>
								<option value="5 to 10 Years">5 to 10 Years</option>
								<option value="More than 10 years">More than 10 Years</option>
							</select>
						</div>
						<div class="floor">
							Floor*<br> <select name="floor">
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
						<div class="bhktype">
							BHK Type* <br> <select name="bhktype">
								<option value="1 RK">1 RK</option>
								<option value="1 BHK">1 BHK</option>
								<option value="2 BHK">2 BHK</option>
								<option value="3 BHK">3 BHK</option>
								<option value="4 BHK">4 BHK</option>
								<option value="5+ BHK">5+ BHK</option>
							</select>
						</div>
						<div class="builtarea">
							Built Up Area*<br> <input type="number" name="builtuparea"
								placeholder=" In Sq.ft" required>
						</div>
					</div>
					<div class="item locality" style="display: none;">
						<div class="locality">
							<div class="address1">
								Address line 1* <br>
								<input type="text" name="addline1"
									placeholder="eg. House name and area" required><br>
							</div>
							<div class="address2">
								Address line 2* <br>
								<input type="text" name="addline2" placeholder="eg. street name"
									required><br>
							</div>
							<div class="pincode">
								Pincode* <br> <input type="number" name="pincode" required>
							</div>
							<div class="city">
								City* <br> <select name="city" required>
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
					<div class="item rentdet" style="display: none;">
						<div class="rentdet">
							<div class="availfor">
								Property availabel for* <br> <select name="availablefor"
									id="availblefor">
									<option value="Rent">Rent</option>
									<option value="Sell">Sell</option>
									<option value="Rent & Sell">both</option>
								</select>
							</div>
							<div class="maintenance">
								Monthly Maintenance <br> <select name="maintenance">
									<option value="Maintenance Included">Maintenance
										Included</option>
									<option value="Maintenance Extra">Maintenance Extra</option>
								</select>
							</div>
							<div class="price">
								Expected Price* <br> <input type="number" name="price"
									placeholder="Rs.Enter Amount ">
							</div>
							<div class="expectedrent">
								Expected Rent* <br> <input type="number" name="rent"
									placeholder="Rs.Enter Amount /Month">
							</div>
							<div class="expecteddeposit">
								Expected Deposit: <br> <input type="number" name="deposite"
									placeholder="Rs.Enter Amount   ">
							</div>
							<div class="prefferedtenants">
								Preferred Tenants* <br> <select name="tenants">
									<option value="Does not matter">Doesn't Matter</option>
									<option value="Family">Family</option>
									<option value="Bachelors">Bachelors</option>
									<option value="Company">Company</option>
								</select>
							</div>
							<div class="funrnished">
								Furnishing* <br> <select name="funishing">
									<option value="Fully Furnished">Fully furnished</option>
									<option value="Semi-Furnished">Semi-furnished</option>
									<option value="Unfurnished">Unfurnished</option>
								</select>
							</div>
							<div class="parking">
								Parking* <br> <select name="parking">
									<option value="Bike">Bike</option>
									<option value="Car">Car</option>
									<option value="Bike & Car">Both</option>
									<option value="No Parking available">None</option>
								</select>
							</div>
							<div class="watersupply">
								Water Supply* <br> <select name="watersupply">
									<option value="Corporation">Corporation</option>
									<option value="Borewell">Borewell</option>
									<option value="Corporation & Borewell">Both</option>
								</select>
							</div>
							<div class="empty"></div>
							<div class="uploadImgBtn">
								<input type="submit" value="Continue to Upload Images">
							</div>
							<div class="reset">
								<input type="reset" value="Clear">
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</form>
	<script>
        var li_elements = document.querySelectorAll(".wrapper_left ul li");
        var item_elements = document.querySelectorAll(".item");
        for(var i=0;i<li_elements.length;i++){
            li_elements[i].addEventListener("click",function(){
                li_elements.forEach(function(li){
                    li.classList.remove("active");
                })
                this.classList.add("active");

                var li_value = this.getAttribute("data-li");

                item_elements.forEach(function(item){
                    item.style.display = "none";
                })
                if(li_value == "propdet") {
                    document.querySelector("." + li_value).style.display = "";
                } else if(li_value == "locality") {
                    document.querySelector("." + li_value).style.display = "";
                } else if(li_value == "rentdet") {
                    document.querySelector("." + li_value).style.display = "";
                }else {
                    console.log("");
                }
            })
        }
    </script>
	<script>
    $('#availblefor').change(function() {
    	sel = $(this).val();
    	if(sel === 'Sell') {
    		$(".maintenance").hide();
            $(".expectedrent").hide();
            $(".expecteddeposit").hide();
            $(".price").show();
            $(".empty").hide();
            $(".container").css("top","30%");
    	} else if(sel === 'Rent') {
    		$(".maintenance").show();
            $(".expectedrent").show();
            $(".expecteddeposit").show();
            $(".price").hide();
            $(".empty").hide();
            $(".container").css("top","30%");
    	}else {
    		$(".maintenance").show();
            $(".expectedrent").show();
            $(".expecteddeposit").show();
            $(".price").show();
            $(".empty").show();
            $(".container").css("top","15%");
    	}
        
    });
    </script>
</body>
</html>