<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/user.css" />
<script type="text/javascript" src="${projectName}/js/validate.js"></script>
<jsp:include page="../header.jsp" />
<script type="text/javascript">
  
function save(){
  if ($('#buyerName').val()==null||$('#buyerName').val()=="") {
    alert('客户名不能为空');
    return;
  }
  if ($('#buyerTel').val()==null||$('#buyerTel').val()=="") {
    alert('客户电话不能为空');
    return;
  }
  var a=$('form[name=form1]').serialize();
    $.ajax({
      type: 'POST',
      url: '${projectName}/c/admin/order/doSave',
      data:a,
      dataType:'json',
      success: function(data){
          alert('预约成功');
          window.history.go(-1);
      },
      error:function(data){
        var json = JSON.parse(data.responseText);
        alert(json.msg);
      }
  });
}


</script>
</head>

<body>
<div class="main">
     <jsp:include page="top.jsp"></jsp:include>
     <div id="top" style="text-align:center">
     
          <span class="s4"><a href="#">&lt;</a></span>
          <span style="margin-left:0;color: #fff;font-size: 1.1em;" >预约${estate.name}</span>
     
     </div>
     
     
<form name="form1" role="form" onsubmit="save();return false;">
     
     <div id="user">
     
          <ul class="myInfoBox BColor">
              <li style="display:none;"><input type="text" value="${estate.id }" name="estateId"></li>
              <li><label style="width:70px; text-align:right;">客户姓名：</label><input type="text" id="buyerName" name="buyerName"></li>
              <li>
                 <label style="width:70px; text-align:right;">客户电话：</label>
                 <input id="buyerTel" name="buyerTel"></li>
              <li><label style="width:70px; text-align:right; float:left;">验证码：</label>
              <input type="text" name="yzm" id="yzm" placeholder="看右边图片" style="width:80px; float:left; margin-top:15px;"><div style=" float:left; margin-top:6px;">
              <img alt="图片验证码" src="${projectName}/c/yzm" onclick="this.src='${projectName}/c/yzm?t='+(+new Date)"style="width: 102px;height: 50px;"></div></li>
          </ul>
          
          <div class="confirm">
                 <input type="submit" value="提交" id="subbtn" style="display: none;">
                 <a href="javascript:void(0)" onclick="save();return false;">马上推荐</a>
          </div>
     
     </div>
     
</form>
     
</div>

</body>
</html>
