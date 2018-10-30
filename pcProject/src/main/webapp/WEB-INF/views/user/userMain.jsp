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
	width: 180px;
	height: 220px;
	border-radius: 70px;
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

.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 15px;
	border: 1px solid #888;
	width: 200px;
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

.foodCnt {
	text-align: center;
	font-size: 16px;
	width: 20px;
	height: 20px;
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
				<div class="modal-content">
					<h3>
						충전하실 시간을 선택하세요.<span class="close">&times;</span>
					</h3>

					<!-- ajax serialize 사용을 위해  -->
					<form id="addTimeForm">
						<input type="hidden" id="comId" name="comId"> <select
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
				<div class="modal-content">
					<h3>
						주문내역<span class="close">&times;</span>
					</h3>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<!-- 컴퓨터 처리(정기)  -->
	<script>
		var setTime = 2;// 최초 설정 시간(기본 : 초), 
		
		// 카운트 함수 
		function msg_time(user) { // 1초씩 카운트
			
			console.log(setTime);
			m = Math.floor(setTime / 60) + "분 " + (setTime % 60) + "초"; // 남은 시간 계산
		         
		    var msg = "<font color='black'><b>" + m + "</b></font>";
		  	$(user).children().eq(2).html(msg); // div 영역에 보여줌 
		  	
		    setTime--; // 1초씩 감소  
		    
		    if (setTime < 0) {
		    	console.log("시간 종료");
		    	
		    	// 시간이 종료 되었으면..
		        m = (Math.floor(setTime / 60)+1)*(-1) + "분 " + ((setTime % 60)+1)*(-1) + "초";

		        var msg = " <font color='red'><b>" + m + "</b></font>";
		        $(user).children().eq(2).html(msg); // div 영역에 보여줌 
		    }
	    } // end msg_time()
		
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
				$(str).appendTo(this);
			});

			// 각 컴퓨터 선택 분기 처리
			$('#comTable td').on('click', function() {
				// 데이터베이스에 저장할 값들
				// 1. 클릭한 컴퓨터 아이디
				// 2. 로그인한 아이디

				var comId = $(this).children().eq(0).text(); // 선택한 컴퓨터의 위치 값 가져오기
				$('#comId').val(comId); //comId input 창에 값 저장
				$('#addTimeModal').show(); // modal창 보이기

			});
			
			// 충전하기 클릭 시 
			$('#addTimeBtn').on('click', function(){
				
				/* UserTimeContoller로 요청 */
				$.ajax({
					url: '<%=request.getContextPath()%>/user/addTime', 
					type: 'post',
					data: $('#addTimeForm').serialize(),
					
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
					} /* end success */
				}); /* end ajax */
				
				$('#addTimeModal').hide();
			});
			
			///////////////////////////////////////////////////////////////////////////////////////
			///////////////////////////////////////////////////////////////////////////////////////
			
			<!-- 음식 처리(민수)  -->
			
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
			
			// 음식 초기화
			$('#foodTable td').each(function(index) {
				var str = '<img src=../images/'+foodArr[index].imgSrc+'/>';
				str += '<div><b>' + foodArr[index].foodName + '</b></div>';
				str += '<div><b>' + foodArr[index].foodPrice + '</b></div>'; 
				str += '<div><button type="button" class="close" aria-label="Close" style="float:left"><span class="minus" aria-hidden="true">-</span></button>';
				str += '<input type="text" value="0" class="foodCnt">';
				str += '<button type="button" class="close" aria-label="Close"><span class="plus" aria-hidden="true">+</span></button> </div>'; 
				$(str).appendTo(this);
			
				$('img').css({
					'max-width' : 100, // 이미지 크기가 div에 넘을 경우 맞춰서 이미지 크기 자동 조정
					'width' : 100,
					'height' : 100
				});
				
				$(this).children().eq(3).css({
					'font-size': 20,
					'display': 'inline-block'
				}); // +, - 크기 조정
			});
			
			// 각 음식 + 카운트 처리
			$('.plus').on('click', function() {
				
				var n =  $('.plus').index(this);
			 	var num = $(".foodCnt:eq("+n+")").val();
				num = $(".foodCnt:eq("+n+")").val(num*1+1);
		
			});
			
			// 각 음식 - 카운트 처리
			$('.minus').on('click', function() {
				
			 	console.log($(this).next().val());
			 	 
				var n =  $('.minus').index(this);
			 	var num = $(".foodCnt:eq("+n+")").val();
				num = $(".foodCnt:eq("+n+")").val(num*1-1);
			});
			
			
			$('#foodTable td').on('click', function() {
				
			});
			
			// 메뉴 선택 후 주문하기 버튼 클릭 시 발생하는 이벤트
			$('#orderBtn').on('click', function () {
				$('#orderListModal').show();
			});
		
		}); // end window.onload() 
	</script>
</body>
</html>