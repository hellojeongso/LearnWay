<%@page import="com.login.biz.LoginBiz"%>
<%@page import="com.login.dto.LoginDto"%>
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
<title>강사 페이지</title>
<style type="text/css">
body {
    font-family: "Lato", sans-serif;
}



.main-head{
    height: 150px;
    background: #FFF;
   
}

.sidenav {
    height: 100%;
    background-color: #777;
    overflow-x: hidden;
    padding-top: 20px;
}


.main {
    padding: 0px 10px;
}

@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
}

@media screen and (max-width: 450px) {
    .login-form{
        margin-top: 10%;
    }

    .register-form{
        margin-top: 10%;
    }
}

@media screen and (min-width: 768px){
    .main{
        margin-left: 40%; 
    }

    .sidenav{
        width: 40%;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
    }

    .login-form{
        margin-top: 80%;
    }

    .register-form{
        margin-top: 20%;
    }
}


.login-main-text{
    margin-top: 20%;
    padding: 60px;
    color: #fff;
}

.login-main-text h2{
    font-weight: 300;
}

.btn-black{
    background-color: #000 !important;
    color: #fff;
}
img{
		width: 150px;
		height: 150px;
		margin-bottom: 20px;
		margin-top:30px;
		border: 1px solid black;
	}


</style>

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
							addr = data.roadAddress;
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
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
<%
	String member_id = request.getParameter("member_id");
	String member_name = request.getParameter("teacher_name");
	String member_phone = request.getParameter("teacher_phone");
	String member_addr = request.getParameter("teacher_addr");
%>


<div class="sidenav">
         <div class="login-main-text">
            <h2>LearnWay</h2>
         <h3>Teacher's MyPage</h3>
         </div>
      </div>
      
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
                  
                  
             <form action="mypage_tch_updateres.jsp" method="post">
                  <input type="hidden" name="member_id" value="<%=member_id%>">
                 <div class="form-group">
	                <img class="tec_img" src="https://cdn.hellodd.com/news/photo/202005/71835_craw1.jpg"><br>
					<input class="btn btn-dark btn-sm" type="submit" value="수정">
                  </div>
                  
                  <div class="form-group">
	                <label for="name">NAME</label><br>
					<input type="text" class="form-control" id="name" name="member_name" value="<%=member_name%>"><br>
					<label for="phone">PHONE</label><br>
					<input type="text" class="form-control" id="phone" name="member_phone" value="<%=member_phone%>"><br>
					<label for="addr">ADDR</label><br>
					<input type="text" class="form-control" id="member_addr" name="member_addr" value="<%=member_addr%>">
					<input type="button" class="btn-dark" onclick="member_execDaumPostcode()" value="find"><br>
                  </div>
                  
                   <div class="form-group">
		                 <input class="btn btn-dark" type="submit" value="수정 완료">&emsp;&emsp;
						<span><input class="btn btn-dark" type="button" value="수정 취소" onclick="location.href='index.jsp'"></span>
                   </div>
               </form>
               
            </div>
         </div>
      </div>
</body>
</html>