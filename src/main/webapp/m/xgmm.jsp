<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/user.css" />
<jsp:include page="../header.jsp" />

<script type="text/javascript">
$(function(){
  var id = getParam('id');
  $('#id').val(id);
});

function save(){
    var a=$('form[name=form1]').serialize();
        var b = $('#newPwd').val();
        var c = $('#replyPwd').val();
        if (b!=c) {
            alert('两次输入的密码不一致，请重新输入');
            window.location.reload();
            return;
        };
    YW.ajax({
        type: 'POST',
        url: '${projectName}/c/admin/user/modifyPwd',
        data:a,
        mysuccess: function(data){
          alert('修改成功');
          setTimeout(function(){window.location='user.jsp'} , 1500);
        }
    });
}

</script>

<style type="text/css">
.litNav .curr{background-color:#E8C6A4}
.orders td{border-bottom: 1px dashed;border-bottom-color: yellowgreen;}
</style>
</head>

<body>
<jsp:include page="top.jsp"></jsp:include>
<div class="main" >
     
     <div id="top" style="height:0px;padding:5px 0px;">
     </div>
     
     <div id="user" >
     
<div class="dialog-custom dialog-book">
  <form name="form1" role="from">
      <div style="display:none">
      <input name="id" id="id">
      </div>
      <div class="form-field">
        <label style="width:23%">旧密码</label>
        <input type="password" placeholder="请输入旧密码" name="oldPwd" class="int int-num">
        <div name="tip" class="tips"><i class="icon-error"></i><span></span></div>
      </div>
      <div class="form-field">
        <label style="width:23%">新密码</label>
        <input type="password" placeholder="请输入新密码" name="newPwd" id="newPwd" autocomplete="off" class="int int-num">
        <div name="tip" class="tips"><i class="icon-error"></i><span></span></div>
      </div>
      <div class="form-field">
        <label style="width:23%">重复新密码</label>
        <input type="password" placeholder="重复新密码" name="replyPwd" id="replyPwd" class="int int-num">
        <div name="tip" class="tips"><i class="icon-error"></i><span></span></div>
      </div>
      
      <div style="padding: 15px 0 0;text-align: center;">
        <button class="btn-active" name="confirm" type="button" onclick="save();return false;">确认修改</button>
      </div>
  </form>
    </div>
     </div>
     
      <jsp:include page="bottom.jsp" />

</div>

</body>
</html>
