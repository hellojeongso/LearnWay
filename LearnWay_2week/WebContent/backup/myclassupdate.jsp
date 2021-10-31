<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.lesson.dto.LessonDto"%>
<%@page import="com.lesson.biz.LessonBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <% request.setCharacterEncoding("UTF-8"); %>
  <% response.setContentType("texthtml; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<script type="text/javascript" src="/LearnWay/myclasspage/se2/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>



</head>
<body>


<%

LessonBiz biz = new LessonBiz();
int no = Integer.parseInt(request.getParameter("no"));

LessonDto dto = biz.selectOne(no);


//System.out.println("2");
%>

 <h1>강의 상세보기 / 수정 페이지</h1>
<div>
내 아이디 <input type="text" value="<%=dto.getClass_writer()%>">
</div>
<br>

<div>
<h4>강의 정보</h4>
<br>
강의 유형 선택
<select id="class_tag" name="class_tag">
   <option value="0">IT</option>
   <option value="1">Cook</option>
   <option value="2">Language</option>
   <option value="3">Stock</option>
   <option value="4">Art</option>
   <option value="5">Sports</option>
</select>

<br>강의시작일 <input type="text" id="class_startdate" value="<%=dto.getClass_startdate()%>">
<br> 강의종료일 <input type="text" id="class_lastdate" value="<%=dto.getClass_lastdate()%>">
<br>강의가격 &emsp; <input type="text" id="class_price" value="<%=dto.getClass_price()%>">
<br> 강의수강생 최대인원 <input type="text" id="class_count" value="<%=dto.getClass_count()%>">
</div>

<div>
<h4>이벤트 중인 강의 정보</h4><br>
이벤트 유무<br>
<input type="radio" name="eventcheck" value="yesevent">이벤트 중
<input type="radio" name="eventcheck" value="noevent">이벤트 아님 
<!-- 이벤트 아님을 선택했을 때 아래 3개 비활성화하기  -->
<br><br>
이벤트 강의시작일 <input type="text" id="class_eventstartdate" value="<%=dto.getClass_eventstartdate()%>">
<br> 이벤트 강의종료일 <input type="text" id="class_eventlastdate" value="<%=dto.getClass_eventlastdate()%>">
<br>이벤트 강의가격 &emsp; <input type="text" id="class_eventprice" value="<%=dto.getClass_eventprice()%>">
</div>



<br><br>
<div id="summernote"><p>Hello Summernote</p></div>
  
  <script>
    $(document).ready(function() {
        $('#summernote').summernote();
       
    });
  </script>
  <script>
  $('#summernote').summernote({
  width:600,
  height: 300,                 // set editor height
  minHeight: null,             // set minimum height of editor
  maxHeight: null,             // set maximum height of editor
  focus: true                  // set focus to editable area after initializing summernote
});
  </script>



<br><br>
<div>
 <input type="button" value="강의수정" onclick=""> <!-- submit???  -->
 <input type="button" value="뒤로가기" onclick="location.href='mypage_tch.jsp'">
</div>	     



</body>
</html>