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
.row {
	margin-top: 50px;
	color: #666;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<h4 style="color: #1e1e1e;">${view.noticeTitle}</h4>
				<fmt:parseDate value="${view.noticeDate}" pattern="yyyy-MM-dd HH:mm"
					var="date" />
				<fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />
			</div>
			<div class="col-sm-9" style="height: 400px">
				<p></p>
				${view.noticeCon}
			</div>
		</div>
		<hr />
		<button type="button" class="btn btn-dark"
			onclick="location.href='/pc/member/notice'">삭제</button>
		<button type="button" class="btn btn-dark"
			onclick="location.href='/pc/member/notice'">수정</button>
		<button type="button" class="btn btn-dark"
			onclick="location.href='/pc/member/notice'">목록</button>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>