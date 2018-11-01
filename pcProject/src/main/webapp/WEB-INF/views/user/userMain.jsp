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
	width: 200px;
	height: 200px;
	border-radius: 100px;
	border: 2px solid gray;
	text-align: center;
}

.comNum {
	color: black;
	font-weight: bold;
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

.modal-contents {
	background-color: #fefefe;
	margin: auto;
	padding: 15px;
	border: 1px solid #888;
	width: 50%;
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

.orderCnt {
	text-align: center;
	font-size: 16px;
	width: 20px;
	height: 20px;
}

.orderTable {
	margin: 0 auto;
	text-align: center;
}

.orderTable td {
	width: 100px;
}

#totalPrice {
	margin-top: 20px;
	margin-bottom: 20px;
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

				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>

			</table>

			<!-- 시간 추가 modal -->
			<div id="addTimeModal" class="mainModal">
				<div class="modal-contents">
					<h3>
						충전하실 시간을 선택하세요.<span class="close">&times;</span>
					</h3>

					<!-- ajax serialize 사용을 위해  -->
					<form id="addTimeForm">
						<input type="hidden" id="inputComId" name="comId"> <select
							name="addTime" id="selectAddTime">
							<option value="0">select Time</option>
						</select>
					</form>

					<button id="addTimeBtn">충전하기</button>
				</div>
			</div>
		</div>
		<!-- end comDiv  -->

		<div class="foodDiv">
			<h3>◆ 음식 선택 후 주문하기 눌러주세요. ◆</h3>
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

			<button id="orderBtn">주문하기</button>

			<!-- 주문 리스트 modal -->
			<div id="orderListModal" class="mainModal">
				<div class="modal-contents">
					<h3>
						주문내역<span class="close">&times;</span>
					</h3>
					<table border="1" id="orderListTable" class="orderTable">
						<!-- jquery로 리스트 동적 생성 -->
					</table>

					<div id="totalPrice"></div>
					<div id="orderInfo"></div>
					<button id="orderConfirmBtn">주문 확정</button>

				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<!-- 컴퓨터 처리(정기)  -->
	<script>
		// 로드 시 최초 1회만 실행
		$(document).ready(function() {
			
			// 시간 충전, 주문내역  modal 창 닫기 버튼 클릭
			$('.close').on('click', function() {
				$('#addTimeModal').hide();
				$('#orderListModal').hide();
			});
			
			// modal 창 외 윈도우 클릭
			$(window).on('click', function() {
				//jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
				if (event.target == $('#addTimeModal').get(0)) {
    				$('#addTimeModal').hide();
    			}
				
				if (event.target == $('#orderListModal').get(0)) {
    				$('#orderListModal').hide();
    			}
			});
			
			// 시간 select box 초기화 
			for (var i = 1; i <= 12; i++) {
				var option = '<option value='+ i + '>' + i + ' 시간</option>';
				$('#selectAddTime').append(option);
			}

			// 각 자리 초기화
			$('#comTable td').each(function(index) {
				var str = '<div><b>' + (index + 1) + '</b></div>'; // comId (1~9)
				str += '<div></div>'; // userId
				str += '<div></div>'; // time
				str += '<div></div>'; // btn
				$(str).appendTo(this);
				
				$(this).attr('comId', index+1);
			});
			function test(){
				// 각 테이블 정보 입력
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
								// 남은시간이 없으면 안나옴
								if(data[index].userTime != 0 && data[index].userTime != null){
									$(this).children().eq(1).text(data[index].userId); // 선택된 컴퓨터의 첫 번째 줄에 아이디 표시
									$(this).children().eq(2).text(Math.floor(data[index].userTime/60)+'시간 ' +(data[index].userTime%60)+'분'); //두번째 줄에 남은 시간 표시
									$(this).children().eq(3).html("<input style='z-index: 100' type='button' id='logout_btn' value='사용 종료'></input>"); // 사용종료
									$(this).children().eq(1).css({
										'color': 'black',
										'font-weight' : 'bold'
									}); // 시간 글씨색 변경
									$(this).children().eq(2).css({
										'color': 'black',
										'font-weight' : 'bold'
									}); // 시간 글씨색 변경
									
									
									//로그인한 아이디 표시
									var userVO = "${sessionScope.userVO.userId}";
									console.log(userVO);									
									if(data[index].userId==userVO){
										$(this).css('opacity', 1); // 선택된 컴퓨터의 투명도 설정
										isUse[index] = true; // 자리 상태
									}
											
								}
							}
						});
					} /* end success */
				}); /* end ajax */
			}
			
			test();
			
			// 각 컴퓨터 선택 분기 처리
			var isUse = new Array(12).fill(false); 
			
			$('#comTable td').on('click', function(e) {
				
				var comId = $(this).attr('comId'); // 선택한 컴퓨터의 위치 값 가져오기
				
				if(isUse[comId] == false){
					isUse[comId] = true;
				}
				
				else{
					isUse[comId] = false;
				}
				
				$('#inputComId').val(comId); //comId input 창에 값 저장
				$('#addTimeModal').show(); // modal창 보이기

			});
			
			// 충전하기 클릭 시 
			$('#addTimeBtn').on('click', function(){
				
				if($('#selectAddTime option:selected').val() == 0){
					alert('충전하실 시간을 선택하세요.');
					return;
				}
				
				/* UserTimeContoller로 요청 */
				$.ajax({
					url: '<%=request.getContextPath()%>/user/addTime', 
					type: 'post',
					data: $('#addTimeForm').serialize(), // 선택한 자리 번호와 충전한 시간 전송
					
					success:function(data){
						console.log(data);
						
						// 선택된 자리에 정보 표시 
						$('#comTable td').each(function(index) {
							if ((index + 1) == data.comId) {
								$(this).css('opacity', 1); // 선택된 컴퓨터의 투명도 설정
								
								$(this).children().eq(1).text(data.userId); // 선택된 컴퓨터의 첫 번째 줄에 아이디 표시
								$(this).children().eq(2).text(Math.floor(data.userTime/60)+'시간 ' +(data.userTime%60)+'분'); // 두 번째 줄에 남은 시간 표시
								$(this).children().eq(2).css({
									'color': 'black',
									'font-weight' : 'bold'
								}); // 시간 글씨색 변경
							}
						});
						test();} /* end success */
				
				}); /* end ajax */
				
				$('#addTimeModal').hide();				
				
			});			

			$('#logout_Btn').on('click', function(e){
				alert("?????")
				<%-- if($('#selectAddTime option:selected').val() == 0){
					alert('충전하실 시간을 선택하세요.');
					return;
				}
				
				/* UserTimeContoller로 요청 */
				$.ajax({
					url: '<%=request.getContextPath()%>/user/addTime', 
					type: 'post',
					data: $('#addTimeForm').serialize(), // 선택한 자리 번호와 충전한 시간 전송
					
					success:function(data){
						console.log(data);
						
						// 선택된 자리에 정보 표시 
						$('#comTable td').each(function(index) {
							if ((index + 1) == data.comId) {
								$(this).css('opacity', 1); // 선택된 컴퓨터의 투명도 설정
								
								$(this).children().eq(1).text(data.userId); // 선택된 컴퓨터의 첫 번째 줄에 아이디 표시
								$(this).children().eq(2).text(Math.floor(data.userTime/60)+'시간 ' +(data.userTime%60)+'분'); // 두 번째 줄에 남은 시간 표시
								$(this).children().eq(2).css({
									'color': 'black',
									'font-weight' : 'bold'
								}); // 시간 글씨색 변경
							}
						});
						test();} /* end success */
				
				}); /* end ajax */
				
				$('#addTimeModal').hide();	 --%>			
				
			});	
		

				
			
			///////////////////////////////////////////////////////////////////////////////////////
			///////////////////////////////////////////////////////////////////////////////////////
			
			<!-- 음식 처리(민수)  -->
			
			// 음식 정보 초기화를 위해 사용할 생성자
			function FoodInfo(imgSrc, foodName, foodPrice) {
				this.imgSrc = imgSrc;
				this.foodName = foodName;
				this.foodPrice = foodPrice;
			}
			
			// 주문한 음식과 유저 정보 담을 생성자
			function OrderList(userComId, userId, orderFoodId, foodName, foodPrice, orderCnt) {
				this.userComId = userComId; // 사용자 컴퓨터 번호
				this.userId = userId; // 사용자 아이디
				this.orderFoodId = orderFoodId; // 음식 번호
				this.foodName = foodName; // 음식 이름
				this.foodPrice = foodPrice; // 수량 만큼 가격 계산
				this.orderCnt = orderCnt; // 이름 갯수
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
			
			// 음식 초기화
			$('#foodTable td').each(function(index) {
				var str = '<img src=../images/'+foodArr[index].imgSrc+'/>';
				str += '<div><b>' + foodArr[index].foodName + '</b></div>';
				str += '<div><b>' + foodArr[index].foodPrice + '</b></div>'; 
				str += '<div><button type="button" class="close" aria-label="Close" style="float:left"><span class="minus" aria-hidden="true">-</span></button>';
				str += '<input type="text" value="0" class="orderCnt">';
				str += '<button type="button" class="close" aria-label="Close"><span class="plus" aria-hidden="true">+</span></button> </div>'; 
				$(str).appendTo(this);
			
				$('img').css({
					'max-width' : 100, // 이미지 크기가 div에 넘을 경우 맞춰서 이미지 크기 자동 조정
					'width' : 100,
					'height' : 100
				});
				
				$(this).attr('foodId', index+1); // 음식 아이디 지정
				
				$(this).children().eq(3).css({
					'display': 'inline-block'
				}); // +, - 크기 조정
			});
			
			// 각 음식 + 카운트 처리
			$('.plus').on('click', function(e) {
				e.stopPropagation(); // 이벤트 전파 방지 (음식이 선택되면 안됨)
				
				var n =  $('.plus').index(this);
			 	var num = $('.orderCnt:eq('+n+')').val();
				num = $('.orderCnt:eq('+n+')').val(num*1+1);
		
			});
			
			// 각 음식 - 카운트 처리
			$('.minus').on('click', function(e) {
				e.stopPropagation(); // 이벤트 전파 방지 (음식이 선택되면 안됨)
				
				var n =  $('.minus').index(this);
			 	var num = $('.orderCnt:eq('+n+')').val();
			 	
			 	if(num-1 < 0 ){ // 수량 0이하 안되게 처리
			 		return;
			 	}
				num = $('.orderCnt:eq('+n+')').val(num*1-1);
			});
			
			var isChoice = new Array(9).fill(false); 
			
			// 각 음식 선택 시 처리
			$('#foodTable td').on('click', function() {
				var idx = $(this).attr('foodId')-1;
				
				var orderCnt = $(this).children().eq(3).children().eq(1).val(); // 선택된 음식의 수량 가져오기
				
				if(isChoice[idx] == false){ // 음식 선택 안된 상태
					if(orderCnt != 0){ // 선택된 음식 갯수가 0이 아닐 때만 선택 가능
						$(this).css('opacity', '0.5');
						isChoice[idx] = true;
					}
				}
				else {
					$(this).css('opacity', '');
					isChoice[idx] = false;
				}
			});
			
			var orderList = []; // 선택된 메뉴 객체를 담을 배열
			
			// 메뉴 선택 후 주문하기 버튼 클릭 시 발생하는 이벤트	
			$('#orderBtn').on('click', function () {
				var isUseCom = false;
				
				for(var i=0; i < isUse.length; i++){
					if(isUse[i]){ // 모든 좌석 검사 (한대라도 사용 중이면 isUseCom true)
						isUseCom = true;
					}
				}
				
				if(!isUseCom){
					alert('사용하실 자리를 먼저 선택하세요.');
					return;
				}
				
				var isUserChoice = false;
				
				for(var i=0; i < isChoice.length; i++){
					if(isChoice[i]){  
						isUserChoice = true;
					}
				}
				
				if(!isUserChoice){
					alert('메뉴를 선택하세요.');
					return;
				}
			
				// 모든 조건 검사 완료 후 주문 가능 ↓
				
				var userComId =''; // 사용자 컴퓨터 아이디 
				var userId=''; // 사용자 아이디
				
				$('#comTable td').each(function(index) {
					var id = $(this).children().eq(1).text(); // 전체 자리의 사용자 아이디 가져오기
					if(id == '${userVO.userId}'){ // 세션 아이디와 일치하는 사용자 찾기
						
						userComId = index+1; // 사용자 컴퓨터 아이디
						userId = id; // 사용자 아이디
					}
				});
				
				orderList = []; // 주문하기 누를 때 마다 매번 초기화 시켜줘야 함(리스트보고 주문안할 수도 있음)
				$('#orderListTable').text(''); // 리스트의 내용도 초기화 (안그러면 계속 이어 붙여서 보여줌)
				
				$('#foodTable td').each(function(index) {
					
					if(isChoice[index]){
						var orderCnt = $(this).children().eq(3).children().eq(1).val(); // 선택된 음식의 수량 가져오기
						var foodName = foodArr[index].foodName; // 선택된 음식의 이름 가져오기
						var foodPrice = foodArr[index].foodPrice; // 선택된 음식의 가격 가져오기
						var orderFoodId = index + 1; // 음식 아이디
						
						// 리스트에 저장
						orderList.push(new OrderList(userComId, userId, orderFoodId, foodName, foodPrice, parseInt(orderCnt)));
					}
				});
				
				console.log(orderList);
					
				var str = '<tr><th>음식</th><th>가격</th><th>수량</th></tr>';
				var totalPrice = 0;
				
				for(var i=0; i < orderList.length; i++){
					str += '<tr><td>'+ orderList[i].foodName +'</td>';
					str += '<td>'+ orderList[i].foodPrice +'</td>';
					str += '<td>'+ orderList[i].orderCnt +'</td></tr>';
					totalPrice +=  (orderList[i].foodPrice * orderList[i].orderCnt); 
				}
				
				$('#orderListTable').append(str);
				$('#totalPrice').text('주문하신 음식의 총 가격은 ' + totalPrice + '원 입니다.');
				$('#orderListModal').show();
			});
			
			// 주문 확정 시 
			$('#orderConfirmBtn').on('click', function () {
				
				$.ajax({
					url: '<%=request.getContextPath()%>/user/order', 
					type: 'post',
					contentType: 'application/json', /* 요청 타입 지정(안하면 405 오류) */
					data: JSON.stringify(orderList),
					
					success:function(data){
						console.log(data);
						
					} /* end success */
				}); /* end ajax */
				
				// 초기화
				$('#foodTable td').each(function(index) {
					$(this).css('opacity', ''); // 투명도 defalut
					$(this).children().eq(3).children().eq(1).val('0'); // 모든 음식 수량 0
				});
				
				// 초기화
				for(var i=0; i<isChoice.length; i++){
					isChoice[i] = false; // 선택된 음식 상태 모두 false 
				}
				
				$('#orderListModal').hide();
								
			});
		}); // end window.onload() 
	</script>
</body>
</html>