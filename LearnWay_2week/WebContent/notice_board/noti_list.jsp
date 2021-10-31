<%@page import="com.login.biz.LoginBiz"%>
<%@page import="java.util.List"%>
<%@page import="com.noti.dto.NotiDto"%>
<%@page import="com.noti.biz.NotiBiz"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LearnWay - 온·오프라인으로 즐기는 다양한 클래스 - 공지사항</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/9b7675f701.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/main.css" type="text/css"/>
<style type="text/css">

body {
	width:100%;
}
main { 
   background:#fff;
   padding: 30px 30px 10px 30px;
}

#insert-bt {
	float: right;
}




</style>
</head>
<body>
<% 
   String text = request.getParameter("noti_search");
   String id = request.getParameter("id");
   LoginBiz logbiz = new LoginBiz();
   String select = logbiz.selectCheck(id);
   System.out.println(text);
   NotiBiz biz = new NotiBiz();
   List<NotiDto> list = null;
   
   if(text==null){
      list = biz.selectList();
   }else{
      list = biz.searchList(text);
   }


   System.out.println(select);
%>
<script type="text/javascript">
   var select = <%=select%>;
   
   function select_insert() {
      if(select == "0"){
         location.href = 'noti_insert.jsp?id=<%=id%>';
      }else{
         alert("관리자가 아닙니다.");
      }   
   }

</script>

<script type="text/javascript">
   var pagenum = 0;// 페이지 넘어간 횟수
   var listsize = <%=list.size()%>;
   // 기본 페이지(1~5) 시작 ~ 끝 숫자
   var onepage = 0;
   var onepagemax = 19;
   var twopage = 20;
   var twopagemax = 39;
   var threepage = 40;
   var threepagemax = 59;
   var fourpage = 60;
   var fourpagemax = 79;
   var fivepage = 80;
   var fivepagemax = 99;
   function one(){
      var num = pagenum * 20 // 목록이 1~5면 첫번째(1)페이지가 0~19페이지 목록이 2~6 이면 첫번째(2)페이지가 20~39페이지
      start = onepage + num;
      stop = onepagemax + num; // 페이지 체크
      // 페이지 최대 크기보다 리스트가 작을때 실행하지 않음
      if(listsize > start || listsize > stop){
         // 페이지 히든걸기
         for(var a = 0; a < listsize;a++){
            document.getElementsByClassName("list")[a].setAttribute("hidden","");
         }
         // 원하는 해당 페이지 히든 풀기
         for(var a = start; a < stop; a++){
            if(a >= listsize){break;}
            document.getElementsByClassName("list")[a].removeAttribute("hidden");
         }
      }
   }
   function two(){
      var num = pagenum * 20 // 목록이 1~5면 첫번째(1)페이지가 0~19페이지 목록이 2~6 이면 첫번째(2)페이지가 20~39페이지
      start = twopage + num;
      stop = twopagemax + num; // 페이지 체크
      if(listsize > start || listsize > stop){
         for(var a = 0; a < listsize;a++){
            document.getElementsByClassName("list")[a].setAttribute("hidden","");
         }
         for(var a = start; a < stop; a++){
            if(a >= listsize){break;}
            document.getElementsByClassName("list")[a].removeAttribute("hidden");
         }
      }
   }
   function three(){
      var num = pagenum * 20 // 목록이 1~5면 첫번째(1)페이지가 0~19페이지 목록이 2~6 이면 첫번째(2)페이지가 20~39페이지
      start = threepage + num;
      stop = threepagemax + num; // 페이지 체크
      if(listsize > start || listsize > stop){
         for(var a = 0; a < listsize;a++){
            document.getElementsByClassName("list")[a].setAttribute("hidden","");
         }
         for(var a = start; a < stop; a++){
            if(a >= listsize){break;}
            document.getElementsByClassName("list")[a].removeAttribute("hidden");
         }
      }
   }
   function four(){
      var num = pagenum * 20 // 목록이 1~5면 첫번째(1)페이지가 0~19페이지 목록이 2~6 이면 첫번째(2)페이지가 20~39페이지
      start = fourpage + num;
      stop = fourpagemax + num; // 페이지 체크
      if(listsize > start || listsize > stop){
         for(var a = 0; a < listsize;a++){
            document.getElementsByClassName("list")[a].setAttribute("hidden","");
         }
         for(var a = start; a < stop; a++){
            if(a >= listsize){break;}
            document.getElementsByClassName("list")[a].removeAttribute("hidden");
         }
      }
   }
   function five(){
      var num = pagenum * 20 // 목록이 1~5면 첫번째(1)페이지가 0~19페이지 목록이 2~6 이면 첫번째(2)페이지가 20~39페이지
      start = fivepage + num;
      stop = fivepagemax + num; // 페이지 체크
      if(listsize > start || listsize > stop){
         for(var a = 0; a < listsize;a++){
            document.getElementsByClassName("list")[a].setAttribute("hidden","");
         }
         for(var a = start; a < stop; a++){
            if(a >= listsize){break;}
            document.getElementsByClassName("list")[a].removeAttribute("hidden");
         }
      }
   }
   function back(){
      pagenum = pagenum - 1;
      var num = document.getElementsByClassName("pageing");
      for(var a = 0;a < 5; a++){
         num[a].textContent=Number(num[a].textContent)-1;
      }
      if(pagenum < 0){
         pagenum = 0;
         num[0].textContent=1;
         num[1].textContent=2;
         num[2].textContent=3;
         num[3].textContent=4;
         num[4].textContent=5;
      }
   }
   function next(){
      pagenum = pagenum + 1;
      var num = document.getElementsByClassName("pageing");
      for(var a = 0;a < 5; a++){
         num[a].textContent=Number(num[a].textContent)+1;
      }
   }
</script>
<header>
<jsp:include page="../header.jsp?id=<%=id %>"></jsp:include>
<div class="category">
      <a href="#"><i class="fas fa-desktop"></i> IT</a>
      <a href="#"><i class="fas fa-utensils"></i> Cooking</a>
      <a href="#"><i class="fas fa-language"></i> Language</a>
      <a href="#"><i class="fas fa-coins"></i> Stock</a>
      <a href="#"><i class="fas fa-palette"></i> Art</a>
      <a href="#"><i class="fas fa-running"></i> Sport</a>
      <a href="#"><i class="fas fa-map-marked"></i> Around Teacher</a>
</div>
</header>


<main>
<form action="noti_list.jsp" method="post">
   <input type = "hidden" name="id" value="<%=id%>">
   
      <h3><b> 공지사항 </b></h3>
      <br>
      <table class="table table-hover table-md">
         <col width="5%"/>
         <col width="15%"/>
         <col width="55%"/>
         <col width="25%"/>
         <tr>
            <th style="text-align:center;">번호</th>
            <th style="text-align:center;">작성자</th>
            <th style="text-align:center;">제목</th>
            <th style="text-align:center;">작성일</th>
         </tr>
   
<% // 페이지 20부터 히든처리
   for (int a = 0; a < list.size(); a++) {
      NotiDto dto = list.get(a);
      if(a < 19){%>
      <tr class="list" id="list<%=a%>">
      <%} else { %>
      <tr class="list" id="list<%=a%>" hidden="">
      <%} %>
         <td style="text-align:center;"><%=dto.getBoard_no() %></td>
         <td style="text-align:center;"><%=dto.getBoard_id() %></td>
         <td><a href="noti_select.jsp?board_no=<%=dto.getBoard_no()%>&id=<%=id%>"><%=dto.getBoard_title() %></a></td> 
         <td style="text-align:center;"><%=dto.getBoard_date() %></td>
      </tr>
      
   <%   
      }
   %>
<nav aria-label="Page navigation example">
<tr>
   <td colspan="4" align="center">
        <ul class="pagination justify-content-center">
          <li class="page-item"><a class="page-link" onclick="back();">&laquo;</a></li>
          <li class="page-item"><a class="page-link" onclick="one();">1</a></li>
          <li class="page-item"><a class="page-link" onclick="two();">2</a></li>
          <li class="page-item"><a class="page-link" onclick="three();">3</a></li>
          <li class="page-item"><a class="page-link" onclick="four();">4</a></li>
          <li class="page-item"><a class="page-link" onclick="five();">5</a></li>
          <li class="page-item"><a class="page-link" onclick="next();">&raquo;</a></li>
        </ul>
   </td>
</tr>  
</nav>
      <tr>
         <td colspan="4" align="center">
            <input type="text" name="noti_search" value="" style="text-align:center; width:400px;">
            <input type="submit" value="검색" class="btn btn-outline-dark">
            <input type="button" value="글 작성" onclick="select_insert();" class="btn btn-outline-dark" id="insert-bt">
         </td>
      </tr>

      </table>         
</form>
</main>
<%@include file="../footer.jsp"%> 


</body>
</html>