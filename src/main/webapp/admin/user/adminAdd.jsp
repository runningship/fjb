<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp" />
<script type="text/javascript">
$(function(){
	
});

function save(){
    if(checkNotnullInput()==false){
        return;
    }
    var a=$('form[name=form1]').serialize();
    YW.ajax({
        type: 'POST',
        url: '${projectName}/c/admin/user/doSave',
        data:a,
        mysuccess: function(data){
            alert('添加成功');
            window.location = 'adminList.jsp';
        }
    });
}
		
</script>
</head>
<body>
<form name="form1" method="post" class="definewidth m20">
<input type="hidden" name="type" value="admin"/>
<table class="table table-bordered table-hover m10">
	<tr>
        <td class="tableleft">账号</td>
        <td><input type="text" name="account" not-null="true"/></td>
    </tr>
    <tr>
        <td class="tableleft">姓名</td>
        <td><input type="text" name="name" not-null="true"/></td>
    </tr>
    <tr>
        <td class="tableleft">电话</td>
        <td><input type="text" name="tel" not-null="true"/></td>
    </tr>
    <tr>
        <td class="tableleft">邮箱</td>
        <td><input type="text" name="email"/></td>
    </tr>
    <tr>
        <td class="tableleft">密码</td>
        <td><input type="password" name="pwd" not-null="true"/></td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button class="btn btn-primary" type="button" onclick="save();return false;">保存</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>