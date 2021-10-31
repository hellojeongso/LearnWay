<%@page import="com.media.dto.MediaDto"%>
<%@page import="com.media.biz.MediaBiz"%>
<%@page import="java.util.List"%>
<%@page import="com.lesson.biz.LessonBiz"%>
<%@page import="com.lesson.dto.LessonDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("texthtml; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Acme&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>LearnWay - 온·오프라인으로 즐기는 다양한 클래스</title>
<%
	String member_id = request.getParameter("id");
	System.out.println(member_id);
%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		if ($(".id").val() == "null") {
			$(".log").html('<a class="log" href="login/main_regist.jsp"><i class="fas fa-sign-in-alt"></i>LOGIN</a>');
			$('.mypage').css("display", "none"); 
			$('.btn-group').css("display", "none");
		} else {
			$(".log").html('<a class="log" href="index.jsp"><i class="fas fa-sign-in-alt"></i>LOGOUT</a>');
			$(".join").text("");
			$('.mypage').css("display", "block"); 
			$('.btn-group').css("display", "block");
		}
		
	});
	
	
	
</script>

<style type="text/css">

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
	height:300px;
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

#searh_btn{
	background-image: url('resources/image/search_icon.png'); 
	background-repeat: no-repeat; 
	outline: 0; 
	border: 0px; 
	cursor:pointer; 
	height:30px; 
	width:30px;
	float: right;
	background-color: rgba( 255, 255, 255, 0 );
	background-position: 0px 0px;
}


</style>
<!-- 아이콘 찾아서 붙여보기 -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/9b7675f701.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/stylesheet.css" type="text/css"/>
</head>
<body>
	<input type="hidden" value="<%=member_id %>" class="id">
	<header>
	   <!-- 로고 -->
	   <ul class="header-list">
	      <li><div><a href="index.jsp?id=<%=member_id%>"><img alt="로고" src="resources/image/LearnWay.png"/></div></a></li>
	      
	   <!-- 검색창 -->   
	      <li>
	      <form action="lesson_board/lesson_list.jsp?id=<%=member_id%>&class_tag=0" method="post">
		      <div class="searchContainer" style="margin-left: 100px">
		         <div class="search_Box">
		            <table class="search_Elements">
		               <tr>
		                  <td>
		                     <input style="font-family: 'Acme', sans-serif; font-weight:bold; font-size:12pt;" type="text" placeholder="찾으시는 클래스가 있으신가요?" class="search" name="search_text">
		                  </td>
		                  <td style="padding-top: 5px;">
		                     <input type="submit" id="searh_btn" value="" >
		                  </td>
		               </tr>
		            </table>
		         </div>
		      </div>
	      </form>
	      </li>
	         
	 
	   <!-- 메뉴 -->   
			<li>
				<div class="btn-group">
				  <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				    Menu
				  </button>
				  <ul class="dropdown-menu">
				    <li><a style="font-family: 'Acme', sans-serif; font-weight:bold" class="dropdown-item" href="lesson_board/lesson_list.jsp?id=<%=member_id%>&class_tag=0">강의</a></li>
				    <li><a style="font-family: 'Acme', sans-serif; font-weight:bold"class="dropdown-item" href="event_board/event_list.jsp?id=<%=member_id%>">이벤트</a></li>
				    <li><a style="font-family: 'Acme', sans-serif; font-weight:bold"class="dropdown-item" href="notice_board/noti_list.jsp?id=<%=member_id%>">공지사항</a></li>
				    <li><a style="font-family: 'Acme', sans-serif; font-weight:bold"class="dropdown-item" href="cs_board/cs_list.jsp?id=<%=member_id%>">고객센터</a></li>
				    <li><hr class="dropdown-divider"></li>
				    <li class="mypage"><a style="font-family: 'Acme', sans-serif; font-weight:bold"class="dropdown-item" href="mypage/mypageload.jsp?id=<%=member_id %>">마이페이지</a></li>
				  </ul>
				</div>				
			</li>
	   
	      
	         <li>
	            <div class="login">
	                  <a class="log" href="login/main_regist.jsp"><i class="fas fa-sign-in-alt"></i>LOGIN</a>
	               </div>
	         </li>
	         
	         <li>   
	            <div class="join">
	               <a class="join" href="login/inmain_regist.jsp"><i class="fas fa-user-friends"></i>JOIN</a>
	            </div>
	         </li>
	                  
	      
	       
	      </ul>
	   
	
	
	</header>

<main>

<div class="section">
   <input type="radio" name="slide" id="slide01" checked>
   <input type="radio" name="slide" id="slide02">
   <input type="radio" name="slide" id="slide03">
   <div class="slidewrap">
      
      <ul class="slidelist">
         <!-- 슬라이드 영역 -->
         
         <li class="slideitem">
            <a>
               <div class="textbox">
                  <h3 style="font-family: 'Acme', sans-serif; font-weight:bold">새로운 취미 찾기</h3>
                  <p style="font-family: 'Acme', sans-serif; font-weight:bold">온라인으로 편하게 즐기세요!</p>
               </div>
               <img src="resources/image/slide_camera.png">
            </a>
         </li>
         
         <li class="slideitem">
            <a>
           		<div class="textbox">
                  <h3 style="font-family: 'Acme', sans-serif; font-weight:bold">새로운 취미 찾기</h3>
                  <p style="font-family: 'Acme', sans-serif; font-weight:bold">온라인으로 편하게 즐기세요!</p>
               </div>
               <img src="resources/image/slide_painting.png">
            </a>
         </li>
         
         <li class="slideitem">
            <a>
               <div class="textbox">
                  <h3></h3>
                  <p></p>
               </div>
               <img src="resources/image/slide_yoga.png">
            </a>
         </li class="slideitem">

         <!-- 좌,우 슬라이드 버튼 -->
         <div class="slide-control">
            <div>
               <label for="slide03" class="left"></label>
               <label for="slide02" class="right"></label>
            </div>
            <div>
               <label for="slide01" class="left"></label>
               <label for="slide03" class="right"></label>
            </div>
            <div>
               <label for="slide02" class="left"></label>
               <label for="slide01" class="right"></label>
            </div>
         </div>

      </ul>
      <!-- 페이징 -->
      <ul class="slide-pagelist">
         <li><label for="slide01"></label></li>
         <li><label for="slide02"></label></li>
         <li><label for="slide03"></label></li>
      </ul>
   </div>
</div>

   <div class="category">
      <a href="lesson_board/lesson_list.jsp?class_tag=0&id=<%=member_id%>"><i class="fas fa-desktop"></i> IT</a>
      <a href="lesson_board/lesson_list.jsp?class_tag=1&id=<%=member_id%>"><i class="fas fa-utensils"></i> Cooking</a>
      <a href="lesson_board/lesson_list.jsp?class_tag=2&id=<%=member_id%>"><i class="fas fa-language"></i> Language</a>
      <a href="lesson_board/lesson_list.jsp?class_tag=3&id=<%=member_id%>"><i class="fas fa-coins"></i> Stock</a>
      <a href="lesson_board/lesson_list.jsp?class_tag=4&id=<%=member_id%>"><i class="fas fa-palette"></i> Art</a>
      <a href="lesson_board/lesson_list.jsp?class_tag=5&id=<%=member_id%>"><i class="fas fa-running"></i> Sport</a>
      <a href="map/kakaomap2.jsp?id=<%=member_id%>"><i class="fas fa-map-marked"></i> Around Teacher</a>
   </div>
   
<!-- 인기 클래스 -->
   <section style="font-family: 'Acme', sans-serif; font-weight:bold;margin-left: 450px; margin-right: 450px; margin-bottom: 50px; border-top: 1px solid gray; padding-top: 30px; ">
      <div class="sec_title" style="font-family: 'Acme', sans-serif; font-weight:bold; margin-bottom: 30px;">인기 CLASS</div>
     	<article>
		 <div class="container" style="width: 70rem;">
		      <div class="row">
<%
	LessonBiz viewbiz = new LessonBiz();
	List<LessonDto> viewlist = viewbiz.viewList();
	
	
	for(int i = 0; i<4; i++){
		LessonDto ldto = new LessonDto();
		ldto = viewlist.get(i);
		
		MediaBiz mbiz = new MediaBiz();
		String class_title = ldto.getClass_title();
		MediaDto mdto = mbiz.mediaOne(class_title);
		String path = mdto.getMedia_path();
		System.out.println(path);
		//외부 접속 시 아이피 변경
		String ip = "49.170.22.193";
		
		String realPath = path.replace("localhost", ip);
%>
		     	<div class="col-md-3">
		     	<div class="card">
			      	<img src="<%=realPath %>" style="width: 235px; height: 200px; padding: 10px;" />
				    <div class="card-body">
				     <p class="card-teacher"><%=ldto.getClass_writer() %><p>
				     <h5 class="card-title"><%=ldto.getClass_title() %></h5>
				     <p class="card-price"><b><%=ldto.getClass_price() %>원</b></p>
				     <div class="card-button"><a href="lesson_board/lessonselectone.jsp?id=<%=member_id %>&class_no=<%=ldto.getClass_no() %>" class="btn btn-outline-dark w-100">수강하기</a></div>
				     </div>
				</div>
			    </div>
<%
	}
%>
			    
			    
		      </div>
		 </div>
		</article>
   </section>

<!-- 진행중인 이벤트 -->   
   <section style="font-family: 'Acme', sans-serif; font-weight:bold;margin-left: 450px; margin-right: 450px; border-top: 1px solid gray; padding-top: 30px; padding-bottom: 50px;" >
      <div class="sec_title" style="font-family: 'Acme', sans-serif; font-weight:bold; margin-bottom:30px;">진행중인 EVENT</div>
           	<article>
		 <div class="container" style="width: 70rem;">
		      <div class="row">	  
<%
	LessonBiz eventbiz = new LessonBiz();
	List<LessonDto> eventlist = eventbiz.eventList();
	
	
	for(int i = 0; i< 4; i++){
		LessonDto evdto = new LessonDto();
		evdto = eventlist.get(i);
		
		MediaBiz evmbiz = new MediaBiz();
		String event_title = evdto.getClass_title();
		MediaDto evmdto = evmbiz.mediaOne(event_title);
		String evpath = evmdto.getMedia_path();
		
		//외부 접속 시 아이피 변경
		String evip = "49.170.22.193";
		
		String evrealPath = evpath.replace("localhost", evip);
%>		      
		      
		        
		      <!-- 이벤트 출력 -->
		     	<div class="col-md-3">
		     	<div class="card">
			      	<img src="<%=evrealPath %>" style="width: 235px; height: 200px; padding: 10px;" />
				    <div class="card-body">
				         <p class="card-teacher"><%=evdto.getClass_writer() %><p>
				         <h5 class="card-title"><%=evdto.getClass_title() %></h5>
				         <p class="card-price"><small><s style="color: black"><%=evdto.getClass_price() %>원</s></small> → <b style="color:#FF3232;"><%=evdto.getClass_eventprice() %>원</b></p>
				     <div class="card-button"><a href="lesson_board/lessonselectone.jsp?id=<%=member_id %>&class_no=<%=evdto.getClass_no() %>" class="btn btn-outline-dark w-100">수강하기</a></div>
				     </div>
			    </div>
			    </div>
			   <!-- 이벤트 출력 -->
<%
	}
%>		    
			    
		      </div>
		 </div>
		</article>
   </section>
</main>
<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "72cd9e68-28fb-4db9-b3a8-fb3abf795732"
  });
</script>
<!-- End Channel Plugin -->
<jsp:include page="footer.jsp?id=<%=member_id %>"></jsp:include>
</body>
</html>