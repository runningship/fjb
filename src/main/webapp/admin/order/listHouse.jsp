<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp" />
<script type="text/javascript">
function doSearch(){
	var a=$('form[name=form1]').serialize();
	YW.ajax({
	    type: 'get',
	    url: '${projectName}/c/admin/order/listHouseData',
	    data: a,
	    dataType:'json',
	    mysuccess: function(json){
	        buildHtmlWithJsonArray("repeat",json.page.data);
	        Page.setPageInfo(json.page);
	    }
	  });
}

function delPost(id){
	art.dialog.confirm('删除后不可恢复，确定要删除吗？', function () {
	    YW.ajax({
	        type: 'POST',
	        url: '${projectName}/c/admin/order/delete?id='+id,
	        data:'',
	        mysuccess: function(data){
                doSearch();
	            alert('删除成功');
	        }
	      });
	  },function(){},'warning');
}

$(function () {
	Page.Init();
	$('#addnew').click(function(){
			window.location.href="add.jsp";
	 });
	doSearch();
});

</script>
</head>
<body>
<form class="form-inline definewidth m20" name="form1"  method="get" onsubmit="return false;">
    客户姓名<input type="text" name="buyerName"/>
    客户电话<input type="text" name="buyerTel"/>
    楼盘名称<input type="text" name="estateName"/>
    经纪人姓名<input type="text" name="sellerName"/>
    <button type="button" class="btn btn-success btn_subnmit" onclick="doSearch();return false;">搜索</button>
</form>

<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
    	<th>编号</th>
    	<th>楼盘</th>
        <th>楼栋</th>
        <th>单元</th>
    	<th>房间号</th>
        <th>客户</th>
        <th>客户电话</th>
        <th>经纪人</th>
        <th>预约时间</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    	<tr style="display:none" class="repeat">
    			<td>$[id]</td>
                <td>$[estateName]</td>
                <td>$[dhao]</td>
                <td>$[unit]</td>
                <td>$[fhao]</td>
                <td>$[buyerName]</td>
                <td>$[buyerTel]</td>
                <td>$[sellerName]</td>
                <td>$[addtime]</td>
                <td>$[status]</td>
                <td>
                    <a href="#" onclick="addTab('edit_yy','查看预约','order/edit.jsp?id=$[id]')">查看</a>
                </td>
            </tr>
    </tbody>
	</table>

	<div class="footer" style="margin-top:5px;margin-left:35px;">
        <div class="maxHW mainCont ymx_page foot_page_box"></div>
    </div>
</body>
</html>
