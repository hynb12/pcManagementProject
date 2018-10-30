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

.buttons {
	float: right;
	display: block;
}

.comments {
	padding-top: 40px;
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
		<div class="buttons">
			<button type="button" class="btn btn-dark" data-toggle="modal"
				data-target="#modalLoginForm" onclick="">삭제</button>
			<button type="button" class="btn btn-dark"
				onclick="location.href='/pc/admin/notice/modify/${view.noticeId}'">수정</button>
			<button type="button" class="btn btn-dark"
				onclick="location.href='/pc/member/notice'">목록</button>
		</div>

		<!--Section: Comments-->
		<section class="comments my-5">

			<!-- Card header -->
			<div class="card-header font-weight-bold">0 comments</div>

			<div class="media d-block d-md-flex mt-5">
				<img
					class="card-img-64 rounded-circle z-depth-1 d-flex mx-auto mb-3"
					src="https://mdbootstrap.com/img/Photos/Avatars/img (21).jpg"
					alt="Generic placeholder image">
				<div class="media-body text-center text-md-left ml-md-3 ml-0">

					댓글 내용입니다.
					<hr />

				</div>
			</div>
		</section>
		<!--Section: Comments-->
		<!-- Quick Reply -->
		<div class="md-form mt-4">
			<label for="quickReplyFormComment">내용 입력</label>
			<textarea class="form-control md-textarea" id="quickReplyFormComment"
				rows="3"></textarea>

			<div class="text-center my-4">
				<button class="btn btn-default btn-sm btn-rounded" type="submit">Post</button>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<!-- 삭제확인 모달 -->
<div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h4 class="modal-title w-100 font-weight-bold">
					정말 <span style="color: red">삭제</span>하시나요?
				</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-footer d-flex justify-content-center">
				<a class="btn btn-danger"
					href="/pc/admin/notice/delete/${view.noticeId}">삭제</a> <a
					class="btn btn-dark" data-dismiss="modal">취소</a>
			</div>
		</div>
	</div>
</div>
<!-- 삭제확인 모달 끝-->
</html>