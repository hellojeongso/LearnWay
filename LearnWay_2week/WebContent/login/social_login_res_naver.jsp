<%@page import="com.login.biz.LoginBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%

	String email = request.getParameter("email");
	
	LoginBiz biz = new LoginBiz();
	String res = biz.selectone(email,"naver");
	
	System.out.println(res);
	
	if(res == null) {
%>
<script type="text/javascript">
	location.href= "social_regist.jsp?email=<%=email%>&platform=naver";
</script>

<%

	} else {
%>

	<script type="text/javascript">		
		location.href= "../index.jsp?id=<%=email%>";
	</script>	

<% 	
	}
	
%>



</body>
</html>