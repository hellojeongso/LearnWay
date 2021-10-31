<%@page import="com.cs.biz.CsBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>SmartEditor</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/9b7675f701.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/stylesheet.css" type="text/css"/>
<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="se2/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%
	
	int board_no = Integer.parseInt(request.getParameter("board_no"));
	
	String board_id = request.getParameter("id");
	String board_title = request.getParameter("title");
	String board_content = request.getParameter("content");
	System.out.println(board_id);
	System.out.println(board_title);
	System.out.println(board_content);

%>

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
              oEditors.getById["ir1"].exec("PASTE_HTML", ["<%=board_content%>"]);
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
 
</head>
<body>
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
	
	<form id="frm" action="cs_answerform_res.jsp" method="post" >
	<input type="hidden" name="boardgroup_no" value="<%=board_no%>">
	<table style="margin:30px auto 30px auto;">

        <tr>
            <td style="font-size: 12px;">작성자　</td>
            <td><input type="text" id="id" name="board_id" style="width:150px" value="<%=board_id%>" class="form-control form-control-sm" readonly="readonly"/></td>
        </tr>
        <tr>
            <td style="font-size: 12px;">제목</td>
            <td><input type="text" id="title" name="board_title" value="　RE:<%=board_title%>" style="width:680px" class="form-control form-control-sm"/></td>
        </tr>
        <tr>
            <td style="font-size: 12px;">내용</td>
            <td>
                <textarea rows="10" cols="30" id="ir1" name="board_content" style="width:678px; height:350px; "><%=board_content%></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2"  align="right">
                <input type="button" id="save" value="답변작성" class="btn btn-outline-dark"/>
                <input type="button" value="취소" class="btn btn-dark" onclick="location.href='csselect.jsp?board_no=<%=board_no%>&id=<%=board_id%>'"/>
            </td>
        </tr>
</table>
</form>
 
</body>
</html>

