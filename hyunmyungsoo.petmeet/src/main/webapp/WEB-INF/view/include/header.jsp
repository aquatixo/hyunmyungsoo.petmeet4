<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='utf-8' isELIgnored='false'%>
<%
   Object mainCheckNav1 = session.getAttribute("main");
%>
<script>
  var imgError = function (image) {
  image.onerror = ""
  var parent = image.parentElement
  var parentTag = parent.innerHTML
  var brokenImageTag = image.outerHTML
  parent.innerHTML = parentTag.replace(brokenImageTag, 
        '<div class="broken logoImg">로고 이미지</div>')
  return true
}
</script>
<div class='row justify-content-center'>
<%
   if(mainCheckNav1 != null){
%>
<!--       <div class='logoImg'><a href='main'>로고이미지</a></div> -->
      <a href='main'><img src='img/logo.PNG' class='logoImg' onerror='imgError(this);'></a>
<% 
   }else{
%>
<!--       <div class='logoImg'><a href='../main'>로고이미지</a></div> -->
      <a href='../main'><img src='../img/logo.PNG' class='logoImg' onerror='imgError(this);'></a>
<%
   }
%>
</div>