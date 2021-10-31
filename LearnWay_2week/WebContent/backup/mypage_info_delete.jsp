<%@page import="com.login.biz.LoginBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <% request.setCharacterEncoding("UTF-8"); %>
  <% response.setContentType("texthtml; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
String member_id = request.getParameter("member_id");

LoginBiz biz = new LoginBiz();
int res = biz.memberdel(member_id);


if(res > 0){


%>

<script type="text/javascript">
  alert("회원 정보 삭제 성공");
  location.href="mylist.jsp";
</script>



<%
}else{
%>

<script type="text/javascript">
  alert("정보 삭제 실패 ");
  location.href= "mypage.jsp?member_id=<%=member_id%>";
</script>

<%
}
%>

</body>
</html>
