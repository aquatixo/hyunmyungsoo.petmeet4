<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
   Object mainCheckHeader = session.getAttribute("main");   
%>
<script>
  var imgError = function (image) {
  image.onerror = ""
  var parent = image.parentElement
  var parentTag = parent.innerHTML
  var brokenImageTag = image.outerHTML
  parent.innerHTML = parentTag.replace(brokenImageTag, '<div class="broken logoImg">로고 이미지</div>')
  return true
}
</script>
<%
   if(mainCheckHeader != null){
%>
<span>ADMIN</span>
<div class='row' >
   <div class='col-4'>
<!--       <a href='main'>로고이미지12</a> -->
      <a href='main'><img src='../img/logo.PNG' class='logoImg' onerror='imgError(this);' ></a>
   </div>
   <div class='offset-6 col-2'>
      <a href='../logout' class='btn logOutBtn p-2 mt-2'><small>로그아웃</small></a>
   </div>
</div>
<% 
   }else{
%>
<span>ADMIN2</span>
<div class='row'>
   <div class='col-4'>
      <a href='../main'><img src='../../img/logo.PNG' class='logoImg' onerror='imgError(this);' ></a>
   </div>
   <div class='offset-6 col-2'>
      <a href='../../logout' class='btn logOutBtn p-2'><small>로그아웃</small></a>
   </div>
</div>
<%
   }
%>