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
<script type="text/javascript" src="js/kxbdSuperMarquee.js"></script>
<script type="text/javascript" src="js/jquery.scrollbox.js"></script>
<script type="text/javascript">
    
    $(function(){
      //一次横向滚动一个
      $('#marquee1').kxbdSuperMarquee({
        distance:1002,
        time:7,
        // btnGo:{left:'#goL',right:'#goR'},
        direction:'left'
      });
  $('#demo4').scrollbox({
    direction: 'h',
    switchItems: 7,
    distance: 1002
  });

}
  
</script>
<style type="text/css">
  #marquee1 {
  width:1002px;
  height:130px;
  overflow:hidden;
}
    #marquee1 ul li {float:left;padding:0 1px;  height:130px;}
    #marquee1 ul li img {display:block;}
  #demo4 {
  width:1002px;
  height:130px;
  overflow:hidden;
}
    #demo4 ul li {float:left;padding:0 1px;  height:130px;}
    #demo4  img {display:inline;}
.scroll-img{white-space:nowrap;}

</style>
<div class="warp banner">
      
      <div class="bigBgImg">
               
                    <ul id="bigPic">
                    
                        <li style="z-index:1; display:list-item; background:url(images/banner1.jpg) no-repeat center top;"></li>
                        <li style="z-index:0; display:none; background:url(images/banner2.jpg) no-repeat center top;"></li>
                        <li style="z-index:0; display:none; background:url(images/banner3.jpg) no-repeat center top;"></li>
                    
                    </ul>
                    <ul id="litPic"></ul>
               
      </div>
      
      
      <div class="warp" style="position:absolute; z-index:100; top:0; left:0;">

           <div class="main">
           
                <div class="l-r-box">
                        
                        <div class="bg"></div>
                		<c:if test="${seller ==null }">
			            <div class="l-r">
                            <a href="login.jsp" class="fl i-p-login">登录</a>
                            <a href="register.jsp" class="fr i-p-register">注册</a>
                        </div>
                        </c:if>
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
          
               <div class="tit"><span class="t fl">推荐楼盘</span><span class="m fr">本期共有<strong>${total}</strong>个合作楼盘，<strong>优惠幅度最大${maxYouhui }</strong></span></div>
               <ul class="con"> 
                  <c:forEach items="${page.result}"  var="tuijian">
                    <li>
                      <a href="info.jsp?estateId=${tuijian.id}">
                        <span class="img"><img src="${upload_path}/${tuijian.img}" /></span>
                      </a>
                       <p><strong>[${tuijian.quyu}]${tuijian.name}</strong></p>
                       <p><em>均价：¥${tuijian.junjia}/m2</em></p>
                       <c:if test="${tuijian.yufu != null && tuijian.shidi !=null}">
                       <p><span class="yhBg">优惠</span> <b>${tuijian.yufu}享${tuijian.shidi }</b></p>
                       </c:if>
                    </li>
                  </c:forEach>
                    
               </ul>
          
          </div>
          
          <div class="rightList fr">
          
<jsp:include page="right.jsp"></jsp:include>
          
          </div>
     
    <div class="partners" style="border-left:50px;">
        <div class="partners-inner clearfix">
          <div class="tit"><span class="t fl">合作伙伴：</span></div>
            <div class="partners-r clearfix scroll-img"  >
              <div id="demo4" >
                  <img src="${projectName}/images/hzhb/szjt.jpg" alt="尚泽集团"  style="margin-right: 3px;" title="尚泽集团">
                  <img src="${projectName}/images/hzhb/sljt.jpg" alt="圣联集团" title="圣联集团" style="margin-right: 3px;" >
                  <img src="${projectName}/images/hzhb/wy.jpg" alt="文一" title="文一" style="margin-right: 3px;" >
                  <img src="${projectName}/images/hzhb/zttz.jpg" alt="中天投资" title="中天投资" style="margin-right: 3px;" >
                  <img src="${projectName}/images/hzhb/1.jpg" alt="信达地产"  style="margin-right: 3px;" title="信达地产">
                  <img src="${projectName}/images/hzhb/2.jpg" alt="万科"  style="margin-right: 3px;" title="万科">
                  <img src="${projectName}/images/hzhb/3.jpg" alt="万达集团"  style="margin-right: 3px;" title="万达集团">
                  <img src="${projectName}/images/hzhb/4.jpg" alt="华邦集团"  style="margin-right: 3px;" title="华邦集团">
                  <img src="${projectName}/images/hzhb/5.jpg" alt="绿地集团"  style="margin-right: 3px;" title="绿地集团">
                  <img src="${projectName}/images/hzhb/6.jpg" alt="保利地产"  style="margin-right: 3px;" title="保利地产">
                  <img src="${projectName}/images/hzhb/7.jpg" alt="恒大集团"  style="margin-right: 3px;" title="恒大集团">
              </div>
            </div>
    </div>
    <div class="partners" style="border-left:50px;">
        <div class="partners-inner clearfix">
          <div class="tit"><span class="t fl">旗下运营：</span></div>
            <div class="partners-r clearfix" style="float:left;">
              <img src="${projectName}/images/hzhb/wxah.jpg" alt="无限安徽" title="无限安徽" style="margin-right: 3px;" >
              <img src="${projectName}/images/hzhb/zjb.jpg" alt="中介宝" title="中介宝" style="margin-right: 3px;" >
              <img src="${projectName}/images/hzhb/kqcm.jpg"  style="margin-right: 3px;" alt="科奇传媒" title="科奇传媒">
              <img src="${projectName}/images/hzhb/hkly.jpg" style="margin-right: 3px;" alt="泓扣礼仪" title="泓扣礼仪">
            </div>
    </div>
     </div>

</div>
<jsp:include page="foot.jsp"></jsp:include>

</body>
</html>
