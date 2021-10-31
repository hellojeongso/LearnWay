<%@page import="com.noti.biz.NotiBiz"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.noti.dao.NotiDao" %>
<%@ page import="com.noti.dto.NotiDto" %> 

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
   

   
   NotiBiz biz = new NotiBiz();
   
   int res = biz.update(board_no, board_content, board_title);
   
   if(res > 0) {
%>
      <script type="text/javascript">
         alert("글 수정 성공");
         location.href="noti_select.jsp?board_no=<%=board_no%>&id=<%=board_id%>";        
      </script>
<%
      } else {
%>
      <script type="text/javascript">
         alert("글 수정 실패");
         location.href="noti_update.jsp?board_no=<%=board_no%>&id=<%=board_id%>";      
      </script>
<%
      }
%>

</body>
</html>