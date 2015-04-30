<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<jsp:include page="../header.jsp" />

<script type="text/javascript" >
var currentPageNo=1;
$(function(){
	doSearch();
	window.navigator.geolocation.getCurrentPosition(handleSuccess,handleError);
});

function handleSuccess(position){
	lat = position.coords.latitude;
    lon = position.coords.longitude;
    
    
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
            var addComp = rs.addressComponents;
            citystr = addComp.district;
			alert(cityStr);
        });
    }
    BMap.Convertor.translate(gpsPoint, 0, translateCallback);     //真实经纬度转成百度坐标
}

function handleError(error){
	alert(error.code);
}
function doSearch(){
	$('#currentPageNo').val(currentPageNo);
	var a=$('form[name=form1]').serialize();
	YW.ajax({
	    type: 'get',
	    url: '${projectName}/c/m/listIndexData',
	    data: a,
	    dataType:'json',
	    mysuccess: function(json){
	    	if(json.page.data.length>0){
	    		buildHtmlWithJsonArray("repeat",json.page.data , false,true);
	    	}else{
	    		$('#FangMore').css('display','none');
	    	}
	        
	    }
	  });
}

function more(){
	currentPageNo++;
	doSearch();
}

function emptySearchResult(){
	currentPageNo=1;
	var arr = $('#Fanglist li ');
	for(var i=0;i<arr.length; i++){
		var li = arr[i];
		if($(li).hasClass('repeat')){
			continue;
		}
		$(li).remove();
	}
}
</script>
</head>

<body>

<form class="form-inline definewidth m20" name="form1"  method="get" onsubmit="return false;">
	<input type="hidden"  name="currentPageNo" id="currentPageNo"/>
	<input type="hidden"  name="quyu" id="quyu"/>
    <button type="button" style="display:none" class="btn btn-success btn_subnmit" onclick="doSearch();return false;">搜索</button>
</form>
<div class="main">
     <jsp:include page="top.jsp"></jsp:include>
<!--      <div id="top" style="padding:0px;"></div> -->
     <jsp:include page="city.jsp"></jsp:include>
     <div class="bigBgImg">
               
                    <ul id="bigPic">
                    
                        <a href="info.jsp?estateId=42" target="_blank"><li style="z-index:1; display:list-item;" ><img src="../images/banner11.jpg"/></li></a>
                        <a href="info.jsp?estateId=36" target="_blank"><li style="z-index:0; display:none; "><img src="../images/banner12.jpg"/></li></a>
                        <a href="info.jsp?estateId=43" target="_blank"><li style="z-index:0; display:none;"><img src="../images/banner13.jpg"/></li></a>
                        <a href="info.jsp?estateId=53" target="_blank"><li style="z-index:0; display:none;"><img src="../images/banner14.jpg"/></li></a>
                    
                    </ul>
               		<ul id="litPic"></ul>
      </div>
     
     
     <div id="nav">
          
          <a href="index.jsp">
          <div class="nbox">
               <p><img src="images/mxf.png" /></p>
               <p><i>买新房</i></p>
          </div>
          </a>
          <a href="sales.jsp">
          <div class="nbox">
               <p><img src="images/xsth.png" /></p>
               <p><i>限时特惠</i></p>
          </div>
          </a>
          <a href="houses.jsp">
          <div class="nbox">
               <p><img src="images/sylp.png" /></p>
               <p><i>所有楼盘</i></p>
          </div>
          </a>
          <a href="houseMap.jsp">
          <div class="nbox">
               <p><img src="images/dtzf.png" /></p>
               <p><i>地图找房</i></p>
          </div>
          </a>
     </div>
     
     <div id="Fanglist">
     
          <div class="tit"><i><img src="images/hot.png" /></i>推荐楼盘</div>
<%--           <div class="tit"><span class="c" style="float:left;padding-left:10px;">本期共有<strong>${total }</strong>个楼盘，优惠幅度最大<strong>${maxYouhui }</strong></span></div> --%>
          <ul>
          
              <li class="repeat" style="display:none">
                  <div class="img"><a href="info.jsp?estateId=$[id]"><img src="../../${upload_path}/$[img]"  style=""/></a></div>
                  <div class="con" style="font-size:14px;">
                  	<a href="order.jsp?estateId=$[id]"><img src="../images/tuijian.jpg"/ style="height:30px;cursor:pointer" /></a>
                       <h2><a href="info.jsp?estateId=$[id]" style="color:black;">$[name]</a></h2>
<!--                        <p><i class="r">$[junjia]元/平</i></p> -->
<!--                        <p style="text-overflow: ellipsis;white-space: nowrap; overflow: hidden;">$[addr]</p> -->
                       <p style="  color: #dc1b1e; white-space: nowrap;overflow: hidden;  text-overflow: ellipsis;"><span class="yhBg">独家优惠: </span> <b>$[youhuiPlan]</b>&nbsp;</p>
                  	   <p style="  color: #dc1b1e; "><span class="yhBg">抢购热线: </span> <b>$[tel]</b>&nbsp;</p>
                  </div>
              </li>
          
          </ul>
          
     
     </div>

     <div id="FangMore" onclick="more();return false">查看更多房源</div>
     
     <jsp:include page="bottom.jsp" />

</div>

</body>
</html>
