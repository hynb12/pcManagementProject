<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="styleSheet" href="../css/css_searchForm.css">

<style>
.btn {
	color: white;
	background-color: green;
}
</style>
</head>
<body>



	<div class="container">
		<div class="row">
			<h2 style="text-align: center">Id or Password Search</h2>
			<div class="vl">
				<span class="vl-innertext">or</span>
			</div>

			<div class="col">
				<form id="idSeachForm" method="post">
					<input type="hidden" name="search" value="id" /> <input
						type="text" name="userPhone" placeholder="UserPhone" required>
					<input type="text" name="userName" placeholder="UserName" required>
					<input id="searchid" type="button" class="btn" value="Search Id">
				</form>
			</div>

			<div class="col">
				<div class="hide-md-lg">
					<p>Or sign in manually:</p>
				</div>
				<form id="pwSearchForm" method="post">
					<input type="hidden" name="search" value="pw" /> <input
						type="text" name="userId" placeholder="Id" required> <input
						type="text" name="userName" placeholder="UserName" required>
					<input id="searchpw" type="button" class="btn" value="Search Password">
				</form>
			</div>

			<div class="cancle">
				<button type="button" class="cancelbtn"
					onclick="location.href='../'">Cancel</button>
			</div>
		</div>
	</div>
	<div id="window_search">-></div>

	<script>
		//searchId 클릭 시		
		$("#searchid").on('click', function() {
				
				$.ajax({
				//url주소 조심하세요 자동정렬할때
				url: '<%=request.getContextPath()%>/member/search',
				type : 'post',
				data : $('#idSeachForm').serialize(),

				success : function(data) {
					console.log(data);

					$('#window_search').text("회원님의 아이디는 : " + data.userId);

				} /* end success */
			}); /* end ajax */
		});
		
		// ID값이 searchpw인 input type="button"에 script를 이용한 클릭 기능 구현  
		$("#searchpw").on('click', function(){
			
			$.ajax({
				// 자동정렬하면 url 주소 깨짐
				url: '<%=request.getContextPath()%>/member/search',
				type : 'post',
				data : $('#pwSearchForm').serialize(),
				success : function(data){
					// 콘솔로 데이터가 잘 들어왔는지 확인
					console.log(data);
					
					$('#window_search').text("비밀번호는 "+ data.userPw +"입니다.")
				}
			
			}); /* end ajax */
		}); /* end button function */
		
		// 경원 공부
		// data: 에는 form 안에 id 값을 넣어주면 된다.
		// JSON(JavaScript Object Notation)이란 클라이언트 브라우저 및
		// AJAX 사용 웹 서비스 간에 소량의 데이터를 신속하게 교환할 수 있는
		// 효율적인 데이터 인코딩 형식이다.
		
		// serialize()는 입력된 모든 Element를 문자열의 데이터에 serialize 한다. 
		// form 안에 각 요소를 param 값으로 저장 시키지 않고 한번에 담아줌		
		
	</script>




</body>
</html>
