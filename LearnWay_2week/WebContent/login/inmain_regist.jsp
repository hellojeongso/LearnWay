<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LearnWay │ 회원가입</title>
<script type="text/javascript">
	function idCheckConfirm() {
		var chk = document.getElementsByName("member_id")[0].title;
		if (chk == "n") {
			alert("id 중복체크를 먼저 해주세요.");
			document.getElementsByName("member_id")[0].focus();
		}
	}
	function idCheck() {
		var doc = document.getElementsByName("member_id")[0];
		if (doc.value.trim() == "" || doc.value == null) {
			alert("id를 입력해주세요");
		} else {
			open("idcheck.jsp?id="+doc.value,
					"", "width=250, height=200,location= no,toolbars= no,status= no");
		}
	}
	
	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
			document.form.userAddr.value = roadFullAddr;		
	}
</script>
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
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("member_extraAddress").value = extraAddr;

						} else {
							document.getElementById("member_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('member_postcode').value = data.zonecode;
						document.getElementById("member_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("member_detailAddress")
								.focus();
					}
				}).open();
	}
	
	
	
	
	$
</script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/regist.css" type="text/css"/>
</head>
<body>
<div class="regist_area">
	<div class="sidenav"></div>
	<div class="main">
            <div class="login-form">
               <form action="regires.jsp" method="post">
                  <div class="home"><img src="../resources/image/login_logo.PNG"/></div>
               		<!-- 강사 or 학생 -->
                  <div class="form-group" id="or_select">
                     <input type="radio" name="member_select" value="1" checked="checked" id="select"><label for="select">Teacher</label> 
                     <input type="radio" name="member_select" value="2" id="select2"><label for="select2">Student</label>
                  </div>
                  
                   <!-- 성별 -->
                  <div class="form-group">
                    <label for="member_gender">성별</label><br>
                    <input type="radio" name="member_gender" value="M" checked="checked" id="select_m"><label for="select_m">남</label>
                    <input type="radio" name="member_gender" value="F" id="select_w"><label for="select_w">여</label>
                  </div>
                  
                  <!-- ID -->
                  <div class="form-group">
                     <label for="member_id">아이디</label><br>
                    <input type="text" id="memeber_id" name="member_id" placeholder="ID" required="required">
                    <input type="button" value="중복확인" id="check_bt" onclick="idCheck();"> 
                  </div>                  

                  <!-- PW -->
                  <div class="form-group">
                     <label for="member_pw">비밀번호</label><br>
                    <input type="password" id="memeber_pw" name="member_pw" placeholder="Password" required="required">
                  </div>
                                    
                  <!-- 이름-->
                  <div class="form-group">
                     <label for="member_name">이름</label><br>
                    <input type="text" id="memeber_name" name="member_name" placeholder="ex) 홍길동" required="required">
                  </div>
                  

                  <!-- 생년월일-->
                    <div class="form-group">
                     <label for="member_birth">생년월일</label><br>
                    <input type="text" id="memeber_birth" name="member_birth" placeholder="ex) 19990415" required="required">
                  </div>
                  
                  <!-- 전화번호 -->
                  <div class="form-group">
                     <label for="member_phone">Phone</label><br>
                    <input type="text" id="memeber_phone" name="member_phone" placeholder="ex) 010-1234-5678" required="required">
                  </div>
                       
                  <!-- Email-->
                  <div class="form-group">
                     <label for="member_email">Email</label><br>
                     <input type="text" id="memeber_email" name="member_email" placeholder="ex) LearnWay@naver.com" required="required">
                  </div>
                  
                  <!-- 질문 -->
                  <div class="form-group">
                     <label for="member_question">Question</label><br>
                    <select name="question" id="question_form">
						<option value="질문을 선택해 주세요">질문을 선택해 주세요</option>
						<option value="기억의 남는 추억의 장소는?">기억의 남는 추억의 장소는?</option>
						<option value="자신의 인생 좌우명">자신의 인생 좌우명</option>
						<option value="가장 기억에 남는 선생님 성함은?">가장 기억에 남는 선생님 성함은?</option>
						<option value="인상 깊게 읽은 책 이름은?">인상 깊게 읽은 책 이름은?</option>
					</select> 
					
				<label id="answer">Answer</label> 
				<input type="text" name="answer">
                 </div>
                  
                  <!-- 주소 -->
					<div class="form-group">
					<label>주소</label><br>
						<input type="text" id="member_postcode" name="member_postcode" placeholder="우편번호"> 
						<input type="button" onclick="member_execDaumPostcode()" id="find_bt" value="우편번호 찾기"><br>
						<input style="width: 300px" type="text" id="member_address" name="member_address" placeholder="주소"><br> 
						<input type="text" id="member_detailAddress" name="member_detailAddress" placeholder="상세주소"> 
						<input type="text" id="member_extraAddress" name="member_extraAddress" placeholder="참고항목">
					</div>
					
					 <div class="form-group">
						<input type="submit" id="regist_bt" value="가입하기">
						<input type="button" id="back_bt" value="취소" onclick="location.href='../index.jsp'">
                  	</div>
				</form>
            </div>
      </div>
	</div>
</body>
</html>