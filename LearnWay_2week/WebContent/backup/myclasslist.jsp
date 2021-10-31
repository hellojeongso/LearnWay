<%@page import="com.lesson.dto.LessonDto"%>
<%@page import="java.util.List"%>
<%@page import="com.lesson.biz.LessonBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
   
  <% request.setCharacterEncoding("UTF-8"); %>
  <% response.setContentType("texthtml; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 강의 목록</title>
</head>
<body>


<%
  LessonBiz biz = new LessonBiz();

  SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");


 //List<LessonDto> list = biz.select_tchlist(request.getParameter("id"));  //id를 안쓴다는 조건, 

  String member_id = request.getParameter("id");
  List<LessonDto> list = biz.select_tchlist(member_id);
%>


<!--  강사 마이페이지 -> 내 강의 목-->
<h1>내 강의 목록 (강사용 페이지)</h1>
 <table border ="1">

   <col width="60px">
   <col width="400px">
   <col width="100px">
   <col width="100px">
      <tr>
	      <th>강의번호</th>
	      <th>강의제목</th>
	      <th>수강시작일</th>
	      <th>수강종료일</th>
      </tr>
<%
  for(LessonDto dto : list){
%>      
    <tr>
       <td><%= dto.getClass_no() %></td>
       <td><a href="myclass_selectone.jsp?no=<%=dto.getClass_no()%>"><%=dto.getClass_title()%></a></td>
       <td><%= date.format(dto.getClass_startdate()) %></td>
       <td><%= date.format(dto.getClass_lastdate()) %></td>
    </tr>  
    
<% 
    }
%>
      <tr>
	     <td colspan="4" align="right">
	        <input type="button" value="강의등록" onclick="location.href='myclassinsert_css.jsp?class_writer=<%=member_id %>'">
	        <input type="button" value="뒤로가기" onclick="location.href='mypage_tch.jsp?id=<%=member_id%>'">
	      </td>
	      
	  </tr>
</table>

</body>
</html>