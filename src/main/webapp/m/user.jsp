<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/user.css" />
<jsp:include page="../header.jsp" />

<script type="text/javascript" src="${projectName}/js/uploadify/jquery.uploadify.js"></script>
<script type="text/javascript" src="${projectName}/js/fjb.js"></script>
<script type="text/javascript">
$(function(){
    setTimeout(function(){
        initPortrait('ChangePortrait' , ${user.id});
    },100)
})


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
<div class="main" >
     
     <div id="top" style="height:0px;padding:5px 0px;">
     </div>
     <!-- <div style="float:right;"><input id="ChangePortrait" /></div> -->
     <div id="user" >
     
          <div class="name" style="height:120px">
               <div>
                    <img style="width:25%;" src="${projectName }/images/touxiang0.png" />
                    <a title="修改密码" style="position: absolute;margin-left: -22%;margin-top: 100px;" href="xgmm.jsp?id=${user.id}">&nbsp;&nbsp;更改密码</a>
               </div>
                        
          	<div style="width:65%;text-align:center;margin-left:10%;margin-top: -80px;float:none">
                    <p>${user.name }</p>
          		<p style="position: absolute;margin-left:160px;margin-top: -31px;">${user.tel }</p>
               </div>
               <div style="width:65%;float:right; text-align:center;margin-top: 5%;">
          		<span style="color:white;font-size:14px;margin-left:-25%">总佣金</span>
          		<span style="color:white;font-size:14px;margin-left:25%">推荐人数</span>
               </div>
               <div style="width:65%;float:right; text-align:center;">
                         <a style="margin-left:-42%">
                         <img src="../images/tj_yongjin.png" style="width:30px;"/><span style="font-size:14px;"> ${allYongjin }</span>
                         </a>
                         <a style="margin-left:20%">
                         <img src="../images/tj_renshu.png" style="width:30px;"/><span style="font-size:14px;"> ${buyerTotal }</span>
                         </a>
                    </div>
          </div>
          
          <div style="margin-top:5px;">
          	<a href="houses.jsp"><img src="../images/tj_big.png" style="width:48%;" /></a>
          	<a href="clients.jsp"><img src="../images/clients.png" style="width:48%;;float:right"/></a>
          	
          </div>
		  <div style="margin-top:5px;">
		  	<a href="yongjin.jsp"><img src="../images/yongjin_big.png" style="width:48%;"/></a>
          	<a href="rule.jsp"><img src="../images/rule_big.png" style="width:48%;float:right"/></a>
		  </div>          
          
     </div>
     
      <jsp:include page="bottom.jsp" />

</div>

</body>
</html>
