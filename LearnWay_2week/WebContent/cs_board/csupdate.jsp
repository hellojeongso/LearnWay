<%@page import="com.cs.biz.CsBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cs.dao.CsDao" %>
<%@ page import="com.cs.dto.CsDto" %>    

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here </title>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="se2/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
var oEditors = [];

$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "se2/smarteditor2/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          
          
          fOnAppLoad : function(){
			  
        	  
        	  
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["ir1"].exec("PASTE_HTML", [text]);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});
 

</script>
<style type="text/css">


 .read{
	border-collapse: separate;
	border-spacing: 0 10px;
}



</style>

</head>
<body>

<%
	int board_no = Integer.parseInt(request.getParameter("board_no"));
	String board_id = request.getParameter("id");
			
	CsBiz biz = new CsBiz();
	CsDto dto = biz.selectOne(board_no);


%>
<header>
<jsp:include page="../header.jsp"></jsp:include>
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

	<form id="frm" action="csupdate_res.jsp" method="post">
	<input type="hidden" name="board_no" value="<%=dto.getBoard_no()%>"/>		<!-- 글번호가 안보이게 했다. -->
	<input type="hidden" name="board_id" value="<%=board_id%>"/>
	<table style="margin:30px auto 30px auto;" class="read">
			<tr>
				<td style="font-size: 12px;">작성자　</td>
				 <!-- 고정 -->
				<td><input type="text" class="form-control form-control-sm" value="<%=dto.getBoard_id() %>" style="width:150px" readonly="readonly"/></td>
			</tr>
			<tr>
				<td style="font-size: 12px;">제목</td> <!-- 수정이 가능하게! -->
				<td><input type="text" name="board_title" style="width:680px" value="<%=dto.getBoard_title()%>" class="form-control form-control-sm" ></td>
			</tr>
			<tr>
				<td style="font-size: 12px;">내용</td> <!-- 수정이 가능하게! -->
				<td><textarea rows="10" cols="30" id="ir1" name="board_content" style="width:678px; height:350px; "><%=dto.getBoard_content()%></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="button" id="save" value="수정" class="btn btn-outline-dark"/>
					<input type="button" value="취소" onclick="location.href='csselect.jsp?board_no=<%=board_no%>&id=<%=board_id%>'" class="btn btn-dark"/>
				</td>
			</tr>
		</table>
	</form>
	
	
<footer>
   <div class="last">
      <span class="footerLogo">
         <h1>LearnWay</h1>
      </span>
      <div class="addrWrap">
         <sub>
            서울시 강남구 테헤란로 TEL:1234-5678, FAX:1234-5679,
            <p class="copyright">Copyright(C) 2021 All Right Reserved.</p>
         </sub>
         <a href="#"><sub>이용약관</sub></a>
         <a href="#"><sub>개인정보처리방침</sub></a>
      </div>
   </div>
</footer>	
</body>
</html>