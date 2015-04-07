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
	    	if (json.page.totalCount<=10) {
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
     	  
          <span class="s4"><a href="#">&lt;</a></span>
          <span class="s5">我的佣金</span>
     </div>
     <div style="text-align:center;color:white;margin-top:20px;">
     	<div style="width:45%;margin-left:3%;height:110px;float:left;background:rgb(144, 172, 40);border-radius: 10px;position:relative">
     		<div style="margin-top:18px;padding-bottom: 15px;  border-bottom: solid 1px gray"><img style="position:absolute;;margin-top:6px;height:18px;" src="images/money.png"/><span style="font-size:20px;margin-left:20px;">可结佣金</span></div>
     		<div style="margin-top:20px;">${allYongjin }元 <span style="font-size:12px;">RMB</span> </div>
     	</div>
     	<div style="width:45%;margin-right:3%;height:110px;float:right;background:rgb(144, 172, 40);border-radius:10px;position:relative;">
			<div style="margin-top:18px;padding-bottom: 15px;  border-bottom: solid 1px gray"><img style="position:absolute;;margin-top:6px;height:18px;" src="images/money.png"/><span style="font-size:20px;margin-left:20px;">已结佣金</span></div>
			<div style="margin-top:20px;">${yongjin }元 <span style="font-size:12px;">RMB</span> </div>
		</div>
     </div>
     <div id="user">
     
          	<div style="  color: rgb(173,173,173);  font-weight: bold;  margin-top: 20px;  border-bottom: 1px solid #ddd;padding-left:3%">账目明细</div>
            <div class="orders" style="margin-top:20px;">
                        
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
				    <thead>
						  <tr>
						    <td align="center" valign="middle" bgcolor="#eeeeee" height="35">楼盘名称</td>
						    <td align="center" valign="middle" bgcolor="#eeeeee" height="35">被推荐人</td>
						    <td align="center" valign="middle" bgcolor="#eeeeee" height="35">奖励金额</td>
						    <td align="center" valign="middle" bgcolor="#eeeeee" height="35">状态</td>
						  </tr>
				    </thead>
				  <tr style="display:none;height:50px;" class="buyer" >
				    <td align="center" valign="middle" height="30">$[estateName]</td>
				    <td align="center" valign="middle" height="30">$[buyerName]</td>
				    <td align="center" valign="middle" height="30">$[yongjin]</td>
				    <td align="center" valign="middle" height="30">$[status]</td>
				  </tr>
				</table>

               </div>
          <div id="FangMore" onclick="more();">更多</div>
     
     </div>
     
      <jsp:include page="bottom.jsp" />

</div>

</body>
</html>
