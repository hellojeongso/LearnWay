<%@page import="com.myclass.dto.MyclassDto"%>
<%@page import="com.myclass.biz.MyclassBiz"%>
<%@page import="java.util.Date"%>
<%@page import="com.lesson.dto.LessonDto"%>
<%@page import="com.lesson.biz.LessonBiz"%>
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
<title>Insert title here</title>
</head>
<body>
<%
	int class_no = Integer.parseInt(request.getParameter("class_no"));
	String member_id = request.getParameter("member_id");
	LessonBiz lbiz = new LessonBiz();
	LessonDto ldto = new LessonDto();
	ldto = lbiz.selectOne(class_no);
	
	String class_title = ldto.getClass_title();
	String class_writer = ldto.getClass_writer();
	Date class_startdate = ldto.getClass_startdate();
	Date class_lastdate = ldto.getClass_lastdate();

	System.out.println(class_no);
	System.out.println(class_title);
	System.out.println(class_writer);
	System.out.println(class_startdate);
	System.out.println(class_lastdate);
	System.out.println(member_id);
	
	MyclassDto mdto = new MyclassDto();
	mdto.setClass_no(class_no);
	mdto.setClass_title(class_title);
	mdto.setClass_writer(class_writer);
	mdto.setClass_startdate(class_startdate);
	mdto.setClass_lastdate(class_lastdate);
	mdto.setMember_id(member_id);
	
	MyclassBiz mbiz = new MyclassBiz();
	int res = mbiz.myclassInsert(mdto);
	
	if(res>0){
%>
	<script type="text/javascript">
		alert("결제성공");
		self.close();
	</script>
<%
	}else{
%>
		
	<input type="button" value="창닫기" onClick="window.close()">
	<script type="text/javascript">
		alert("결제실패");
		self.close();
	</script>
<%
	}
%>
</body>
</html>