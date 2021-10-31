<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("texthtml; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		if ($(".id").val() == "null") {
			$(".log").html('<a class="log" href="login/main_regist.jsp"><i class="fas fa-sign-in-alt"></i>LOGIN</a>');
			$('.mypage').css("display", "none"); 
			$('.btn-group').css("display", "none");
		} else {
			$(".log").html('<a class="log" href="../index.jsp"><i class="fas fa-sign-in-alt"></i>LOGOUT</a>');
			$(".join").text("");
			$('.mypage').css("display", "block"); 
			$('.btn-group').css("display", "block");
		}
	});
	
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/9b7675f701.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/main.css" type="text/css"/>
</head>
<body>
<%
	String member_id = request.getParameter("id");
	System.out.println(member_id);
%>
<body>
   <input type="hidden" value="<%=member_id %>" class="id">
   
   <header>
	<div class="header">
      <ul>
		  <!-- 로고 -->
         <li>
         	<div class="logo">
         		<a href="../index.jsp?id=<%=member_id%>"><img alt="로고" src="../resources/image/LearnWay.png"/></a>
         	</div>	
         </li>
     	 <!-- 검색창 -->   
         <li>
         	<div class="search_area">
         		<form>
         			<input type="search" placeholder="찾으시는 클래스가 있으신가요?">
         			<span><i class="fas fa-search"></i></span>
         		</form>
         	</div>
         </li>
      	<!-- 메뉴 -->   
         <li class="btn-group-li">
            <div class="btn-group">
              <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                Menu
              </button>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="../notice_board/noti_list.jsp?id=<%=member_id%>">공지사항</a></li>
                <li><a class="dropdown-item" href="../cs_board/cs_list.jsp?id=<%=member_id%>">고객센터</a></li>
                <li><a class="dropdown-item" href="../mypage/mypageload.jsp?id=<%=member_id %>">마이페이지</a></li>
              </ul>
            </div>            
         </li>
         <!-- Login -->         
         <li>
            <div class="login">
              <a class="log" href="login/main_regist.jsp"><i class="fas fa-sign-in-alt"></i>LOGIN</a>
            </div>
         </li>
         <!-- Join -->   
         <li>   
             <div class="join">
                <a class="join" href="login/inmain_regist.jsp"><i class="fas fa-user-friends"></i>JOIN</a>
            </div>
       	</li>
	</ul>
  </div>  
  </header>
</body>
</html>