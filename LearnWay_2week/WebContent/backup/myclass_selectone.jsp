<%@page import="com.media.dto.MediaDto"%>
<%@page import="com.media.biz.MediaBiz"%>
<%@page import="org.apache.ibatis.javassist.bytecode.annotation.IntegerMemberValue"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.lesson.dto.LessonDto"%>
<%@page import="com.lesson.biz.LessonBiz"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
/*-------------라디오버튼 onevent 일 경우 버튼 자동클릭되도록 가져오기. ----------------------------*/
 
 function onevent(){
	$(".event-detail").removeAttr("disabled"); //onevent 발동시 , eventattr속성을 삭제 
}
 function notevent(){
		$(".event-detail").attr("disabled","disabled"); 
 } 
 /* 
 function SetSelectBox(){
	    var selectedtag = $("#class_tag option:selected").val(); 
	} */
 
 //-----------------------------------------------------
</script>
</head>
<body>
<%

LessonBiz biz = new LessonBiz();

int class_no = Integer.parseInt(request.getParameter("no"));
LessonDto dto = biz.selectOne(class_no);
String class_writer = dto.getClass_writer();

MediaBiz mbiz = new MediaBiz();
MediaDto mdto = mbiz.mediaOne(dto.getClass_title());
String realPath = mdto.getMedia_path();
System.out.println(realPath);


//String class_writer = request.getParameter("class_writer");    //보내준게 없으니까 null잡힘. classlist 51번째 줄에서 안보내줘서 null잡힘  
SimpleDateFormat date = new SimpleDateFormat("yyyy-mm-dd");

 
// int class_tag = Integer.parseInt(request.getParameter("class_tag"));
 ///////System.out.println(class_tag);
  
 
       
 
//String class_tag = null;   (dto.getClass_tag()가 int타입일 때 이용 필요. )
   

 switch( dto.getClass_tag()){
 
  //이 0은 switch 에 의해서 바껴서 한번 사용햇으니까. 
  //dto.setClass_tag("0");  => dto.setClass_tag("it");   
  case "0" : dto.setClass_tag("it");   //case "0" : class_tag ="it";        dto의 class_tag라는 변수가 string 타입이니까, 서버에서 불러온 값은 숫자이고, 이것을 string 다른 문자로 바꿈. 
  break; 
  
  case "1" : dto.setClass_tag("Cook");
  break;
  
  case "2" : dto.setClass_tag("Lanuage");
  break;
  
  case "3" : dto.setClass_tag("Stock");
  break;
  
  case "4" : dto.setClass_tag("Art");
  break;
  
  case "5" : dto.setClass_tag("Sports");
  break;
  
  }  
    
  
  
  
  
    %>


   <div class="container">
      <div class="page-header">
         <div class="col-md-30">
            <div class="title-header text-center">
               <h1 style=" color:white; ">강의 상세 페이지</h1>
            </div>
         </div>
      </div>
   </div>
   


	   <br>



 <form action="myclassinsertres.jsp" method="post" name="forfunction">
 
	<div>
	   <input type="hidden" name="class_writer" value="<%=dto.getClass_writer() %>"> 
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
						 <br> 강의 유형 선택 <input id="class_tag" name="class_tag" value="<%=dto.getClass_tag()%>" style="width:120px;" readonly="readonly">

							
							
							<br>
							<br>강의시작일 <input type="text" id="class_startdate" name="class_startdate" value="<%=date.format(dto.getClass_startdate()) %>" readonly="readonly">
							<br>
							<br> 강의종료일 <input type="text" id="class_lastdate" name="class_lastdate" value="<%=date.format(dto.getClass_lastdate()) %>" readonly="readonly">
							<br>
							<br>강의가격 &emsp; <input type="text" id="class_price" name="class_price"  value="<%=dto.getClass_price()%>" readonly="readonly">
							<br>
							<br> 강의수강생 최대인원 <input type="text" style=" width: 30px;" id="class_count" name="class_count" value="<%=dto.getClass_count()%>" readonly="readonly">
							                      
              </div>
	          </div>
	          </div>
	          
	          

           <div class="form-group" style="margin-left:200px; margin-bottom:20px;" >
	          	<div class="panel panel-default">
              		<div class="panel-heading">
					<h4>이벤트 중인 강의 정보</h4>
					<br>
					이벤트 유무<br> 
					
					
					 <%
					 if(dto.getClass_eventcheck() == 1){
					%>
																 
					<input type="radio" class="radio-value" name="eventcheck" value="1" checked="checked" onclick="return(false);">이벤트 중
					
					<input type="radio" class="radio-value" name="eventcheck" value="0"  onclick="return(false);">이벤트 아님 
					
					<br>
					<br>이벤트 강의시작일 <input type="text" class="event-detail"  id="class_eventstartdate" name="class_eventstartdate" readonly="readonly" value="<%=date.format(dto.getClass_eventstartdate()) %>">
					<br>
					<br> 이벤트 강의종료일 <input type="text" class="event-detail" id="class_eventlastdate" name="class_eventlastdate" readonly="readonly" value="<%=date.format(dto.getClass_eventlastdate()) %>">
					<br>
					<br>이벤트 강의가격 &emsp; <input type="text" style="width:100px;" class="event-detail" id="class_eventprice" name="class_eventprice" readonly="readonly" value="<%=dto.getClass_eventprice()%>">
					<br>
					<br>
					
					<%
					 }else{
						 %>
							<input type="radio" class="radio-value" name="eventcheck" value="1"  onclick="return(false);">이벤트 중
							
							<input type="radio" class="radio-value" name="eventcheck" value="0" checked="checked" onclick="return(false);" >이벤트 아님
							
					<br>
					<br>이벤트 강의시작일 <input type="text" class="event-detail"  id="class_eventstartdate" name="class_eventstartdate" readonly="readonly" disabled value="<%=date.format(dto.getClass_eventstartdate()) %>">
					<br>
					<br> 이벤트 강의종료일 <input type="text" class="event-detail" id="class_eventlastdate" name="class_eventlastdate" readonly="readonly" disabled value="<%=date.format(dto.getClass_eventlastdate()) %>">
					<br>
					<br>이벤트 강의가격 &emsp; <input type="text" style="width:100px;" class="event-detail" id="class_eventprice" name="class_eventprice" disabled readonly="readonly" value="<%=dto.getClass_eventprice()%>">
					<br>
					<br>
							
				   <%
					 }
					%>
					<!-- 이벤트 아님을 선택했을 때 아래 3개 비활성화하기  -->
					
					
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
		강의제목&emsp;&emsp;<input type="text" style="width: 500px" name="class_title" value="<%= dto.getClass_title()%> "> 
	</div> 
	  </div>
	    </div>
	
	
		<!--섬머노트 --> 
		<br>
		<br>
		
  <div class="container">
  <div class="text-center" style="width:1000px; margin-left:70px;" >
		<textarea class="summernote" name="class_content" id="summernote" readonly="readonly"><%=dto.getClass_content() %></textarea>
		</div>
		  
		  
		  <script>
	      $('#summernote').summernote('disable');  // for disable editing 

	      
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
		<div>
			<img src="<%=realPath %>" style="width: 200px; height: 200px;" />
		</div>
		
		
		<br><br>	
			
		<div>
		   <div class="title-header text-center">
			 <input type="submit" value="강의 수정하기" onclick="location.href='myclassupdate.jsp?id=<%=dto.getClass_writer()%>'">&emsp;&emsp; 
			 <input type="button" value="뒤로가기" onclick="location.href='myclasslist.jsp?id=<%=class_writer%>'">
			</div>
		</div>	  
    <br>
    <br>
    <br>
    <br>
</form>
</body>
</html>