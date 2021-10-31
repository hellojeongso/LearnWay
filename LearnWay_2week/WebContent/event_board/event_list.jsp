<%@page import="com.media.dto.MediaDto"%>
<%@page import="com.media.biz.MediaBiz"%>
<%@page import="com.lesson.dto.LessonDto"%>
<%@page import="java.util.List"%>
<%@page import="com.lesson.biz.LessonBiz"%>
<%@page import="com.login.biz.LoginBiz"%>
<%@page import="com.login.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <% request.setCharacterEncoding("UTF-8"); %>
  <% response.setContentType("texthtml; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LearnWay - 온·오프라인으로 즐기는 다양한 클래스</title>
<!-- 아이콘 찾아서 붙여보기 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
var memberscroll = 3; // 멤버 번호

$(document).scroll(function(){
   if($(window).scrollTop() >= ($(document).height() - $(window).height())){ // 스크롤 높이 >= 사이트 크기 - 화면 크기
      for(var a = 0; a < 4; a++ ){ 
         var tr = document.getElementById("lesson"+memberscroll);
         tr.style.display='block';
         memberscroll++;
      }
   }
})

</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/9b7675f701.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/stylesheet.css" type="text/css"/>
<style type="text/css">

body {background:#fff;}


.card-teacher{
	margin: 5px 0;
	font-size: 13px;
	color: gray;
	
}

.card-title{
	font-size: 20px;
	font-weight: 600;
	color: rgb(60,60,60);
	
}


.card-text{
	padding:5px 0 0 0px;
	margin: 5px 0;
	font-size: 15px;
	color: gray;
}

.card-price{
	padding:15px 0 0 0px;
	font-size: 15px;
	
}


.card{
	
	border-radius: 30px;
	margin: 30px;
}


.body_scroll {
	padding-top: 70px;
}


</style>

</head>
<body>
<%
	String member_id = request.getParameter("id");
	System.out.println(member_id);
	
	LoginDto ldto = new LoginDto();
	LoginBiz lbiz = new LoginBiz();
	ldto = lbiz.mypageView(member_id);
	
	//-------------------------------
	LessonBiz biz = new LessonBiz();
	
	List<LessonDto> list = biz.eventList();
	
%>
<jsp:include page="../header.jsp?id=<%=member_id %>"></jsp:include>

<div class="category">
      <a href="../lesson_board/lesson_list.jsp?class_tag=0&id=<%=member_id %>"><i class="fas fa-desktop"></i> IT</a>
      <a href="../lesson_board/lesson_list.jsp?class_tag=1&id=<%=member_id %>"><i class="fas fa-utensils"></i> Cooking</a>
      <a href="../lesson_board/lesson_list.jsp?class_tag=2&id=<%=member_id %>"><i class="fas fa-language"></i> Language</a>
      <a href="../lesson_board/lesson_list.jsp?class_tag=3&id=<%=member_id %>"><i class="fas fa-coins"></i> Stock</a>
      <a href="../lesson_board/lesson_list.jsp?class_tag=4&id=<%=member_id %>"><i class="fas fa-palette"></i> Art</a>
      <a href="../lesson_board/lesson_list.jsp?class_tag=5&id=<%=member_id %>"><i class="fas fa-running"></i> Sport</a>
      <a href="../map/kakaomap2.jsp?id=<%=member_id%>"><i class="fas fa-map-marked"></i> Around Teacher</a>
</div>
</header>

<main>


	<article>
		 <div class="container" style="width: 70rem;">
		      <div class="row">
<%
   for(int i = 0; i<list.size(); i++){
      LessonDto dto = new LessonDto();
      dto = list.get(i);
      if(i<4){
%>
                 <div class="col-6" id="lesson<%=i%>" style="display: block;">
                   <div class="card">
<%
      }else{
%>
                <div class="col-6" id="lesson<%=i%>"  style="display: none;">
                   <div class="card">

<%
      }
	MediaBiz mbiz = new MediaBiz();
	String class_title = dto.getClass_title();
	MediaDto mdto = mbiz.mediaOne(class_title);
	String path = mdto.getMedia_path();
	
	//외부 접속 시 아이피 변경
	String ip = "49.170.22.193";
	
	String realPath = path.replace("localhost", ip);
%>
		            <img src="<%=realPath %>" style="height: 300px;" />
		            <div class="card-body">
		              <p class="card-teacher"><%=dto.getClass_writer() %><p>
		              <h5 class="card-title"><%=dto.getClass_title() %></h5>
		              <p class="card-text"><%=dto.getClass_title() %></p>
		              <p class="card-price"><small><s><%=dto.getClass_price() %>원</s></small> → <b style="color:#FF3232;"><%=dto.getClass_eventprice() %>원</b></p>
		              <div class="card-button"><a href="../lesson_board/lessonselectone.jsp?id=<%=member_id %>&class_no=<%=dto.getClass_no() %>" class="btn btn-outline-dark w-100">수강하기</a></div>
		            </div>
		          </div>
		         </div>
<%
	}
%>
		       </div>
		  </div>
</article>

</main>

<jsp:include page="../footer.jsp?id=<%=member_id %>"></jsp:include>


</body>
</html>
