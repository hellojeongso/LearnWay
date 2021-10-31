<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LearnWay │ 비밀번호 찾기</title>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../css/find.css" type="text/css"/>
</head>
<body>
<div class="find_area">
	<div class="sidenav"></div>
      <div class="main">
            <div class="login-form">
               <form action="findpw_res.jsp" method="post">
                  <div class="form-group">
                     <p>이름</p>
                     <input type="text" placeholder="이름" name ="member_name">
                  </div>
                  
                  <div class="form-group">
                     <p>Email</p>
                     <input type="text" placeholder="Email" name="member_email">
                  </div>
                  
                  <div class="form-group">
                     <p>비밀번호 찾기 질문</p>
                     <select name="member_question" class="select_form">
						<option value="질문을 선택해 주세요">질문을 선택해 주세요</option>
						<option value="기억의 남는 추억의 장소는?">기억의 남는 추억의 장소는?</option>
						<option value="자신의 인생 좌우명">자신의 인생 좌우명</option>
						<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
						<option value="인상 깊게 읽은 책 이름은?">인상 깊게 읽은 책 이름은?</option>
					</select>
                  </div>
                  
                  <div class="form-group">
                     <p>답변</p>
                     <input type="text" placeholder="답변" name="member_answer">
                  </div>
					<input type="submit" id="find_bt" value="비밀번호 찾기">
					<input type="button" id="back_bt" value="취소" onclick="location.href='main_regist.jsp'">
               </form>
            </div>
         </div>
      </div>
</body>
</html>
