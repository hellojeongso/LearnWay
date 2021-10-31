<%@page import="com.login.biz.LoginBiz"%>
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
    String id = request.getParameter("id");

	LoginBiz biz = new LoginBiz();
	id = biz.idCheck(id);
	System.out.println(id);
	
	if(id==null){	
%>
	<label>중복된 아이디가 아닙니다.</label>
	<input type="button" value="확인" onclick="window.close();">
<%
	}else{
%>
	<label>중복된 아이디입니다.</label>
	<input type="button" value="확인" onclick="window.close();">
<%
	}
%>     
	
	
         
</body>
</html>




