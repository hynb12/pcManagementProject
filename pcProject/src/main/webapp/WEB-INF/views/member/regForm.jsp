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
			<input type="checkbox" id="isAdmin" name="isAdmin"> <span
				style="color: red">are you admin?</span>
			<hr>

			<label for="email"><b>Id (Email)</b></label>
			<input type="text" placeholder="Enter Email" id="idE" name="id" required>
			<p id="idCheck"></p>
			<label for="psw"><b>Password</b></label>
			<input type="password" placeholder="Enter Password" id="pw1" name="pw" required>
			<label for="psw-repeat"><b>Repeat Password</b></label>
			<input type="password" placeholder="Repeat Password" id="pw2" name="pw-repeat" required>
			<p id="pwError"></p>
			<label for="name"><b>Name</b></label>
			<input type="text" placeholder="Enter Name" name="name" required>
			<label for="phoneNum"><b>PhoneNum</b></label>
			<input type="text" placeholder="Enter PhoneNum" name="phoneNum" id="phoneNum" required>
			<label for="birth"><b>Birth</b></label>
			<input type="text" placeholder="Enter Birth" name="birth" id="birth" required>
			<label> <input type="checkbox" checked="checked" name="remember" style="margin-bottom: 15px"> Remember me </label>

			<div class="clearfix">
				<button type="button" class="cancelbtn"
					onclick="location.href='../'">Cancel</button>
				<button type="submit" class="signupbtn">Sign Up</button>
			</div>
		</div>
	</form>

	<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
	<script>
		
		// user & admin 회원가입 구분하기
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
		
		
		// 1. 회원가입하는데 userId / userPhone 중복 체크하고
		$('#idE').keyup(function(){
			
			var isAdmin = $('#isAdmin').is(':checked');
			
			// true = admin & false = user
			console.log(isAdmin);
			
			$.ajax({
				url: '${pageContext.request.contextPath}/member/regCheck?id='+$('#idE').val()+'&isAdmin='+isAdmin,
				type : 'get',
				success : function(data) {
					if (data == 1) {

						/* console.log("아이디가 존재합니다. 다른 아이디를 입력해주세요."); */
						//아이디가 존재할 경우 빨간색으로 알림이 뜨고 포커스를 맞춰줌
						$("#idCheck").text("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
						$("#idCheck").css("color", "red");
						$("#idE").focus();

					} else {
						console.log("사용가능한 아이디입니다.");
						//사용가능하면 경우 파란색으로 알림이 뜨고 비밀번호로 포커스를 맞춰줌
						$("#idCheck").text("중복된 아이디가 없으니 사용해도 OK");
						$("#idCheck").css("color", "blue");
						

					}
				},
				error : function(error) {

					console.log("error : " + error);
				}

			});

		});

		// 2. 비밀번호 중복 체크 (keydown 이벤트를 사용)
		$('#pw2').keyup(function() {
			if ($('#pw1').val() != $(this).val()) {
				$('#pwError').text('비밀번호가 일치하지 않습니다.');
				$('#pwError').css('color', 'red');
			} else {
				$('#pwError').text('');
			}

		});
	</script>
</body>
</html>
