<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="styleSheet" href="../css/css_loginForm.css">

</head>
<body>

	<form method="post">
		<div class="imgcontainer">
			<img src="../images/img_avatar2.png" alt="Avatar" class="avatar">
		</div>

		<div class="container">
			<label for="uname"><b>Username</b></label> 
			<input type="text" placeholder="Enter Username" name="uname" required> 
			<label for="psw"><b>Password</b></label> 
			<input type="password" placeholder="Enter Password" name="psw" required>

			<button type="submit">Login</button>
			<label>
				<input type="checkbox" checked="checked" name="remember"> Remember me
			</label>
		</div>

		<div class="container" style="background-color: #f1f1f1">
			<button type="button" class="cancelbtn" onclick="location.href='../'">Cancel</button>
		</div>
	</form>

</body>
</html>
