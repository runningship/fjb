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
		        url: '${projectName}/c/admin/estate/update',
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
	<input type="hidden" name="id"  value="${estate.id}"/>
<table class="table table-bordered table-hover m10">
	
    <tr>
        <td class="tableleft">名称</td>
        <td><input type="text" name="name" value="${estate.name }"/></td>
    </tr>
    <tr>
        <td class="tableleft">区域</td>
        <td>
        	<select  class="sortSelect" name="quyu">
                <option value="" >所有</option>
                <c:forEach items="${quyus}" var="quyu">
                  <option value="${quyu.value}">${quyu.value}</option>
                </c:forEach>
            </select>
        </td>
    </tr>
    <tr>
        <td class="tableleft">均价</td>
        <td><input type="text" name="junjia" value="${junjia }"/>元/平方</td>
    </tr>
    
    <tr id="tr_conts" >
    	<td class="tableleft">开盘时间</td>
    	<td></td>
    </tr>
    <tr>
        <td class="tableleft">建筑类型</td>
        <td>
        	<select  class="sortSelect" name="lxing">
                <option value="" >所有</option>
                <c:forEach items="${lxings}" var="lxing">
                  <option value="${lxing.value}">${lxing.value}</option>
                </c:forEach>
            </select>
       </td>
    </tr>
    <tr>
        <td class="tableleft">物业类型</td>
        <td><select  class="sortSelect" name="wylx">
                <option value="" >所有</option>
                <c:forEach items="${wylxs}" var="wylx">
                  <option value="${wylx.value}">${wylx.value}</option>
                </c:forEach>
            </select></td>
    </tr>
    <tr>
        <td class="tableleft">装修</td>
        <td><select  class="sortSelect" name="zxiu">
                <option value="" >所有</option>
                <c:forEach items="${zxius}" var="zxiu">
                  <option value="${zxiu.value}">${zxiu.value}</option>
                </c:forEach>
            </select></td>
    </tr>
    <tr>
        <td class="tableleft">建筑面积</td>
        <td><input type="text" name="jzmj"  value="${estate.jzmj }" />平方</td>
    </tr>
    <tr>
        <td class="tableleft">容积率</td>
        <td><input type="text" name="rongji" value="${estate.rongji }"/></td>
    </tr>
    <tr>
        <td class="tableleft">规划面积</td>
        <td><input type="text" name="ghmj" value="${estate.ghmj }"/>平方</td>
    </tr>
    <tr>
        <td class="tableleft">绿化率</td>
        <td><input type="text" name="lvhua" value="${estate.lvhua }"/></td>
    </tr>
    <tr>
        <td class="tableleft">车位数</td>
        <td><input type="text" name="chewei" value="${estate.chewei }"/></td>
    </tr>
    <tr>
        <td class="tableleft">规划户数</td>
        <td><input type="text" name="hushu"  value="${estate.hushu }"/></td>
    </tr>
    <tr>
        <td class="tableleft">物业费</td>
        <td><input type="text" name="wyfee" value="${estate.wyfee }"/>元/平方*月</td>
    </tr>
    <tr>
        <td class="tableleft">楼盘特色</td>
        <td><textarea name="tese"  >${estate.tese }</textarea></td>
    </tr>
    <tr>
        <td class="tableleft">开发商</td>
        <td><input type="text" name="developer" value="${estate.developer }"/></td>
    </tr>
    <tr>
        <td class="tableleft">物业公司</td>
        <td><input type="text" name="wyComp" value="${estate.wyComp }"/></td>
    </tr>
    <tr>
        <td class="tableleft">地址</td>
        <td><input type="text" name="addr" value="${estate.addr }"/></td>
    </tr>
    <tr>
        <td class="tableleft">户型图</td>
        <td><input id="hxing_upload"  style="display:none;margin-top:5px;">
        	<div id="hxing_img_container">
        	</div>
        </td>
    </tr>
     <tr>
        <td class="tableleft">效果图</td>
        <td><input id="xiaoguo_upload"  style="display:none;margin-top:5px;">
        	<div id="xiaoguo_img_container">
        	</div>
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