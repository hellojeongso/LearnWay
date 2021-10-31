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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
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
<script type="text/javascript">
   var now_img;  //현재 이미지
   var last_img; //마지막 이미지
   var cnt = 0;

   window.onload = function() {
      //setInterval("fn_change()",3000);
      //setInterval(호출함수 , 시간) : 일정시간 간격으로 작업수행이 필요한 경우
      setInterval("section_change()",2500);
   }

   function section_change() {
         //마지막 이미지를 첫번째로 옮긴다.     
         if (cnt > 2){
            $("input[name='slide']:radio").eq(cnt).prop('checked',false);
            cnt = 0;
            
            $("input[name='slide']:radio").eq(cnt).prop('checked',true);
            cnt++;
         }else {
            
            $("input[name='slide']:radio").eq(cnt-1).prop('checked',false);
            
            $("input[name='slide']:radio").eq(cnt).prop('checked',true);
            cnt++;
         }
      }
</script>

<style type="text/css">


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
<link rel="stylesheet" href="css/main.css" type="text/css"/>
</head>
<body>
   <input type="hidden" value="<%=member_id %>" class="id">
   
   <header>
	<div class="header">
      <ul>
		  <!-- 로고 -->
         <li>
         	<div class="logo">
         		<a href="index.jsp?id=<%=member_id%>"><img alt="로고" src="resources/image/LearnWay.png"/></a>
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
                <li><a class="dropdown-item" href="notice_board/noti_list.jsp?id=<%=member_id%>">공지사항</a></li>
                <li><a class="dropdown-item" href="cs_board/cs_list.jsp?id=<%=member_id%>">고객센터</a></li>
                <li><a class="dropdown-item" href="mypage/mypageload.jsp?id=<%=member_id %>">마이페이지</a></li>
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
<main>
<section class="slide_area">
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
	               <img src="resources/image/slide_camera.png" >
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
	               <img src="resources/image/slide_yoga.png" >
	            </a>
	         </li>
	
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
</section>
<section class="category_area">
   <div class="category">
      <a href="#"><i class="fas fa-desktop"></i> IT</a>
      <a href="#"><i class="fas fa-utensils"></i> Cooking</a>
      <a href="#"><i class="fas fa-language"></i> Language</a>
      <a href="#"><i class="fas fa-coins"></i> Stock</a>
      <a href="#"><i class="fas fa-palette"></i> Art</a>
      <a href="#"><i class="fas fa-running"></i> Sport</a>
   </div>
</section>
<section class="class-section">
      <div class="class_title">New Class</div>
      <div class="class_box">
         <div class="class">
            <div class="class_img"><img src="resources/image/class_img1.jpg"></div>
               <div class="class_info">
               <div class="info1">김철수</div>
               <div class="info2">비전공자를 위한 자바스크립트 강의</div>
               <div class="info3">
                     <span class="star">⭐⭐⭐⭐⭐</span>
                     <span class="count">185</span>
               </div>
               <div class="price">      
                     <span class="before">45,000원</span>
                     <span class="after">월 28,000원 (6개월)</span>
               </div>
            </div>   
         </div>
         <div class="class">
            <div class="class_img"><img src="resources/image/class_img2.jpg"></div>
               <div class="class_info">
               <div class="info1">이유리</div>
               <div class="info2">하루 15분, 내 몸을 위한 요가</div>
               <div class="info3">
                     <span class="star">⭐⭐⭐⭐⭐</span>
                     <span class="count">52</span>
               </div>
               <div class="price">      
                     <span class="before">45,000원</span>
                     <span class="after">월 28,000원 (6개월)</span>
               </div>
            </div>   
         </div>
         <div class="class">
            <div class="class_img"><img src="resources/image/class_img3.jpg"></div>
               <div class="class_info">
               <div class="info1">박짱구</div>
               <div class="info2">비건 쿠킹 클래스 #채식요리지도사</div>
               <div class="info3">
                     <span class="star">⭐⭐⭐⭐⭐</span>
                     <span class="count">45</span>
               </div>
               <div class="price">      
                     <span class="before">45,000원</span>
                     <span class="after">월 28,000원 (6개월)</span>
               </div>
            </div>   
         </div>                  
         <div class="class">
            <div class="class_img"><img src="resources/image/class_img4.jpg"></div>
               <div class="class_info">
               <div class="info1">훈이</div>
               <div class="info2">주식투자, 300억 자산을 굴리는 투자법</div>
               <div class="info3">
                     <span class="star">⭐⭐⭐⭐⭐</span>
               </div>
               <div class="price">      
                     <span class="before">45,000원</span>
                     <span class="after">월 28,000원 (6개월)</span>
               </div>
            </div>   
         </div>
         <div class="class">
            <div class="class_img"><img src="resources/image/class_img4.jpg"></div>
               <div class="class_info">
               <div class="info1">훈이</div>
               <div class="info2">주식투자, 300억 자산을 굴리는 투자법</div>
               <div class="info3">
                     <span class="star">⭐⭐⭐⭐⭐</span>
               </div>
               <div class="price">      
                     <span class="before">45,000원</span>
                     <span class="after">월 28,000원 (6개월)</span>
               </div>
            </div>   
         </div>
         <div class="class">
            <div class="class_img"><img src="resources/image/class_img4.jpg"></div>
               <div class="class_info">
               <div class="info1">훈이</div>
               <div class="info2">주식투자, 300억 자산을 굴리는 투자법</div>
               <div class="info3">
                     <span class="star">⭐⭐⭐⭐⭐</span>
               </div>
               <div class="price">      
                     <span class="before">45,000원</span>
                     <span class="after">월 28,000원 (6개월)</span>
               </div>
            </div>   
         </div>         
      </div>  
 
             
      
   </section>
   
   <section>
      <div class="class_title">💎 EVENT</div>
         <div class="event_box">
            <div class="event">
               <div class="event_img"><img src="resources/image/event_img1.jpg"></div>
                  <div class="event_title">요즘 핫한 바디 프로필 클래스 할인받자!</div>
                     <div class="info">      
                        <span class="day">D-31</span>
                        <span class="date">07.18(일)~08.17(화)</span>
                  </div>      
            </div>   
            <div class="event">
               <div class="event_img"><img src="resources/image/event_img2.jpg"></div>
                  <div class="event_title">토익 900점 수강료 100% 환급?!</div>
                     <div class="info">      
                        <span class="day">D-48</span>
                        <span class="date">07.18(일)~09.03(금)</span>
                  </div>      
            </div>
            <div class="event">
               <div class="event_img"><img src="resources/image/event_img3.jpg"></div>
                  <div class="event_title">최신형 아이패드 증정! 스페셜 이벤트</div>
                     <div class="info">      
                        <span class="day">D-60</span>
                        <span class="date">07.18(일)~09.15(수)</span>
                  </div>      
            </div>                        
         </div>            
   </section>
   
<%@include file="footer.jsp"%>      
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
</body>
</html>