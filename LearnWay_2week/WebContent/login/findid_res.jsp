<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.login.biz.LoginBiz"%>
<%@page import="com.login.dto.LoginDto"%>
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
		String member_name= request.getParameter("member_name");
		String member_email = request.getParameter("member_email");
		
		Map map = new HashMap();
		map.put("item1", member_name);
		map.put("item2", member_email);
		
	
		LoginBiz biz = new LoginBiz();
		String findid = biz.findId(map);
		
		System.out.println(findid);
		
		
	if(findid==null ){	
%>
	 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal({
			title : "아이디 찾기 실패",
			icon : "error"
		}).then(function() {
			location.href="findid.jsp";
		});
	
	 
		
	</script>
	

<%
	}else{
%>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal({
			title: "ID",
			text : "<%=findid%>",
			icon : "info"
		}).then(function() {
			   location.href="main_regist.jsp";	   
		});
		
	   

	</script>
	
<%
	}
%>


</body>
</html>