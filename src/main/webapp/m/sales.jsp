<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/slide.js"></script>
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
      url: '${projectName}/c/m/listSalesData',
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

<form class="form-inline definewidth m20" name="form1"  method="get" onsubmit="doSearch();return false;">
  <input type="hidden"  name="currentPageNo" id="currentPageNo"/>
    <button type="button" style="display:none" class="btn btn-success btn_subnmit" onclick="doSearch();return false;">搜索</button>
</form>
<div class="main">
     
     <div id="top">
     	  <jsp:include page="top.jsp"></jsp:include>
     	  <span class="s1"><a href="index.jsp"><img src="images/logo.png" /></a></span>
          <span class="s4"><a href="#">&lt;</a></span>
     </div>
     
     <div id="Fanglist">
     
          
          <ul>
          
              <li class="repeat" style="display:none">
                  <div class="img"><a href="info.jsp?estateId=$[id]"><img src="../${upload_path}/$[img]"/></a></div>
                  <div class="con">
                  
                       <h2>$[name]<em>在售</em></h2>
                       <p>$[quyu]<i class="r">$[junjia]元/平</i></p>
                       <p>[$[addr]]</p>
                       <p><i class="ys">$[yufu]抵$[shidi]</i><i class="ys">投资地产</i><i class="ys">地铁沿线</i></p>
                       <p><i> 优惠截止时间</i> <i>$[youhuiEndtime]</i></p>
                       <p><i> 开盘时间</i> <i>$[opendate]</i></p>
                  
                  </div>
              </li>
          
          </ul>
          
     
     </div>

     <div id="FangMore" onclick="more();return false">查看更多房源</div>
     
<%--      <jsp:include page="bottom.jsp" /> --%>

</div>

</body>
</html>
