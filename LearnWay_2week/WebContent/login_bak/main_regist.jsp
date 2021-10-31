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
<meta name = "google-signin-client_id"content = " 468234685765-dp640q18p8lnr0k2thfba56fvpopvpm8.apps.googleusercontent.com ">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	<meta name="google-signin-client_id"
	content="805502210933-uhd1c3d071j2sagpss5fbplkalageest.apps.googleusercontent.com">
<title>Insert title here</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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


</style>
</head>
<body>
<div class="sidenav">
         <div class="login-main-text">
            
           
            <h2 style="font-size: 40px">LearnWay</h2>
         <p><span style="font-weight: bold;">Login</span> from here to access.</p>
         </div>
      </div>
      
      <form action="logincheck.jsp" method="post">
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
              
                  <div class="form-group">
                     <label>ID</label>
                     <input type="text" class="form-control" placeholder="ID" required="required" name="member_id">
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" class="form-control" placeholder="Password" required="required" name="member_pw">
                  </div>
                  <input type="submit" class="btn btn-black" value="login"/>
                  <a href="../index.jsp"  class="btn btn-secondary">Back</a>
                 
               			<br>
               			<br>
               			
               		<a href="findid.jsp" class="btn btn-secondary">find ID</a>
               		<a href="findpw.jsp"  class="btn btn-secondary">find PW</a>
               		<br>
               			<br>
               		<a class="btn btn-outline-secondary" onclick="openPopup()">Social Login</a>
               		<script type="text/javascript">
               		 function openPopup() {
						window.open("sociallogin.jsp","new","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=350, height=350, left=0, top=0");
					}
               		
               		
               		</script>
               		
               			<br>
               			<br>
               		
               		
             
            </div>
         </div>
      </div>
      </form>
      
      	

</body>
</html>