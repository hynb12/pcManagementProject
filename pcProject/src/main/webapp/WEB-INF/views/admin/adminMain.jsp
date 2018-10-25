<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>adminMain</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<style>
html, body {
	height: 90%;
}

.navbar-nav {
	position: absolute;
	right: 1%;
}

#admin-name {
	position: absolute;
	right: 40%;
}

.form-inline {
	position: absolute;
	right: 65%;
}

#main-container {
	height: 100%;
	margin-top: 1%;
}

#comDiv {
	float: left;
	width: 50%;
	height: 100%;
	padding: 20px;
	overflow-y: scroll;
	text-align: center;
}

#foodDiv {
	float: right;
	width: 50%;
	background: blue;
	height: 100%;
	padding: 20px;
	overflow-y: scroll;
}

#footer {
	position: absolute;
	left: 0px;
	bottom: 0px;
	width: 100%;
}

#comTable {
	border-spacing: 20px;
	border-collapse: separate;
	margin-left: 10%;
}

#comTable td {
	background: gray;
	padding: 80px;
	font-size: 30px;
	color: white;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/adminHeader.jsp"%>

	<div id="main-container">
		<div id="comDiv">
			<h3>◆ 현재 사용 중인 컴퓨터: 5대</h3>
			<table id="comTable">
				<tr>
					<td>1</td>
					<td>2</td>
					<td>3</td>
				</tr>

				<tr>
					<td>4</td>
					<td>5</td>
					<td>6</td>
				</tr>

				<tr>
					<td>7</td>
					<td>8</td>
					<td>9</td>
				</tr>

			</table>
		</div>
		<div id="foodDiv">
			<h1>음식</h1>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/adminFooter.jsp"%>

</body>
</html>