<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp" />
<script type="text/javascript" src="../../js/city/jquery.cityselect.js"></script>
<script type="text/javascript" src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>
<script type="text/javascript">
$(function(){
	setTimeout(function(){
		initUploadHouseImage('shijing_upload' , 'shijing' , '${estateUUID}');
		initUploadHouseImage('guihua_upload' , 'guihua' , '${estateUUID}');
		initUploadHouseImage('xiaoguo_upload' , 'xiaoguo' , '${estateUUID}');
		initUploadHouseImage('main_upload' , 'main' , '${estateUUID}');
	},100);
	
	var myprovince = remote_ip_info['province'];
	var mycity = remote_ip_info['city']
	var mydistrict = remote_ip_info['district'];
	$("#city_1").citySelect({
		prov:myprovince, 
    	city:mycity,
    	dist: mydistrict
	});
});


function save(){
    if(checkNotnullInput()==false){
        return;
    }
    var a=$('form[name=form1]').serialize();
    YW.ajax({
        type: 'POST',
        url: '${projectName}/c/admin/estate/doSave',
        data:a,
        mysuccess: function(data){
            alert('添加成功');
        }
    });
}

function changeQuYu(city){
    $('#quyu option').css('display','none');
    $('#quyu option[city='+city+']').css('display','block');
    var first = $('#quyu option[city='+city+']').first();
    if(first){
    	$('#quyu').val(first.text());
    }
}

</script>
</head>
<body>
<form name="form1" method="post" class="definewidth m20">
	<input type="hidden" name="uuid"  value="${estateUUID }"/>
<table class="table table-bordered table-hover m10">
	
    <tr>
        <td class="tableleft">名称</td>
        <td><input type="text" name="name" not-null="true"/></td>
    </tr>
    <tr>
        <td class="tableleft">电话</td>
        <td><input type="text" name="tel" not-null="true"/></td>
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
            <select  class="sortSelect" name="city" onchange="changeQuYu(this.value);">
                <c:forEach items="${citys}" var="city">
                  <option value="${city.value}">${city.value}</option>
                </c:forEach>
            </select>
        	<select  class="sortSelect" name="quyu" id="quyu">
                <c:forEach items="${quyus}" var="quyu">
                  <option value="${quyu.value}" city="${quyu.attr}">${quyu.value}</option>
                </c:forEach>
            </select>
            -->
            <div id="city_1" style="display:inline-block;">
		  		<select class="prov"  id="province"  name="province"></select> 
		    	<select class="city" id="city" name="city"></select>
		    	<select class="dist" id="dist"  name="quyu"></select>
		    </div>
        </td>
    </tr>
    <tr>
        <td class="tableleft">均价</td>
        <td><input type="text" name="junjia"/>元/平方</td>
    </tr>
    <tr>
        <td class="tableleft">特惠价</td>
        <td><input type="text" name="tejia"/>元/平方</td>
    </tr>
    <tr id="tr_conts" >
    	<td class="tableleft">开盘时间</td>
    	<td><input type="text" class="form-control input-sm input-left" name="opentime" id="opentime" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})" ></td>
    </tr>
    <tr>
        <td class="tableleft">建筑类型</td>
        <td>
<!--         	<select  class="sortSelect" name="lxing"> -->
<!--                 <option value="" >所有</option> -->
<%--                 <c:forEach items="${lxings}" var="lxing"> --%>
<%--                   <option value="${lxing.value}">${lxing.value}</option> --%>
<%--                 </c:forEach> --%>
<!--             </select> -->
            <c:forEach items="${lxings}" var="lxing">
              <input value="${lxing.value}" name="lxing" type="checkbox"/>${lxing.value}
            </c:forEach>
       </td>
    </tr>
    <tr>
        <td class="tableleft">物业类型</td>
        <td>
<!--         	<select  class="sortSelect" name="wylx"> -->
<!--                 <option value="" >所有</option> -->
<%--                 <c:forEach items="${wylxs}" var="wylx"> --%>
<%--                   <option value="${wylx.value}">${wylx.value}</option> --%>
<%--                 </c:forEach> --%>
<!--             </select> -->
             <c:forEach items="${wylxs}" var="wylx">
               <input value="${wylx.value}"  name="wylx" type="checkbox"/>${wylx.value}
             </c:forEach>
            </td>
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
        <td><input type="text" name="jzmj"/>平方</td>
    </tr>
    <tr>
        <td class="tableleft">容积率</td>
        <td><input type="text" name="rongji"/></td>
    </tr>
    <tr>
        <td class="tableleft">规划面积</td>
        <td><input type="text" name="ghmj"/>平方</td>
    </tr>
    <tr>
        <td class="tableleft">绿化率</td>
        <td><input type="text" name="lvhua"/></td>
    </tr>
    <tr>
        <td class="tableleft">车位数</td>
        <td><input type="text" name="chewei"/></td>
    </tr>
    <tr>
        <td class="tableleft">规划户数</td>
        <td><input type="text" name="hushu"/></td>
    </tr>
    <tr>
        <td class="tableleft">物业费</td>
        <td><input type="text" name="wyfee"/>元/平方*月</td>
    </tr>
    <tr>
        <td class="tableleft">楼盘特色</td>
        <td><textarea name="tese" ></textarea></td>
    </tr>
    <tr>
        <td class="tableleft">开发商</td>
        <td><input type="text" name="developer"/></td>
    </tr>
    <tr>
        <td class="tableleft">物业公司</td>
        <td><input type="text" name="wyComp"/></td>
    </tr>
    <tr>
        <td class="tableleft">地址</td>
        <td><input type="text" name="addr"/ not-null="true"></td>
    </tr>
    <tr>
        <td class="tableleft">经纬度</td>
        <td><input type="text" name="jingdu" placeholder="经度"/>  /  <input type="text" name="weidu" placeholder="纬度"/></td>
    </tr>
    <tr>
        <td class="tableleft">推荐</td>
        <td><select name="tuijian">
			<option value="0">否</option>
        	<option value="1">是</option>
        </select></td>
    </tr>
    <tr>
        <td class="tableleft">特惠</td>
        <td><select name="tehui">
        	<option value="0">否</option>
        	<option value="1">是</option>
        </select></td>
    </tr>
    <tr>
        <td class="tableleft">优惠方案</td>
        <td><input type="text" name="yufu"/>抵<input type="text" name="shidi"/></td>
    </tr>
    <tr>
        <td class="tableleft">优惠截止时间</td>
        <td><input type="text" class="form-control input-sm input-left" name="youhuiEndtime" id="youhuiEndtime" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})" ></td>
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
        </td>
    </tr>
</table>
</form>
</body>
</html>