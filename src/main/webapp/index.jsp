<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UrbanNest | Login Page</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,300,0,0" />
<style>
body {
	min-height: 100vh;
	background-image: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.8),
		rgba(0, 0, 0, 0.8)), url(img/loginbackground.png);
	background-size: cover;
	display: flex;
	align-items: center;
	justify-content: center;
}

.login-card {
	width: 450px;
	background: rgba(255, 255, 255, .5);
	padding: 4rem;
	padding-top: 0;
	border-radius: 10px;
	position: relative;
}

.login-card::before {
	content: "";
	position: absolute;
	background: rgba(255, 255, 255, .15);
	inset: 0;
	transform: rotate(-5px);
	z-index: -1;
}

.login-card-logo {
	margin-bottom: 0;
	height: 200px;
}

.login-card-logo img {
	width: 210px;
	border-radius: 100%;
}

.login-card-logo, .login-card-header, .login-card-footer {
	text-align: center;
}

.login-card a {
	text-decoration: none;
	color: #35339a;
}

.login-card a:hover {
	text-decoration: underline;
}

.login-card-header {
	margin: 1rem;
	margin-top: 0;
}

.login-card-header h1 {
	font-size: 2rem;
	font-weight: 600;
	margin-bottom: .5rem;
}

.login-card-header h1+div {
	font-size: calc(1rem * .8);
	opacity: .8;
}

form {
	display: flex;
	flex-direction: column;
	gap: 1.5rem
}

form .form-item {
	position: relative;
}

form .form-item .material-symbols-rounded {
	position: absolute;
	top: .82rem;
	left: 1.4rem;
	font-size: 1.3rem;
	opacity: .4;
}

form .button {
	display: flex;
	align-items: center;
	justify-content: space-around;
	font-size: calc(1rem * .8);
	margin-bottom: .5rem;
}

.login-card-footer {
	margin-top: 1.5rem;
	font-size: calc(1.3rem * .8);
}

input[type="email"], input[type="password"] {
	border: none;
	outline: none;
	background: rgba(255, 255, 255, .5);
	padding: 1rem 1.5rem;
	padding-left: calc(1rem * 3.5);
	border-radius: 100px;
	width: 80%;
}

input:focus {
	background: white;
}

input[type="submit"], input[type="reset"] {
	background: rgba(0, 0, 0, 1);
	color: white;
	border-radius: 100px;
	padding: .5rem;
	font-size: 15px;
	width: 100px;
}

input[type="submit"]:hover, input[type="reset"]:hover {
	background-color: rgba(0, 0, 0, .5);
}
</style>
</head>
<body>
	<%@ page import="javax.servlet.http.HttpSession"%>
	<%
	session.removeAttribute("user");
	session.removeAttribute("userName");
%>
	<div class="login-card-container">
		<div class="login-card">
			<div class="login-card-logo">
				<img src="img/logo3.png" alt="HouseDesk Logo">
			</div>
			<div class="login-card-header">
				<h1>Log In</h1>
				<p>Please Login to use platform</p>
			</div>
			<form method="post" action="LoginServlet">
				<div class="form-item">
					<span class="material-symbols-rounded">mail:</span> <input
						type="email" name="uname" id="username" placeholder="Enter Email"
						required autofocus autocomplete="on">
				</div>
				<div class="form-item">
					<span class="material-symbols-rounded">lock:</span> <input
						type="password" name="upass" id="userpass"
						placeholder="Enter Pasword" required autocomplete="off">
				</div>
				<div class="button">
					<input type="submit" value="Log In"> <input type="reset"
						value="Reset">
				</div>
			</form>
			<div class="login-card-footer">
				Don't Have an account? <a href="registration.jsp">Create a free
					account.</a>
			</div>
		</div>

	</div>
</body>
</html>