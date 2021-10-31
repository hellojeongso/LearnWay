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
<style type="text/css">

body {
    font-family: "Lato", sans-serif;
}
h1{
	color: white;
	
}
.page-header{
	background-color: #777;
	font-color: #white;
	padding: 10px;
}
.center{
	color: #000;
}
.h4{
	font-color: #white;
}
.container {
    padding: 0px 10px;
}

</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>

function popup() {
	var url = "fileupload.jsp";
    var name = "강의 자료 업로드";
    var option = "width = 520, height = 300, top = 100, left = 200, location = no"
    window.open(url, name, option);
}


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
String serverport = "8787";
String realPath = "http://localhost:"+serverport+"/LearnWay_2week/fileupload";
System.out.println(realPath);

%>


   <div class="container">
      <div class="page-header">
         <div class="col-md-30">
            <div class="title-header text-center">
               <h1 style=" color:white; ">강의 등록 페이지</h1>
            </div>
         </div>
      </div>
   </div>
   


	   <br>



 <form action="myclassinsertres.jsp" method="post" name="forfunction">
 
	<div>
	<input type="hidden" name="class_writer" value="<%=class_writer%>"> 
	</div>
<br>
      
<div>
<div class="center">
	   <div class="container">
	      <div class="row col-md-12 m-2">
	         <div class="form-inline col-md=12 justify-content-center" name="forcss">
	            <div class="form-group" style="margin-left:200px;">
	            	<div class="panel panel-default">
               			 <div class="panel-heading">
							<h4>강의 정보</h4>
							<br> 강의 유형 선택 <select id="class_tag" name="class_tag" >
							   <option value="0">IT</option>
							   <option value="1">Cook</option>
							   <option value="2">Language</option>
							   <option value="3">Stock</option>
							   <option value="4">Art</option>
							   <option value="5">Sports</option>
							</select>
							<br>
							<br>강의시작일 <input type="date" id="class_startdate" name="class_startdate">
							<br>
							<br> 강의종료일 <input type="date" id="class_lastdate" name="class_lastdate">
							<br>
							<br>강의가격 &emsp; <input type="text" id="class_price" name="class_price"  placeholder="ex) 59,000원">
							<br>
							<br> 강의수강생 최대인원 <select id="class_count" name="class_count">
							                      <option value="0">1</option>
								                  <option value="1">2</option>
								                  <option value="2">3</option>
								                  <option value="3">4</option>
								                  <option value="4">5</option>
								                  <option value="5">6</option>
								                  <option value="6">7</option>
								                  <option value="7">8</option>
								                  <option value="8">9</option>
								                  <option value="9">10</option>
								                  <option value="10">11</option>
								                  <option value="11">12</option>
								                  <option value="12">13</option>
								                  <option value="14">14</option>
								                  <option value="15">15</option>
                                                </select>
              </div>
	          </div>
	          </div>
	          
	          

           <div class="form-group" style="margin-left:200px; margin-bottom:20px;" >
	          	<div class="panel panel-default">
              		<div class="panel-heading">
					<h4>이벤트 중인 강의 정보</h4>
					<br>
					이벤트 유무<br>
					<input type="radio" class="radio-value" name="eventcheck" value="1" onclick="onevent();">이벤트 중
					<input type="radio" class="radio-value" name="eventcheck" value="0" onclick="notevent();">이벤트 아님 
					<!-- 이벤트 아님을 선택했을 때 아래 3개 비활성화하기  -->
					<br>
					<br>이벤트 강의시작일 <input type="date" class="event-detail"  id="class_eventstartdate" name="class_eventstartdate" >
					<br>
					<br> 이벤트 강의종료일 <input type="date" class="event-detail" id="class_eventlastdate" name="class_eventlastdate" >
					<br>
					<br>이벤트 강의가격 &emsp; <input type="text" class="event-detail" id="class_eventprice" name="class_eventprice" placeholder="ex) 39,000원">
					<br>
					<br>
					
					</div>
					  </div>
					    </div>
					    
              </div>
            </div>
          </div>
        </div>
      </div>
       <br>
    <br>					    
<div class="panel panel-default">
    <div class="panel-heading">
     <div class="text-center" style="width:1200px; margin-left:70px;" >
		강의제목&emsp;&emsp;<input type="text" style="width: 500px" name="class_title" placeholder="강의제목을 입력해주세요."> 
	</div>

	  </div>
	    </div>
	
	
		<!--섬머노트 --> 
		<br>
		<br>
  <div class="container">
  <div class="text-center" style="width:1000px; margin-left:70px;" >
		<textarea class="summernote" name="class_content" id="summernote">강의설명을 입력해 주세요</textarea>
		</div>
		  
		  
		  <script>
		    $(document).ready(function() {
		        $('#summernote').summernote();
		       
		    });
		  </script>
		  
		  <br>
		  <script>
      $('#summernote').summernote({
         width : 100%,
         height : 1000px, // set editor height
         minHeight : null, // set minimum height of editor
         maxHeight : null, // set maximum height of editor
         focus : true
         text-align:center;

      // set focus to editable area after initializing summernote
      });
      
      $('textarea[name="class_content"]').html($('.summernote').code());
   </script>
   </div>
		
		
		
		<br><br>	
		<div class="form-group" style="margin-left:550px; margin-right:600px; margin-bottom:100px;" >
			<input type="button" value="사진 업로드" onclick="popup();">
			<input id="puploadfile" type="text" name="myclass_photo" value="" readonly="readonly">
		</div>			
		<div>
		   <div class="title-header text-center">
			 <input type="submit" value="강의등록" >&emsp;&emsp; <!-- submit???  -->
			 <input type="button" value="뒤로가기" onclick="location.href='mypage_tch.jsp'">
			</div>
		</div>
		<input type="hidden" name ="uploadpath" value="<%=realPath%>">
    <br>
    <br>
    <br>
    <br>
</form>
</body>
</html>
