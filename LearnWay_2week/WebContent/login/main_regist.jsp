<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>LearnWay │ 로그인</title>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer>

function onSignIn(googleUser) {
     var profile = googleUser.getBasicProfile();
     console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
     console.log('Name: ' + profile.getName());
     console.log('Image URL: ' + profile.getImageUrl());
     console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
   }

</script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/login.css" type="text/css"/>
</head>
<body>
<div class="login_area">
<div class="sidenav"></div>
	<div class="main">
	<form action="logincheck.jsp" method="post">
            <div class="login-form">
            	<a href="../index.jsp"><img src="../resources/image/login_logo.PNG" class="home"/></a>
				<div class="form-group">
					<input type="text" placeholder="learnway@naver.com" required="required" name="member_id">
				</div>
				<div class="form-group">
					<input type="password" placeholder="********" required="required" name="member_pw">
				</div>
				<div class="find">	 
					<a href="findid.jsp">아이디</a>
					<a href="findpw.jsp">비밀번호 찾기</a>
					<span id="sign"><a href="inmain_regist.jsp">회원가입</a></span>
                </div>
				<div class="button">
					<input type="submit" id="login_bt" value="로그인"/>
				</div>                
                	    
<!--  네이버 login-->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<div id="naver_id_login"></div>
<script type="text/javascript">
		var naver_id_login = new naver_id_login("iPebPScsoiwrYEwp5EO9", "http://49.170.22.193:8787/LearnWay_2week/login/callback_naver.jsp");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("white", 3, 48);
		naver_id_login.setDomain("y826gT7iVo");
		naver_id_login.setState(state);
		naver_id_login.init_naver_id_login();
</script>

<!-- 카톡 login -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   <a id="kakao-login-btn"></a>
   <a href="http://developers.kakao.com/logout"></a>
   <script type='text/javascript'>
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('a73f4d1f0ed420f290f1ee269cadf83b'); //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
       container : '#kakao-login-btn',
       success : function( authObj ) {
          
          Kakao.API.request({
                 url: '/v2/user/me',
                 success: function(res) {

                   var userid = res.kakao_account.profile.nickname
                   var email = res.kakao_account.email
       
                   location.href = "social_login_res_kakao.jsp?email="+ email;
                   
                   },
                 fail: function(error) {
                   alert(JSON.stringify(error));
                 }
               });
             },
             fail: function(err) {
               alert(JSON.stringify(err));
             }
           });
        
       </script>
       
			</div>
			</form>
		</div> 
</div>      
         

</body>
</html>