<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UrbanNest | Registration</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
* {
	margin: 0px;
	padding: 0px;
	font-family: 'Courier New';
	line-height: 3;
}

body {
	background: #f2f2f2;
}

.wrapper {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: #2b6777;
	width: 800px;
	height: 680px;
	display: flex;
	justify-content: center;
	border-radius: 16px;
}

div.transbox {
	margin: 2px;
	color: #f2f2f2;
	padding: 8px;
	text-align: left;
}

h2 {
	font-family: 'Times New Roman';
	padding-left: 200px;
}

input {
	height: 30px;
	width: 290px;
	background: #f2f2f2;
	margin-top: 8px;
	color: #2b6777;
	font-size: 16px;
	padding-left: 8px;
}

textarea {
	border-radius: 10px;
	background: #52ab98;
	margin-top: 8px;
	color: #52ab98;
	font-size: 16px;
	padding-left: 8px;
}

input[type="submit"], input[type="reset"] {
	width: 10em;
	height: 3em;
	font-size: 15px;
	font-weight: bold;
	background: #f2f2f2;
	color: #52ab98;
	margin-bottom: 10px;
}

sup {
	color: balck;
	font-size: small;
}

.box {
	display: grid;
	grid-template-columns: 1fr 3fr;
}

a {
	text-decoration: none;
	color: black;
}

#alert {
	color: #73ec10;
	font-size: 16px;
	grid-column: 2;
}

hr {
	margin: 20px;
	width: 95%;
}
</style>
</head>
<body>
	<div class="wrapper">
		<div class="transbox">
			<form method="post" action="RegistrationServlet"
				onsubmit="return validate()">

				<h2>REGISTRATION FORM</h2>
				<div class="box">
					<span>Name:<sup> *</sup>
					</span> <input type=text name="fullname" required> <span>Number:<sup>
							*</sup></span> <input type=number id="mno" name="mobileno"
						placeholder="Enter 10 digit mobile No" required> Aadhar
					Card Number:<input type=Number name="adhar"> <span>Enter
						Your Email:<sup> *</sup>
					</span> <input type=email name="username"
						placeholder="Eg. ishikawagh@gmail.com" required> <span>Your
						Password:<sup> *</sup>
					</span> <input type=password name="password" id="password"
						placeholder="password must be 8-13 chars" required> <span>Password:<sup>
							*</sup></span> <input type=password name="confirmpassword" id="password1"
						placeholder="password must be 8-13 chars" required
						onkeyup="check(this)"> <label id="alert"></label>
				</div>

				By continuing, you agree to our <a href="termsconditions.html"><b>Terms
						& Conditions<sup> *</sup>
				</b></a><br> <input type="submit" value="Continue"> <input
					type="reset" value="Reset">
				<hr>
				Already have an account?<a href="index.jsp"> Login </a>
			</form>
		</div>
	</div>
</body>
<script>
	var password = document.getElementById('password');
	var flag = true;
	function check(elem) {
		if(elem.value.length > 0) {
			if(elem.value != password.value) {
				document.getElementById('alert').innerText = "Password does not match.";
				flag = false;
			}else{
				document.getElementById('alert').innerText ="";
				flag = true;
			}
		}else {
			document.getElementById('alert').innerText ="Enter the password.";
			flag = false;
		}
	}
	function validate() {
		flag1 = true;
		if($("#mno").val().length != 10) {
			alert("Invalid Mobile No length -> " +  $("#mno").val().length);
			flag1 = false;
		} else if($("#password1").val().length < 8 || $("#password1").val().length > 13){
			alert("Invalid Password Length -> " + $("#password1").val().length);
			flag1 = false;
		}	
			
		flag2 = flag && flag1;
		return flag2 ;
	}
</script>
</html>