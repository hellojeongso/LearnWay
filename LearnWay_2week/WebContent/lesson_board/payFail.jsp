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
<h1>실패</h1>

<input type="button" value="창닫기" onClick="window.close()">
<script type="text/javascript">
	alert("결제실패");
	self.close();
</script>

</body>
</html>