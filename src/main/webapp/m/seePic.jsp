<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<jsp:include page="../header.jsp" />
<link rel="stylesheet" href="css/public.css" type="text/css" />
<script type="text/javascript" src="js/swipe.qq.min.js"></script>
<script type="text/javascript"  src="js/home.min.js"></script>
<script type="text/javascript">
function smart_jump(obj){
  var url=$(obj).attr('href').split('转')[0];
  var wx_sign='#mp.weixin.qq.com';
  if(anchor != wx_sign)
  {
      window.location=url + wx_sign;
  }
}

</script>
<style text="text/css">
.thumb-item{float:left;width:21%;margin-left:3%;position:relative}
.thumb-item img{height:65px;width:100%;}
.thumb-selected img{border: 1px solid;border-color: red;}
.cover-layer{  position: absolute;  left: 0px;  bottom: 0px;  color: white;  width: 100%;  background: #444;  text-align: center;opacity:0.9}
.s1 img{display:none}
</style>
</head>

<body style="background:black;">
<jsp:include page="top.jsp"></jsp:include>
<div class="main">
     <div class="swipe" id="imgSwipe" style="visibility: visible;margin-top:5%">
   	  <div class="swipe-wrap" >
   	  		<c:forEach items="${images}"  var="image">
   	  			<div style="" class="swipe_pic "  type="${image.type }"><img src="../${upload_path}/${image.path }" style="height:auto;"/></div>
   	  		</c:forEach>
           
       </div>
      <span class="swipe_num"><span id="nowNum">1</span>/<span id="totalNum"></span></span>
	 </div>
</div>

</body>
</html>
