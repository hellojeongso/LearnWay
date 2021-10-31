<%@page import="com.noti.biz.NotiBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

response.setContentType("text/html; charset=UTF-8");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	int board_no = Integer.parseInt(request.getParameter("board_no"));
	String id = request.getParameter("id");

	NotiBiz biz = new NotiBiz();
	int res = biz.delete(board_no);
	
	if (res > 0) {
%>
	<script type="text/javascript">
		alert("글 삭제 성공");
		location.href = "noti_list.jsp?board_no=<%=board_no%>&id=<%=id%>";
	</script>
<%
	} else {
%>
	<script type="text/javascript">
		alert("글 삭제 실패");
		location.href="noti_select.jsp?board_no=<%=board_no%>&id=<%=id%>";
	</script>
<%
	}
%>



</body>
</html>

