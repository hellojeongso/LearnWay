<%@page import="com.lesson.dto.LessonDto"%>
<%@page import="java.util.List"%>
<%@page import="com.lesson.biz.LessonBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("texthtml; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 강의 목록</title>
<script type="text/javascript"
	src="/LearnWay/myclasspage/se2/smarteditor2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<style type="text/css">
body {
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
.container {
    padding: 0px 10px;
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

</style>
</head>
<body>
	
	
		<%
		LessonBiz biz = new LessonBiz();
	
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	
		//List<LessonDto> list = biz.select_tchlist(request.getParameter("id"));  //id를 안쓴다는 조건, 
	
		String member_id = request.getParameter("id");
		List<LessonDto> list = biz.select_tchlist(member_id);
		%>
	
	
		<!--  강사 마이페이지 -> 내 강의 목-->
		<br>
		<br>
		<div class="container">
			<div class="page-header">
				<div class="col-md-30">
					<div class="title-header text-center">
						<h1>내 강의 목록</h1>
					</div>
				</div>
			</div>
		</div>
		<br>
		<br>
		<div class="content_sub_wrap_box" style="padding-top:0">
		<div class="container">
			<div class="text-center" style="width: 910px; margin-left: 100px;">
				<div class="title-header text-center">
	
					<table>
						<col width="700px">
						<col width="400px">
						<col width="100px">
						<col width="100px">
						<tr style="background-color:#CCCCCC">
						
							<th style="width: 8%;">강의번호</th>
							<th>강의제목</th>
							<th style="width: 10%;">수강시작일</th>
							<th style="width: 10%;">수강종료일</th>
						</tr>
						
	
						<%
						for (LessonDto dto : list) {
						%>
						<tr>
							<td style="background-color:WhiteSmoke"><%=dto.getClass_no()%></td>
							<td><a href="myclass_selectone.jsp?no=<%=dto.getClass_no()%>"><%=dto.getClass_title()%></a></td>
							<td style="background-color:WhiteSmoke"><%=date.format(dto.getClass_startdate())%></td>
							<td style="background-color:WhiteSmoke"><%=date.format(dto.getClass_lastdate())%></td>
						</tr>
	
						<%
						}
						%>
						<tr>
	
							<td colspan="4" align="right">
							<input type="button" class="btn btn-secondary" value="강의등록" onclick="location.href='myclassinsert_css.jsp?class_writer=<%=member_id%>'">
							<input type="button" class="btn btn-secondary" value="뒤로가기" onclick="location.href='mypage_tch.jsp?id=<%=member_id%>'"></td>		
						</tr>
					</table>
				</div>
			</div>
		</div>
		</div>
		<br>
		<br>
		<br>
		
		<!-- 페이지 가운데로 몰기 -->
	<!--  <div class="form-group" style="margin-left:600px; margin-bottom:20px;" >
		<div class="board_num">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href=""> < </a></li>
				<li class="page-item"><a class="page-link" href="">1</a></li>
				<li class="page-item"><a class="page-link" href="">2</a></li>
				<li class="page-item"><a class="page-link" href="">3</a></li>
				<li class="page-item"><a class="page-link" href="">4</a></li>
				<li class="page-item"><a class="page-link" href="">5</a></li>
				<li><a class="page-link" href=""> > </a></li>
			</ul>

		</div>
	</div> -->
	<br>
	<br>
	<br>
</body>
</html>