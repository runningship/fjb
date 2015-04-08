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
});

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
</script>
</head>

<body>

<form class="form-inline definewidth m20" name="form1"  method="get" onsubmit="return false;">
	<input type="hidden"  name="currentPageNo" id="currentPageNo"/>
    <button type="button" style="display:none" class="btn btn-success btn_subnmit" onclick="doSearch();return false;">搜索</button>
</form>
<div class="main">
     <jsp:include page="top.jsp"></jsp:include>
<!--      <div id="top" style="padding:0px;"></div> -->
     <jsp:include page="city.jsp"></jsp:include>
     <div id="banner"><img src="images/ad1.jpg" /></div>
     
     
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
          <div class="tit"><span class="c" style="float:left;padding-left:10px;">本期共有<strong>${total }</strong>个楼盘，优惠幅度最大<strong>${maxYouhui }</strong></span></div>
          <ul>
          
              <li class="repeat" style="display:none">
                  <div class="img"><a href="info.jsp?estateId=$[id]"><img src="../../${upload_path}/$[img]"  style=""/></a></div>
                  <div class="con">
                  
                       <h2><a href="info.jsp?estateId=$[id]" style="color:black;">$[name]</a><em>在售</em></h2>
                       <p><i class="r">$[junjia]元/平</i></p>
                       <p style="text-overflow: ellipsis;white-space: nowrap; overflow: hidden;">$[addr]</p>
                       <p style="  color: #dc1b1e; font-size: 18px;"><span class="yhBg">独家优惠: </span> <b>$[youhuiPlan]</b>&nbsp;</p>
                  	   <p style="  color: #dc1b1e; font-size: 18px;"><span class="yhBg">抢购热线: </span> <b>$[tel]</b>&nbsp;</p>
                  </div>
              </li>
          
          </ul>
          
     
     </div>

     <div id="FangMore" onclick="more();return false">查看更多房源</div>
     
     <jsp:include page="bottom.jsp" />

</div>

</body>
</html>
