<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<span class="navbar-text"> PC Management System </span>

	<form class="form-inline" action="/action_page.php">
		<input class="form-control mr-sm-2" type="text" placeholder="Search">
		<button class="btn btn-success" type="submit">Search</button>

	</form>

	<span class="navbar-text" id="admin-name"> 관리자님 어서오세요. </span>

	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link"
			href="<%=request.getContextPath()%>/admin/adminMain">메인 </a></li>
		<li class="nav-item"><a class="nav-link"
			href="<%=request.getContextPath()%>/admin/userList">회원정보 </a></li>
		<li class="nav-item"><a class="nav-link"
			href="<%=request.getContextPath()%>/admin/board">게시판</a></li>
		<li class="nav-item"><a class="nav-link"
			href="<%=request.getContextPath()%>/admin/message">쪽지</a></li>
	</ul>
</nav>