<%@page import="com.media.biz.MediaBiz"%>
<%@page import="com.media.dto.MediaDto"%>
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
	String filename = request.getParameter("filename");
	String realPath = request.getParameter("uploadpath");
	String class_title = request.getParameter("class_title");
	String media_path = realPath+filename;
	
	MediaDto mdto = new MediaDto();
	mdto.setClass_title(class_title);
	mdto.setMedia_extension("video");
	mdto.setMedia_path(media_path);
	
	MediaBiz mbiz = new MediaBiz();
	int mres = mbiz.mediainsert(mdto);
	
	
	if(mres>0){
%>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal({
			title : "동영상 업로드 성공! ",
			icon : "success"
		}).then(function() {
			self.close();
		});
	
	 
		
	</script>
<%
	}else{
%>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		swal({
			title : "동영상 업로드 실패! ",
			icon : "error"
		}).then(function() {
			self.close();
		});
	
	</script>
<%
	}
%>
</body>
</html>