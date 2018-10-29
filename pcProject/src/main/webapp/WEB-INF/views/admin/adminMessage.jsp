<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>PC Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#messageTitle {
	font-weight: bold;
	margin-top: 15px;
	margin-left: 50px;
	margin-bottom: 20px;
}

#wrap {
	position: relative;
	margin-left: 50px;
	margin-right: 50px;
}

#messageUlWrap {
	float: left;
}

#messageUl {
	background-color: #eee;
	padding: 15px 10px;
	text-align: center;
	width: 250px;
	height: 250px;
	border: 1px solid #8e8e8e;
	margin-left: 40px;
	list-style: none;
	margin-bottom: 30px;
	border-radius: 10px;
}

#messageUl textarea {
	padding: 10px;
	margin-top: 10px;
	margin-bottom: 10px;
	height: 120px;
	border-radius: 5px;
	font-weight: bold;
}

#messageUl li {
	font-size: 17px;
	font-weight: bold;
}

#messageBtn {
	margin: 0px 10px;
	font-size: 15px;
	color: white;
	background-color: black;
	border: 1px solid black;
	text-decoration: none;
	padding: 5px;
	border-radius: 5px;
}

#messageBtn:hover {
	background-color: #8e8e8e;
	cursor: pointer;
}

#detailDiv {
	width: 450px;
	height: 550px;
	background-color: white;
	position: absolute;
	border: 1px solid black;
	right: 100px;
	top: 20px;
	border-radius: 10px;
}

#detailUl {
	list-style: none;
	padding: 20px 20px;
	text-align: center;
}

#detailUl h3 {
	font-weight: bold;
	margin-bottom: 20px;
}

#detailUl li {
	font-weight: bold;
}

#detailUl input[type=text] {
	margin-left: 5px;
	margin-bottom: 15px;
	width: 250px;
	height: 33px;
	border: none;
	padding: 6px 12px 6px 12px;
	background-color: #eee;
	font-weight: bold;
	border-radius: 7px;
}

#detailUl textarea {
	margin-top: 10px;
	height: 200px;
	font-size: 20px;
	padding: 15px;
	border-radius: 7px;
	font-weight: bold;
}

#detailFoot {
	margin-top: 5px;
	text-align: center;
}

#detailDel, #detailClose {
	margin: 5px 20px 0px 20px;
	color: white;
	border: none;
	background-color: black;
	text-decoration: none;
	border-radius: 7px;
}

#detailDel {
	padding: 10px;
}

#detailClose {
	width: 83px;
	height: 41.6px;
	font-size: 15px;
	padding: 11px;
}

#detailDel:hover, #detailClose:hover {
	background-color: #8e8e8e;
	cursor: pointer;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="container" id="main-container">
		<h1 id="messageTitle">메시지 리스트</h1>
		<c:if test="${list == null}">
	메세지가 없습니다.
</c:if>

		<c:if test="${list != null}">
			<div id="wrap">
				<c:forEach var="message" items="${list}" varStatus="status">
					<div id="messageUlWrap">
						<ul id="messageUl">
							<li>메시지 번호 : ${message.messageId}</li>
							<li>아이디 : ${message.userId}</li>
							<li><textarea readonly cols="20">${message.messageCon}</textarea></li>
							<a href="message?messageId=${message.messageId}" id="messageBtn">상세보기</a>
							<a href="delete?messageId=${message.messageId}" id="messageBtn">삭제하기</a>
						</ul>
					</div>
				</c:forEach>
			</div>
		</c:if>

		<!-- 상세보기가 나오는 창 -->
		<c:if test="${detail.messageId !=null}">
			<div id="detailDiv">
				<ul id="detailUl">
					<h3>메시지 상세보기</h3>
					<li>메시지 번호 : <input type="text" value="${detail.messageId}"
						readonly></li>
					<li>보낸 아이디 : <input type="text" value="${detail.userId}"
						readonly></li>
					<li>메시지 날짜 : <input type="text" value="${detail.messageDate}"
						readonly></li>
					<li>메시지 제목 : <input type="text" value="${detail.messageTitle}"
						readonly></li>
					<li><textarea readonly cols="28"> ${detail.messageCon}</textarea></li>
					<div id="detailFoot">
						<a href="delete?messageId=${detail.messageId}" id="detailDel">삭제하기</a>
						<input type="button" value="닫기" id="detailClose">
					</div>
				</ul>
			</div>
		</c:if>

	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script>
	$(document).ready(function() {
		$('#detailClose').click(function() {
			$('#detailDiv').hide();
		});
	});
</script>
</html>