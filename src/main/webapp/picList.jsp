<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="header.jsp" />
<link rel="stylesheet" type="text/css" href="style/piclist.css" />
<script type="text/javascript">
function filterImg(type){
	$('#keyFilterList li').hide();
	$('li[key="'+type+'"]').show();
}
</script>
</head>

<body>
<jsp:include page="top.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>

<div class="warp">

     <div class="main">
          
          
          
          
          <div class="section-inner house-photo-list">
  <!-- 楼盘单页公共头部 -->
  <div class="section-hd">
    <!-- 面包屑 -->
<div class="breadcrumbs-wrap">
    <div class="breadcrumb">
        <a href="/">房金宝</a>
        <span class="arrow">&gt;</span>
        <a href="/house/list">新房</a>
        <span class="arrow">&gt;</span>
        <a href="/house/3796">玫瑰绅城</a>

                <span class="arrow">&gt;</span>
        <a href="/house/3796/photo">相册列表</a>
        
        <span></span>
    </div>
</div>
<!-- /面包屑 -->
    <!-- 标题 -->
<div class="house-title clearfix">
  <h1 class="house-name">
    <a href="/house/3796"><em>[包河区]</em>
    玫瑰绅城</a>
    <small>&nbsp;&nbsp;/&nbsp;
    参考均价<em>7500</em>元/平米
    </small></h1>
  
</div>
<!-- /标题 -->

  </div>
  <!-- /楼盘单页公共头部 -->

  <div class="section-bd">

    <div class="content">
      
      <div id="keyFilterTabs" class="tabs">
        <a tabkey="all" href="#" class="tabs-item current">所有图片(${all })</a>
      <c:forEach items="${fenleiList}" var="fenlei">
        <span class="sep">|</span>          
            <c:choose>
              <c:when test="${fenlei.name==\"huxing\" }">
              <a tabkey="${fenlei.name}"  onclick="filterImg('${fenlei.name}');" href="#" class="tabs-item ">户型图(${fenlei.total})</a>
              </c:when>
              <c:when test="${fenlei.name==\"xiaoguo\" }">
              <a tabkey="${fenlei.name}"  onclick="filterImg('${fenlei.name}');" href="#" class="tabs-item ">效果图(${fenlei.total})</a>
              </c:when>
              <c:when test="${fenlei.name==\"guihua\" }">
              <a tabkey="${fenlei.name}"  onclick="filterImg('${fenlei.name}');" href="#" class="tabs-item ">规划图(${fenlei.total})</a>
              </c:when>
              <c:when test="${fenlei.name==\"shijing\" }">
              <a tabkey="${fenlei.name}"  onclick="filterImg('${fenlei.name}');" href="#" class="tabs-item ">实景图(${fenlei.total})</a>
              </c:when>
            </c:choose>
        </c:forEach>
      </div>

      <div class="photo-list-wrap">
        <ul id="keyFilterList" class="photo-list">
          <c:forEach items="${images}" var="image">
          <li key="${image.type}" class="list-item">
            <img alt="" src="./upload/${image.path}">
            <c:choose>
            	<c:when test="${image.type==\"huxing\" }">
            		<p class="title">户型图</p>
            	</c:when>
            	<c:when test="${image.type==\"xiaoguo\" }">
            		<p class="title">效果图</p>
            	</c:when>
              <c:when test="${image.type==\"guihua\" }">
                <p class="title">规划图</p>
              </c:when>
              <c:when test="${image.type==\"shijing\" }">
                <p class="title">实景图</p>
              </c:when>
            </c:choose>
          </li>
          </c:forEach>
        </ul>
      </div>
    </div>
  </div>
</div>
        
     
     </div>

</div>

<jsp:include page="foot.jsp"></jsp:include>


</body>
</html>