<%@page import="java.util.List"%>
<%@page import="com.noti.dto.NotiDto"%>
<%@page import="com.noti.biz.NotiBiz"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LearnWay - 온·오프라인으로 즐기는 다양한 클래스 - 공지사항</title>
</head>
<body>

<% 	
	String text = request.getParameter("text");
	System.out.println(text);
	NotiBiz biz = new NotiBiz();
	List<NotiDto> list = biz.searchList(text);
%>

	<h1> 공지사항 </h1>

	<table border="1">
		<col width="50px"/>
		<col width="100px"/>
		<col width="500px"/>
		<col width="100px"/>
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>

<% 
	for (NotiDto dto : list) {
%>

	<tr>
		<td><%=dto.getBoard_no() %></td>
		<td><%=dto.getBoard_id() %></td>
		<td><a href="noti_select.jsp?board_no=<%=dto.getBoard_no()%>"><%=dto.getBoard_title() %></a></td> 
		<td><%=dto.getBoard_date() %></td>
	</tr>
	
<%	
	}
%>

	<tr>
      	<td colspan="4" align="right">
       		<input type="button" value="글작성" onclick="location.href='noti_insert.jsp'" />
		</td>
		<td>
			<input type="text" name="noti_search" value="">
			<input type="button" value="검색" onclick="location.href='noti_searchlist.jsp?text=${noti_search}'" >
		</td>
	</tr>
	</table>			

</body>
</html>