<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>PC Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
/* 정기 마이페이지 */
#user_info {
	margin: 20px;
}

#user_table * {
	padding: 10px 50px;
}

#user_table>tbody>tr>th {
	border: 1px solid #303030;
	border-top: 1px solid white;
	border-bottom: 1px solid white;
	color: white;
	background-color: #303030;
}

#user_table>tbody>tr>td {
	color: black;
	border: 1px solid #303030;
	background-color: white;
}

#bt {
	padding: 0px;
	width: 80px;
	height: 25px;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<h1>마이 페이지</h1>
		<hr>
		<div id="user_info">
			<form action="">
				<table id="user_table">
					<tr>
						<th>회원아이디</th>
						<td>MinSSSSS</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>MinSSSSS</td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td>01012345678</td>
					</tr>
					<tr>
						<th>남은시간</th>
						<td>1234분</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>11.11.11</td>
					</tr>
					<tr>
						<th>회원정보관리</th>
						<td><input id="bt" type="button" value='수정' onclick="">
							<input type="button" id="bt" value="삭제" onclick=""></td>
					</tr>
				</table>
			</form>


		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>