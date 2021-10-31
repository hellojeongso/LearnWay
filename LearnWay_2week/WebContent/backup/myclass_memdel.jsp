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
	int res = biz.memberdel(member_id);
	
	if(res>0){
%>
	 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal({
			title : "회원 탈퇴 성공! ",
			icon : "success"
		}).then(function() {
			location.href="../index.jsp";
		});
	
	 
		
	</script>
<%
	}else{

%>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal({
			title : "다시 시도해주세요  ",
			icon : "error"
		}).then(function() {
			location.href="../index.jsp?id=<%=member_id%>";
		});
	
	</script>
<%
	}
%>
</body>
</html>