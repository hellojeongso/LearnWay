<%@page import="com.webrtc.biz.WebrtcBiz"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.myclass.biz.MyclassBiz"%>
<%@page import="java.util.List"%>
<%@page import="com.media.dto.MediaDto"%>
<%@page import="com.media.biz.MediaBiz"%>
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
		
		
		if ($(".writer_id").val() == $('.my_id').val()) {
			$('input[name=video_insert]').css("display", "inline-block");
			$('#webrtc').css("display", "inline-block");
		} else {
			$('input[name=video_insert]').css("display", "none");
		}
		
		if($('input[name=sugang]').val() == "null"){
			$('#sugang1').html('<a class="btn btn-outline-dark w-100" onclick="gogo();">수강신청</a>');
			$('#video').css("display", "none");
			$('#webrtc').css("display", "none");
		}else{
			$('#sugang1').html('<a class="btn btn-outline-dark w-100" onclick="">수강완료</a>');
			$('#video').css("display", "inline-block");
			$('#webrtc').css("display", "inline-block");
		}
	})
	
	

</script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/9b7675f701.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/stylesheet.css" type="text/css"/>
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

.card-price{
	padding:10px 0 0 0px;
	font-size: 15px;
	color: #FF3232;
}


.rightmenu {
	padding-left: 830px;
	position: absolute;
}

.leftmenu {
	padding-left: 100px;
}
</style>



</head>
<body>
<%
	String member_id = request.getParameter("id");
	int class_no = Integer.parseInt(request.getParameter("class_no"));
	
	LoginDto dto = new LoginDto();
	LoginBiz biz = new LoginBiz();
	
	LessonBiz lbiz = new LessonBiz();
	LessonDto ldto = new LessonDto();
	ldto = lbiz.selectOne(class_no);
	
	String class_title = ldto.getClass_title();
	
	LessonBiz viewbiz = new LessonBiz();
	int res = viewbiz.viewupdate(class_title);
	
	int viewcount = ldto.getClass_count();
	System.out.println(viewcount);
	
	MediaBiz mbiz = new MediaBiz();
	MediaDto mdto = mbiz.mediaOne(class_title);
	String path = mdto.getMedia_path();
	String realPath = path.replace("localhost", "49.170.22.193");
	MediaBiz vbiz = new MediaBiz();
	List<MediaDto> list = vbiz.videoList(class_title);
	
	dto = biz.mypageView(member_id);
	
	int event_check = ldto.getClass_eventprice();
	int price = 0;
	
	if(event_check == 0){
		price = ldto.getClass_price();	
	}else{
		price = ldto.getClass_eventprice();
	}
	
%>



<%
	MyclassBiz cbiz = new MyclassBiz();
	Map map = new HashMap();
	map.put("item1",class_no);
	map.put("item2",member_id);
	String sugangCheck = cbiz.sugang(map);
	
	System.out.println(sugangCheck);
	
	
	WebrtcBiz webbiz = new WebrtcBiz();
	String webrtc = webbiz.selectOne(class_title);
	System.out.println(webrtc);
	
%>

<!-- 유효성 검사 용 hidden -->
<input type="hidden" name="class_no" value="<%=class_no%>">
<input type="hidden" name="member_id" value="<%=member_id%>">
<input type="hidden" name="sugang" value="<%=sugangCheck%>">

<script type="text/javascript">

	function gogo() {
	    var url = 'PayForm.jsp?id=<%=member_id%>&price=<%=price%>&class_no=<%=class_no%>';
	    window.open(url, "", "width=500, height=600");
	}
	
	function popup() {
		var url = "fileupload.jsp?title=<%=ldto.getClass_title()%>";
	    var name = "강의 자료 업로드";
	    var option = "width = 520, height = 300, top = 100, left = 200, location = no"
	    window.open(url, name, option);
	}
	
	function webrtc() {
		var url = "<%=webrtc%>";
	    var name = "Learnway 화상강의";
	    //var option = "width = 520, height = 300, top = 100, left = 200"
	    var win = window.open(url, name);
	    win.focus();
	}
</script>
<input type="hidden" value="<%=member_id %>" class="id">
	<header>
	   <!-- 로고 -->
	   <ul class="header-list">
	      <li><div><a href="../index.jsp?id=<%=member_id%>"><img alt="로고" src="../resources/image/LearnWay.png"/></div></a></li>
	      
	   <!-- 검색창 -->   
	      <li>
	      <div class="searchContainer" style="margin-left: 100px">
	         <div class="search_Box">
	            <table class="search_Elements">
	               <tr>
	                  <td>
	                     <input style="font-family: 'Acme', sans-serif; font-weight:bold; font-size:12pt;" type="text" placeholder="찾으시는 클래스가 있으신가요?" class="search">
	                  </td>
	                  <td>
	                     <a href="#"><img src="resources/image/search_icon.png" style="float: right;"/></a>
	                  </td>
	               </tr>
	            </table>
	         </div>
	      </div>
	      </li>
	         
	 
	   <!-- 메뉴 -->   
			<li>
				<div class="btn-group">
				  <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				    Menu
				  </button>
				  <ul class="dropdown-menu">
				    <li><a style="font-family: 'Acme', sans-serif; font-weight:bold" class="dropdown-item" href="../lesson_board/lesson_list.jsp?id=<%=member_id%>&class_tag=0">강의</a></li>
				    <li><a style="font-family: 'Acme', sans-serif; font-weight:bold"class="dropdown-item" href="../event_board/event_list.jsp?id=<%=member_id%>">이벤트</a></li>
				    <li><a style="font-family: 'Acme', sans-serif; font-weight:bold"class="dropdown-item" href="../notice_board/noti_list.jsp?id=<%=member_id%>">공지사항</a></li>
				    <li><a style="font-family: 'Acme', sans-serif; font-weight:bold"class="dropdown-item" href="../cs_board/cs_list.jsp?id=<%=member_id%>">고객센터</a></li>
				    <li><hr class="dropdown-divider"></li>
				    <li class="mypage"><a style="font-family: 'Acme', sans-serif; font-weight:bold"class="dropdown-item" href="../mypage/mypageload.jsp?id=<%=member_id %>">마이페이지</a></li>
				  </ul>
				</div>				
			</li>
	   
	      
	         <li>
	            <div class="login">
	                  <a class="log" href="../login/main_regist.jsp"><i class="fas fa-sign-in-alt"></i>LOGIN</a>
	               </div>
	         </li>
	         
	         <li>   
	            <div class="join">
	               <a class="join" href="../login/inmain_regist.jsp"><i class="fas fa-user-friends"></i>JOIN</a>
	            </div>
	         </li>
	                  
	      
	       
	      </ul>
	   
	
	
	</header>
   <div class="category">
      <a href="../lesson_board/lesson_list.jsp?class_tag=0&id=<%=member_id%>"><i class="fas fa-desktop"></i> IT</a>
      <a href="../lesson_board/lesson_list.jsp?class_tag=1&id=<%=member_id%>"><i class="fas fa-utensils"></i> Cooking</a>
      <a href="../lesson_board/lesson_list.jsp?class_tag=2&id=<%=member_id%>"><i class="fas fa-language"></i> Language</a>
      <a href="../lesson_board/lesson_list.jsp?class_tag=3&id=<%=member_id%>"><i class="fas fa-coins"></i> Stock</a>
      <a href="../lesson_board/lesson_list.jsp?class_tag=4&id=<%=member_id%>"><i class="fas fa-palette"></i> Art</a>
      <a href="../lesson_board/lesson_list.jsp?class_tag=5&id=<%=member_id%>"><i class="fas fa-running"></i> Sport</a>
      <a href="../map/kakaomap2.jsp?id=<%=member_id%>"><i class="fas fa-map-marked"></i> Around Teacher</a>
   </div>
<input type="hidden" class="my_id" value="<%=member_id %>">
<input type="hidden" class="writer_id" value="<%=ldto.getClass_writer() %>">

<!-- START THE FEATURETTES -->

<main>
<div class="container">
  	<div class="row">
	  	<div class="leftmenu">
		      <div class="col-7 col-lg-7">
		    	<hr class="featurette-divider">
		    	<div class="row featurette">
		      		<div class="col-md-7">
		        		<h2 class="featurette-heading"><%=ldto.getClass_title() %></span></h2>
		        		<p class="lead"><%=ldto.getClass_content() %> </p>
		      		</div>
		     		<div class="col-md-5">
						<img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" src="<%=realPath %>" style="width: 500px; height: 300px;">
		      		</div>
		    	</div>
	    		<br>
			</div>
			<div id="video">
<%	
	//동영상 강의 개수 카운트
	int cnt = 1;
	//외부 접속 시 아이피 변경
	String ip = "49.170.22.193";
	
	//동영상 강의 리스트 뽑기
	for(MediaDto vdto : list){
			String vp = vdto.getMedia_path();
			String vPath = vp.replace("localhost", ip); 
			System.out.println(vPath);
%>
<hr class="featurette-divider">
	<p><%=cnt %>번째 동영상 강의</p>
	<video src="<%=vPath%>" width='300' controls style="margin-left: 10px;"></video>
<%
	cnt++;
	}
%>		
		</div>
		</div>
	

	
	
	    <!-- END THE FEATURETTES -->
		<div class="rightmenu">
			<div class="col-5 .ms-auto">
				<div class="card-body">
					<p class="card-teacher"><%=ldto.getClass_writer() %><p>
					<h5 class="card-title"><%=ldto.getClass_title() %></h5>
					<p class="card-price"><b><%=price %>원</b></p>
					<div id="sugang1" ><a class="btn btn-outline-dark w-100" onclick="gogo();">수강신청</a></div>
					<input name="video_insert" class="btn-outline-dark w-100" type="button" value="동영상 강의 등록" onclick="popup();" style="margin-top: 15px;">
					<div id="webrtc" style="padding-top: 10px;">
					<input name="webrtc_view" class="btn-outline-dark w-100" type="button" value="화상강의 시작" onclick="webrtc();" style="margin-top: 15px;">
					</div>
				</div>       
			</div>
		</div>
	</div>
</div>
</main>





<!-- 푸터  -->
<footer>
	<div class="last">
		<span class="footerLogo">
			<h1>LearnWay</h1>
		</span>
		<div class="addrWrap">
			<sub>
				서울시 강남구 테헤란로 TEL:1234-5678, FAX:1234-5679,
				<p class="copyright">Copyright(C) 2021 All Right Reserved.</p>
			</sub>
			<a href="#"><sub>이용약관</sub></a>
			<a href="#"><sub>개인정보처리방침</sub></a>
		</div>
	</div>
</footer>
</body>
</html>
