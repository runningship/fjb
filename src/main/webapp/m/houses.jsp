<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<jsp:include page="../header.jsp" />
<script type="text/javascript" src="js/slide.js"></script>
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
	    url: '${projectName}/c/m/listHousesData',
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

function setValueAndSearch(id, a){
	if(!a){
		$('#'+id).val('');
		$('#'+id+'_btn').html('楼型'+'<i></i>');
	}else{
		$('#'+id).val($(a).text());
		$('#'+id+'_btn').html($(a).text()+'<i></i>');
	}
	
	emptySearchResult();
	doSearch();
	return false;
}

function setJiageAndSearch(start,end , a){

	$('#jiageStart').val(start);
	$('#jiageEnd').val(end);

	if(!start && !end){
		$('#jiage_btn').html('价格<i></i>');
	}else{
		$('#jiage_btn').html($(a).text()+'<i></i>');	
	}
	
	emptySearchResult();
	doSearch();
	return false;
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
	<input type="hidden"  name="lxing" id="lxing"/>
	<input type="hidden"  name="jiageStart" id="jiageStart"/>
	<input type="hidden"  name="jiageEnd" id="jiageEnd"/>
    <button type="button" style="display:none" class="btn btn-success btn_subnmit" onclick="doSearch();return false;">搜索</button>

<div class="main">
     
        <jsp:include page="top.jsp"></jsp:include>
        <jsp:include page="city.jsp"></jsp:include>
     <div id="top">
          <span class="s4"><a href="#">&lt;</a></span>
          <span class="s2"><div class="search"><input type="text" name="searchText" class="searchBox" placeholder="楼盘名称" /><button onclick="emptySearchResult();doSearch();">搜索</button></div></span>
     
     </div>
     
     <div class="SelectTit" id="SelectTit">
     <!--  
         <span>
              <a href="#" id="quyu_btn">区域<i></i></a>
               <div class="hide">
               		<a href="#" onclick="setValueAndSearch('quyu' ,'');">不限</a>
               		<c:forEach items="${quyus}" var="quyu">
               			<a href="#" onclick="setValueAndSearch('quyu' , this);">${quyu.value}</a>
                  </c:forEach>
               </div>
         </span>
         -->
         <span>
               <a href="#" id="lxing_btn">楼型<i></i></a>
               <div class="hide">
               		<a href="#" onclick="setValueAndSearch('lxing' ,'');">不限</a>
                  <c:forEach items="${lxings}" var="lxing">
               			<a href="#" onclick="setValueAndSearch('lxing' , this);">${lxing.value}</a>
                  </c:forEach>
               </div>
         </span>
         <span class="borNone">
               <a href="#" id="jiage_btn">价格<i></i></a>
               <div class="hide">
                  <a href="#" onclick="setJiageAndSearch(6000,10000,this);">6000~10000</a>  
                  <a href="#" onclick="setJiageAndSearch(10000,20000,this);">10000~20000</a>  
                  <a href="#" onclick="setJiageAndSearch(20000,30000,this);">20000~30000</a>
                  <a href="#" onclick="setJiageAndSearch(30000,50000,this);">30000~50000</a>
                  <a href="#" onclick="setJiageAndSearch(50000,'',this);">50000以上</a>
                  <a href="#" onclick="setJiageAndSearch('','',this);">不限</a>
               </div>
         </span>
    </div>
     
     <div id="Fanglist">
     
          
          <ul>
          
              <li class="repeat" style="display:none">
                  <div class="img"><a href="info.jsp?estateId=$[id]"><img src="../../${upload_path}/$[img]" /></a></div>
                  <div class="con">
                  		<a href="order.jsp?estateId=$[id]"><img src="../images/tuijian.jpg"/ style="height:35px;cursor:pointer" /></a>
                       <h2><a href="info.jsp?estateId=$[id]" style="color:black;">$[name]</a></h2>
<!--                        <p><i class="r">$[junjia]元/平</i></p> -->
<!--                        <p style="text-overflow: ellipsis;white-space: nowrap; overflow: hidden;">$[addr]</p> -->
                       <p style="  color: #dc1b1e; font-size: 18px;"><span class="yhBg" show="'$[youhuiPlan]'!=null">独家优惠: </span> <b>$[youhuiPlan]</b></p>
                       <p style="  color: #dc1b1e; font-size: 18px;"><span class="yhBg">抢购热线: </span> <b>$[tel]</b>&nbsp;</p>
                  </div>
              </li>
          
          </ul>
          
     
     </div>

     <div id="FangMore" onclick="more();">查看更多房源</div>
     
<jsp:include page="bottom.jsp" />

</div>
</form>
</body>
</html>

