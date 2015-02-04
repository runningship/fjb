<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.youwei.fjb.entity.User" %>
<div class="warp top">
     
     <div class="main">
     	<%
			User user = (User)request.getSession().getAttribute("user");
	     	if(user!=null){
	     		request.setAttribute("seller" , user);
	     	}
     	%>
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
