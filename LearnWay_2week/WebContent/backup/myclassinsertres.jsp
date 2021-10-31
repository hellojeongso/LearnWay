<%@page import="com.media.biz.MediaBiz"%>
<%@page import="com.media.dto.MediaDto"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
</head>
<body>


<%
  String class_writer = request.getParameter("class_writer");
  String path = request.getParameter("uploadpath");
  String file = request.getParameter("myclass_photo");
  String media_path = path + "/"+ file;
  
  System.out.println("---------------------");
  System.out.println(class_writer);
  System.out.println(media_path);
  System.out.println("---------------------");
  
  String class_tag = request.getParameter("class_tag");
  Date class_startdate = new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("class_startdate"));
  Date class_lastdate = new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("class_lastdate"));
  
  int class_price = Integer.parseInt(request.getParameter("class_price"));
  int class_count = Integer.parseInt(request.getParameter("class_count"));
  
  String class_title = request.getParameter("class_title");
  String class_content = request.getParameter("class_content");  
  int eventcheck =  Integer.parseInt(request.getParameter("eventcheck"));
 
  
  System.out.println(eventcheck);
  
  
  
  
      Date  class_eventstartdate = new SimpleDateFormat("yyyy-mm-dd").parse("0000-00-00");
	  Date class_eventlastdate = new SimpleDateFormat("yyyy-mm-dd").parse("0000-00-00");
	  int class_eventprice = 0;
		   	
      if(eventcheck == 1 ){
    //if 문 안에서 선언된 변수들은 if문 안에서만 사용이 가능하다. 따라서, if문 안의 변수를 밖에서 사용하려면, if문 위에서 미리 변수를 선언하면 된다. 	  
	      class_eventstartdate = new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("class_eventstartdate"));
	      class_eventlastdate = new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("class_eventlastdate"));
	      class_eventprice = Integer.parseInt(request.getParameter("class_eventprice"));
		   	  
     }
  
  //---------------------------
  
   LessonDto dto = new LessonDto();  
   dto.setClass_writer(class_writer);
   dto.setClass_tag(class_tag);
   dto.setClass_startdate(class_startdate);
   dto.setClass_lastdate(class_lastdate);
   dto.setClass_price(class_price);
   dto.setClass_count(class_count);
  
   
   dto.setClass_eventcheck(eventcheck);
   dto.setClass_eventstartdate(class_eventstartdate);
   dto.setClass_eventlastdate(class_eventlastdate);
   dto.setClass_eventprice(class_eventprice);
   
   dto.setClass_title(class_title);
   dto.setClass_content(class_content);
   
   //-------------------------------
   
   MediaDto mdto = new MediaDto();
   mdto.setClass_title(class_title);
   mdto.setMedia_extension("photo");
   mdto.setMedia_path(media_path);
   
   
  LessonBiz biz = new LessonBiz();
  int res = biz.insert(dto);
  
  MediaBiz mbiz = new MediaBiz();
  int mres = mbiz.mediainsert(mdto);
  
  if(res > 0 && mres > 0){
%>

	<script type="text/javascript">
	alert("강의 등록 성공");
	location.href="myclasslist.jsp?id=<%=class_writer %>";
	</script>
	
	<%
	
}else{
	%>

	<script type="text/javascript">
	   alert("강의등록 실패");
	   location.href="myinsert.jsp?id=<%=class_writer%>";
	</script>
		<%
	
}
%>

</body>
</html>