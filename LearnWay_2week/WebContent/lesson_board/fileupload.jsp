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
<title>강의자료 업로드</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
progress{
display: none;
}
</style>
<script>
window.onload = function(){
progress = document.querySelector("progress");
// upload 버튼을 클릭하면 파일을 업로드 한다.
document.querySelector("button").onclick = function(){
fileUpload();
};
};

// 파일을 업로드 한다.
function fileUpload(){
var uploadFile = document.querySelector("input");

var xhr = new XMLHttpRequest();

// 업로드 시작 -> xhr.download.onloadstart로 하면 download
xhr.upload.onloadstart = function(e){
progress.value = 0;
progress.style.display = "inline";
};

// 업로드 도중에 계속 발생 -> xhr.download.onprogress 하면 download
xhr.upload.onprogress= function(e){
// e.total : 전체 업로드 크기, e.loaded : 현재 업로드된 크기
progress.value = e.loaded/e.total;
console.log(progress.value);
};

// 업로드 종료 시 발생 -> xhr.download.onload 하면 download
xhr.upload.onload = function(e){
progress.style.display = "none";
};

xhr.onreadystatechange = function(){
if(xhr.readyState == 4 && xhr.status == 200){
document.getElementById("upload").value = (xhr.responseText).trim();
}
};
xhr.open("POST", "fileuploadres.jsp", true);
xhr.setRequestHeader("X-File-Name", encodeURIComponent(uploadFile.files[0].name));
xhr.send(uploadFile.files[0]);
}

/*-------------다시 insert로 보내기------------------------*/
</script>
</head>
<%
	String serverport = "8787";
	String realPath = "http://localhost:"+serverport+"/LearnWay_2week/fileupload/";
	String class_title = request.getParameter("title");
%>
<body>
<h3>강의자료 업로드</h3>

<input type="file"><br>
<button>upload</button>
<progress>0%</progress><br>
<form action="videoinsert.jsp" method="post">
<input id="upload" name="filename" type="text" readonly="readonly" value=""  style="margin-top: 20px;">
<input type="hidden" name ="uploadpath" value="<%=realPath%>">
<input type="hidden" name ="class_title" value="<%=class_title%>">
<input type="submit" value="업로드 완료">
</form>
</body>
</html>