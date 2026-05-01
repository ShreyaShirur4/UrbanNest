<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UrbanNest | Payment Form</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
.row {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	margin: 12 16px;
}

.col-25 {
	-ms-flex: 15%;
	flex: 15%;
}

* {
	background-color: #f2f2f2;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	color: #2b6777;
}

.container {
	background-color: #f2f2f2;
	padding: 8px 50px 50px 32%;
	font-family: Georgia, 'Times New Roman', Times, serif;
}

input[type=text], input[type=password] {
	width: 50%;
	margin-bottom: 20px;
	padding: 10px;
	border: 3px solid rgb(128, 110, 110);
	border-radius: 3px;
}

input[type=submit], select {
	background-color: #2b6777;
	color: #f2f2f2;
	padding: 12px 12px 12px 12px;
	margin-bottom: 20px;
	padding: 12px;
	border: 3px;
	width: 53%;
	border-radius: 3px;
	cursor: pointer;
	font-size: 17px;
}

input[type=submit]:hover {
	background-color: #52ab98;
}

.icon-container {
	margin-bottom: 20px;
	padding: 7px 0;
	font-size: 24px;
}

label {
	font-weight: bold;
	margin-bottom: 2px;
	display: block;
}
</style>
</head>
<body>
	<div class="container">
		<form method="post" action="AddPayment" onsubmit="return validate()">
			<label for="cname">Accepted Cards</label>
			<div class="icon-container">
				<a href="http://www.credit-card-logos.com/"><img
					src="http://www.credit-card-logos.com/images/visa_credit-card-logos/visa_logo_2.gif"
					width="57" height="42"></a> <a
					href="http://www.credit-card-logos.com/"><img
					src="http://www.credit-card-logos.com/images/american_express_credit-card-logos/american_express_logo_1.gif"
					width="43" height="43"></a> <a
					href="http://www.credit-card-logos.com/"><img
					src="http://www.credit-card-logos.com/images/mastercard_credit-card-logos/mastercard_logo_4.gif"
					width="65" height="41"></a> <a
					href="http://www.credit-card-logos.com/"><img
					src="http://www.credit-card-logos.com/images/discover_credit-card-logos/discover_logo_2.gif"
					width="57" height="42"></a>
			</div>
			<h2>Payment Form</h2>
			<label for="ctype">*Card Type:</label> <select name="cardtype"
				id="card" required>
				<option value="" disabled>--Select a Card Type--</option>
				<option value="visa">VISA</option>
				<option value="amex">AMEX</option>
				<option value="mastercard">MASTER CARD</option>
				<option value="discover">DISCOVER</option>
			</select> <label for="cname">*Name on Card</label> <input type="text"
				id="cname" name="cardname" placeholder="Fname Mname Lname">
			<label for="ccnum">*Credit card number</label> <input type="text"
				id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
			<label for="expmonth">*Exp Month</label> <input type="text"
				id="expmonth" name="expmonth" placeholder="Month">
			<div class="row">
				<div class="col-50">
					<label for="expyear">*Exp Year</label> <input type="text"
						id="expyear" name="expyear" placeholder="Year">
				</div>
				<div class="col-50">
					<label for="cvv">*CVV</label> <input type="password" id="cvv"
						name="cvv" placeholder="xxx">
				</div>
			</div>
			<input type="submit" value="Rs. 500 Pay Now">
		</form>
	</div>
	<script>
function validate() {
	flag = true;
	if($("#ccnum").val().length != 12) {
		alert("Invalid Card No length ->" + $("#ccnum").val().length);
		flag = false;
	} else if($("#expmonth").val() > 12 || $("#expmonth").val() < 1) {
		alert("Invalid Month ->"+$("#expmonth").val());
		flag = false;
	}else if($("#expyear").val().length != 4) {
		alert("Invalid Year ->"+$("#expyear").val());
		flag = false;
	} else if($("#cvv").val().length != 3) {
		alert("Invalid CVV Length -> "+$("#cvv").val().length);
		flag = false;
	}
	return flag;
}
</script>
</body>
</html>