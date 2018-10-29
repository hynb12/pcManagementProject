<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
</style>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>

<!--Navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

	<!-- 메인화면으로 이동 -->
	<c:if test="${isAdmin}">
		<a class="navbar-brand"
			href="<%=request.getContextPath()%>/member/main?isAdmin=${isAdmin}">PMS</a>
	</c:if>
	<c:if test="${!isAdmin}">
		<a class="navbar-brand"
			href="<%=request.getContextPath()%>/member/main?isAdmin=${isAdmin}">PMS</a>
	</c:if>

	<!-- Collapse button -->
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#basicExampleNav" aria-controls="basicExampleNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<!-- Collapsible content -->
	<div class="collapse navbar-collapse" id="basicExampleNav">
		<!-- Links -->
		<ul class="navbar-nav mr-auto">
			<c:if test="${isAdmin}">
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/admin/userList">회원목록</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/member/notice">공지사항</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/admin/message">쪽지함</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/member/logout">로그아웃</a></li>
			</c:if>
			<c:if test="${!isAdmin}">
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/user/myPage">내정보</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/member/notice">공지사항</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/user/message">쪽지전송</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/member/logout">로그아웃</a></li>
			</c:if>
		</ul>
		<!-- Links -->

		<form class="form-inline">
			<div class="md-form my-0">
				<input class="form-control mr-sm-2" type="text" placeholder="Search"
					aria-label="Search">
			</div>
		</form>
	</div>
	<!-- Collapsible content -->

</nav>
<!--/.Navbar-->