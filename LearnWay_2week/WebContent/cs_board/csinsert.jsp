<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>SmartEditor</title>

<script src="https://kit.fontawesome.com/9b7675f701.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/stylesheet.css" type="text/css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
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
              oEditors.getById["ir1"].exec("PASTE_HTML", ["문의사항을 입력해주세요."]);
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
	String id = request.getParameter("id");
%>
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



<form id="frm" action="csinsert_res.jsp" method="post" >
<table style="margin:30px auto 30px auto;" class="read">
		
        <tr>
            <td style="font-size: 12px;">작성자　</td>
            <td><input type="text" class="form-control form-control-sm" id="id" name="board_id" value="<%=id %>" style="width:150px" readonly="readonly"/></td>
        </tr>
        <tr>
            <td style="font-size: 12px;">제목 </td>
            <td><input type="text" class="form-control form-control-sm" id="title" name="board_title" style="width:680px"/></td>
        </tr>
        <tr>
            <td style="font-size: 12px;">내용</td>
            <td>
                <textarea rows="10" cols="30" id="ir1" name="board_content" style="width:678px; height:350px;"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <input type="button" id="save" value="저장" class="btn btn-outline-dark"/>
                <input type="button" value="취소" class="btn btn-dark" onclick="location.href='cs_list.jsp?id=<%=id%>'"/>
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

