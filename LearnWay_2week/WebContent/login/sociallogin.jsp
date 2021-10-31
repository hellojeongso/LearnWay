s<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "google-signin-client_id"content = " 468234685765-dp640q18p8lnr0k2thfba56fvpopvpm8.apps.googleusercontent.com ">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	<meta name="google-signin-client_id"
	content="805502210933-uhd1c3d071j2sagpss5fbplkalageest.apps.googleusercontent.com">
<title>social login</title>

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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
</head>
<body><!-- 구글 로그인  -->
	
<div class="g-signin2" data-onsuccess="onSignIn"></div>

<a href="#" onclick="signOut();"></a>
<br>


	<!--//로그아웃 -->
	<!-- <a href="#" onclick="signOut();">Sign out</a> 
	
<script>
	//구글 로그아웃 스크립트 
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			console.log('User signed out.');
		});
	}
</script>
	
	-->


   <!--  naver login-->
   <script type="text/javascript"
      src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
      charset="utf-8"></script>
   <script type="text/javascript"
      src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
   <!-- 네이버아이디로로그인 버튼 노출 영역 -->
   <div id="naver_id_login"></div>
   <!-- //네이버아이디로로그인 버튼 노출 영역 -->
   <script type="text/javascript">
      var naver_id_login = new naver_id_login("iPebPScsoiwrYEwp5EO9",
            "http://49.170.22.193:8787/LearnWay_2week/login/callback_naver.jsp");
      var state = naver_id_login.getUniqState();
      naver_id_login.setButton("white", 2, 50);
      naver_id_login.setDomain("y826gT7iVo"); // 이건 뭐지??
      naver_id_login.setState(state);
      naver_id_login.setPopup();
      naver_id_login.init_naver_id_login();
   </script>
<br>







<!--  카카오톡 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   <a id="kakao-login-btn"></a>
   <a href="http://developers.kakao.com/logout"></a>
   <script type='text/javascript'>
   //<![CDATA[
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
       
                   
               if (typeof email == "undefined") {                    
                         location.href=  'social_regist.jsp?userid=' + userid +'&email=' +email;
                         
               } else {
                  
                  location.href=  '../index.jsp?id=' + email;
               }
                   
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
         //]]>
       </script>
<br>
<br>

	<!-- login btn -->
	<div align="center" class="fb-login-button" data-max-rows="1"
		data-size="large" data-button-type="continue_with"
		data-show-faces="true" data-auto-logout-link="true"
		data-use-continue-as="true"></div>

	<!-- facebook -->
	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.9&appId=3019893794964352";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
               

</body>
</html>