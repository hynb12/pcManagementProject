<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="styleSheet" href="../css/css_regForm.css">
</head>
<body>

	<form method="post">
		<div class="container">
			<h1>Sign Up</h1>
			<p>Please fill in this form.</p>
			<input type="checkbox" id="isAdmin" name="isAdmin">
			<span style="color: red">are you admin?</span>
			<hr>

			<label for="email"><b>Id (Email)</b></label> 
			<input type="text" placeholder="Enter Email" name="id" required> 
			<label for="psw"><b>Password</b></label> 
			<input type="password" placeholder="Enter Password" name="pw" required> 
			<label for="psw-repeat"><b>Repeat Password</b></label> 
			<input type="password" placeholder="Repeat Password" name="pw-repeat" required> 
			<label for="name"><b>Name</b></label> 
			<input type="text" placeholder="Enter Name" name="name" required>
			<label for="phoneNum"><b>PhoneNum</b></label> 
			<input type="text" placeholder="Enter PhoneNum" name="phoneNum" required>
			<label>
				<input type="checkbox" checked="checked" name="remember" style="margin-bottom: 15px"> Remember me
			</label>

			<div class="clearfix">
				<button type="button" class="cancelbtn"
					onclick="location.href='../'">Cancel</button>
				<button type="submit" class="signupbtn">Sign Up</button>
			</div>
		</div>
	</form>

</body>
</html>
