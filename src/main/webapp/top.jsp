<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.youwei.fjb.entity.User" %>
<script type="text/javascript" src="js/city/jquery.cityselect.js"></script>
<script type="text/javascript" src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>
<script type="text/javascript">
var mycity;
$(function(){
	var myprovince = remote_ip_info['province'];
	mycity = remote_ip_info['city']
	var mydistrict = remote_ip_info['district'];
	$(function(){
		$("#city_1").citySelect({
			prov:myprovince, 
	    	city:mycity
		});
	});
	if(document.cookie.indexOf('city')<0){
		document.cookie=document.cookie+";city="+mycity;
	}
});

function changeCity(city){
	YW.ajax({
        type: 'POST',
        url: '${projectName}/c/setCity',
        data:'city='+city,
        mysuccess: function(data){
            alert('修改成功');
        }
    });
}

function selectDefaultCity(){
	changeCity(mycity);
}
</script>
<div class="warp top">
     
     <div class="main">
            <div id="city_1" style="display:inline-block;">
		  		<select class="prov"></select> 
		    	<select class="city" onchange="changeCity(this.value)"></select>
		    </div>
     	<%
			User user = (User)request.getSession().getAttribute("user");
	     	if(user!=null){
	     		request.setAttribute("seller" , user);
	     	}
	     	String city = (String)request.getSession().getAttribute("session_city");
	     	if(city!=null){
	     		request.setAttribute("session_city" , city);
	     	}
     	%>
     	<c:if test="${session_city ==null }">
     		<script type="text/javascript">selectDefaultCity()</script>
     	</c:if>
   		<c:if test="${seller !=null }">
   			<span class="fr topFr"><a href="sellerIndex.jsp">${seller.name }</a><a href="logout.jsp">退出</a><a href="#">微信公众账号</a></span>
   		</c:if>
   		<c:if test="${seller ==null }">
       		<span class="fr topFr"><a href="login.jsp">经纪人登录</a><a href="register.jsp">注册</a><a href="#">微信公众账号</a></span>
   		</c:if>
     </div>

</div>

<div class="warp">
     
     <div class="main">
      
          <div class="fl"><a href="index.jsp"><img src="images/logo.jpg" /></a></div>
          
          <div class="search-wrap fr">
                <div id="searchBar" class="search-bar">
                                
                    
                    <div class="search-menu">
                      <div class="search-tab">
                        <a val="1" href="javascript:;" class="tab-item current">新房</a>
                        <a val="2" href="javascript:;" class="tab-item">二手房</a>
                      </div>
                      <i></i>
                    </div>
                    <input type="text" placeholder="楼盘名称 / 地址" value="" name="kw" class="search-input" role="elem">
                    <button class="search-btn" type="submit">搜索</button>
                </div>
            </div>
          
          
      
     </div>

</div>
