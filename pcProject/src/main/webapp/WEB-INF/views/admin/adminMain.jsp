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
	height: 100%;
	padding: 20px;
	overflow-y: scroll;
	text-align: center;
}

#footer {
	position: absolute;
	left: 0px;
	bottom: 0px;
	width: 100%;
}

#comTable {
	margin: 0 auto;
	border-spacing: 20px;
	border-collapse: separate;
}

#comTable td {
	background: gray;
	width: 180px;
	height: 180px;
	padding-left: 10px;
	font-size: 20px;
	color: white;
	text-align: left;
	border-radius: 10px;
}

/* 테스트 */
#comTable td:not (:nth-child(1) ){
	opacity: 0.5;
}

#foodTable {
	margin: 0 auto;
}

#foodTable td {
	padding: 10px;
}

.comNum {
	color: black;
	font-weight: bold;
}

#close {
	color: red;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div id="main-container">
		<div id="comDiv">
			<h3>◆ 현재 사용 중인 컴퓨터: 5대 ◆</h3>
			<table id="comTable">
				<tr>
					<td>
						<div class="comNum"></div>
						<div class="userId">mkms1104</div>
						<div class="reMaining-time">03:40</div>
						<div class="comManagement">
							<a href="">시간 추가</a><br> <a href="" id="close">강제 종료</a>
						</div>
					<td>2</td>
					<td>3</td>
				</tr>

				<tr>
					<td>
						<div class="comNum">4</div>
						<div class="userId">zzan123</div>
						<div class="reMaining-time">00:35</div>
						<div class="comManagement">
							<a href="">시간 추가</a><br> <a href="" id="close">강제 종료</a>
						</div>
					</td>
					<td>5</td>
					<td>6</td>
				</tr>

				<tr>
					<td>
						<div class="comNum">7</div>
						<div class="userId">bba557</div>
						<div class="reMaining-time">02:19</div>
						<div class="comManagement">
							<a href="">시간 추가</a><br> <a href="" id="close">강제 종료</a>
						</div>
					</td>
					<td>8</td>
					<td>9</td>
				</tr>

			</table>
		</div>
		<div id="foodDiv">
			<h3>◆ 주문 대기 중인 음식 ◆</h3>
			<table border="1" id="foodTable">
				<tr>
					<td>컴퓨터 번호</td>
					<td>음식 이름</td>
					<td>수량</td>
					<td>상태</td>
				</tr>

				<tr>
					<td>3</td>
					<td>돈까스</td>
					<td>1</td>
					<td>처리하기</td>
				</tr>

			</table>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
	<script>
		$(document).ready(function() {
			// 컴퓨터 아이디 지정(1~9)
			$('#comTable td').each(function (index) {
				$(this).attr("id", index+1);
			});
			
			// 각 컴퓨터 선택 분기 처리
			$('#comTable td').on('click', function() {
				console.log($(this).attr('id'));
			});
		});
			
			
	
	</script>
</body>
</html>