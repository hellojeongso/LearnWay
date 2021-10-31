<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.login.dto.LoginDto"%>
<%@page import="java.util.List"%>
<%@page import="com.login.biz.LoginBiz"%>
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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/9b7675f701.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/stylesheet.css" type="text/css"/>
<style type="text/css">

#map {
	margin: 13px auto 50px auto;
	border: 3px solid gray;
	
}

*{
font-family: 'Acme', sans-serif;

}





</style>

</head>
<body>

<header>
<jsp:include page="../header.jsp"></jsp:include>
<div class="category">

      <a href="#"><i class="fas fa-desktop"></i> IT</a>
      <a href="#"><i class="fas fa-utensils"></i> Cooking</a>
      <a href="#"><i class="fas fa-language"></i> Language</a>
      <a href="#"><i class="fas fa-coins"></i> Stock</a>
      <a href="#"><i class="fas fa-palette"></i> Art</a>
      <a href="#"><i class="fas fa-running"></i> Sport</a>
      <a href="#"><i class="fas fa-map-marked"></i> Around Teacher</a>
     
</div>
</header>


<p style="padding: 16px 10px 10px 10px; font-size: 18pt; font-weight: bold; text-align: center; font-family: 'Acme', sans-serif;">가까운 위치에서 강사를 찾아보세요 !</p>

<div id="map" style="width:800px;height:350px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2602eebc257f1d562e35b9586f2c4c2e&libraries=services"></script>
 <script>
        var mapContainer = document.getElementById('map'); // 지도를 표시할 div  
        mapOption = {
            center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표 
            level : 7 // 지도의 확대 레벨
        };
 		
        var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        var geocoder = new daum.maps.services.Geocoder();
        var addressArray = [];
        var addressName = [];
        var cnt = 0;
        var coords;
 <%
 	LoginBiz biz = new LoginBiz();
 	List<LoginDto> list = biz.mapList();
 	
 	String member_id = request.getParameter("id");
	LoginBiz stubiz = new LoginBiz();
	LoginDto studto = new LoginDto();
	studto = stubiz.mypageView(member_id);

 	
 	for(LoginDto dto : list){
 %>
 	addressName.push("<%=dto.getMember_name()%>");
 	
 	addressArray.push({
        'groupAddress' : "<%=dto.getMember_addr()%>"
    });
 <%
 	}
 %>
 
 
       addressArray.forEach(function (v,i) {
    	      geocoder.addressSearch(
                      addressArray[i].groupAddress,
                      function(result, status, data) {
                          // 정상적으로 검색이 완료됐으면 
                          if (status === daum.maps.services.Status.OK) {

                              coords = new daum.maps.LatLng(
                                      result[0].y, result[0].x);

                              // 결과값으로 받은 위치를 마커로 표시합니다
                              var marker = new daum.maps.Marker({
                                  map : map,
                                  position : coords
                              });

                              // 마커를 지도에 표시합니다.
                              marker.setMap(map);
							
                              var content = '<div class ="labelWish"><span class="leftWish"></span><span class="centerWish" style="font-weight:bold; font-size:13pt;">'
                                      + addressName[i]
                                      + '</span><span class="rightWish"></span></div>';
                                      console.log(addressName[cnt]);        
                              // 커스텀 오버레이를 생성합니다
                              var customOverlay = new daum.maps.CustomOverlay(
                                      {
                                          position : coords,
                                          content : content
                                      });

                              // 커스텀 오버레이를 지도에 표시합니다
                              customOverlay.setMap(map);
                          }
                      });
		
	});


   	geocoder.addressSearch('<%=studto.getMember_addr()%>', function(result, status) {
   	
   	    // 정상적으로 검색이 완료됐으면 
   	     if (status === kakao.maps.services.Status.OK) {
   	    	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
   	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
   	     // 마커 이미지의 이미지 크기 입니다
   	     var imageSize = new kakao.maps.Size(24, 35); 
   	     
   	     // 마커 이미지를 생성합니다    
   	     var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
   	        
   	        // 결과값으로 받은 위치를 마커로 표시합니다
   	        var marker = new kakao.maps.Marker({
   	            map: map,
   	            position: coords,
   	            image : markerImage
   	        });
   	
   	        // 인포윈도우로 장소에 대한 설명을 표시합니다
   	        var infowindow = new kakao.maps.InfoWindow({
   	            content: '<div style="width:170px;text-align:center; padding: 5px 0;"><a style="font-weight:bold;"><%=member_id%>님의 위치</a></div>'
   	        });																				
   	        infowindow.open(map, marker)
   	
   	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
   	        map.setCenter(coords);
   	    } 
   	}); 
    
 </script>
 
 
 
 
 <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>