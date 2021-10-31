<%@page import="com.media.dto.MediaDto"%>
<%@page import="com.media.biz.MediaBiz"%>
<%@page import="java.util.List"%>
<%@page import="com.lesson.biz.LessonBiz"%>
<%@page import="com.lesson.dto.LessonDto"%>
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
<title>LearnWay - 온·오프라인으로 즐기는 다양한 클래스</title>
<!-- 아이콘 찾아서 붙여보기 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	var count = 0;
	//스크롤 바닥 감지
	window.onscroll = function(e) {
	//추가되는 임시 콘텐츠
	//window height + window scrollY 값이 document height보다 클 경우,
	if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
		//실행할 로직 (콘텐츠 추가)
	    count++;
		}
	};


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
	color: #FF3232;
}


.card{
	
	border-radius: 30px;
	margin-bottom: 30px;
}


.body_scroll {
	padding-top: 70px;
}


</style>

</head>
<body>
<%
	String member_id = request.getParameter("id");
	int class_tag = Integer.parseInt(request.getParameter("class_tag"));
	LoginDto ldto = new LoginDto();
	LoginBiz lbiz = new LoginBiz();
	ldto = lbiz.mypageView(member_id);
	
	//-------------------------------
	LessonBiz biz = new LessonBiz();
	
	List<LessonDto> list = null; 
	String text = request.getParameter("search_text");		

	if(text == null){
		list = biz.classList(class_tag); 		
	}else{
		list = biz.classSearch(text);
	}
	
	
%>

<header>
<jsp:include page="../header.jsp?id=<%=member_id %>"></jsp:include>
<div class="category">
      <a href="lesson_list.jsp?class_tag=0&id=<%=member_id %>"><i class="fas fa-desktop"></i> IT</a>
      <a href="lesson_list.jsp?class_tag=1&id=<%=member_id %>"><i class="fas fa-utensils"></i> Cooking</a>
      <a href="lesson_list.jsp?class_tag=2&id=<%=member_id %>"><i class="fas fa-language"></i> Language</a>
      <a href="lesson_list.jsp?class_tag=3&id=<%=member_id %>"><i class="fas fa-coins"></i> Stock</a>
      <a href="lesson_list.jsp?class_tag=4&id=<%=member_id %>"><i class="fas fa-palette"></i> Art</a>
      <a href="lesson_list.jsp?class_tag=5&id=<%=member_id %>"><i class="fas fa-running"></i> Sport</a>
      <a href="../map/kakaomap2.jsp?id=<%=member_id%>"><i class="fas fa-map-marked"></i> Around Teacher</a>
</div>
</header>

<main>

	<article>
		 <div class="body_scroll">


			 <div class="container" style="width: 70rem;">
			      <div class="row">

<%
	for(LessonDto dto : list){

%>
			        <div class="col-4">
			          <div class="card">
<%
	MediaBiz mbiz = new MediaBiz();
	String class_title = dto.getClass_title();
	MediaDto mdto = mbiz.mediaOne(class_title);
	String path = mdto.getMedia_path();
	
	int event_check = dto.getClass_eventprice();
	int price = 0;
	
	if(event_check == 0){
		price = dto.getClass_price();	
	}else{
		price = dto.getClass_eventprice();
	}
	
	//외부 접속 시 아이피 변경
	String ip = "49.170.22.193";
	
	String realPath = path.replace("localhost", ip);
%>
			            <img src="<%=realPath %>" style="width: 347px; height: 300px;" />
			            <div class="card-body">
			              <p class="card-teacher"><%=dto.getClass_writer() %><p>
			              <h5 class="card-title"><%=dto.getClass_title() %></h5>
			              <p class="card-text"><%=dto.getClass_title() %></p>
			              <p class="card-price"><b><%=price %>원</b></p>
			              <div class="card-button"><a href="lessonselectone.jsp?id=<%=member_id %>&class_no=<%=dto.getClass_no() %>" class="btn btn-outline-dark w-100">수강하기</a></div>
			            </div>
			          </div>
			        </div>
<%
	}
%>
				</div>
			</div>
			
		</div>
</article>

</main>

<jsp:include page="../footer.jsp?id=<%=member_id %>"></jsp:include>


</body>
</html>