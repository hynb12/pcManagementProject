<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>adminMain</title>
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
	height: 100%;
	padding: 20px;
	overflow-y: scroll;
	text-align: center;
}

#footer {
	position: absolute;
	left: 0px;
	bottom: 0px;
	width: 100%;
}

#comTable {
	margin: 0 auto;
	border-spacing: 20px;
	border-collapse: separate;
}

#comTable td {
	background: gray;
	width: 180px;
	height: 180px;
	padding-left: 10px;
	font-size: 20px;
	color: white;
	text-align: left;
	border-radius: 10px;
}

#comTable td {
	opacity: 0.5;
}

#foodTable {
	margin: 0 auto;
	border-spacing: 20px;
	border-collapse: separate;
}

#foodTable td {
	width: 180px;
	height: 180px;
	border-radius: 90px;
	border: 2px solid gray;
}

.comNum {
	color: black;
	font-weight: bold;
}

#close {
	color: red;
}

#addTimeModal {
	position: absolute;
	top: 300px;
	left: 200px;
	background: red;
	width: 400px;
	height: 200px;
	display: none;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div id="main-container">
		<div id="comDiv">
			<h3>◆ 사용하실 컴퓨터를 선택하세요. ◆</h3>
			<table id="comTable">
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>

			</table>

			<!-- 시간 추가 modal -->
			<div id="addTimeModal">
				<!-- UserTimeController 요청 URL -->
				<h3>충전하실 시간을 선택하세요.</h3>
				<form action="<%=request.getContextPath()%>/user/addTime">
					<input type="hidden" id="comId" name="comId"> 
					<input type="hidden" name="userId" value="mkms1104">
					<select name="addTime" id="selectAddTime">
  						<option value="0">select Time</option>
					</select>
					<input type="submit" value="충전하기">
				</form>
			</div>
		</div>
		<!-- end comDiv  -->

		<div id="foodDiv">
			<h3>◆ 음식 리스트 ◆</h3>
			<table id="foodTable">
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>

			</table>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<script src="https://code.jquery.com/jquery-1.10.0.js"></script>

	<!-- 컴퓨터 처리(정기)  -->
	<script>
		$(document).ready(function() {
			
			// 시간 select box 초기화 
			for (var i = 1; i <= 12; i++) {
                var option = '<option value='+ i + '>' + i + ' 시간</option>';
                $('#selectAddTime').append(option);
            }
			
			// 각 자리 초기화
			$('#comTable td').each(function(index) {
				var str = '<div><b>' + (index + 1) + '번</b></div>'; // comId (1~9)
				str += '<div></div>'; // userId
				str += '<div></div>'; // time
				$(str).appendTo(this);
			});

			// 선택된 자리에 정보 표시 
			$('#comTable td').each(function(index) {
				if ((index + 1) == '${uTime.comId}') {
					$(this).css('opacity', 1); // 선택된 컴퓨터의 투명도 설정
					$(this).children().eq(1).text('${uTime.userId}'); // 선택된 컴퓨터의 첫 번째 줄에 아이디 표시
					$(this).children().eq(2).text('${uTime.userTime}'); // 두 번째 줄에 남은 시간 표시
					$(this).children().eq(2).css('color', 'black'); // 시간 글씨색 변경
				}
			});

			// 각 컴퓨터 선택 분기 처리
			$('#comTable td').on('click', function() {
				// 데이터베이스에 저장할 값들
				// 1. 클릭한 컴퓨터 아이디
				// 2. 로그인한 아이디

				var comId = $(this).children().eq(0).text(); // 선택한 컴퓨터의 위치 값 가져오기
				$('#comId').val(parseInt(comId)); //comId input 창에 값 저장 (n번의 번 글자 지우고 숫자만 저장)
				$('#addTimeModal').show(); // modal창 보이기

			});
		});
	</script>

	<!-- 음식 처리(민수)  -->
	<script>
		var foodImgArr = new Array(9); // 음식 이미지 정보를 담을 배열
		var foodNameArr = ['나쵸', '감자튀김', '햄버거', '제육볶음', '새우볶음밥', '소고기볶음밥', '오렌지쥬스', '콜라', '사이다'];
		
		// 배열에 음식 이미지 이름 초기화
		for(var i=0; i<foodImgArr.length; i++){
			foodImgArr[i] = 'food_'+ (i+1) + '.png';
		}
		
		// 테이블에 각 음식 표시
		$('#foodTable td').each(function(index) {
			var str = '<img src=../images/'+foodImgArr[index]+'/>';
			str+= '<div><b>'+ foodNameArr[index] +'</b></div>'
			$(str).appendTo(this);
			
			$('img').css({
				'max-width': 100, // 이미지 크기가 div에 넘을 경우 맞춰서 이미지 크기 자동 조정
				'width' : 100,
				'height' : 100
			}); 
		});
	</script>
</body>
</html>