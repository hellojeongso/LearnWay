<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
    int member_select = Integer.parseInt(request.getParameter("member_select"));
	String member_id = request.getParameter("member_id");
	String member_pw = request.getParameter("member_pw");
	String member_name = request.getParameter("member_name");
	String member_gender = request.getParameter("member_gender");
	String member_birth = request.getParameter("member_birth");
	String member_email = request.getParameter("member_email");
	String member_phone = request.getParameter("member_phone");
	
	String member_postcode = request.getParameter("member_postcode");
	String member_address = request.getParameter("member_address");
	String member_detailAddress = request.getParameter("member_detailAddress");
	String member_extraAddress = request.getParameter("member_extraAddress");
	
    String member_addr = member_address+member_extraAddress;
    
    String member_question = request.getParameter("question");
    String member_answer = request.getParameter("answer");
    
    
	
	LoginDto dto = new LoginDto();
	
	dto.setMember_id(member_id); 
	dto.setMember_pw(member_pw); 
	dto.setMember_name(member_name);
	dto.setMember_birth(member_birth);
	dto.setMember_addr(member_addr);
	dto.setMember_phone(member_phone);
	dto.setMember_email(member_email);
	dto.setMember_gender(member_gender);
	dto.setMember_select(member_select);
	dto.setMember_question(member_question);
	dto.setMember_answer(member_answer);
	
	System.out.println(member_id);
	System.out.println(member_pw);
	System.out.println(member_name);
	System.out.println(member_birth);
	System.out.println(member_addr);
	System.out.println(member_phone);
	System.out.println(member_email);
	System.out.println(member_gender);
	System.out.println(member_select);
	System.out.println(member_question);
	System.out.println(member_answer);

	
	
    LoginBiz biz = new LoginBiz();
	int res = biz.insert(dto);
	if(res > 0){
	
%>

	<script type="text/javascript">
	alert("회원가입 성공");
	location.href="../index.jsp";
	</script>
	
	<%
	
}else{
	%>

	<script type="text/javascript">
	   alert("회원가입 실패");
	   location.href="inmain_regist.jsp";	   
	</script>
		<%
	
}
%>


 
</body>
</html>