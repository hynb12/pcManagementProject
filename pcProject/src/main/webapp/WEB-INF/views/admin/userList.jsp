<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style>
.container {
	margin-top: 20px;
}
</style>
<title>PC Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="container">
		<h1>회원목록</h1>
		<table class="table">
			<tr>
				<th>회원아이디</th>
				<th>회원이름</th>
				<th>비밀번호</th>
				<th>핸드폰번호</th>
				<th>생년월일</th>
				<th>남은시간</th>
			</tr>
			<c:forEach var="list" items="${userlist}">
				<tr>
					<td>${list.userId}</td>
					<td>${list.userName}</td>
					<td>${list.userPw}</td>
					<td>${list.userPhone}</td>
					<td>${list.userBirth}</td>
					<td>${list.userTime}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>