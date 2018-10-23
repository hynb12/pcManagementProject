<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>PC Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<style>
body, html {
	height: 100%;
	margin: 0;
}

.container {
	background-image: url('<%=request.getContextPath()%>/images/back1.jpg');
	height: 100%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative;
}

.buttons {
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
</head>
<body>
	<div class="container">
		<div class="buttons">
			<button type="button" class="btn btn-success btn-lg"
				onclick="location.href='loginForm'">로그인</button>
			<button type="button" class="btn btn-info btn-lg"
				onclick="location.href='memberRegForm'">회원가입</button>
		</div>
	</div>
</body>
</html>
