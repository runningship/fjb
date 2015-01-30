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

<div class="warp banner">
      
      <div class="bigBgImg">
               
                    <ul id="bigPic">
                    
                        <li style="z-index:1; display:list-item; background:url(images/banner1.jpg) no-repeat center top;"></li>
                        <li style="z-index:0; display:none; background:url(images/banner1.jpg) no-repeat center top;"></li>
                        <li style="z-index:0; display:none; background:url(images/banner1.jpg) no-repeat center top;"></li>
                    
                    </ul>
                    <ul id="litPic"></ul>
               
      </div>
      
      
      <div class="warp" style="position:absolute; z-index:100; top:0; left:0;">

           <div class="main">
           
                <div class="l-r-box">
                        
                        <div class="bg"></div>
                
			            <div class="l-r">
                            <a href="login.jsp" class="fl i-p-login">登录</a>
                            <a href="register.jsp" class="fr i-p-register">注册</a>
                        </div>
                                    
                        <div class="l-r-step">
                            <a href="#" class="i-p-step-1">
                                <i><img src="images/step1.png" /></i>
                                <strong>经纪人注册</strong>
                                <span>一键注册、轻松操作</span>
                            </a>
                            <a href="#" class="i-p-step-2">
                                <i><img src="images/step2.png" /></i>
                                <strong>不仅销售二手房</strong>
                                <span>增加销售渠道 新房也能卖</span>
                            </a>
                            <a href="#" class="i-p-step-3">
                                <i><img src="images/step3.png" /></i>
                                <strong>赚取佣金</strong>
                                <span>推荐销售即得佣金</span>
                            </a>
                        </div>
                </div>
           
           </div>
           
      </div>
      
      
      

</div>

<div class="warp">

     <div class="main">
     
          <div class="tuijian">
          
               <div class="tit"><span class="t fl">推荐楼盘</span><span class="m fr">本期共有<strong>49</strong>个合作楼盘，<strong>优惠幅度最大50万</strong></span></div>
               <ul class="con"> 
                  <c:forEach items="${tuijianList}"  var="tuijian">
                    <li>
                      <a href="info.jsp">
                        <span class="img"><img src="${tuijian.img}" /></span>
                      </a>
                       <p><strong>[${tuijian.quyu}]${tuijian.name}</strong></p>
                       <p><em>均价：¥${tuijian.junjia}/m2</em></p>
                       <p><span class="yhBg">优惠</span> <b>${tuijian.youhui}</b></p>
                    </li>
                  </c:forEach>
                    
               </ul>
          
          </div>
          
          <div class="rightList fr">
          
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
