<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/user.css" />
<script type="text/javascript" src="${projectName}/js/validate.js"></script>
<jsp:include page="../header.jsp" />
<script type="text/javascript" src="${projectName}/js/city/jquery.cityselect.js"></script>
<script type="text/javascript" src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>
<script type="text/javascript">
  
function save(){
 if(checkNotnullInput()==false){
      return;
  }
	 
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


var sessionCity;
var sessionProvince;
$(function(){
	var province_reg = remote_ip_info['province'];
	var city_reg = remote_ip_info['city']
	var district_reg = remote_ip_info['district'];
	if(sessionProvince && sessionCity){
		$("#city_reg").citySelect({
			prov : sessionProvince, 
	    	city : sessionCity,
		});
	}else{
		$("#city_reg").citySelect({
			prov: province_reg, 
	    	city: city_reg,
	    	dist: district_reg,
		});
	}
});

</script>
<style type="text/css">
#city_reg select{height:30px;width:100px;}
</style>
</head>

<body>
<div class="main">
     
     <div id="top">
     	 <span class="s1"><a href="index.jsp"><img src="images/logo.png" /></a></span>
          <span class="s4"><a href="#">&lt;</a></span>
          <span class="s5">经纪人注册</span>
     
     </div>

<form name="form1" role="form" onsubmit="save();return false">
	<input type="hidden" name="type" value="seller" />
     <div id="user">
     
           <ul class="myInfoBox BColor">
              <li><label style="width:70px; text-align:right;">手机号码：</label><input type="text"  not-null="true"  name="tel" id="tel" placeholder="设定您的手机号码"></li>
              <li><label style="width:70px; text-align:right;">密码：</label><input type="password"  not-null="true"  name="pwd" id="pwd" placeholder="设置您的密码"></li>
              <li><label style="width:70px; text-align:right;">确认密码：</label><input type="password" name="mm1" id="mm1" placeholder="确认您的密码"></li>
              <li><label style="width:70px; text-align:right;">姓名：</label><input type="text" name="name" not-null="true"  id="name" placeholder="输入您的姓名"></li>
              
               <li><label style="width:70px; text-align:right;">城市：</label>
               <div id="city_reg" style="display:inline-block;">
			  		<select class="prov"  id="province_reg"  name="province"></select> 
			    	<select class="city" name="city"></select>
			    	<select class="dist"  name="quyu"></select>
		    	</div></li>
              <li><label style="width:70px; text-align:right;">公司名称：</label><input type="text" not-null="true"  name="compName" id="compName" placeholder="输入您的公司名称"></li>
              <li><label style="width:70px; text-align:right;">部门名称：</label><input type="text" not-null="true"  name="deptName" id="deptName" placeholder="输入您的部门名称"></li>
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
