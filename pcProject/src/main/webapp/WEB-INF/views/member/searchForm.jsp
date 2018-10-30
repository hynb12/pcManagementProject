<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="styleSheet" href="../css/css_searchForm.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<h2 style="text-align: center">Id or Password Search</h2>
			<div class="vl">
				<span class="vl-innertext">or</span>
			</div>

			<div class="col">
				<form method="post">
					<input type="hidden" name="search" value="id"/>
					<input type="text" name="userPhone" placeholder="UserPhone" required>
					<input type="text" name="userName" placeholder="UserName" required>
					<input type="submit" value="Search Id">
				</form>
			</div>

			<div class="col">
				<div class="hide-md-lg">
					<p>Or sign in manually:</p>
				</div>
				<form method="post">
					<input type="hidden" name="search" value="pw"/>
					<input type="text" name="userid" placeholder="Id" required>
					<input type="text" name="username" placeholder="UserName" required>
					<input type="submit" value="Search Password">
				</form>
			</div>

			<div class="cancle">
				<button type="button" class="cancelbtn"
					onclick="location.href='../'">Cancel</button>
			</div>
		</div>
	</div>
</body>
</html>
