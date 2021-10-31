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
	
	int boardgroup_no = Integer.parseInt(request.getParameter("boardgroup_no"));
	String board_id = request.getParameter("board_id");
	String board_title = request.getParameter("board_title");
	String board_content = request.getParameter("board_content");
	
	System.out.println("번호 : " + boardgroup_no);
	System.out.println("id : " + board_id);
	System.out.println("title : " + board_title);
	System.out.println("content : " + board_content);
	
	CsDto dto = new CsDto();
	
	dto.setBoard_id(board_id);
	dto.setBoard_title(board_title);
	dto.setBoard_content(board_content);
	dto.setBoardgroup_no(boardgroup_no);
	
	System.out.println("dto 담기 성공");
	
	CsBiz biz = new CsBiz();
	int res = biz.answerInsert(dto);
	
	if (res > 0){
%>
	
	<script type="text/javascript">
		alert("답변 성공");
		location.href="cs_list.jsp";		
	</script>
<%
	} else {
%>

	<script type="text/javascript">
		alert("답변 실패");
		location.href="csselect.jsp?board_no=<%=boardgroup_no%>";		
	</script>

<%
	}
%>

</body>
</html>