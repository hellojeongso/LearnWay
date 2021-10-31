<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
String member_name = request.getParameter("member_name");
String member_phone = request.getParameter("member_phone");
String member_addr = request.getParameter("member_addr");

System.out.println(member_id);
System.out.println(member_name);
System.out.println(member_phone);
System.out.println(member_addr);

Map map = new HashMap();
map.put("item1",member_id);
map.put("item2",member_name);
map.put("item3",member_phone);
map.put("item4",member_addr);

LoginBiz biz = new LoginBiz();

int res = biz.mypageupdate(map);

if(res > 0){ 
%>
     

 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   <script type="text/javascript">
      swal({
         title : "정보가 수정되었습니다 ! ",
         icon : "success"
      }).then(function() {
         location.href="mypage_stu.jsp?id=<%=member_id %>";
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
         location.href="mypage_info_update_stu.jsp?member_id=<%=member_id%>";
      });
   
    
      
   </script>
  
  
  
<%
}
%>

</body>
</html>