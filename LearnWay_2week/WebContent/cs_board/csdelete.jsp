<%@page import="com.cs.biz.CsBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	// SELECT에서 MYDELETE로 MYNO를 보내줬다. 
	int board_no = Integer.parseInt(request.getParameter("board_no"));
	String id = request.getParameter("id");

	CsBiz biz = new CsBiz();
	int res = biz.delete(board_no);
	// 비즈를 통해서 myno를 딜리트할거다
	
	if(res>0) {
%>	
	<script type="text/javascript">
		alert("글 삭제 성공");
		location.href="cs_list.jsp?board_no=<%=board_no%>&id=<%=id%>";
	</script>	
<% 
	} else {
%>	

	<script type="text/javascript">
		alert("글 삭제 실패");
		location.href="csselect.jsp??board_no=<%=board_no%>&id=<%=id%>";
	</script>
	
<%
	}
%>
	

</body>
</html>