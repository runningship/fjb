<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="../js/city/jquery.cityselect.js"></script>
<script type="text/javascript" src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>

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
	var myprovince = remote_ip_info['province'];
	mycity = remote_ip_info['city']
	var mydistrict = remote_ip_info['district'];
	if(sessionProvince && sessionCity){
		$("#city_1").citySelect({
			prov : sessionProvince, 
	    	city : sessionCity,
	    	dist : mydistrict,
	    	required:false,
	    	cityChange:changeCity
		});
	}else{
		$("#city_1").citySelect({
			prov:myprovince, 
	    	city:mycity,
	    	cityChange:changeCity
		});
		alert('正在为您切换到'+myprovince+'省'+mycity+'市...');
		setTimeout(changeCity,2000);
	}
});

function changeCity(){
	YW.ajax({
        type: 'POST',
        url: '${projectName}/c/setCity',
        data:'province='+$('#province').val()+'&city='+$('#city').val(),
        mysuccess: function(data){
            //alert('修改成功');
            window.location.reload();
        }
    });
}
</script>