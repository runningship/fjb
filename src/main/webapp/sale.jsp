<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="header.jsp" />
</head>

<body>

<jsp:include page="top.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<div class="warp">

     <div class="main">
     
     
          <div class="teSelect">
               
               <h2>房金宝承诺合肥最低价<em>[共2款特惠房源促销中]</em></h2>
               
               <div class="choose">
                        <div class="choose_list">
                            <label class="pass-label">区域</label>
                            <select onchange="checkSelect('qy');" id="quyu" class="sortSelect">
                                <option value="" selected="">默认区域</option>
                                <c:forEach items="${quyus}" var="quyu">
                                  <option value="${quyu.value}">${quyu.value}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="choose_list">
                            <label class="pass-label">户型</label>
                            <select onchange="checkSelect('hx');" id="huxing" class="sortSelect">
                                <option value="" selected="">默认户型</option>
                                <c:forEach items="${hxings}" var="hxing">
                                  <option value="${hxing.value}">${hxing.value}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="choose_list">
                            <label class="pass-label">价位</label>
                            <select onchange="checkSelect('jw');" id="jiawei" class="sortSelect">
                                <option value="" selected="">默认价位</option>
                                <option value="1">6000元以下</option>
                                <option value="2">6000-10000元</option>
                                <option value="3">1-1.5万</option>
                                <option value="4">1.5-2万</option>
                                <option value="5">2-2.5万</option>
                                <option value="6">2.5-3万</option>
                                <option value="7">3万以上</option>
                            </select>
                        </div>
                    </div>
          
          </div>
     
          <c:forEach items="${page.result}" var="youhui">
          <div class="teHui">
          
               <h2><span class="title">${youhui.name}<em>[${youhui.quyu}]</em></span></h2>
               <div class="lpPic"><a href="#"><img src="${youhui.img}" /></a></div>
               <div class="lpCon">
                   
                    <span class="hYPrice"><em>市场价 ${youhui.sjia} </em>房金宝团购优惠价 </span>
                    <span class="hnPrice"><strong>${youhui.junjia}</strong>元/平米 <em>${youhui.youhui}</em></span>
                    <span class="liaojie">
                          <div class="fl w180">
                               <p>楼盘位置：${youhui.quyu}</p>
                               <p>开盘日期：<fmt:formatDate value="${youhui.opendate}" pattern="yyyy-MM-dd"/></p>
                          </div>
                          <a href="info.jsp" class="btn-sub fl">了解详情</a>
                    </span>
                    
                    <span class="yuyue">
                          <div class="fl w180">
                               <em>76</em>人已预约看房
                          </div>
                          <a href="#" class="btn-main fl">预约看房</a>
                    </span>
                    
                    
                    <span class="tehuiClock">已成交:<em>${youhui.chengjiao}</em>套 &nbsp; 活动结束剩<em>93</em>天<em>7</em>小时<em>19</em>分钟<em>39</em>秒</span>
               
               </div>
          
          </div>
          </c:forEach>
		
		<jsp:include page="page.jsp" />
         
     </div>

</div>



<jsp:include page="foot.jsp"></jsp:include>
<div class="warp footerBot">


     <div class="main">

          <p><a href="#">关于房金宝</a> | <a href="#">联系我们</a> | <a href="#">在售楼盘</a> | <a href="#">服务申明</a> | <a href="#">微信版</a> | <a href="#">服务电话</a></p>
          <p>copyright © 2013-2015 www.jinbaohouse.com All Rights Reserved</p>
          <p>粤ICP备88888888号</p>

     </div>


</div>


</body>
</html>
