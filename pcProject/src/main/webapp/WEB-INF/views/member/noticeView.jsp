<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.row {
	margin-top: 50px;
	color: #666;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="row" >
			<div class="col-sm-3">
				<h4 style="color: #1e1e1e;">${view.noticeTitle}</h4>
				<fmt:parseDate value="${view.noticeDate}}" pattern="yyyy-MM-dd HH:mm" var="date"/>
				<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/>
			</div>
			<div class="col-sm-9"><p></p>
			${view.noticeCon}
			<hr>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>