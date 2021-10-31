%@ page language=java contentType=texthtml; charset=UTF-8
    pageEncoding=UTF-8%
%
request.setCharacterEncoding(UTF-8);
response.setContentType(texthtml; charset=UTF-8);
%
!DOCTYPE html
html
head
meta charset=UTF-8
titleLearnWay - 온·오프라인으로 즐기는 다양한 클래스title
!-- 아이콘 찾아서 붙여보기 --
%
	String member_id = request.getParameter(id);
	System.out.println(member_id);
%
script type=textjavascript src=httpscode.jquery.comjquery-3.6.0.min.jsscript
script type=textjavascript
	$(document).ready(function() {
		if ($(.id).val() == null) {
			$(.log).html('a class=log href=loginmain_regist.jspi class=fas fa-sign-in-altiLOGINa');
			$('.mypage').css(display, none); 
		} else {
			$(.log).html('a class=log href=index.jspi class=fas fa-sign-in-altiLOGOUTa');
			$(.join).text();
			$('.mypage').css(display, block); 
		}
	});
	
script

link href=httpscdn.jsdelivr.netnpmbootstrap@5.0.0-beta3distcssbootstrap.min.css rel=stylesheet integrity=sha384-eOJMYsd53ii+scObJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6 crossorigin=anonymous
script src=httpscdn.jsdelivr.netnpmbootstrap@5.0.0-beta3distjsbootstrap.bundle.min.js integrity=sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf crossorigin=anonymousscript
script src=httpskit.fontawesome.com9b7675f701.js crossorigin=anonymousscript
link rel=stylesheet href=cssstylesheet.css type=textcss
script type=textjavascript
script

head
body

header

input type=hidden value=%=member_id % class=id

   !-- 로고 --
   ul class=header-list
      lidivimg alt=로고 src=resourcesimagemain_Logo.png width=170px height=40pxdivli
      
   !-- 검색창 --   
      li
      div class=searchContainer style=margin-left 100px
         div class=search_Box
            table class=search_Elements
               tr
                  td
                     input type=text placeholder=찾으시는 클래스가 있으신가요 class=search
                  td
                  td
                     a href=#img src=resourcesimagesearch_icon.png style=float right;a
                  td
               tr
            table
         div
      div
      li
         
 
   !-- 메뉴 --   
		li
			div class=btn-group
			  button class=btn btn-secondary btn-sm dropdown-toggle type=button data-bs-toggle=dropdown aria-expanded=false
			    Menu
			  button
			  ul class=dropdown-menu
			    lia class=dropdown-item href=lesson_boardlesson_list.jspid=%=member_id%강의ali
			    lia class=dropdown-item href=event_boardevent_list.jspid=%=member_id%이벤트ali
			    lia class=dropdown-item href=notice_boardnoti_list.jspid=%=member_id%공지사항ali
			    lia class=dropdown-item href=cs_boardcs_list.jspid=%=member_id%고객센터ali
			    lihr class=dropdown-dividerli
			    li class=mypagea class=dropdown-item href=mypagemypageload.jspid=%=member_id %마이페이지ali
			  ul
			div				
		li
   
      
         li
            div class=login
                  a class=log href=loginmain_regist.jspi class=fas fa-sign-in-altiLOGINa
               div
         li
         
         li   
            div class=join
               a class=join href=logininmain_regist.jspi class=fas fa-user-friendsiJOINa
            div
         li
                  
      
       
      ul
   


header
main

div class=section
   input type=radio name=slide id=slide01 checked
   input type=radio name=slide id=slide02
   input type=radio name=slide id=slide03
   div class=slidewrap
      
      ul class=slidelist
         !-- 슬라이드 영역 --
         li class=slideitem
            a
               div class=textbox
                  h3새로운 취미 찾기h3
                  p온라인으로 편하게 즐기세요!p
               div .............................................
               img src=resourcesimageslide_camera.png
            a
         li
         li class=slideitem
            a
               
               div class=textbox
                  h3h3
                  pp
               div
               img src=resourcesimageslide_painting.png
            a
         li
         li class=slideitem
            a
               
               div class=textbox
                  h3h3
                  pp
               div
               img src=resourcesimageslide_yoga.png
            a
         li class=slideitem

         !-- 좌,우 슬라이드 버튼 --
         div class=slide-control
            div
               label for=slide03 class=leftlabel
               label for=slide02 class=rightlabel
            div
            div
               label for=slide01 class=leftlabel
               label for=slide03 class=rightlabel
            div
            div
               label for=slide02 class=leftlabel
               label for=slide01 class=rightlabel
            div
         div

      ul
      !-- 페이징 --
      ul class=slide-pagelist
         lilabel for=slide01labelli
         lilabel for=slide02labelli
         lilabel for=slide03labelli
      ul
   div
div

   div class=category
      a href=#i class=fas fa-desktopi ITa
      a href=#i class=fas fa-utensilsi Cookinga
      a href=#i class=fas fa-languagei Languagea
      a href=#i class=fas fa-coinsi Stocka
      a href=#i class=fas fa-palettei Arta
      a href=#i class=fas fa-runningi Sporta
      a href=#i class=fas fa-map-markedi Around Teachera
   div
   
   section
      div class=sec_title인기 CLASSdiv
      내용
   section
   
   section
      div class=sec_title진행중인 EVENTdiv
      내용
   section
main
!-- Channel Plugin Scripts --
script
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error  window.console.log  function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'textjavascript';
      s.async = true;
      s.src = 'httpscdn.channel.iopluginch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    pluginKey 72cd9e68-28fb-4db9-b3a8-fb3abf795732
  });
script
!-- End Channel Plugin --

footer
   div class=last
      span class=footerLogo
         h1LearnWayh1
      span
      div class=addrWrap
         sub
            서울시 강남구 테헤란로 TEL1234-5678, FAX1234-5679,
            p class=copyrightCopyright(C) 2021 All Right Reserved.p
         sub
         a href=#sub이용약관suba
         a href=#sub개인정보처리방침suba
      div
   div
footer


body
html