<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
<title>PC Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
/* 정기 마이페이지 */
#user_info {
   margin: 30px 20px;
   position : relative;
}
#user_table th {
   color: white;
   background-color: #212121;
   width : 180px;
   height : 80px;
   font-size : 20px;
   padding : 10px 20px;
   border-top : 1px solid white;
   border-bottom : 2px solid white;
}
#user_table td {
   width : 400px;
   color: black;
   border-top: 1px solid white;
   border-bottom: 2px solid white;
   background-color: #eee;
}
#user_table input[type=text]{
   width : 300px;
   height : 40px;
   margin-left : 50px;
   border-radius : 7px;
   border : 1px solid ivory;
   background-color : ivory;
   padding-left : 20px;
   font-size : 20px;
   font-weight : bold;
}
#myPageTitle{
   margin-top : 30px;
}
#userBtnTd{
   padding-left : 50px;
}
#editBtn, #deleteBtn {
   border : none;
   background-color : #212121;
   width : 100px;
   height : 40px;
   color : white;
   margin-left : 30px;
}
#editBtn:hover, #deleteBtn:hover {
   background-color : #8e8e8e;
   cursor : pointer;
}

#edit_table{
   width : 500px;
   height : 500px;
   position : absolute;
   top : 150px;
   right : 500px;
}

#edit_table tr, #edit_table td{
}
#edit_table th {
   background-color : #212121;
   color : white;
   padding-left : 20px;
   width : 150px;
   border-top : 2px solid white;
   font-size : 17px;
}
#editTitle {
   border-top : none !important;
   font-size : 25px !important;
   text-align : center;
   height : 70px;
   position : relative;
   border-radius : 12px 12px 0px 0px
}
#edit_table input[type="text"]{
   background-color : ivory;
   border-radius : 5px;
   border : none;
   margin-left : 30px;
   width : 280px;
   height : 40px;
   padding-left : 20px;
   font-size : 18px;
   font-weight : bold;
   
}
#edit_table td {
   background-color : #eee;
   border : 2px solid white;
}
#editUserId{
   background-color : darkgray !important;
}

#editBtnTd{
   text-align : center;
}
#editOkBtn{
   background-color : #212121;
   color : white;
   border : none;
   width : 100px;
   height : 40px;
}
#editOkBtn:hover {
   background-color : #8e8e8e;
   cursor : pointer;
}
#mainModal{
   position : fixed;
   width : 100%;
   height : 100%;
   left : 0px;
   top : 0px;
   z-index : 1;
   background-color : rgba(0, 0, 0, 0.4);
   display : none;
}
#close{
   position : absolute;
   right : 10px;
   top : 2px;
   color : darkgray;
}
#close:hover {
   color: white;
   text-decoration: none;
   cursor: pointer;
</style>

</head>
<body>
   <%@ include file="/WEB-INF/views/common/header.jsp"%>
   <div class="container">
      <h1 id = "myPageTitle">마이 페이지</h1>
      <hr>
      <div id="user_info">
         <form action="" id = "myForm">
            <table id="user_table">
               <tr id = "userIdTr">
                  <th>회원아이디</th>
                  <td><input type = "text" name = "userId" id = "userId" value = "${user.userId }" readonly></td>
               </tr>
               <tr>
                  <th>이름</th>
                  <td><input type = "text" name = "userName" id = "userName" value = "${user.userName }" readonly></td>
               </tr>
               <tr>
                  <th>비밀번호</th>
                  <td><input type = "text" name = "userPw" id = "userPw" value = "${user.userPw }" readonly></td>
               </tr>
               <tr>
                  <th>핸드폰번호</th>
                  <td><input type = "text" name = "userPhone" id = "userPhone" value = "${user.userPhone }" readonly></td>
               </tr>
               <tr>
                  <th>생년월일</th>
                  <td><input type = "text" name = "userBirth" id = "userBirth" value = "${user.userBirth }" readonly></td>
               </tr>
               <tr>
                  <th>남은시간</th>
                  <td><input type = "text" name = "userBirth" id = "userBirth" value = "${userVO.userTime }분" readonly></td>
               </tr>
               <tr>
                  <th>회원정보관리</th>
                  <td id = "userBtnTd"><input type="button" value='수정' id = "editBtn">
                     <input type="button" id="deleteBtn" value="삭제"></td>
               </tr>
            </table>
         </form>


      </div>
      
   <!-- 수정페이지 누르면 모달창이 뜸 -->
<div id = "mainModal">
   <form action="" id = "editForm">
            <table id="edit_table">
               <tr>
                  <th colspan = "2" id = "editTitle">회원 수정<span id = "close">×</span></th>
               </tr>
               <tr id = "">
                  <th>회원아이디</th>
                  <td id = "editUserId"><input type = "text" name = "userId" id = "editUserId" value = "${user.userId }" readonly></td>
               </tr>
               <tr>
                  <th>이름</th>
                  <td><input type = "text" name = "userName" value = "${user.userName }" ></td>
               </tr>
               </tr>
               <tr>
                  <th>비밀번호</th>
                  <td><input type = "text" name = "userPw" value = "${user.userPw }" ></td>
               </tr>
               <th>핸드폰번호</th>
                  <td><input type = "text" name = "userPhone" value = "${user.userPhone }" ></td>
               <tr>
                  <th>생년월일</th>
                  <td><input type = "text" name = "userBirth" value = "${user.userBirth }" ></td>
               </tr>
               <tr>
                  <th>회원정보관리</th>
                  <td id = "editBtnTd"><input type="button" id="editOkBtn" value='수정완료' onclick=""></td>
               </tr>
            </table>
         </form>
   </div>
</div>   
   <%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
   <script>
      $(document).ready(function(){
         
         $('#mainModal').hide();
         
         $('#editBtn').on('click', function(){
         
            $('#mainModal').show();
            
         });
         
         $('#editOkBtn').click(function(){
            
            $.ajax({
               url : '<%=request.getContextPath()%>/user/userEdit',
               type : 'post',
               data : $('#editForm').serialize(),
               success : function(data){
                  alert("회원수정을 완료했습니다.");
                  location.href = '<%=request.getContextPath()%>/user/myPage'
               }
            });
            
         });
         
         $('#deleteBtn').click(function(){
            
            $.ajax({
               url : '<%=request.getContextPath()%>/user/userDelete',
               type : 'post',
               data : $('#myForm').serialize(),
               success : function(data){
                  alert("탈퇴처리 되었습니다.");
                  location.href = '<%=request.getContextPath()%>'
               }
            });
            $('#mainModal').hide();
         });
      
         $(window).on('click', function() {
            //jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
            if (event.target == $('#mainModal').get(0)) {
                $('#mainModal').hide();
             }
         });
         
         $('#close').click(function(){
            $('#mainModal').hide();
         
         });
      });
   </script>
</html>