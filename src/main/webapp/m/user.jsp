<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/user.css" />
<jsp:include page="../header.jsp" />

<script type="text/javascript">


</script>

<style type="text/css">
.litNav .curr{background-color:#E8C6A4}
.orders td{border-bottom: 1px dashed;border-bottom-color: yellowgreen;}
</style>
</head>

<body>
<jsp:include page="top.jsp"></jsp:include>
<form class="form-inline definewidth m20" name="form1"  method="get" onsubmit="return false;">
	<input type="hidden"  name="currentPageNo" id="currentPageNo"/>
</form>
<div class="main">
     
     <div id="top" style="text-align:center">
          <span class="s4"><a href="#">&lt;</a></span>
          <span class="s5">个人中心</span>
     </div>
     
     <div id="user">
     
          <div class="name">
          		<div style="width:120px;float:left;margin-left:5%;">
          		<p>${user.tel }</p>
               <p>${user.name }</p>
               </div>
               <div style="width:60px;float:right; position:relative;margin-right:5%;text-align:center" >
               		<span style="color:white;font-size:14px;">总佣金</span>
               		<a>
               		<img src="../images/tj_yongjin.png" style="width:28px;"/><span style="position:absolute;margin-top:6px;font-size:14px;"> ${allYongjin }</span>
               		</a>
               </div>
               <div style="width:60px;float:right; position:relative;margin-right:5%;text-align:center" >
               		<span style="color:white;font-size:14px;">推荐人数</span>
               		<a>
               		<img src="../images/tj_renshu.png" style="width:30px;"/><span style="position:absolute;margin-top:6px;font-size:14px;"> ${buyerTotal }</span>
               		</a>
               </div>
               
          </div>
          
          <div style="margin-top:5px;">
          	<a href="houses.jsp"><img src="../images/tj_big.png" style="width:45%;margin-left:3%;" /></a>
          	<a href="clients.jsp"><img src="../images/clients.png" style="width:45%;margin-right:3%;float:right"/></a>
          	
          </div>
		  <div style="margin-top:5px;">
		  	<a href="yongjin.jsp"><img src="../images/yongjin_big.png" style="width:45%;margin-left:3%;"/></a>
          	<a href="rule.jsp"><img src="../images/rule_big.png" style="width:45%;margin-right:3%;float:right"/></a>
		  </div>          
          
     </div>
     
      <jsp:include page="bottom.jsp" />

</div>

</body>
</html>
