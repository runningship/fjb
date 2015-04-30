<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="../js/city/jquery.cityselect.js?23232"></script>
<script type="text/javascript" src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0"></script>
<script type="text/javascript" src="../js/city/convertor.js"></script>
<style type="text/css">
#city_1 select{width:30.5%}
</style>
     <div class="main" style="padding-top:15px;padding-bottom:10px;height:30px;z-index:999999;background-color: rgb(222,48,49);">
            <div id="city_1" style="display:inline-block;width:97%;padding-left:3%">
		  		<select class="prov"  id="province" style="height:30px;" ></select>
		    	<select class="city" id="city"  style="height:30px;"></select>
		    	<select class="dist" id="dist"  style="height:30px;"></select>
		    </div>
     	<%
	     	String city = (String)request.getSession().getAttribute("session_city");
	     	if(city!=null && !"undefined".equals(city)){
	     		request.setAttribute("session_city" , city);
	     	}
	     	String province = (String)request.getSession().getAttribute("session_province");
	     	if(province!=null && !"undefined".equals(province)){
	     		request.setAttribute("session_province" , province);
	     	}
	     	
     	%>
     	<c:if test="${session_city !=null }">
     		<script type="text/javascript">$(function(){sessionCity='${session_city}'; sessionProvince='${session_province}';});</script>
     	</c:if>
     </div>


<script type="text/javascript">
var mycity;
var sessionCity;
var sessionProvince;
$(function(){
	
  if(window.navigator.userAgent.indexOf('MicroMessenger')>-1){
    //weixin
    if(sessionProvince && sessionCity){
      $("#city_1").citySelect({
        prov : sessionProvince, 
          city : sessionCity,
          required: true,
          cityChange:changeCity,
          distChange: changeDist
      });
    }else{
      // alert('正在为您切换到'+myprovince+'省'+mycity+'市...');
      alert('正在定位...');
      window.navigator.geolocation.getCurrentPosition(handleSuccess,handleError);
      //setTimeout(changeCity,2000);
    }
  }else{  
    locateBySina();
  }
	
});

function locateBySina(){
  var myprovince = remote_ip_info['province'];
    mycity = remote_ip_info['city']
    var mydistrict = remote_ip_info['district'];
    if(sessionProvince && sessionCity){
      $("#city_1").citySelect({
        prov : sessionProvince, 
        city : sessionCity,
        required: true,
        cityChange:changeCity,
        distChange: changeDist
      });
    }else{
      $("#city_1").citySelect({
        prov : myprovince, 
        city : mycity,
        required: true,
        cityChange:changeCity,
        distChange: changeDist
      });
      alert('正在为您切换到'+myprovince+'省'+mycity+'市...');
      setTimeout(changeCity,2000);
    }
}
function changeCity(){
	YW.ajax({
        type: 'POST',
        url: '${projectName}/c/setCity',
        data:'province='+$('#province').val()+'&city='+$('#city').val(),
        mysuccess: function(data){
            //alert('修改成功');
            //window.location.reload();
        	emptySearchResult();
        	$('#quyu').val($('#dist').val());
        	doSearch();
        }
    });
}

function changeDist(){
	emptySearchResult();
	$('#quyu').val($('#dist').val());
	doSearch();
}

function handleSuccess(position){
  lat = position.coords.latitude;
  lon = position.coords.longitude;
  try{
      // 百度地图API功能
    //GPS坐标
    var xx = lon;
    var yy = lat;
    var gpsPoint = new BMap.Point(xx, yy);
    //地图初始化
    //坐标转换完之后的回调函数
    translateCallback = function (point) {
        lat = point.lat;
        lon = point.lng;
        var point = new BMap.Point(point.lng, point.lat);
        var gc = new BMap.Geocoder();
        gc.getLocation(point, function (rs) {
            
            var myprov = rs.addressComponents.province;
            myprov = myprov.replace("省","").replace("市","");
            var mycity = rs.addressComponents.city;
            mycity = mycity.replace("市","");
            //infoAlert(xx);
            // var addComp = rs.addressComponents;
            // var citystr = addComp.district;
            // alert(prov+city);
            $("#city_1").citySelect({
				prov:myprov, 
		    	city:mycity,
		    	cityChange:changeCity,
		    	distChange: changeDist
			});
			setTimeout(changeCity,1000);
        });
    }
    BMap.Convertor.translate(gpsPoint, 0, translateCallback);     //真实经纬度转成百度坐标
  }catch(e){
    alert(e);
  }
  
}

function handleError(error){
  switch (error.code) {
        case 0:
            alert("浏览器无法确定您的位置！");
            break;
        case 1:
            alert("您设置了阻止该页面获取位置信息！");
            locateBySina();
            break;
        case 2:
            alert("浏览器无法确定您的位置！");
            break;
        case 3:
            alert("浏览器无法确定您的位置！");
            break;
    }
}
</script>