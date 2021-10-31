<%@page import="com.login.biz.LoginBiz"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
	String member_name = request.getParameter("member_name");
	String member_email = request.getParameter("member_email");
	String member_question= request.getParameter("member_question");
	String member_answer= request.getParameter("member_answer");
	System.out.println(member_name);
	System.out.println(member_email);
	System.out.println(member_question);
	System.out.println(member_answer);
	
	
	Map map = new HashMap();
	map.put("item1", member_name);
	map.put("item2", member_email);
	map.put("item3", member_question);
	map.put("item4", member_answer);

	LoginBiz biz = new LoginBiz();
	String findpw = biz.findPw(map);
	
	System.out.println(findpw);
	
	if(findpw == null){

%>
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal({
			title : "비밀번호 찾기 실패",
			icon : "error"
		}).then(function() {
			location.href="findpw.jsp";
		});
	
	 
		
	</script>
	

<%
	}else{

%>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal({
			title: "PASSWORD",
			text : "<%=findpw%>",
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