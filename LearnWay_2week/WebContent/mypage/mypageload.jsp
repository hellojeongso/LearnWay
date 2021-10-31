<%@page import="com.login.biz.LoginBiz"%>
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

<%
   String member_id = request.getParameter("id");
   System.out.println(member_id);
   
   LoginBiz biz = new LoginBiz();
   String select = biz.selectCheck(member_id);
   System.out.println(select);
   
   if(select.equals("1")){
      
%>
   <script type="text/javascript">
         location.href="mypage_tch.jsp?id=<%=member_id%>";
   </script>

<%
   }else if(select.equals("0")){      
 %>

   <script type="text/javascript">
         location.href="../admin_page/memberList.jsp?member_id=<%=member_id%>";
   </script>


   <% 
   }else{
%>
   <script type="text/javascript">
         location.href="mypage_stu.jsp?id=<%=member_id%>";
   </script>
<%

   }

%>
</body>
</html>