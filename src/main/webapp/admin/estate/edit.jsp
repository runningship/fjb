<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <script type="text/javascript" src="../../js/fjb.js"></script>
    <script type="text/javascript" src="../../js/DatePicker/WdatePicker.js"></script>
    
    <script type="text/javascript" src="../../js/city/jquery.cityselect.js"></script>
	<script type="text/javascript" src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>
	<script type="text/javascript">
		
		$(function(){
			setTimeout(function(){
				initUploadHouseImage('shijing_upload' , 'shijing' , '${estate.uuid}');
				initUploadHouseImage('guihua_upload' , 'guihua' , '${estate.uuid}');
				initUploadHouseImage('xiaoguo_upload' , 'xiaoguo' , '${estate.uuid}');
				initUploadHouseImage('main_upload' , 'main' ,'${estate.uuid}');
			},100);
			getImgList('${estate.uuid}' ,'main');
			getImgList('${estate.uuid}' ,'xiaoguo');
			getImgList('${estate.uuid}' ,'guihua');
			getImgList('${estate.uuid}' ,'shijing');
			
			$('#tehui').val(${estate.tehui});
			$('#tuijian').val(${estate.tuijian});
			
			var myprovince = remote_ip_info['province'];
			var mycity = remote_ip_info['city']
			var mydistrict = remote_ip_info['district'];
			$("#city_1").citySelect({
				prov: '${estate.province}', 
		    	city: '${estate.city}',
		    	dist: '${estate.quyu}'
			});
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
        <td class="tableleft">电话</td>
        <td><input type="text" name="tel" value="${estate.tel }"/></td>
    </tr>
    <tr>
        <td class="tableleft">主图片<em style="color:red">*</em></td>
        <td><input id="main_upload"  style="display:none;margin-top:5px;">
        	<div id="main_img_container">
        	</div>
        </td>
    </tr>
    <tr>
        <td class="tableleft">区域</td>
        <td>
        	<!--
        	<select  class="sortSelect" name="quyu">
                <option value="" >所有</option>
                <c:forEach items="${quyus}" var="quyu">
                  <option <c:if test="${quyu.value eq estate.quyu }">selected="selected"</c:if> value="${quyu.value}">${quyu.value}</option>
                </c:forEach>
            </select>
            -->
            <div id="city_1" style="display:inline-block;">
		  		<select class="prov"  id="province" name="province"></select> 
		    	<select class="city" id="city" name="city"></select>
		    	<select class="dist" id="dist"  name="quyu"></select>
		    </div>
        </td>
    </tr>
    <tr>
        <td class="tableleft">均价</td>
        <td><input type="text" name="junjia" value="${estate.junjia }"/>元/平方</td>
    </tr>
    <tr>
        <td class="tableleft">特惠价</td>
        <td><input type="text" name="tejia" value="${estate.tejia }"/>元/平方</td>
    </tr>
    <tr id="tr_conts" >
    	<td class="tableleft">开盘时间</td>
    	<td><input type="text" value="<fmt:formatDate value="${estate.opentime}" pattern="yyyy-MM-dd"/>" class="form-control input-sm input-left" name="opentime" id="opentime" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})" ></td>
    </tr>
    <tr>
        <td class="tableleft">建筑类型</td>
        <td>
        	<select  class="sortSelect" name="lxing">
                <option value="" >所有</option>
                <c:forEach items="${lxings}" var="lxing">
                  <option <c:if test="${lxing.value eq estate.lxing }">selected="selected"</c:if> value="${lxing.value}">${lxing.value}</option>
                </c:forEach>
            </select>
       </td>
    </tr>
    <tr>
        <td class="tableleft">物业类型</td>
        <td><select  class="sortSelect" name="wylx">
                <option value="" >所有</option>
                <c:forEach items="${wylxs}" var="wylx">
                  <option <c:if test="${wylx.value eq estate.wylx }">selected="selected"</c:if> value="${wylx.value}">${wylx.value}</option>
                </c:forEach>
            </select></td>
    </tr>
    <tr>
        <td class="tableleft">装修</td>
        <td><select  class="sortSelect" name="zxiu">
                <option value="" >所有</option>
                <c:forEach items="${zxius}" var="zxiu">
                  <option <c:if test="${zxiu.value eq estate.zxiu }">selected="selected"</c:if> value="${zxiu.value}">${zxiu.value}</option>
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
        <td class="tableleft">经纬度</td>
        <td><input type="text" name="jingdu" placeholder="经度" value="${estate.jingdu}" />  /  <input type="text" name="weidu" placeholder="纬度" value="${estate.weidu}" /></td>
    </tr>
    <tr>
        <td class="tableleft">推荐</td>
        <td><select name="tuijian" id="tuijian">
	        <option value="0">否</option>
        	<option value="1">是</option>
        </select></td>
    </tr>
    <tr>
        <td class="tableleft">特惠</td>
        <td><select name="tehui"  id="tehui">
        	<option value="0">否</option>
        	<option value="1">是</option>
        </select></td>
    </tr>
    <tr>
        <td class="tableleft">优惠方案</td>
        <td><input type="text" name="yufu" value="${estate.yufu }"/>抵<input type="text" name="shidi" value="${estate.shidi }"/></td>
    </tr>
    <tr>
        <td class="tableleft">优惠截止时间</td>
        <td><input value="<fmt:formatDate value="${estate.youhuiEndtime}" pattern="yyyy-MM-dd"/>"  type="text" class="form-control input-sm input-left" name="youhuiEndtime" id="youhuiEndtime" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})" ></td>
    </tr>
    <tr>
        <td class="tableleft">规划图</td>
        <td><input id="guihua_upload"  style="display:none;margin-top:5px;">
        	<div id="guihua_img_container">
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
        <td class="tableleft">实景图</td>
        <td><input id="shijing_upload"  style="display:none;margin-top:5px;">
        	<div id="shijing_img_container">
        	</div>
        </td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button class="btn btn-primary" type="button" onclick="save();return false;">保存</button>
            <button class="btn btn-primary" type="button" onclick="window.location='list.jsp'">返回</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>