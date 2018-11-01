<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>PC Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
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
	opacity: 0.5;
}

#foodTable {
	margin: 0 auto;
	text-align: center;
	width: 450px;
	margin-top: 25px;
}

#foodTable td {
	padding: 10px;

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
	border-right-width: 
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="main-container">
		<div class="comDiv">
			<h3>◆ 현재 사용 중인 컴퓨터: 5대 ◆</h3>
			<table id="comTable">
				<tr>
					<td></td>
					<td></td>
					<td></td>

				</tr>

				<tr>
					<td>
						<!-- <div class="comNum">4</div>
						<div class="userId">zzan123</div>
						<div class="reMaining-time">00:35</div>
						<div class="comManagement">
							<a href="">시간 추가</a><br> <a href="" id="close">강제 종료</a>
						</div> -->
					</td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<td>
						<!-- <div class="comNum">7</div>
						<div class="userId">bba557</div>
						<div class="reMaining-time">02:19</div>
						<div class="comManagement">
							<a href="">시간 추가</a><br> <a href="" id="close">강제 종료</a>
						</div> -->
					</td>
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
		<div class="foodDiv">
			<h3>◆ 주문 대기 중인 음식 ◆</h3>
			<table border="1" id="foodTable">
				<!-- 리스트 동적 추가 -->
			</table>

			<!-- 시간 추가 modal -->
			<div id="addTimeModal" class="mainModal">
				<div class="modal-content">
					<h3>
						충전하실 시간을 선택하세요.<span class="close">&times;</span>
					</h3>

					<!-- ajax serialize 사용을 위해  -->
					<form id="addTimeForm">
						<input type="hidden" id="inputComId" name="comId">
					</form>

					<button id="addTimeBtn">충전하기</button>
				</div>
			</div>

		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
	<script>
	
		$(document).ready(function() {
			
			/* 시간처리(정기) */
			
			// 시간 충전, 주문내역  modal 창 닫기 버튼 클릭
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

			// 각 자리 초기화
			$('#comTable td').each(function(index) {
				var str = '<div><b>' + (index + 1) + '</b></div>'; // comId (1~12 )
				str += '<div></div>'; // userId
				str += '<div></div>'; // time
				$(str).appendTo(this);

				$(this).attr('comId', index + 1);
			});

			// 각 컴퓨터 선택 분기 처리
			$('#comTable td').on('click', function() {
				var comId = $(this).attr('comId'); // 선택한 컴퓨터의 위치 값 가져오기

				$('#inputComId').val(comId); //comId input 창에 값 저장
				$('#addTimeModal').show(); // modal창 보이기

			});
			
			/* UserTimeContoller로 요청 */
			$.ajax({
				url: '<%=request.getContextPath()%>/member/maintimetable', 
				type: 'post',
				data: $('#addTimeForm').serialize(), // 선택한 자리 번호와 충전한 시간 전송
				
				success:function(data){
					console.log(data);
					
					// 선택된 자리에 정보 표시 
					$('#comTable td').each(function(index) {						
						console.log(index)
						
						if ((index + 1) == data[index].comId) {
							$(this).css('opacity', 1); // 선택된 컴퓨터의 투명도 설정
							
							$(this).children().eq(1).text(data[index].userId); // 선택된 컴퓨터의 첫 번째 줄에 아이디 표시
							$(this).children().eq(2).text(Math.floor(data[index].userTime/60)+'시간 ' +(data[index].userTime%60)+'분'); //두번째 줄에 남은시간 표시
							$(this).children().eq(2).css({
								'color': 'black',
								'font-weight' : 'bold'
							}); // 시간 글씨색 변경
						}
					});
				} /* end success */
			}); /* end ajax */
			
			////////////////////////////////////////////////////////////////////
			////////////////////////////////////////////////////////////////////
			
			/* 음식처리(민수) */
			
			$.ajax({ // 주문 리스트 보여주기
				url: '<%=request.getContextPath()%>/admin/order', 
				type: 'post',
				contentType: 'application/json',
				
				success:function(data){
					console.log("데이타" + data);
					
					if(data == ''){
						$('.foodDiv').append('<h2 style="color:red">※고객이 주문하신 음식이 없습니다.</h2>');
						return;
					}
					
					var str='';
					var prevComId = '';
					for(var i=0; i<data.length; i++){
						
						if(prevComId != data[i].comId){
							str += '<tr><td colspan="4" style="background : lightgray">주문번호 '+ data[i].orderId +'</td></tr>'
							str += '<tr><td colspan="3">컴퓨터 번호 '+ data[i].comId +'</td><td colspan="1" style="background:#F78181" id='+ data[i].orderId +'><button class="orderProcess"
							>처리하기</button></td></tr>';
							str += '<tr><td>음식 번호</td><td>음식 이름</td><td>총 가격</td><td>수량</td></tr>';
						}
						str += '<tr><td style="margin-bottom:20">'+ data[i].foodId +'</td><td>'+ data[i].foodName +'</td><td>'+ data[i].totalPrice +'</td><td>'+ data[i].foodCnt +'</td></tr>';
						
						prevComId = data[i].comId; 
					}
					
					$('#foodTable').append(str);
				} /* end success */
			}); /* end ajax */
			
			
			// 처리하기 클릭 시
			$('.orderProcess').on('click', function () {
				console.log('클릭이다');
				alert('클릭이다');
				
				$.ajax({ // 주문 처리하기 
					url: '<%=request.getContextPath()%>/admin/orderProcess',
					type: 'post',
					data: { orderid: $(this).attr('id') }, // 주문번호 
					
					success:function(data){
						console.log(data);
						
					} /* end success */
				}); /* end ajax */
				
			});
		});
	</script>
</body>
</html>