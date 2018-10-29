<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>PC Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
			<input type="text" placeholder="Enter PhoneNum" name="phoneNum" id="phoneNum" required>
			<label for="birth"><b>Birth</b></label>
			<input type="text" placeholder="Enter Birth" name="birth" id="birth" required>
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
	
	<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
	<script>
		
		$('#isAdmin').on('click', function() {
			
			var isAdmin = $('#isAdmin').is(':checked');
			console.log("출력"+isAdmin);
			
			// 관리자 회원가입으로 체크되었을 경우
			if(isAdmin){
				$('#birth').attr('disabled', true);
				$('#birth').css('background', 'gray');
				$('#phoneNum').attr('disabled', true);
				$('#phoneNum').css('background', 'gray');
			}
			
			else{
				$('#birth').attr('disabled', false);
				$('#birth').css('background', '');
				$('#phoneNum').attr('disabled', false);
				$('#phoneNum').css('background', '');
			}
		});
	</script>
</body>
</html>
