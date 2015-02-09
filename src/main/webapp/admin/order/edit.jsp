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
		    var a=$('form[name=form1]').serialize();
		    YW.ajax({
		        type: 'POST',
		        url: '${projectName}/c/admin/order/update',
		        data:a,
		        mysuccess: function(data){
		            alert('修改成功');
		        }
		    });
		}
</script>
</head>
<body>
<form name="form1" method="post" class="definewidth m20">
	<input type="hidden" name="id"  value="${order.id}"/>
<table class="table table-bordered table-hover m10">
	
    <tr>
        <td class="tableleft">楼盘</td>
        <td>${estate.name}</td>
    </tr>
    <c:if test="${house!=null}">
    <tr>
        <td class="tableleft">楼栋</td>
        <td><input type="text" name="dhao" value="${house.dhao}" /></td>
    </tr>
    <tr>
        <td class="tableleft">单元</td>
        <td><input type="text" name="unit" value="${house.unit}" /></td>
    </tr>
    <tr>
        <td class="tableleft">房间号</td>
        <td><input  style="width:101px;" type="text" name="fhao" value="${house.fhao}"/></td>
    </tr>
    </c:if>
    <tr>
        <td class="tableleft">经纪人姓名/电话</td>
        <td><span>${order.sellerName}</span>
        </td>
    </tr>
     <tr>
        <td class="tableleft">经纪人电话</td>
        <td><span>${sellerTel}</span>
        </td>
    </tr>
    <tr>
        <td class="tableleft">客户姓名</td>
        <td><span>${order.buyerName}</span>
        </td>
    </tr>
    <tr>
        <td class="tableleft">客户电话</td>
        <td>
            <span>${order.buyerTel}</span>
        </td>
    </tr>
    <tr>
        <td class="tableleft">备注</td>
        <td>${order.sellerMark}</td>
    </tr>
    <!-- <tr>
        <td class="tableleft">主图片</td>
        <td><input id="main_upload"  style="display:none;margin-top:5px;">
            <div id="main_img_container">
            </div>
        </td>
    </tr> -->
    <tr>
        <td class="tableleft">状态</td>
        <td>
            <select  class="sortSelect" name="status">
                <option value="" >所有</option>
                <c:forEach items="${statusList}" var="status">
                  <option <c:if test="${status eq order.status }">selected="selected"</c:if> value="${status}">${status}</option>
                </c:forEach>
            </select>
        </td>
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