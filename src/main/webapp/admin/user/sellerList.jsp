<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head> 
<jsp:include page="../header.jsp" />
<script type="text/javascript" src="../../js/city/jquery.cityselect.js"></script>
<script type="text/javascript" src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>
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

	function edi(id){
  		art.dialog.open("${projectName}/admin/user/sellerEdit.jsp?id="+id,{
  			id:'edit_seller',
  			title:  '修改经纪人',
  			width:  440,
  			height: 400
  		})
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
		var province_reg = remote_ip_info['province'];
		var city_reg = remote_ip_info['city']
		var district_reg = remote_ip_info['district'];
		$("#city_reg").citySelect({
			prov: province_reg, 
	    	city: city_reg,
	    	dist: district_reg
		});
		Page.Init();
		doSearch();
	});
</script>
<style type="text/css">
#city_reg select{height:30px;width:120px;}
#adminName select{height:30px;width:120px;}
#adminName label{height:30px;width:90px;}
</style>
</head>
<body>
<form class="form-inline definewidth m20" name="form1"  method="get" onsubmit="return false;">
               <div id="city_reg" style="display:inline-block;">
<!--                		<span style="font-size:14px; width:50px;pading-right:20px;">区域 </span> -->
			  		<select class="prov"  id="province_reg"  name="province"></select> 
			    	<select class="city" name="city"></select>
			    	<select class="dist"  name="quyu"></select>
		    	</div>
      <div style="display:inline-block;margin-left:20px;" id="adminName">
        <label>经纪服务人员</label>
        <select>
          <option name="adminName" value="">所有</option>
        <c:forEach items="${admins}" var="admin">
          <option name="adminId" <c:if test="${admin.name==seller.adminName}"> select="selected" </c:if> value="${admin.id}"> ${admin.name}</option>
        </c:forEach>
        </select>
      </div>
    <button type="button" class="btn btn-success btn_subnmit" onclick="doSearch();return false;">搜索</button>
</form>

<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
    	<th>经纪人ID</th>
        <th>电话号码</th>
        <th>真实姓名</th>
        <th>城市</th>
        <th>区域</th>
        <th>所属公司</th>
        <th>所属门店</th>
        <th>经纪服务人员</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    	<tr style="display:none" class="repeat">
    			<td>$[id]</td>
                <td>$[tel]</td>
                <td>$[name]</td>
                <td>$[city]</td>
                <td>$[quyu]</td>
                <td>$[compName]</td>
                <td>$[deptName]</td>
                <td>
                	<d href="#" show="$[valid]==1">$[adminName]</d>
                	<d href="#" show="$[valid]==0">未分配</d>
                </td>
                <td>
                	<a href="#"  show="$[valid]==1" onclick="toggleShenhe($[id])">已审核</a>
                	<a href="#"  show="$[valid]==0" onclick="toggleShenhe($[id])">未审核</a>
                </td>
                <td>
                	<a href="#" onclick="edi($[id]);">编辑</a>
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
