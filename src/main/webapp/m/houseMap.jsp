<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>

<jsp:include page="../header.jsp" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.css" />

<style type="text/css">
html, body, .body {height: 100%;padding: 0;margin: 0;}
#allmap{max-width:640px;min-width:320px;}
.Pfixed{bottom:-4px;}


  
.iconfont{ font-size: 28px; color: #FFF;}
</style>
</head>

<body>
<div class="main" style="padding-bottom:0px;">
     <jsp:include page="top.jsp"></jsp:include>
   <div id="top" style="padding-bottom:0px;">
   	  
   </div>
<%--    <jsp:include page="bottom.jsp" /> --%>
</div>
<div class="body">
<div id="allmap" style="margin:0px auto;text-aglin:center;width:100%;height:100%;border:0px solid #666; text-align:center;"></div>
</div>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=9ad26b763c7cd0619e372f993cdc9849"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js"></script>

<script type="text/javascript">
// 百度地图API功能
  var mp = new BMap.Map("allmap");
  mp.centerAndZoom(new BMap.Point(117.246104,31.854113), 12);
  //mp.centerAndZoom(new BMap.Point(${estate.jingdu}, ${estate.weidu}), 12);
  //mp.setCurrentCity("${session_city}");
  mp.enableScrollWheelZoom();
  // 复杂的自定义覆盖物
    function ComplexCustomOverlay(point, text, mouseoverText , estateId){
      this._point = point;
      this._text = text;
      this._overText = mouseoverText;
      this._estateId = estateId;
    }
    ComplexCustomOverlay.prototype = new BMap.Overlay();
    ComplexCustomOverlay.prototype.initialize = function(map){
      this._map = map;
      var div = this._div = document.createElement("a");
      div.style.position = "absolute";
      div.style.zIndex = BMap.Overlay.getZIndex(this._point.lat);
      div.style.backgroundColor = "#EE5D5B";
      div.style.border = "1px solid #BC3B3A";
      div.style.color = "white";
      div.style.height = "18px";
      div.style.padding = "2px";
      div.style.lineHeight = "18px";
      div.style.whiteSpace = "nowrap";
      div.style.MozUserSelect = "none";
      div.style.fontSize = "12px";
      //div.href='info.jsp?estateId='+ this._estateId;
      var span = this._span = document.createElement("span");
//       span.href='info.jsp?estateId='+ this._estateId;
//       span.style.color='white';
      div.appendChild(span);
      span.appendChild(document.createTextNode(this._text));
      $(div).attr('estateId' , this._estateId);
      var that = this;

      var arrow = this._arrow = document.createElement("div");
      arrow.style.background = "url(http://map.baidu.com/fwmap/upload/r/map/fwmap/static/house/images/label.png) no-repeat";
      arrow.style.position = "absolute";
      arrow.style.width = "11px";
      arrow.style.height = "10px";
      arrow.style.top = "22px";
      arrow.style.left = "10px";
      arrow.style.overflow = "hidden";
      
      div.appendChild(arrow);
     
      div.onclick = function(){
		window.location='info.jsp?estateId='+ $(div).attr('estateId');
      }

      div.ontouchend = function(){
		window.location='info.jsp?estateId='+ $(div).attr('estateId');
      }
      mp.getPanes().labelPane.appendChild(div);
      
      return div;
    }
    ComplexCustomOverlay.prototype.draw = function(){
      var map = this._map;
      var pixel = map.pointToOverlayPixel(this._point);
      this._div.style.left = pixel.x - parseInt(this._arrow.style.left) + "px";
      this._div.style.top  = pixel.y - 30 + "px";
    }
    
    //var myCompOverlay = new ComplexCustomOverlay(new BMap.Point(117.291843, 31.857359), "银湖海岸城",mouseoverTxt);
    //var myCompOverlay2 = new ComplexCustomOverlay(new BMap.Point(117.246104, 31.854113), "银湖海岸城2",mouseoverTxt);
    //mp.addOverlay(myCompOverlay);
    //mp.addOverlay(myCompOverlay2);
    
    	// mp.addOverlay(new ComplexCustomOverlay(new BMap.Point(117.246104, 31.854113), "银湖海岸城2",mouseoverTxt));

$(function(){
  $('.loupan').each(function(index,obj){
    mp.addOverlay(new ComplexCustomOverlay(new BMap.Point($(obj).attr('jingdu'), $(obj).attr('weidu')), $(obj).attr('loupan'), '' ,$(obj).attr('estateId')));
  });
});
</script>

<div>
<c:forEach items="${houses}" var="estate">
<span class="loupan" jingdu="${estate.jingdu }" weidu="${estate.weidu }"  loupan="${estate.name }" estateId="${estate.id }"></span>
</c:forEach>
</div>
</body>
</html>