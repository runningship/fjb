<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.youwei.fjb.entity.User" %>
<div class="main" style="padding-top:15px;padding-bottom:0px;height:30px;z-index:999999;background-color: rgb(222,48,49);font-size:14px;">
     <a href="#" onclick="window.history.go(-1);return false;" style="margin-left:10px;color:white;">返回</a>
     <span class="s1" style="float:right;margin-right:1%"><a href="index.jsp"><img src="images/logo.png" style="height:30px;"/></a></span>
</div>
<%
User user = (User)request.getSession().getAttribute("user");
  	if(user!=null){
  		request.setAttribute("seller" , user);
  	}
  	Boolean isDebug = request.getSession().getServletContext().getServerInfo().startsWith("jetty");
  	if(isDebug){
  		request.setAttribute("upload_path" , "upload/");
  	}else{
  		request.setAttribute("upload_path" , "/upload/");
  	}
%>
