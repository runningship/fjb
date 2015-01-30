<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="style/css.css" />
<script src="js/jquery-1.6.4.min.js"></script>
<script src="js/jquery.nivo.slider.pack.js"></script> 
<script src="${projectName}/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="${projectName}/js/buildHtml.js"></script>
</head>
<script type="text/javascript">
  
function save(){
  var a=$('form[name=form1]').serialize();
    YW.ajax({
      type: 'POST',
      url: 'c/order/doSave',
      data:a,
      mysuccess: function(data){
          // $('#saveBtn').removeAttr('disabled');
          //art.dialog.close();
          // art.dialog.opener.doSearchAndSelectFirst();
          alert('提交成功');
      }
  });
}


</script>
<body>
<form name="form1" role="form">
<div class="dialog-custom dialog-book">
      <div class="form-title">
        <p class="title-main">预约&nbsp;<span>玫瑰绅城 ${dhao }栋 ${unit }单元 ${fhao }室</span></p>
        <p class="title-sub">请填写您的姓名和手机号，以便经纪人联系您看房</p>
      </div>
      <div class="form-field">
        <label>手机号</label>
        <input type="text" placeholder="请输入手机号" name="mobile" class="int int-num">
        <div name="tip" class="tips"><i class="icon-error"></i><span></span></div>
      </div>
      <div class="form-field">
        <label>姓&#12288;名</label>
        <input type="text" placeholder="请输入姓名" name="name" autocomplete="off" class="int int-num">
        <div name="tip" class="tips"><i class="icon-error"></i><span></span></div>
      </div>
      <div class="form-field">
        <label>验证码</label>
        <input type="text" placeholder="请输入图片验证码" name="yzm" class="int int-code"><a class="btn-link">
          <img alt="图片验证码" src="c/yzm" onclick="this.src='c/yzm?t='+(+new Date)" style="width:97px;height:46px;position:static">
        </a>
        <div name="tip" class="tips"><i class="icon-error"></i><span></span></div>
      </div>
      
      <div class="btn-wrap">
        <button data-house-id="10" data-url="/fang/house/ajax-subscribe-house-see?houseId=3796" onclick="save();" class="btn-active" name="confirm" type="button">立即预约</button>
      </div>
    </div>
</form>
</body>
</html>
