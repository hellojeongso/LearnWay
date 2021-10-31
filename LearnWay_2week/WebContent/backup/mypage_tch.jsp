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
<title>강사 페이지</title>
<style type="text/css">
body {
    font-family: "Lato", sans-serif;
}



.main-head{
    height: 150px;
    background: #FFF;
   
}

.sidenav {
    height: 100%;
    background-color: #777;
    overflow-x: hidden;
    padding-top: 20px;
}


.main {
    padding: 0px 10px;
}

@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
}

@media screen and (max-width: 450px) {
    .login-form{
        margin-top: 10%;
    }

    .register-form{
        margin-top: 10%;
    }
}

@media screen and (min-width: 768px){
    .main{
        margin-left: 40%; 
    }

    .sidenav{
        width: 40%;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
    }

    .login-form{
        margin-top: 80%;
    }

    .register-form{
        margin-top: 20%;
    }
}


.login-main-text{
    margin-top: 20%;
    padding: 60px;
    color: #fff;
}

.login-main-text h2{
    font-weight: 300;
}

.btn-black{
    background-color: #000 !important;
    color: #fff;
}
img{
		width: 150px;
		height: 150px;
		margin-bottom: 20px;
		margin-top:30px;
		border: 1px solid black;
	}


</style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
<%
	String member_id = request.getParameter("id");
	
	LoginDto dto = new LoginDto();
	LoginBiz biz = new LoginBiz();
	
	dto = biz.mypageView(member_id);
	

%>

<div class="sidenav">
         <div class="login-main-text">
            <h2>LearnWay</h2>
         <h3>Teacher's MyPage</h3>
         </div>
      </div>
      
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
                  
                  
       		 <form action="mypage_info_update_tch.jsp" method="post">
       		 <input type="hidden" name="member_id" value="<%=member_id%>"> 
                 <div class="form-group">
	                    <img class="tec_img" src="https://cdn.hellodd.com/news/photo/202005/71835_craw1.jpg"><br>
						<input class="btn btn-dark btn-sm" type="submit" value="수정">
                  </div>
                  
                  <div class="form-group">
			             <label for="name">NAME</label><br>
						<input type="text" class="form-control" id="name" name="teacher_name" readonly="readonly"
						value="<%=dto.getMember_name()%>"><br>
						<label for="phome">PHONE</label><br>
						<input type="text" class="form-control" id="phone" name="teacher_phone" readonly="readonly"
						value="<%=dto.getMember_phone()%>"><br>
						<label for="addr">ADDR</label><br>
						<input type="text" class="form-control" id="addr" name="teacher_addr" readonly="readonly"
						value="<%=dto.getMember_addr()%>">
                  </div>
                  
                   <div class="form-group">
	                    <input class="btn btn-dark" type="button" value="강의목록" onclick="location.href='myclasslist.jsp?id=<%=member_id%>'"><br><br>
						<input class="btn btn-dark" type="button" value="실시간 강의 시작" onclick=""><br><br>
						<input class="btn btn-dark" type="button" value="회원 탈퇴" onclick="location.href='myclass_memdel.jsp?id=<%=member_id%>'"><br><br>
						<input class="btn btn-dark" type="button" value="돌아가기" onclick="location.href='../index.jsp?id=<%=member_id%>'">
                   </div>
                   
                  
               </form>
            </div>
         </div>
      </div>
</body>
</html>