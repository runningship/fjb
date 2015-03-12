<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<jsp:include page="../header.jsp" />
</head>

<body>
<jsp:include page="top.jsp"></jsp:include>
<div class="main">
     
     <div id="top">
     
          <span class="s1"><a href="index.jsp"><img src="images/logo.png" /></a></span>
          <span class="s4"><a href="#">&lt;</a></span>
     
     </div>
     
     <div id="banner"><img src="../${upload_path}/${main_img}" /></div>
     
     <div id="infoCon">
     
          <div class="line"><div class="coloReds">${estate.name}</div></div>
          <div class="line"><div class="coloReds">均价${estate.junjia}元/平</div></div>
          <div class="line">开盘：<fmt:formatDate value="${estate.opentime }" pattern="yyyy-MM-dd"/>开盘</div>
          <div class="line">地址：${estate.addr }</div>
          <div class="line">${estate.tese }</div>
          
          <div class="tehui">
               
               <div class="tit"><i><img src="images/th.png" /></i>本站特惠</div>
               <div class="line">可售：${leftCount }套 总价：${minTotalPrice}起</div>
               <div class="line">${estate.yufu}抵${estate.shidi}</div>
               <div class="line">截止时间：<fmt:formatDate value="${estate.youhuiEndtime }" pattern="yyyy-MM-dd"/></div>
               
               <div class="yuyue"><a href="order.jsp?estateId=${estate.id }">立即预约</a></div>
          
          </div>
          
          <div class="xiangxi">
               <div class="tit">详细信息</div>
               <div class="line">装修状态：${estate.zxiu}</div>
              <c:if test="${estate.wyfee!=null}">
                <div class="line">物业费：${estate.wyfee }元/月/平米</div>
              </c:if>
          
          </div>
     
     </div>
     

     <jsp:include page="bottom.jsp" />
</div>

</body>
</html>
