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
					<input id="searchid" type="button" value="Search Id">
				</form>
			</div>

			<div class="col">
				<div class="hide-md-lg">
					<p>Or sign in manually:</p>
				</div>
				<form method="post">
					<input type="hidden" name="search" value="pw" /> <input
						type="text" name="userid" placeholder="Id" required> <input
						type="text" name="username" placeholder="UserName" required>
					<input type="submit" value="Search Password">
				</form>
			</div>

			<div class="cancle">
				<button type="button" class="cancelbtn"
					onclick="location.href='../'">Cancel</button>
			</div>
		</div>
	</div>
	<div id="window_id">-></div>

	<script>
		//searchId 클릭 시		
		$("#searchid").on('click', function() {
				
				$.ajax({
					url: '<%=request.getContextPath()%>/member/search',
					type : 'post',
					data : $('#idSeachForm').serialize(),

					success : function(data) {
					console.log(data);

					$('#window_id').text("회원님의 아이디는 : " + data.userId);

				} /* end success */
			}); /* end ajax */
		});
	</script>



</body>
</html>
