<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${projectName }/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${projectName }/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${projectName }/Css/style.css" />
    <script type="text/javascript" src="${projectName }/js/jquery.js"></script>
    <script type="text/javascript" src="${projectName }/js/bootstrap.js"></script>
    <script type="text/javascript" src="${projectName }/js/artDialog/jquery.artDialog.source.js?skin=default"></script>
    <script type="text/javascript" src="${projectName }/js/artDialog/plugins/iframeTools.source.js"></script>
    <script type="text/javascript" src="${projectName }/js/buildHtml.js"></script>
    <script type="text/javascript" src="${projectName}/js/uploadify/jquery.uploadify.js"></script>
	<script type="text/javascript">
		$(function(){
			
		});
		
		function save(){
		    var a=$('form[name=form1]').serialize();
		    YW.ajax({
		        type: 'POST',
		        url: '${projectName}/c/admin/house/doSave',
		        data:a,
		        dataType:'json',
		        mysuccess: function(data){
		        	if(data.result){
		        		alert(data.result);	
		        	}else{
		        		alert('添加成功');
		        	}
		        }
		    });
		}
</script>
</head>
<body>
<form name="form1" method="post" class="definewidth m20">
	<input type="hidden" name="estateId"  value="${estateId }"/>
<table class="table table-bordered table-hover m10">
	
    <tr>
        <td class="tableleft">楼栋</td>
        <td><input type="text" name="dhao"/></td>
    </tr>
    <tr>
        <td class="tableleft">单元</td>
        <td><input type="text" name="unit"/></td>
    </tr>
    <tr>
        <td class="tableleft">房间号</td>
        <td><input  style="width:101px;" type="text" name="lcengStart"/>层到<input style="width:101px;" type="text" name="lcengEnd"/>层&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            层内编号：<input style="width:101px;" type="text" name="fanghao"/></td>
    </tr>
    <tr>
        <td class="tableleft">面积</td>
        <td><input type="text" name="mji" id="mji" /></td>
    </tr>
    <!-- <tr>
        <td class="tableleft">主图片</td>
        <td><input id="main_upload"  style="display:none;margin-top:5px;">
        	<div id="main_img_container">
        	</div>
        </td>
    </tr> -->
    <tr>
        <td class="tableleft">户型</td>
        <td>
            <select  class="sortSelect" name="hxing">
                <option value="" >所有</option>
                <c:forEach items="${hxings}" var="hxing">
                  <option value="${hxing.name}">${hxing.name}</option>
                </c:forEach>
            </select>
        </td>
    </tr>
    <tr>
        <td class="tableleft">朝向</td>
        <td>
            <select  class="sortSelect" name="cxiang">
                <option value="东" >东</option>
                <option value="西" >西</option>
                <option value="南" >南</option>
                <option value="北" >北</option>
            </select>
        </td>
    </tr>
    <tr>
        <td class="tableleft">单价</td>
        <td><input type="text" name="djia" id="djia" />元/平方</td>
    </tr>
    <tr>
        <td class="tableleft">优惠方案</td>
        <td><input type="text" name="yufu"/>抵<input type="text" name="shidi"/></td>
    </tr>
    <tr>
        <td class="tableleft">折后总价</td>
        <td><input type="text" name="totalPrice" id="totalPrice" /></td>
    </tr>
    <tr>
        <td class="tableleft">佣金</td>
        <td><input type="text" name="yongjin"/></td>
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