<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="header.jsp" />
        <link rel="stylesheet" href="http://static.fangdd.com/www/xf/v1/style/global.css">
        <link rel="stylesheet" href="http://static.fangdd.com/www/xf/v1/style/house-channel.css"><link rel="stylesheet" href="http://static.fangdd.com/www/xf/v1/style/artdialog-play.css">
    </head>
    <body >
        <!-- 头部 -->
        <div id="header">

<jsp:include page="top.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include></div>
        <!-- /头部 -->

        <!-- 主内容区 -->
        <div id="section">
            <div class="section-inner house-photo-list">
  <!-- 楼盘单页公共头部 -->
  <div class="section-hd">
    <!-- 面包屑 -->
<div class="breadcrumbs-wrap">
    <div class="breadcrumb">
        <a href="/">房多多</a>
        <span class="arrow">&gt;</span>
        <a href="/house/list">新房</a>
        <span class="arrow">&gt;</span>
        <a href="/house/3796">玫瑰绅城</a>

                <span class="arrow">&gt;</span>
        <a href="/house/3796/photo">相册列表</a>
        
        <span></span>
    </div>
</div>
<!-- /面包屑 -->
    <!-- 标题 -->
<div class="house-title clearfix">
  <h1 class="house-name">
    <a href="/house/3796"><em>[包河区]</em>
    玫瑰绅城</a>
    <small>&nbsp;&nbsp;/&nbsp;
    参考均价<em>7500</em>元/平米
    </small></h1>
  <div class="contact">
    <span class="tel">
        <em>4000989900</em> 转 <em>99368</em>    </span>
    <a id="callUpBtn" role="callUp" class="btn-call" href="javascript:;" data-param='{"url":"/fang/house/ajax-free-tel-back?houseId=3796"}'><i class="pngfix"></i>免费通话</a>
    <!-- 免费咨询 -->
    <script type="text/tmpl" id="callUpTmpl">
      <div class="dialog-custom dialog-call">
        <p>输入您的号码，我们将会即刻接通您的电话</p>
        <div>
          <input type="text" class="int" name="mobile" value="" placeholder="输入手机号或固定电话">
          <div class="tips" name="tip"><i class="icon-error"></i><span>您输入的电话号码有误！</span></div>
        </div>
        <p class="tip-text">固定电话，请先填写区号，例如：0755-52412562</p>
        <div class="tc">
          <button type="button" name="call" class="btn-active">免费通话</button>
        </div>
      </div>
    </script>
    <script type="text/tmpl" id="callUpSuccTmpl">
      <div class="dialog-custom dialog-calling">
        <p>将为您转接，请保持电话畅通！</p>
      </div>
    </script>
    <!-- /免费咨询 -->
  </div>
</div>
<!-- /标题 -->

  </div>
  <!-- /楼盘单页公共头部 -->

  <div class="section-bd">

    <div class="content">
      
        <div class="tabs" id="keyFilterTabs">
                                                                    <a class="tabs-item current"  href="#" tabKey="all">所有图片(30)</a>
                                    <span class="sep">|</span>                    <a class="tabs-item "  href="#101" tabKey="101">效果图(2)</a>
                                    <span class="sep">|</span>                    <a class="tabs-item "  href="#102" tabKey="102">实景图(14)</a>
                                    <span class="sep">|</span>                    <a class="tabs-item "  href="#103" tabKey="103">规划图(6)</a>
                                    <span class="sep">|</span>                    <a class="tabs-item "  href="#107" tabKey="107">户型样板间图(8)</a>
                                <a href="/house/3796/flat" class="btn-pure">户型图</a>
                    </div>

        <div class="photo-list-wrap">
          <ul class="photo-list" id="keyFilterList">

                            

            <li class="list-item" key="101" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/-sGdTitbF-Sd_I-1yOKP9k9zTv4.jpg " alt="">
              <p class="title">效果图</p>
            </li>

                

            <li class="list-item" key="101" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/000/101/qloUVyMbrdx9lWYrjrEBhyrbzr8.jpg " alt="效果图">
              <p class="title">效果图</p>
            </li>

                

            <li class="list-item" key="102" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/DT0wOtwAQ7jrECPVuyQCZaZdI2Y.jpg " alt="">
              <p class="title">实景图</p>
            </li>

                

            <li class="list-item" key="102" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/_nC3dgNV9FubinSNGNMUcCRA8oI.jpg " alt="">
              <p class="title">实景图</p>
            </li>

                

            <li class="list-item" key="102" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/ghM1Zf_zmNz0PUhtqu-ikYV_Ej4.jpg " alt="">
              <p class="title">实景图</p>
            </li>

                

            <li class="list-item" key="102" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/VkPOpEL-dLVUfs20nH6ZM4fv03s.jpg " alt="">
              <p class="title">实景图</p>
            </li>

                

            <li class="list-item" key="102" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/uTCB9nDXwPliacTFh2VoJyJWcuA.jpg " alt="">
              <p class="title">实景图</p>
            </li>

                

            <li class="list-item" key="102" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/eMAaBNSE7NwZKcVb-vKOjYn5df0.jpg " alt="">
              <p class="title">实景图</p>
            </li>

                

            <li class="list-item" key="102" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/xm7AExNqDohTMqO_t6_fZSvl4qE.jpg " alt="">
              <p class="title">实景图</p>
            </li>

                

            <li class="list-item" key="102" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/xUT-KwL7TxE-UrJjpwR2V15D-qo.jpg " alt="">
              <p class="title">实景图</p>
            </li>

                

            <li class="list-item" key="102" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/q1ttyY-zBWSTxgjX-hw07o0Ho8M.jpg " alt="">
              <p class="title">实景图</p>
            </li>

                

            <li class="list-item" key="102" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/SAq7T1gVWOwccuUgY5miEqOC9Ys.jpg " alt="">
              <p class="title">实景图</p>
            </li>

                

            <li class="list-item" key="102" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/yyzFzqh8hqmHXhh555qwISxmdhg.jpg " alt="">
              <p class="title">实景图</p>
            </li>

                

            <li class="list-item" key="102" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/rUm3Wxrm1izCLXDGXtofgifs1Ho.jpg " alt="">
              <p class="title">实景图</p>
            </li>

                

            <li class="list-item" key="102" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/BGGMXlWFVZ3PuMzeWtj9XLvVyko.jpg " alt="">
              <p class="title">实景图</p>
            </li>

                

            <li class="list-item" key="102" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/AIcOmCTY4yW06d6fRDsV08XWvdQ.jpg " alt="">
              <p class="title">实景图</p>
            </li>

                

            <li class="list-item" key="103" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/fEqdU4GMqg1gmNNbfeOADZxM3Zo.jpg " alt="">
              <p class="title">规划图</p>
            </li>

                

            <li class="list-item" key="103" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/nvWcpLqRqp0oOIfJBwKoS1yMLu0.jpg " alt="">
              <p class="title">规划图</p>
            </li>

                

            <li class="list-item" key="103" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/wmbKcqx9UNluuuBL2GkWo0hhIHQ.jpg " alt="">
              <p class="title">规划图</p>
            </li>

                

            <li class="list-item" key="103" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/vcfl5ypgBHTm2q1Eg0C59dsbpDY.jpg " alt="">
              <p class="title">规划图</p>
            </li>

                

            <li class="list-item" key="103" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/D6WQOBYN2yUvXbjE09dEH64ZWV4.jpg " alt="">
              <p class="title">规划图</p>
            </li>

                

            <li class="list-item" key="103" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/C3c6QRjWlVWhZsdzju55P4keB7M.jpg " alt="">
              <p class="title">规划图</p>
            </li>

                

            <li class="list-item" key="107" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/-v9yL7Zmx5gARukx2-5oBFG3LGU.jpg " alt="">
              <p class="title">样板间图</p>
            </li>

                

            <li class="list-item" key="107" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/KupZV2vRRN3GU48_enTqMRPMJN8.jpg " alt="">
              <p class="title">样板间图</p>
            </li>

                

            <li class="list-item" key="107" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/UyDwr8OQvoFckNuWw98ZrOpQznA.jpg " alt="">
              <p class="title">样板间图</p>
            </li>

                

            <li class="list-item" key="107" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/4ECvjXMOMyOGUlK9Msi-nvHy1YI.jpg " alt="">
              <p class="title">样板间图</p>
            </li>

                

            <li class="list-item" key="107" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/zVEjtSrZ1HIzhoUHnn7CKrBFsWk.jpg " alt="">
              <p class="title">样板间图</p>
            </li>

                

            <li class="list-item" key="107" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/Gd_SQmg_dJOVlAH5bvrMBjlYCyM.jpg " alt="">
              <p class="title">样板间图</p>
            </li>

                

            <li class="list-item" key="107" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/k9q31ySMZ50jZ0anSnQ3ovStRp0.jpg " alt="">
              <p class="title">样板间图</p>
            </li>

                

            <li class="list-item" key="107" >
              <img src="http://fs.fangdd.com/thumb/230x142/000/001/817/-kRPx1n-oqnjM0rTLwI6ihEFXjo.jpg " alt="">
              <p class="title">样板间图</p>
            </li>

                            

          </ul>
        </div>
    </div>
  </div>
</div>

<script type="text/tmpl" id="photoPlayWrapTmpl">
  <div class="slide-wrap play-wrap" id="sliderAlbum" data-param='{"hoverShowPage":false,"autoPlay":false}'>
    <!-- 当前播放的相册 -->
    <div class="slide-show" role="slideShow">
      <ul class="slide" role="slide" ga="bigphotoclick">
        <li class="slide-item" role="slideItem">
          <img isrc="" src="http://static.fangdd.com/www/xf/v1/style/images/placeholder.png" alt="">
        </li>
      </ul>
    </div>
    <!-- /当前播放的相册 -->

    <!-- 翻页 -->
    <div class="page" role="page" ga="nextpageclick">
      <a href="javascript:;" class="page-item prev pngfix" title="上一张" role="prev">上一张</a>
      <a href="javascript:;" class="page-item next pngfix" title="下一张" role="next">下一张</a>
    </div>
    <!-- /翻页 -->

    <!-- 缩略图 -->
    <div class="thumb-wrap" role="thumbWrap">
      <div class="thumb-show" role="thumbShow">
        <div class="thumb" role="thumb" ga="smallphotoclick">
          <a href="javascript:;" class="thumb-item" role="thumbItem">
            <img src="" alt="">
            <i class="icon-arrow"></i>
          </a>
        </div>
      </div>

      <div class="rolling" role="rolling">
        <a href="javascript:;" class="rolling-item rolling-prev pngfix" role="prev" title="上一页">上一页</a>
        <a href="javascript:;" class="rolling-item rolling-next pngfix" role="next" title="下一页">下一页</a>
      </div>
    </div>
    <!-- /缩略图 -->
  </div>
</script>

        </div>
        <!-- /主内容区 -->

        <!-- 侧边栏 -->
        <div id="sidebar">
                    </div>
        <!-- /侧边栏 -->

        <!-- 页脚 -->
        <div id="footer">
<jsp:include page="foot.jsp"></jsp:include>
        </div>
        <!-- /页脚 -->
        <!-- 脚本文件 -->
        <script src="http://static.fangdd.com/www/xf/v1/js/lib.js"></script>
        <script data-main="http://static.fangdd.com/www/xf/v1/js/main" src="http://static.fangdd.com/www/xf/v1/js/lib/require.js"></script>
        <!--[if lte IE 8]><script src="http://static.fangdd.com/www/xf/v1/js/bin/excanvas.js"></script><![endif]-->
        <script src="http://static.fangdd.com/www/xf/v1/js/house-base.js"></script><script src="http://static.fangdd.com/www/xf/v1/js/effect/house-photo-play.js"></script>        <!-- /脚本文件 -->
        
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  //hm.src = "//hm.baidu.com/hm.js?598831e3649909599ea8cbc14540e7df";
  hm.src = "//hm.baidu.com/hm.js?9d1e3ef6b1e47fe8c8b5de3facbb255e";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
/*增加百度事件统计代码 */
function baidu_cal_event(id,note){
	_hmt.push(['_trackEvent', id, 'click', note, note]);
}
</script>

<script type="text/javascript">
var _py = _py || [];
_py.push(['a', '6M..Ros_D0mqCULXHFjwTxg340']);
_py.push(['domain','stats.ipinyou.com']);
_py.push(['e','']);
-function(d) {
    var s = d.createElement('script'),
    e = d.body.getElementsByTagName('script')[0]; e.parentNode.insertBefore(s, e),
    f = 'https:' == location.protocol;
    s.src = (f ? 'https' : 'http') + '://'+(f?'fm.ipinyou.com':'fm.p0y.cn')+'/j/adv.js';
}(document);
</script>
<noscript><img src="//stats.ipinyou.com/adv.gif?a=6M..Ros_D0mqCULXHFjwTxg340&e=" style="display:none;"/></noscript>

                
        
        <div class="hide">
            
        </div>
        <div class="fixed-qrcode" >
          <a class="fixed-close" href="javascript:;" onclick="this.parentNode.style.display = 'none';"></a>
          <img src="http://static.fangdd.com/www/xf/v1/style/images/qrc-app.png">
        </div>
    </body>
</html>