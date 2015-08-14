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
  if ($('#pwd').val()!=$('#mm1').val()) {
    alert('两次输入的密码不一致');
    return;
  };
  var a=$('form[name=form1]').serialize();
    YW.ajax({
      type: 'POST',
      url: '${projectName}/c/admin/user/doRegiste',
      data:a,
      mysuccess: function(data){
          // $('#saveBtn').removeAttr('disabled');
          //art.dialog.close();
          infoAlert('注册成功,工作人员会第一时间与您联系，审核成功后即可登录');
      }
  });
}


</script>
</head>

<body>
<div class="main">
     
     <div id="top">
     	 <span class="s1"><a href="index.jsp"><img src="images/logo.png" /></a></span>
          <span class="s4"><a href="#">&lt;</a></span>
          <span class="s5">注册</span>
     
     </div>

<form name="form1" role="form" onsubmit="save();return false">
     <div id="user">
     
           <ul class="myInfoBox BColor">
              <li><label style="width:70px; text-align:right;">手机号码：</label><input type="text" name="tel" id="tel" placeholder="设定您的手机号码"></li>
              <li><label style="width:70px; text-align:right;">密码：</label><input type="password" name="pwd" id="pwd" placeholder="设置您的密码"></li>
              <li><label style="width:70px; text-align:right;">确认密码：</label><input type="password" name="mm1" id="mm1" placeholder="确认您的密码"></li>
              <li><label style="width:70px; text-align:right;">姓名：</label><input type="text" name="name" id="name" placeholder="输入您的姓名"></li>
         </ul>
          
          <div class="confirm">
                 <input type="submit" value="提交" id="subbtn" style="display: none;">
                 <a href="javascript:void(0)" onclick="save();return false;">注册</a>
          </div>
          
          <p style="margin:25px;"><a href="login.jsp">已有账号？请登陆</a></p>
     
     </div>
</form>

</div>

</body>
</html>
