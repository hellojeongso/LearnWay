<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

<script type="text/javascript">
      var naver_id_login = new naver_id_login("iPebPScsoiwrYEwp5EO9", "http://49.170.22.193:8787/LearnWay_2week/login/callback_naver.jsp");
      // 접근 토큰 값 출력
      //alert(naver_id_login.oauthParams.access_token);
      // 네이버 사용자 프로필 조회
      naver_id_login.get_naver_userprofile("naverSignInCallback()");
      
      function naverSignInCallback() { // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
       
         //alert(naver_id_login.getProfileData('nickname'));
         //alert(naver_id_login.getProfileData('age'));
         
         var email = naver_id_login.getProfileData('email');
         
       
	         	location.href = "social_login_res_naver.jsp?email="+ email;
	            
	           
	      
      }
   </script>
</body>
</html>