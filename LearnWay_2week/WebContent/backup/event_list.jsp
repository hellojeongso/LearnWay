<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <% request.setCharacterEncoding("UTF-8"); %>
  <% response.setContentType("texthtml; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LearnWay - 온·오프라인으로 즐기는 다양한 클래스</title>
<!-- 아이콘 찾아서 붙여보기 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	var count = 0;
	//스크롤 바닥 감지
	window.onscroll = function(e) {
	//추가되는 임시 콘텐츠
	//window height + window scrollY 값이 document height보다 클 경우,
	if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
		//실행할 로직 (콘텐츠 추가)
	    count++;
	    var addContent = $('.container').clone();
	    //article에 추가되는 콘텐츠를 append
	    $('article').append(addContent);
		}
	};



</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/9b7675f701.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/stylesheet.css" type="text/css"/>
<style type="text/css">

body {background:#fff;}


.card-teacher{
	margin: 5px 0;
	font-size: 13px;
	color: gray;
	
}

.card-title{
	font-size: 20px;
	font-weight: 600;
	color: rgb(60,60,60);
	
}


.card-text{
	padding:5px 0 0 0px;
	margin: 5px 0;
	font-size: 15px;
	color: gray;
}

.card-price{
	padding:15px 0 0 0px;
	font-size: 15px;
	
}


.card{
	
	border-radius: 30px;
}


.body_scroll {
	padding-top: 70px;
}


</style>

</head>
<body>
<%
	String member_id = request.getParameter("id");
	System.out.println(member_id);
%>
<jsp:include page="../header.jsp?id=<%=member_id %>"></jsp:include>

<main>


	<article>
		 <div class="body_scroll">

		
		 <div class="container" style="width: 70rem;">
		      <div class="row">
		        <div class="col-6">
		 		
		          <div class="card">
		            <img src="resources/image/캡처2.PNG" />
		            <div class="card-body">
		              <p class="card-teacher">카테고리·강사 이름<p>
		              <h5 class="card-title">강의 제목</h5>
		              <p class="card-text">강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용</p>
		              <p class="card-price"><small><s>월 59,900원(5개월)</s></small> → <b style="color:#FF3232;">월 29,900원(5개월)</b></p>
		              <div class="card-button"><a href="#" class="btn btn-outline-dark w-100">수강하기</a></div>
		            </div>
		            
		          </div>
		        
		       </div>
		        <div class="col-6">
		 
		          <div class="card">
		            <img src="resources/image/캡처2.PNG" />
		            <div class="card-body">
		              <p class="card-teacher">카테고리·강사 이름<p>
		              <h5 class="card-title">강의 제목</h5>
		              <p class="card-text">강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용</p>
		              <p class="card-price"><small><s>월 59,900원(5개월)</s></small> → <b style="color:#FF3232;">월 29,900원(5개월)</b></p>
		              <div class="card-button"><a href="#" class="btn btn-outline-dark w-100">수강하기</a></div>
		            </div>
		            
		          </div>
		        </div>
     
		      </div>
</br>
</br>
			
		 </div>
 
 	
		 <div class="container" style="width: 70rem;">
		      <div class="row">
		        <div class="col-6">
		 		
		          <div class="card">
		            <img src="resources/image/캡처2.PNG" />
		            <div class="card-body">
		              <p class="card-teacher">카테고리·강사 이름<p>
		              <h5 class="card-title">강의 제목</h5>
		              <p class="card-text">강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용</p>
		              <p class="card-price"><small><s>월 59,900원(5개월)</s></small> → <b style="color:#FF3232;">월 29,900원(5개월)</b></p>
		              <div class="card-button"><a href="#" class="btn btn-outline-dark w-100">수강하기</a></div>
		            </div>
		            
		          </div>
		        
		       </div>
		        <div class="col-6">
		 
		          <div class="card">
		            <img src="resources/image/캡처2.PNG" />
		            <div class="card-body">
		              <p class="card-teacher">카테고리·강사 이름<p>
		              <h5 class="card-title">강의 제목</h5>
		              <p class="card-text">강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용</p>
		              <p class="card-price"><small><s>월 59,900원(5개월)</s></small> → <b style="color:#FF3232;">월 29,900원(5개월)</b></p>
		              <div class="card-button"><a href="#" class="btn btn-outline-dark w-100">수강하기</a></div>
		            </div>
		            
		          </div>
		        </div>
     
		      </div>
</br>
</br>
			
		 </div>
	

		
		 <div class="container" style="width: 70rem;">
		      <div class="row">
		        <div class="col-6">
		 		
		          <div class="card">
		            <img src="resources/image/캡처2.PNG" />
		            <div class="card-body">
		              <p class="card-teacher">카테고리·강사 이름<p>
		              <h5 class="card-title">강의 제목</h5>
		              <p class="card-text">강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용</p>
		              <p class="card-price"><small><s>월 59,900원(5개월)</s></small> → <b style="color:#FF3232;">월 29,900원(5개월)</b></p>
		              <div class="card-button"><a href="#" class="btn btn-outline-dark w-100">수강하기</a></div>
		            </div>
		            
		          </div>
		        
		       </div>
		        <div class="col-6">
		 
		          <div class="card">
		            <img src="resources/image/캡처2.PNG" />
		            <div class="card-body">
		              <p class="card-teacher">카테고리·강사 이름<p>
		              <h5 class="card-title">강의 제목</h5>
		              <p class="card-text">강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용</p>
		              <p class="card-price"><small><s>월 59,900원(5개월)</s></small> → <b style="color:#FF3232;">월 29,900원(5개월)</b></p>
		              <div class="card-button"><a href="#" class="btn btn-outline-dark w-100">수강하기</a></div>
		            </div>
		            
		          </div>
		        </div>
     
		      </div>
</br>
</br>
			
		 </div>


		
		 <div class="container" style="width: 70rem;">
		      <div class="row">
		        <div class="col-6">
		 		
		          <div class="card">
		            <img src="resources/image/캡처2.PNG" />
		            <div class="card-body">
		              <p class="card-teacher">카테고리·강사 이름<p>
		              <h5 class="card-title">강의 제목</h5>
		              <p class="card-text">강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용</p>
		              <p class="card-price"><small><s>월 59,900원(5개월)</s></small> → <b style="color:#FF3232;">월 29,900원(5개월)</b></p>
		              <div class="card-button"><a href="#" class="btn btn-outline-dark w-100">수강하기</a></div>
		            </div>
		            
		          </div>
		        
		       </div>
		        <div class="col-6">
		 
		          <div class="card">
		            <img src="resources/image/캡처2.PNG" />
		            <div class="card-body">
		              <p class="card-teacher">카테고리·강사 이름<p>
		              <h5 class="card-title">강의 제목</h5>
		              <p class="card-text">강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용강의내용</p>
		              <p class="card-price"><small><s>월 59,900원(5개월)</s></small> → <b style="color:#FF3232;">월 29,900원(5개월)</b></p>
		              <div class="card-button"><a href="#" class="btn btn-outline-dark w-100">수강하기</a></div>
		            </div>
		            
		          </div>
		        </div>
     
		      </div>
</br>
</br>
			
		 </div>
</article>

</main>

<jsp:include page="../footer.jsp?id=<%=member_id %>"></jsp:include>


</body>
</html>
