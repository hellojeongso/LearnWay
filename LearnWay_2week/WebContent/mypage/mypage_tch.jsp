<%@page import="com.login.biz.LoginBiz"%>
<%@page import="com.login.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("texthtml; charset=UTF-8");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>LearnWay │ Mypage</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/mypage.css" type="text/css"/>
</head>
<body>
<%
   String member_id = request.getParameter("id");
   
   LoginDto dto = new LoginDto();
   LoginBiz biz = new LoginBiz();
   
   dto = biz.mypageView(member_id);

%>
<div class="mypage_area">
	<div class="sidenav"></div>
      <div class="main">
            <div class="login-form"> 
              <form action="mypage_info_update_tch.jsp" method="post">
              <input type="hidden" name="member_id" value="<%=member_id%>"> 
              	<div class="home"><img src="../resources/image/login_logo.PNG"/></div>
				<div class="form-group">
 					<div class="title"><label for="name">이름</label><br></div>
					<input type="text" class="form-control" id="name" name="teacher_name" readonly="readonly"
                 	 value="<%=dto.getMember_name()%>"><br>
 					<div class="title"><label for="phome">전화 번호</label><br></div>
 					<input type="text" class="form-control" id="phone" name="teacher_phone" readonly="readonly"
 					value="<%=dto.getMember_phone()%>"><br>
 					<div class="title"><label for="addr">주소</label><br></div>
 					<input type="text" class="form-control" id="addr" name="teacher_addr" readonly="readonly"
 					value="<%=dto.getMember_addr()%>">
 					</div>
 					<div class="form-group">
 						<input class="btn" type="submit" value="수정">
 						<input class="btn" type="button" value="회원 탈퇴" onclick="location.href='myclass_memdel.jsp?id=<%=member_id%>'">
 						<input class="btn" type="button" value="취소" id="cancel" onclick="location.href='../index.jsp?id=<%=member_id%>'">
                   </div>
               </form>
            </div>
         </div>
      </div>    
</body>
</html>