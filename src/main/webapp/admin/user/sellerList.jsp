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
	    url: '${projectName}/c/admin/user/listData?type=seller',
	    data: a,
	    dataType:'json',
	    mysuccess: function(json){
	        buildHtmlWithJsonArray("repeat",json.page.data);
	        Page.setPageInfo(json.page);
	    }
	  });
}
	function del(id){
		art.dialog.confirm('删除后不可恢复，确定要删除吗？', function () {
		    YW.ajax({
		        type: 'POST',
		        url: '${projectName}/c/admin/user/delete?id='+id,
		        data:'',
		        mysuccess: function(data){
                    doSearch();
		            alert('删除成功');
		        }
		      });
		  },function(){},'warning');
	}

	function toggleShenhe(id){
		YW.ajax({
	        type: 'POST',
	        url: '${projectName}/c/admin/user/toggleShenHe?id='+id,
	        data:'',
	        mysuccess: function(data){
	            alert('操作成功');
	            doSearch();
	        }
	      });
	}
	$(function () {
		Page.Init();
		doSearch();
	});
</script>
</head>
<body>
<form class="form-inline definewidth m20" name="form1"  method="get" onsubmit="return false;">
</form>

<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
    	<th>编号</th>
        <th>姓名</th>
        <th>电话</th>
        <th>公司名称</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    	<tr style="display:none" class="repeat">
    			<td>$[id]</td>
                <td>$[name]</td>
                <td>$[tel]</td>
                <td>$[compName]</td>
                <td>
                	<a href="#"  show="$[valid]==1" onclick="toggleShenhe($[id])">已审核</a>
                	<a href="#"  show="$[valid]==0" onclick="toggleShenhe($[id])">未审核</a>
                </td>
                <td>
                    <a href="#" onclick="del($[id])">删除</a>
                </td>
            </tr>
    </tbody>
	</table>

	<div class="footer" style="margin-top:5px;margin-left:35px;">
        <div class="maxHW mainCont ymx_page foot_page_box"></div>
    </div>
</body>
</html>
