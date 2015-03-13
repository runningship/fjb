<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/user.css" />
<jsp:include page="../header.jsp" />

<script type="text/javascript">
var currentPageNo=1;
function doSearch(){
	$('#currentPageNo').val(currentPageNo);
	var a=$('form[name=form1]').serialize();
	YW.ajax({
	    type: 'get',
	    url: '${projectName}/c/m/listOrder?sellerId=${user.id}',
	    data: a,
	    dataType:'json',
	    mysuccess: function(json){
	    	if(json.page.data.length>0){
	    		buildHtmlWithJsonArray("buyer",json.page.data , false,true);
	    	}else{
	    		$('#FangMore').css('display','none');
	    	}
	        
	    }
	  });
}

function view(id){
	window.location='ckyy.jsp?orderId='+id;
}
function more(){
	currentPageNo++;
	doSearch();
}

$(function(){
	doSearch();
});
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
     	  <span class="s1"><a href="index.jsp"><img src="images/logo.png" /></a></span>
          <span class="s4"><a href="#">&lt;</a></span>
          <span class="s5">个人中心</span>
     </div>
     
     <div id="user">
     
          <div class="name">
          		<p>${user.tel }</p>
               <p>${user.name }</p>
               
          </div>
          
          
          <div class="litNav"><a href="#"><span class="curr">我的预约</span></a><a href="#"><span >我的收藏</span></a>
          	<a href="#"><span >我的浏览</span></a>
          </div>
            <div class="orders">
                        
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
				    <thead>
						  <tr>
						    <td align="center" valign="middle" bgcolor="#eeeeee" height="35">姓名</td>
						    <td align="center" valign="middle" bgcolor="#eeeeee" height="35">预约楼盘</td>
						    <td align="center" valign="middle" bgcolor="#eeeeee" height="35">预约时间</td>
						    <td align="center" valign="middle" bgcolor="#eeeeee" height="35">状态</td>
						  </tr>
				    </thead>
				  <tr style="display:none" class="buyer" ontouchend="view($[id])" onclick="view($[id]);">
				    <td align="center" valign="middle" height="30">$[buyerName]</td>
				    <td align="center" valign="middle" height="30">$[estateName]</td>
				    <td align="center" valign="middle" height="30">$[addtime]</td>
				    <td align="center" valign="middle" height="30">$[status]</td>
				  </tr>
				</table>

               </div>
          <div id="FangMore" onclick="more();">查看更多预约</div>
<!--           <div class="litNav"><a href="#">我的收藏</a></div> -->
<!--           <div class="litNav"><a href="#">我的浏览</a></div> -->
     
     </div>
     
      <jsp:include page="bottom.jsp" />

</div>

</body>
</html>
