<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.cs.biz.CsBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cs.dao.CsDao" %>
<%@ page import="com.cs.dto.CsDto" %> 

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	
	
	int board_no = Integer.parseInt(request.getParameter("board_no"));
	String board_title = request.getParameter("board_title");
	String board_content = request.getParameter("board_content");
	String board_id = request.getParameter("board_id");
	

	
	System.out.println(board_no);
	System.out.println(board_title);
	System.out.println(board_content);
	

	
	CsBiz biz = new CsBiz();
	
	int res = biz.update(board_no, board_content, board_title);
	
	if(res > 0) {
%>
		<script type="text/javascript">
			alert("글 수정 성공");
			location.href="csselect.jsp?board_no=<%=board_no%>&id=<%=board_id%>";			
		</script>
<%
		} else {
%>
		<script type="text/javascript">
			alert("글 수정 실패");
			location.href="csupdate.jsp?board_no=<%=board_no%>&id=<%=board_id%>";		
		</script>
<%
		}
%>

</body>
</html>