<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="header.jsp" />
<script type="text/javascript">
  
function save(){
  var a=$('form[name=form1]').serialize();
    YW.ajax({
      type: 'POST',
      url: 'c/admin/user/doRegiste',
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

<jsp:include page="top.jsp"></jsp:include>

<div class="warp loginMain" style="margin-bottom:50px;">
      
      
<form name="form1" role="form" onsubmit="save();return false">
      <div class="main">
      
           <div class="fr loginLeft" style="margin-top:80px;"><img src="images/tu.png" /></div>
           
           <h2 style=" font-size:18px; margin-bottom:8px; color:#444444;">新用户注册</h2>
           <div class="fl form-login">
              
                <p><label for="name">手机号码</label><span class="form-tips">用户名不存在</span></p>
               <input type="text" placeholder="请输入手机号" class="name" name="tel">
               
              <p><label for="captcha">密码</label><span class="form-tips">请输入您的密码</span></p>
               <input type="password" placeholder="请输入您的密码" class="password" name="pwd">

              <p><label for="captcha">姓名</label><span class="form-tips">请输入您的姓名</span></p>
               <input type="text" placeholder="请输入您的姓名" class="name" name="name">
               
               <p><label for="captcha">公司名称</label><span class="form-tips">请输入您的公司名称</span></p>
               <input type="text" placeholder="公司名称+分店" class="name" name="compName">
               
               <p><label for="captcha">请输入图片验证码</label><span class="form-tips">验证码错误</span></p>
              <div class="form-field">
               <input type="text" placeholder="请输入图片验证码" class="captcha" name="yzm">
          <img alt="图片验证码" src="c/yzm" onclick="this.src='c/yzm?t='+(+new Date)" style="cursor: pointer;width:100px;">
               </div>
               <input type="submit" class="btn-login" value="注册" />
           
           </div>
      
      </div>
</form>
</div>

<jsp:include page="foot.jsp"></jsp:include>

</body>
</html>
