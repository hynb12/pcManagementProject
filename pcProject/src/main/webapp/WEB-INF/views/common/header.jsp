<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<span class="navbar-text"> PC Management System </span>

	<form class="form-inline" action="/action_page.php">
		<input class="form-control mr-sm-2" type="text" placeholder="Search">
		<button class="btn btn-success" type="submit">Search</button>

	</form>

	<c:if test="${isAdmin}">
		<span class="navbar-text" id="admin-name"> 관리자님 어서오세요. </span>
	</c:if>

	<c:if test="${!isAdmin}">
		<span class="navbar-text" id="admin-name"> 사용자님 어서오세요. </span>
	</c:if>

	<ul class="navbar-nav">
		<li class="nav-item"><c:if test="${isAdmin}">
				<a class="nav-link"
					href="<%=request.getContextPath()%>/member/main?isAdmin=${isAdmin}">메인
				</a>
			</c:if> <c:if test="${!isAdmin}">
				<a class="nav-link"
					href="<%=request.getContextPath()%>/member/main?isAdmin=${isAdmin}">메인
				</a>
			</c:if></li>

		<li class="nav-item"><c:if test="${isAdmin}">
				<a class="nav-link"
					href="<%=request.getContextPath()%>/admin/userList">회원리스트 </a>
			</c:if> <c:if test="${!isAdmin}">
				<a class="nav-link" href="<%=request.getContextPath()%>/user/myPage">마이
					페이지 </a>
			</c:if></li>

		<li class="nav-item"><a class="nav-link"
			href="<%=request.getContextPath()%>/member/notice">공지사항</a></li>

		<li class="nav-item"><c:if test="${isAdmin}">
				<a class="nav-link"
					href="<%=request.getContextPath()%>/admin/message">사용자 쪽지</a>
			</c:if> <c:if test="${!isAdmin}">
				<a class="nav-link"
					href="<%=request.getContextPath()%>/user/message">쪽지 남기기</a>
			</c:if></li>
	</ul>
</nav>