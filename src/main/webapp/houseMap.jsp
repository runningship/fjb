<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
<style type="text/css">
html, body, .body {height: 100%;padding: 0;margin: 0;}
.errTip{ position:absolute; top:40%; left:30%; z-index:999; background:#F60; color:#FFF; height:100px; width:300px; line-height:100px; text-align:center; font-size:30px; font-family:"微软雅黑","黑体"; display:none;}
</style>
<jsp:include page="header.jsp" />

</head>

<body>
<jsp:include page="top.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<div class="body">
<div id="allmap" style="margin:0px auto;text-aglin:center;width:100%;height:100%;border:0px solid #666; text-align:center;"></div>
</div>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=9ad26b763c7cd0619e372f993cdc9849"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js"></script>
<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.css" />
<script type="text/javascript">
// 百度地图API功能
  var mp = new BMap.Map("allmap");
  mp.centerAndZoom(new BMap.Point(117.246104,31.854113), 14);
  mp.enableScrollWheelZoom();
  // 复杂的自定义覆盖物
    function ComplexCustomOverlay(point, text, mouseoverText){
      this._point = point;
      this._text = text;
      this._overText = mouseoverText;
    }
    ComplexCustomOverlay.prototype = new BMap.Overlay();
    ComplexCustomOverlay.prototype.initialize = function(map){
      this._map = map;
      var div = this._div = document.createElement("div");
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
      div.style.fontSize = "12px"
      var span = this._span = document.createElement("span");
      div.appendChild(span);
      span.appendChild(document.createTextNode(this._text));      
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
     
      div.onmouseover = function(){
        this.style.backgroundColor = "#6BADCA";
        this.style.borderColor = "#0000ff";
        this.getElementsByTagName("span")[0].innerHTML = that._overText;
        arrow.style.backgroundPosition = "0px -20px";
      }

      div.onmouseout = function(){
        this.style.backgroundColor = "#EE5D5B";
        this.style.borderColor = "#BC3B3A";
        this.getElementsByTagName("span")[0].innerHTML = that._text;
        arrow.style.backgroundPosition = "0px 0px";
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
    mp.addOverlay(new ComplexCustomOverlay(new BMap.Point($(obj).attr('jingdu'), $(obj).attr('weidu')), $(obj).attr('loupan'),''));
  });
});
</script>

</script>
<jsp:include page="foot.jsp"></jsp:include>
<div>
<c:forEach items="${houses}" var="house">
<span class="loupan" jingdu="${house.jingdu }" weidu="${house.weidu }"  loupan="${house.name }"></span>
</c:forEach>
</div>
</body>
</html>