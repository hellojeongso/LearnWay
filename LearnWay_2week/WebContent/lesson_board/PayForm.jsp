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
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<style type="text/css">


.payform{

    border:0px solid black;
    width:400px; 
    height:700px;
    margin:24px auto;

}

.pay_text1{

   width: 400px;
   height: 80px;
   line-height: 80px;
   display: block;
   text-align: center;
   background: #f5f5f5;
   font-size: 25px;
   color: #7C7877;
   transform: translate(0, -50%)

}

.pay_text2{
	margin-top:2px;
	margin-bottom: 5px;
	font-size: 19px;
}

.pay_text3{
	padding:10px 0 0 0px;
	font-size: 17px;
	color: #f94e3f;
	
}

.pay_text4{

	padding:5px 0 0 0px;
	margin: 5px 0;
	font-size: 15px;
	color: gray;

}

#check {
	font-size: 9px;

}


</style>
</head>
<body>
<%
	String member_id = request.getParameter("id");
	int price = Integer.parseInt(request.getParameter("price"));
	int class_no = Integer.parseInt(request.getParameter("class_no"));
	

	System.out.println(member_id);
	
	LoginDto dto = new LoginDto();
	LoginBiz biz = new LoginBiz();

	dto = biz.mypageView(member_id);
	
%>



	
	<div class="payform">
	<form action="kakao.jsp">
	<input type="hidden" name="class_no" value="<%=class_no %>">
	<input type="hidden" name="member_id" value="<%=member_id %>">
	<div class="pay_text1"><b>결제하기</b></div>
	<div class="pay_text2"><b>주문 정보</b></div>
		<p>
			<span class="pay_text4">받으시는 분</span><br>
			<input name="name" value="<%=dto.getMember_name() %>"><br>
		</p>
		<p>
			<span class="pay_text4">핸드폰 번호</span><br>
			<input name="phone" value="<%=dto.getMember_phone() %>">
		</p>	
		<p class="pay_text3">
			<b>결제 금액</b><br>
			<input name="totalPrice" value="<%=price%>" readonly="readonly">
		</p>
		<input type="checkbox">개인정보 제3자 제공에 동의합니다. </br></br>
		
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<input type="submit" value="결제" class="btn btn-outline-dark" > 
		<button type="button" class="btn btn-dark" onclick="location.href='lesson_list.jsp?id=<%=member_id %>'">취소</button>
		</div>
	</form>
	</div>

</body>
</html>