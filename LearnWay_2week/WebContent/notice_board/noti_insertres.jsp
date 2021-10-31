<%@page import="com.noti.biz.NotiBiz"%>
<%@page import="com.noti.dto.NotiDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String board_id = request.getParameter("board_id");
	String board_title = request.getParameter("board_title");
	String board_content = request.getParameter("board_content");
	
	System.out.println(board_title);
	System.out.println(board_content);
	NotiDto dto = new NotiDto();
	
	dto.setBoard_title(board_title);
	dto.setBoard_content(board_content);
	
	
	NotiBiz biz = new NotiBiz();
	int res = biz.insert(dto);
	
	if (res > 0){
%>
	
	<script type="text/javascript">
		alert("글 작성 성공");
		location.href="noti_list.jsp?id=<%=board_id%>";		
	</script>
<%
	} else {
%>

	<script type="text/javascript">
		alert("글 작성 실패");
		location.href="noti_insert.jsp?id=<%=board_id%>";		
	</script>

<%
	}
%>

</body>
</html>