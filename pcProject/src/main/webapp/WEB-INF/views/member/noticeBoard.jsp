<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>PC Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

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

#write {
	float: right;
	margin: 10px;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<a id="write" class="btn btn-secondary" href="/pc/admin/noticeWrite">글쓰기</a>
	${viewData.isEmpty()}
		<table class="table table-hover text-center">
			<thead>
				<tr>
					<th style="width: 80%">내용</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${viewData.isEmpty()}">
					<tr>
						<td>작성된 방명록 메시지가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>