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
	/* 	font-weight: bold; */
	text-decoration: underline;
}

.table {
	table-layout: fixed;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<a id="write" class="btn btn-outline-elegant waves-effect"
			href="/pc/admin/noticeWrite">글쓰기</a>
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

		<!--Pagination -->
		<nav class="d-flex justify-content-center mt-5">
			<ul class="pagination pagination-circle pg-teal mb-0">

				<!--First-->
				<li class="page-item disabled"><a class="page-link">First</a></li>

				<!--Arrow left-->
				<li class="page-item disabled"><a class="page-link"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						<span class="sr-only">Previous</span>
				</a></li>

				<!--Numbers-->
				<li class="page-item active"><a class="page-link">1</a></li>
				<li class="page-item"><a class="page-link">2</a></li>
				<li class="page-item"><a class="page-link">3</a></li>
				<li class="page-item"><a class="page-link">4</a></li>
				<li class="page-item"><a class="page-link">5</a></li>

				<!--Arrow right-->
				<li class="page-item"><a class="page-link" aria-label="Next">
						<span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
				</a></li>

				<!--Last-->
				<li class="page-item"><a class="page-link">Last</a></li>

			</ul>
		</nav>
		<!--Pagination -->
		<div style="text-align: center;">
			<c:forEach var="num" begin="1" end="${viewData.pageTotalCount}">
				<a href="notice?page=${num}">[${num}]</a>
			</c:forEach>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>