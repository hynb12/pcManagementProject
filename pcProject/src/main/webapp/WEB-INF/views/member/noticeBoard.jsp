<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>PC Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
#write {
	float: right;
	margin: 10px;
}
/* 공지사항 게시판 제목 오버 */
.notice-title:hover {
	font-weight: bold;
	text-decoration: underline;
}
</style>

</head>
<body>
	<!--Navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark primary-color">

		<!-- Navbar brand -->
		<a class="navbar-brand" href="#">Navbar</a>

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
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Features</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Pricing</a></li>

				<!-- Dropdown -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="navbarDropdownMenuLink"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
					<div class="dropdown-menu dropdown-primary"
						aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a>
					</div></li>

			</ul>
			<!-- Links -->

			<form class="form-inline">
				<div class="md-form my-0">
					<input class="form-control mr-sm-2" type="text"
						placeholder="Search" aria-label="Search">
				</div>
			</form>
		</div>
		<!-- Collapsible content -->

	</nav>
	<!--/.Navbar-->
	<div class="container">
		<a id="write" class="btn btn-secondary" href="/pc/admin/noticeWrite">글쓰기</a>
		<table class="table">
			<thead>
				<tr class="text-center">
					<th style="width: 85%">제목</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${viewData.isEmpty()}">
					<tr>
						<td>작성된 방명록 메시지가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!viewData.isEmpty()}">
					<c:forEach var="list" items="${viewData.noticeList}">
						<tr>
							<td style="padding: 20px;"><a class="notice-title"
								href="notice/${list.noticeId}">${list.noticeTitle}</a></td>
							<td class="text-center"><fmt:parseDate
									value="${list.noticeDate}" pattern="yyyy-MM-dd HH:mm"
									var="date" /> <fmt:formatDate value="${date}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<c:forEach var="num" begin="1" end="${viewData.pageTotalCount}">
			<a href="notice?page=${num}">[${num}]</a>
		</c:forEach>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>