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

#comTable td{
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

#addTimeModal {
	position: absolute;
	top: 300px;
	left: 200px;
	background: red;
	width: 400px;
	height: 200px;
	display: none;
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
					<td></td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>

			</table>
			
			<!-- 시간 추가 modal -->
			<div id="addTimeModal">
				<form action="<%=request.getContextPath()%>/user/addTime">
					<input type="hidden" id="comId" name="comId">
					<input type="hidden" name="userId" value="mkms1104">
					충전 시간<input type="text" name="addTime"><br>
					<input type="submit" value="충전하기">
				</form>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	
	<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
	<script>
		$(document).ready(function() {
			
			// 각 자리 초기화
			$('#comTable td').each(function (index) {
				var str = '<div>' + (index+1) + '</div>'; // comId (1~9)
				str += '<div></div>'; // userId
				str += '<div></div>'; // time
				$(str).appendTo(this);
			});
			
			// 선택된 자리에 정보 표시 
			$('#comTable td').each(function (index) {
				if((index+1)==${uTime.comId}){
					$(this).css('opacity', 1); // 투명도 설정
					$(this).children().eq(1).text('${uTime.userId}'); 
					$(this).children().eq(2).text('${uTime.userTime}');
				}
			});
		
			// 각 컴퓨터 선택 분기 처리
			$('#comTable td').on('click', function() {
				// 데이터베이스에 저장할 값들
				// 1. 클릭한 컴퓨터 아이디
				// 2. 로그인한 아이디
				
				var comId = $(this).children().eq(0).text(); // 선택한 컴퓨터의 위치 값 가져오기
				
				
				$('#addTimeModal').show(); // modal창 보이기
				$('#comId').val(comId); 
				
			});
		});

	</script>
</body>
</html>