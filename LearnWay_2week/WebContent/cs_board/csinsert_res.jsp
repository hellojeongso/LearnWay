<%@page import="com.cs.biz.CsBiz"%>
<%@page import="com.cs.dto.CsDto"%>
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
	request.setCharacterEncoding("utf-8");

	String board_id = request.getParameter("board_id");
	String board_title = request.getParameter("board_title");
	String board_content = request.getParameter("board_content");
	
	System.out.println(board_title);
	System.out.println(board_content);
	CsDto dto = new CsDto();
	
	dto.setBoard_id(board_id);
	dto.setBoard_title(board_title);
	dto.setBoard_content(board_content);
	
	
	CsBiz biz = new CsBiz();
	int res = biz.insert(dto);
	
	if (res > 0){
%>
	
	<script type="text/javascript">
		alert("글 작성 성공");
		location.href="cs_list.jsp?id=<%=board_id%>";		
	</script>
<%
	} else {
%>

	<script type="text/javascript">
		alert("글 작성 실패");
		location.href="csinsert.jsp?id=<%=board_id%>";		
	</script>

<%
	}
%>

</body>
</html>