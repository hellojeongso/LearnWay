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
<title>Insert title here</title>
</head>
<body>
<div id="map" style="width:600px;height:350px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2602eebc257f1d562e35b9586f2c4c2e&libraries=services"></script>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b118fdf4bf7c9e5407bcb4077257451&libraries=services"></script> -->
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
 
 	String member_id = request.getParameter("id");
    LoginBiz biz = new LoginBiz();
    List<LoginDto> list = biz.mapList();
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
                     
                              var content = '<div class ="labelWish"><span class="leftWish"></span><span class="centerWish">'
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
                  content: '<div style="width:150px;text-align:center;padding:6px 0;">내 위치</div>'
              });
              infowindow.open(map, marker);
      
              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
              map.setCenter(coords);
          } 
      }); 
    
 </script>
</body>
</html>