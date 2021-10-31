<%@page import="com.adminPage.dto.learnDto"%>
<%@page import="com.adminPage.dto.adminPageDto"%>
<%@page import="com.adminPage.biz.adminListBiz"%>
<%@page import="java.util.List"%>
<%@   page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%   boolean admincheck = true;
   adminListBiz biz = new adminListBiz();

   String member_id = request.getParameter("member_id");
   int result = biz.adminCheck(member_id);
   if(result != 0) { admincheck = false;%>
<script type="text/javascript">alert("관리자만 입장이 가능합니다"); window.history.back();</script>
<%   } else { admincheck = true; System.out.println("관리자 입장"); }
   
   List<adminPageDto> memberList = biz.selectList();
   List<learnDto> learnList = biz.learnList();
   
%>
<script type="text/javascript">
var memberscrollmax = 19;
var memberscroll = 19;
var learnscrollmax = 29;
var learnscroll = 29;
var scrollname = true;

function memberList(){
   var user = document.getElementById("userList");
   var learn = document.getElementById("learnList");
   user.removeAttribute("hidden");
   learn.setAttribute("hidden","");
   scrollname = true;
}

function learnList(){
   var user = document.getElementById("userList");
   var learn = document.getElementById("learnList");
   learn.removeAttribute("hidden");
   user.setAttribute("hidden","");
   scrollname = false;
}

$(document).scroll(function(){
   if($(window).scrollTop() >= ($(document).height() - $(window).height())){ // 스크롤 높이 >= 사이트 크기 - 화면 크기
      if(scrollname){
         for(var a = 0; a < memberscrollmax; a++ ){
            var tr = document.getElementById("member"+memberscroll);
            tr.removeAttribute("hidden");
            memberscroll++;
         }memberscrollmax += 20;
      } else {
         for(var a = 0; a < learnscrollmax; a++ ){
            var tr = document.getElementById("learn"+learnscroll);
            tr.removeAttribute("hidden");
            learnscroll++;
         }learnscrollmax += 30;
      }
   }
})

</script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<style type="text/css">
body{
   font-family: "Lato", sans-serif;
}
h1{
   color: white;
}
.page-header{
   background-color: #777;
   font-color: #white;
   padding: 10px;
}
.center{
   color: #000;
}
.board_num {
    text-align: center;
}
table{
   border-top: 1px solid black;
   border-bottom: 1px solid black;
   padding-top: 10px;
   padding-bottom: 10px;
}   
td{
   border-top: 1px solid black;
   border-bottom: 1px solid black;
}
.container {
    padding: 0px 10px;
}


</style>
</head>
<body>
   <br>
      <br>
      <div class="container">
         <div class="page-header">
            <div class="col-md-30">
               <div class="title-header text-center">
                  <h1>관리자 페이지</h1>
               </div>
            </div>
         </div>
      </div>
      <br>
      <br>
   
      <div class="content_sub_wrap_box" style="padding-top:0">
      <div class="container">
         <div class="text-center" style="width: 1200px;">
            <div class="title-header text-center">
      <div id="menu">
      <div colspan="4" align="center" style="margin-right:100px;">
         <input type="button" class="btn btn-secondary" value="멤버목록" onclick="memberList();">
         <input type="button" class="btn btn-secondary" value="강의목록" onclick="learnList();">
         <input type="button" class="btn btn-secondary" value="Home" onclick="location.href='../index.jsp?id=<%=member_id%>'">
      </div>
      </div>
      <br>
      
      <div class="text-center" id="userList" style="margin-right:100px;">
         <table>
            <col width="100px">
            <col width="200px">
            <col width="250px">
            <col width="100px">
            <col width="1200px">
            <col width="170px">
            <col width="300px">
            <col width="100px">
            <col width="100px">
            <col width="230px">
            <col width="260px">
            <tr style="background-color:#CCCCCC">
               <th>번호</th>
               <th>아이디</th>
               <th>이름</th>
               <th>생년월일</th>
               <th>주소</th>
               <th>핸드폰번호</th>
               <th>이메일</th>
               <th>성별</th>
               <th>권한</th>
               <th>회원탈퇴</th>
               <th>가입일</th>
            </tr>
            <%if(memberList.size() == 0){ %>
            <tr><td colspan="11">-----회원이 없습니다-----</td></tr>
            <% } else {if(admincheck){for(int a = 0; a < memberList.size(); a++){ 
               adminPageDto dto = memberList.get(a);
               if(a < 19){
               %>   <tr id="member<%=a%>">
               <%} else { %>
                  <tr id="member<%=a%>" hidden="">
               <%} %>
                     <td><%=dto.getMember_no() %></td>
                     <td><%=dto.getMember_id() %></td>
                     <td><%=dto.getMember_name() %></td>
                     <td><%=dto.getMember_birth() %></td>
                     <td><%=dto.getMember_addr() %></td>
                     <td><%=dto.getMember_phone() %></td>
                     <td><%=dto.getMember_email() %></td>
                     <td><%=(dto.getMember_gender().equals("F"))? "여자" : "남자" %></td>
                     <%switch(dto.getMember_select()){
                     case 0:%><td>관리자</td><%break; 
                     case 1:%><td>강사</td><%break; 
                     case 2:%><td>학생</td><%break; 
                     } %>
                     <td><%=(dto.getMember_del() == 0)? "회원": "탈퇴" %></td>
                     <td><%=dto.getMember_regdate() %></td>
                  </tr>
               <% }
               } 
            } %>
         </table>
      </div>
      </div>
      </div>
      </div>
      </div>
      
      <div id="learnList" hidden="">
         <table>
            <col width="70px">
            <col width="1500px">
            <col width="200px">
            <col width="130px">
            <col width="130px">
            <tr style="background-color:#CCCCCC">
               <th>번호</th>
               <th>제목</th>
               <th>강사이름</th>
               <th>시작일</th>
               <th>종료일</th>
            </tr>
            <%if(learnList.size() == 0){ %>
            <tr><td colspan="6" style="text-align: center;">-----강의가 없습니다-----</td></tr>
            <% } else {if(admincheck){for(int a = 0; a < learnList.size(); a++){ 
               learnDto dto = learnList.get(a);
               if(a < 29){
               %>   <tr id="learn<%=a%>">
               <%} else { %>
                  <tr id="learn<%=a%>" hidden="">
               <%} %>
                        <td><%=dto.getClass_no() %></td>
                        <td><a href="../mypage/myclass_selectone.jsp?no=<%=dto.getClass_no() %>"><%=dto.getClass_title() %></a></td>
                        <td><%=dto.getClass_writer() %></td>
                        <td><%=dto.getClass_startdate() %></td>
                        <td><%=dto.getClass_lastdate() %></td>
                     </tr>
                  <% }
               } 
            } %>
         </table>
      </div>
   
<br>
<br>
<br>
    <div class="form-group" style="margin-left:600px; margin-bottom:20px;" >
      <div class="board_num">

      </div>
   </div>
   <br>
   <br>
   <br>
   
   
</body>
</html>