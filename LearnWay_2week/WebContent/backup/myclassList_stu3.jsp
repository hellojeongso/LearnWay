<%@page import="com.myclass.dto.MyclassDto"%>
<%@page import="java.util.List"%>
<%@page import="com.myclass.biz.MyclassBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
   
  <% request.setCharacterEncoding("UTF-8"); %>
  <% response.setContentType("texthtml; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/9b7675f701.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/stylesheet.css" type="text/css"/>
</head>
<body>
<%
	String member_id = request.getParameter("id");
		
	MyclassBiz biz = new MyclassBiz();
	List<MyclassDto> list = biz.myclassList(member_id);
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
%>
<jsp:include page="../header.jsp"></jsp:include>
	<h1>내 수강 목록</h1>
	 <table>
	
	   <col width="100px">
	   <col width="400px">
	   <col width="100px">
	   <col width="100px">
	   <col width="100px">
	      <tr>
		      <th>강의번호</th>
		      <th>강의제목</th>
		      <th>강사이름</th>
		      <th>수강시작일</th>
		      <th>수강종료일</th>
	      </tr>
<%

	 for(MyclassDto dto : list){
%>
    <tr>
       <td><%= dto.getMyclass_no() %></td>
       <td><a href="../lesson_board/lessonselectone.jsp?id=<%=member_id %>&class_no=<%=dto.getClass_no() %>"><%=dto.getClass_title()%></a></td>
       <td><%= dto.getClass_writer() %></td>
       <td><%= date.format(dto.getClass_startdate()) %></td>
       <td><%= date.format(dto.getClass_lastdate()) %></td>
    </tr>  
<%
	 }
%>
      <tr>
	     <td colspan="5" align="right">
	        <input type="button" value="뒤로가기" onclick="location.href='mypage_stu.jsp?id=<%=member_id%>'">
	      </td>
	      
	  </tr>
</table>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>