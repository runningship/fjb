<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/user.css" />
<script type="text/javascript" src="${projectName}/js/validate.js"></script>
<jsp:include page="../header.jsp" />
<script type="text/javascript">
  
function save(){
  if ($('#conts').val()==null||$('#conts').val()==""||$('#conts').val()==undefined) {
    alert('跟进不能为空');
    return;
  };
  var a=$('form[name=form1]').serialize();
    YW.ajax({
      type: 'POST',
      url: '${projectName}/c/admin/order/fankui',
      data:a,
      mysuccess: function(data){
        alert('跟进成功');
        var json = JSON.parse(data);
        var gj = '<p style=" margin-bottom:5px;"><em style="color:#999999;">'+json.genjin.addtime+' :</em>'+json.genjin.conts+'</p>';
        $('#id_genjin').prepend(gj);
        $('#conts').val('');
      }
  });
}


</script>

<style type="text/css">
.myInfoBox li span{margin-left:15px;}
</style>
</head>

<body>
<div class="main">
     
     <div id="top">
     	 <span class="s1"><a href="index.jsp"><img src="images/logo.png" /></a></span>
          <span class="s4"><a href="#">&lt;</a></span>
          <span class="s5">预约查看</span>
     
     </div>

<form name="form1" role="form" onsubmit="save();return false">
    <input name="orderId" value="${order.id}" style="display:none" />
           <ul class="myInfoBox BColor">
              <li><label style="width:70px; text-align:right;">客户姓名:</label><span>${order.buyerName}</span></li>
              <li><label style="width:70px; text-align:right;">联系电话:</label><span>${order.buyerTel}</span></li>
              <li><label style="width:70px; text-align:right;">预约楼盘:</label><span>${estate.name}</span></li>
              <li><label style="width:70px; text-align:right;">预约时间:</label><span><fmt:formatDate value="${order.addtime}" pattern="yyyy-MM-dd HH:mm"/></span></li>
              <li><label style="width:70px; text-align:right; float:left;">状态:</label><span>${order.status}</span></li>
              <li><textarea  style="width:70%; height:52px; border:1px solid #CCC; margin-top:5px;resize:none" id="conts" name="conts"></textarea>
                 <input type="submit" value="提交" id="subbtn" style="display: none;" />
                 <a href="javascript:void(0)" onclick="save();return false;" style="vertical-align:top">跟进</a></li>
         </ul>
          
</form>

	<div style="margin: 25px 4%;" id="id_genjin">
		<c:forEach items="${genjiList}" var="genjin">
        	<p style=" margin-bottom:5px;"><em style="color:#999999;"><fmt:formatDate value="${genjin.addtime}" pattern="yyyy-MM-dd HH:mm"/> :</em>${genjin.conts}</p>
    	</c:forEach>
	</div>
</div>

</body>
</html>
