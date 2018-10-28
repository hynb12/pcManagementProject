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

.main-container {
	height: 100%;
	margin-top: 1%;
}

.comDiv {
	float: left;
	width: 50%;
	height: 100%;
	padding: 20px;
	overflow-y: scroll;
	text-align: center;
}

.foodDiv {
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

.mainModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 15px;
	border: 1px solid #888;
	width: 60%;
}


/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	font-size: 28px;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="main-container">
		<div class="comDiv">
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
			<div id="addTimeModal" class="mainModal">
				<div class="modal-content">
					<h3>
						충전하실 시간을 선택하세요.<span class="close">&times;</span>
					</h3>
					<!-- UserTimeController 요청 URL -->
					<form action="<%=request.getContextPath()%>/user/addTime">
						<input type="hidden" id="comId" name="comId"> <input
							type="hidden" name="userId" value="mkms1104"> <select
							name="addTime" id="selectAddTime">
							<option value="0">select Time</option>
						</select> <input type="submit" value="충전하기">
					</form>
				</div>
			</div>
		</div>
		<!-- end comDiv  -->

		<div class="foodDiv">
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
			
			<button onclick="viewOrderList()">주문하기</button>
			
			<!-- 주문 리스트 modal -->
			<div id="orderListModal" class="mainModal">
				<div class="modal-content">
					<h3>
						주문내역<span class="close">&times;</span>
					</h3>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<script src="https://code.jquery.com/jquery-1.10.0.js"></script>

	<!-- 컴퓨터 처리(정기)  -->
	<script>
		$(document).ready(function() {
			
			// 시간 충전 modal 창 닫기 버튼 클릭
			$('.close').on('click', function() {
				$('#addTimeModal').hide();
			});
			
			// modal 창 외 윈도우 클릭
			$(window).on('click', function() {
				//jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
				if (event.target == $('#addTimeModal').get(0)) {
    				$('#addTimeModal').hide();
    			}
			});
			
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
		$(document).ready(function() {
			
			// 음식 정보 담을 생성자
			function FoodInfo(imgSrc, foodName, foodPrice) {
				this.imgSrc = imgSrc;
				this.foodName = foodName;
				this.foodPrice = foodPrice;
			}
			
			// 생성자로 각 음식 정보 생성 후 배열에 저장
			var foodArr = [new FoodInfo('food_1.png', '나쵸', 5000),
							new FoodInfo('food_2.png', '감자튀김', 3000),
							new FoodInfo('food_3.png', '햄버거', 3000),
							new FoodInfo('food_4.png', '제육볶음', 6000),
							new FoodInfo('food_5.png', '새우볶음밥', 6000),
							new FoodInfo('food_6.png', '소고기볶음밥', 7000),
							new FoodInfo('food_7.png', '오렌지쥬스', 1000),
							new FoodInfo('food_8.png', '콜라', 1000),
							new FoodInfo('food_9.png', '사이다', 1000),
			];
			
			// 테이블에 각 음식 표시
			$('#foodTable td').each(function(index) {
				var str = '<img src=../images/'+foodArr[index].imgSrc+'/>';
				str += '<div><b>' + foodArr[index].foodName + '</b></div>';
				str += '<div><b>' + foodArr[index].foodPrice + '</b></div>'; 
				$(str).appendTo(this);

				$('img').css({
					'max-width' : 100, // 이미지 크기가 div에 넘을 경우 맞춰서 이미지 크기 자동 조정
					'width' : 100,
					'height' : 100
				});
			});
			
			// 메뉴 선택 후 주문하기 버튼 클릭 시 발생하는 이벤트
			function viewOrderList() {
				$('#orderListModal').show();
			}
	
		});
	</script>
</body>
</html>