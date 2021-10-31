<%@page import="com.login.dto.LoginDto"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.login.biz.LoginBiz"%>
<%@page import="com.login.dao.LoginDao"%>
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
   String member_id = request.getParameter("member_id");
   String member_pw = request.getParameter("member_pw");

   Map map = new HashMap();
   map.put("item1", member_id);
   map.put("item2", member_pw);

   System.out.println(member_id);
   System.out.println(member_pw);

   LoginBiz biz = new LoginBiz();
   LoginDao dao = new LoginDao();

   Integer check = biz.loginCheck(map);
   System.out.println(check);

   if (check == 1) {
      LoginDto dto = new LoginDto();
      dto = biz.login(map);

      int del = dto.getMember_del();

      if (del == 0) {
%>
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   <script type="text/javascript">
   swal({
         title: "<%=member_id%>님 환영합니다.♥",
         icon: "success" //"info,success,warning,error" 중 택1
      }).then(function() {
         location.href = "../index.jsp?id=<%=member_id%>";
      });
      
         
      
      
      </script>
           
      

<%
   } else {
%>

   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   <script type="text/javascript">
      swal({
         title: "탈퇴한 회원입니다." ,
         icon : "warning"
      }).then(function() {
         location.href = "main_regist.jsp";
      });
      
   </script>

<%
   }

   } else { // id, pw가 틀린 경우
%>
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   <script type="text/javascript">
   swal({
         title: "아이디와 비밀번호를 확인해주세요." ,
         icon: "error" 
      }).then(function() {
         location.href = "main_regist.jsp";
      });
   </script>
<%
   }
%>


</body>
</html>