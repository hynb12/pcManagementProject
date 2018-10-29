<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<style>
html, body {
	height: 90%;
}

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

.post {
	padding: 0 1.5%
}

.comment-form .form-control {
	border: 0px;
	background: #eee;
	min-height: 50px;
}

.comment-form>.row {
	margin: 0 -1.5%;
}

.comment-form [class*="col-"] {
	padding: 0 1.5%
}

.form-group {
	margin-bottom: 30px;
}

.messageTitle {
	margin-bottom: 40px;
}

@media ( min-width :992px) {
	.post {
		width: 50%;
		max-width: 500px;
		margin: 0 auto;
	}
	.comment-form label {
		position: absolute;
		width: 200px;
	}
	.comment-form .name {
		top: -20px;
	}
	.comment-form .email {
		top: -20px;
	}
	.comment-form .message {
		top: -20px;
	}
}

@media ( min-width :1200px) {
	.post {
		max-width: 525px;
	}
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>


	<div class="post">
		<div class="contact">
			<div class="messageTitle">
				<h2>쪽지보내기</h2>
			</div>
			<form class="comment-form" method="post">
				<div class="row">
					<div class="col-md-12 form-group">
						<label class="name">보내는 사람</label> <input type="text"
							class="form-control" placeholder="user Id" name="userId" required />
					</div>
					<div class="col-md-12 form-group">
						<label class="email">메시지 제목</label> <input type="text"
							class="form-control" placeholder="message Title"
							name="messageTitle" required />
					</div>
					<div class="clearfix"></div>
					<div class="col-md-12 form-group">
						<label class="message">메시지 내용</label>
						<textarea class="form-control" cols="47" rows="7"
							placeholder="Message" name="messageCon" required></textarea>
					</div>
					<div class="col-md-12 form-group">
						<input type="submit" class="btn btn-block btn-lg btn-success"
							value="쪽지 보내기">
					</div>

				</div>
			</form>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>