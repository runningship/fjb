<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
     
          <div class="teSelect fl">
               
               <h2>房金宝在售房源<em>[合肥最低价]</em></h2>
               
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
          
          <div class="allList fl">
          
               <ul>
                <c:forEach items="${page.result}" var="house">
                     <li>
                        <a target="_blank" href="#"><img width="180" height="120" src="${house.img}"></a>
                        <span class="f_name"><a target="_blank" href="#">[${house.quyu}]${house.name}</a></span>
                        <span class="f_sale">${house.youhui}</span>
                        <span class="f_price"><em>${house.junjia}元/㎡</em>
                        <a href="info.jsp">
                        <button class="button_tao" title="了解更多" type="submit">了解更多</button></a></span>
                     </li>   
                </c:forEach>                      
               </ul>
               
               <jsp:include page="page.jsp" />
          </div>
          
          <div class="rightList fl">
          
			<jsp:include page="right.jsp"></jsp:include>
          </div>
     
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
