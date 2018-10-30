<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>PC Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container">
	<h1>수정페이지입니다.</h1>
		<form class="text-center p-5" method="post">
			<input type="text" class="form-control" placeholder="제목" name="noticeTitle" value="${modifyView.noticeTitle}">
			<textarea class="form-control" id="exampleFormControlTextarea2" rows="3" placeholder="내용" name="noticeCon">${modifyView.noticeCon}</textarea>
			<button type="submit" class="btn btn-info btn-block">수정하기</button>
		</form>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>