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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>

/*-------------라디오버튼 ----------------------------*/
 
 function onevent(){
	$(".event-detail").removeAttr("disabled"); //onevent 발동시 , eventattr속성을 삭제 
}
 function notevent(){
		$(".event-detail").attr("disabled","disabled"); 
 } 
 
 //-----------------------------------------------------
</script>

</head>
<body>
<%


LessonDto dto = new LessonDto();

String class_writer = request.getParameter("class_writer");


%>

 <h1>강의 등록 페이지</h1>
 <form action="myclassinsertres.jsp" method="post">
 
<div>
내 아이디 <input type="text" readonly="readonly" name="class_writer" value="<%=class_writer%>"> 
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

<br>강의시작일 <input type="date" id="class_startdate" name="class_startdate">
<br> 강의종료일 <input type="date" id="class_lastdate" name="class_lastdate">
<br>강의가격 &emsp; <input type="text" id="class_price" name="class_price">
<br> 강의수강생 최대인원 <input type="text" id="class_count" name="class_count">
</div>

<div>
<h4>이벤트 중인 강의 정보</h4><br>
이벤트 유무<br>
<input type="radio" class="radio-value" name="eventcheck" value="0" onclick="onevent();">이벤트 중
<input type="radio" class="radio-value" name="eventcheck" value="1" onclick="notevent();">이벤트 아님 
<!-- 이벤트 아님을 선택했을 때 아래 3개 비활성화하기  -->
<br><br>
이벤트 강의시작일 <input type="date" class="event-detail"  id="class_eventstartdate" name="class_eventstartdate" >
<br> 이벤트 강의종료일 <input type="date" class="event-detail" id="class_eventlastdate" name="class_eventlastdate" >
<br>이벤트 강의가격 &emsp; <input type="text" class="event-detail" id="class_eventprice" name="class_eventprice" >
</div>


제목<input type="text" name="class_title">
내용<input type="text" name="class_content"> 

<br><br>
<div id="summernote"><p>강의설명을 입력해 주세요</p></div>
  
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
<jsp:include page="fileupload.jsp"></jsp:include>
</div>
<div>
 <input type="submit" value="강의수정" > <!-- submit???  -->
 <input type="button" value="뒤로가기" onclick="location.href='mypage_tch.jsp'">
</div>	  
</form>
</body>
</html>