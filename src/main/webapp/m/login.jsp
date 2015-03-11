<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/user.css" />
<script type="text/javascript" src="${projectName}/js/validate.js"></script>
<jsp:include page="../header.jsp" />
<script type="text/javascript">
  
function login(){
  var a=$('form[name=form1]').serialize();
    $.ajax({
      type: 'POST',
      url: '${projectName}/c/admin/user/login',
      data:a,
      dataType:'json',
      success: function(data){
          alert('登陆成功');
          window.location = 'index.jsp';
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
     
     <div id="top">
     
          <span class="s4"><a href="#">&lt;</a></span>
          <span class="s5">登陆</span>
          <span class="s3">合肥<i class="sanj"></i></span>
     
     </div>
     
     
<form name="form1" role="form" onsubmit="login();return false;">
     
     <div id="user">
     
          <ul class="myInfoBox BColor">
              <li><label style="width:70px; text-align:right;">用户名：</label><input type="text" id="tel" name="tel" placeholder="输入用户名"></li>
              <li>
                 <label style="width:70px; text-align:right;">密　码：</label>
                 <input type="password" id="pwd" name="pwd" placeholder="输入正确的密码"></li>
              <li><label style="width:70px; text-align:right; float:left;">验证码：</label>
              <input type="text" name="yzm" id="yzm" placeholder="看右边图片" style="width:150px; float:left; margin-top:15px;"><div style=" float:left; margin-top:6px;">
              <img alt="图片验证码" src="${projectName}/c/yzm" onclick="this.src='${projectName}/c/yzm?t='+(+new Date)"style="width: 122px;height: 50px;"></div></li>
          </ul>
          
          <div class="confirm">
                 <input type="submit" value="提交" id="subbtn" style="display: none;">
                 <a href="javascript:void(0)" onclick="login();return false;">登陆</a>
          </div>
          
          <p style="margin:25px;"><a href="#">您还没有账号？立即注册</a></p>
     
     </div>
     
</form>
     
     <div class="Pfixed">
     
         <div id="footer">
         
              <div class="nbox">
                   <p><img src="images/home.png" /></p>
                   <p><i class="sel">首页</i></p>
              </div>
              
              <div class="nbox">
                   <p><img src="images/user.png" /></p>
                   <p><i>我的</i></p>
              </div>
         
         </div>
     
     </div>

</div>

</body>
</html>
