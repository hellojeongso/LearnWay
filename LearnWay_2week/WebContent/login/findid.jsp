<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LearnWay │ 아이디 찾기</title>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../css/find.css" type="text/css"/>
</head>
<body>
<div class="find_area">
	<div class="sidenav"></div>
      <div class="main">
            <div class="login-form">
               <form action="findid_res.jsp" method="post">
					<div class="form-group">
						<p>이름</p> 
						<input type="text" class="form-control" placeholder="User Name" name="member_name">
					</div>
					<div class="form-group">
						<p>Email</p> 
						<input type="text" class="form-control" placeholder="Email" name="member_email">
					</div>
					<input type="submit" id="find_bt" value="아이디 찾기">
					<input type="button" id="back_bt" value="취소" onclick="location.href='main_regist.jsp'">
               </form>
            </div>
         </div>
</div>
	

</body>
</html>
