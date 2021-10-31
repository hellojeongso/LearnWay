<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <% request.setCharacterEncoding("UTF-8"); %>
  <% response.setContentType("texthtml; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LearnWay │ Mypage</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   function member_execDaumPostcode() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수
                  var memaddr = '';

                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     addr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if (data.userSelectedType === 'R') {
                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if (data.bname !== ''
                           && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if (data.buildingName !== ''
                           && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName : data.buildingName);
                     }
                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                     }
                  } else {
                     extraAddr = '';
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById("member_addr").value = addr + extraAddr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("member_addr")
                        .focus();
               }
            }).open();
   }
</script>



<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/mypage_update.css" type="text/css"/>
</head>
<body>

<%
String member_id = request.getParameter("member_id");
String member_name = request.getParameter("student_name");
String member_phone = request.getParameter("student_phone");
String member_addr = request.getParameter("student_addr");
%>
<div class="mypage_area">
	<div class="sidenav"></div>
    <div class="main">
		<div class="login-form">
			<form action="mypage_stu_updateres.jsp" method="post">
			<input type="hidden" name="member_id" value="<%=member_id%>">
			 <div class="home"><img src="../resources/image/login_logo.PNG"/></div>
                  <div class="form-group">
					<div class="title"><label for="name">이름</label><br></div>
					<input type="text" class="form-control" id="name" name="member_name" value="<%=member_name%>"><br>
					<div class="title"><label for="phone">전화번호</label><br></div>
					<input type="text" class="form-control" id="phone" name="member_phone" value="<%=member_phone%>"><br>
					<div class="title"><label for="addr">주소</label><br></div>
					<input type="text" class="form-control" id="member_addr" name="member_addr" value="<%=member_addr %>">
					<input type="button" class="btn" onclick="member_execDaumPostcode()" value="주소검색"><br>
                  </div>
                  <div class="form-group">
                  	<input class="btn" type="submit" value="확인">
         			<input class="btn" id="cancel" type="button" value="취소" onclick="location.href='../index.jsp?id=<%=member_id%>'">
                  </div>
			</form>
		</div>
    </div>
</div>
</body>
</html>