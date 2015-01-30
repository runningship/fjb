<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <link rel="dns-prefetch" href="http://static.fangdd.com" />
        <link rel="dns-prefetch" href="http://static.esf.fangdd.com" />
        <link rel="dns-prefetch" href="http://fs.fangdd.com" />
        <link rel="shortcut icon" href="http://static.fangdd.com/www/xf/v1/style/images/favicon.ico" />
        <link rel="icon" href="http://static.fangdd.com/www/xf/v1/style/images/favicon.ico" />
        <title>相册 - 玫瑰绅城 - 合肥房多多</title>
        <meta name="keywords" content="玫瑰绅城，相册，实景图，效果图，规划图，配套图，样板间图" />
        <meta name="description" content="为您展示玫瑰绅城相册,图片,实景图,效果图，规划图，配套图，样板间图，方便您的购房选择。" />
        <link rel="stylesheet" href="http://static.fangdd.com/www/xf/v1/style/global.css">
        <link rel="stylesheet" href="http://static.fangdd.com/www/xf/v1/style/house-channel.css"><link rel="stylesheet" href="http://static.fangdd.com/www/xf/v1/style/artdialog-play.css">
        <!--[if IE 6]>
        <script src="http://static.fangdd.com/www/xf/v1/js/bin/DD_belatedPNG_0.0.8a-min.js"></script>
        <script> DD_belatedPNG.fix('.pngfix'); </script>
        <![endif]-->
        <script>
            var APP_CONFIG = {
                UC_URL: "http://my.fangdd.com",
                STATIC_URL: "http://static.fangdd.com",
                PAGE_MODULE: "fang",
                PAGE_CONTROL: "photo",
                PAGE_ACTION: "list"
            };
        </script>
    </head>
    <body >
        <!-- 头部 -->
        <div id="header">
                            <!-- 顶部工具栏 -->
<div class="header-top">
    <div class="header-top-inner">
        <div class="top-nav-r">
                        <a href="http://my.fangdd.com">登录</a>

            <span class="line">|</span>
            
            <a href="http://e.fangdd.com">经纪人</a>
            <span class="line">|</span>
            <a class="strong-txt" href="http://open.fangdd.com"><strong>开放平台</strong></a>
            <span class="line">|</span>
            <a class="fdd-mobile strong-txt" href="/app" target="_blank"><i class="pngfix"></i>手机房多多</a>

            
                    </div>
    </div>
</div><!-- /顶部工具栏 -->

<div class="header-main">
    <div class="header-main-inner">
        <div class="header-main-l">

            <h1 class="logo">
                <a href="/" title="房多多">
                    <img src="http://static.fangdd.com/www/xf/v1/style/images/logo.png" alt="房多多Logo"/>
                </a>
            </h1>

            
<div class="city-wrap" widget="tooltip" data-param='{"hoverClassName":"city-hover"}'>
    <!-- 当前定位城市 -->
    <div class="city-locate" href="javascript:;">
        <p class="city-name">合肥</p>
        
        <p class="toggle-city">切换城市</p>
    </div>
    <!-- /当前定位城市 -->
    
    <!-- 城市列表弹层 -->
    <div class="city-list">
        

        <div class="city-list-bd">
                                        <dl>
                    <dt>华东地区</dt>
                    <dd>
                                                        <a href="http://suzhou.f.fangdd.com">苏州</a>
                                                        <a href="http://wuxi.f.fangdd.com">无锡</a>
                                                        <a href="http://shanghai.f.fangdd.com">上海</a>
                                                        <a href="http://changzhou.f.fangdd.com">常州</a>
                                                        <a href="http://nanjing.f.fangdd.com">南京</a>
                                                        <a href="http://xuzhou.f.fangdd.com">徐州</a>
                                                        <a href="http://zhenjiang.f.fangdd.com">镇江</a>
                                                        <a href="http://yangzhou.f.fangdd.com">扬州</a>
                                                        <a href="http://kunshan.f.fangdd.com">昆山</a>
                                                        <a href="http://hefei.f.fangdd.com">合肥</a>
                                                        <a href="http://ganzhou.f.fangdd.com">赣州</a>
                                                        <a href="http://zhangjiagang.f.fangdd.com">张家港</a>
                                                        <a href="http://qingdao.f.fangdd.com">青岛</a>
                                                        <a href="http://linyi.f.fangdd.com">临沂</a>
                                                        <a href="http://wuhu.f.fangdd.com">芜湖</a>
                                                        <a href="http://bengbu.f.fangdd.com">蚌埠</a>
                                                        <a href="http://taicang.f.fangdd.com">太仓</a>
                                                        <a href="http://zhoushan.f.fangdd.com">舟山</a>
                                                        <a href="http://xiamen.f.fangdd.com">厦门</a>
                                                        <a href="http://jiujiang.f.fangdd.com">九江</a>
                                                        <a href="http://nantong.f.fangdd.com">南通</a>
                                                        <a href="http://jiaxing.f.fangdd.com">嘉兴</a>
                                                        <a href="http://hangzhou.f.fangdd.com">杭州</a>
                                                        <a href="http://nanchang.f.fangdd.com">南昌</a>
                                                        <a href="http://jinan.f.fangdd.com">济南</a>
                                                        <a href="http://ningbo.f.fangdd.com">宁波</a>
                                                        <a href="http://anqing.f.fangdd.com">安庆</a>
                                                        <a href="http://jiangyin.f.fangdd.com">江阴</a>
                                                        <a href="http://huaian.f.fangdd.com">淮安</a>
                                                        <a href="http://taizhou.f.fangdd.com">泰州</a>
                                                        <a href="http://yancheng.f.fangdd.com">盐城</a>
                                                        <a href="http://yantai.f.fangdd.com">烟台</a>
                                                        <a href="http://changshu.f.fangdd.com">常熟</a>
                                            </dd>
                </dl>
                            <dl>
                    <dt>华南地区</dt>
                    <dd>
                                                        <a href="http://hainan.f.fangdd.com">海南</a>
                                                        <a href="http://nanning.f.fangdd.com">南宁</a>
                                                        <a href="http://guangzhou.f.fangdd.com">广州</a>
                                                        <a href="http://dongguan.f.fangdd.com">东莞</a>
                                                        <a href="http://shenzhen.f.fangdd.com">深圳</a>
                                                        <a href="http://huizhou.f.fangdd.com">惠州</a>
                                                        <a href="http://zhanjiang.f.fangdd.com">湛江</a>
                                                        <a href="http://foshan.f.fangdd.com">佛山</a>
                                                        <a href="http://jiangmen.f.fangdd.com">江门</a>
                                                        <a href="http://changsha.f.fangdd.com">长沙</a>
                                                        <a href="http://zhongshan.f.fangdd.com">中山</a>
                                            </dd>
                </dl>
                            <dl>
                    <dt>西南地区</dt>
                    <dd>
                                                        <a href="http://chongqing.f.fangdd.com">重庆</a>
                                                        <a href="http://chengdu.f.fangdd.com">成都</a>
                                                        <a href="http://guiyang.f.fangdd.com">贵阳</a>
                                                        <a href="http://kunming.f.fangdd.com">昆明</a>
                                                        <a href="http://nanchong.f.fangdd.com">南充</a>
                                                        <a href="http://suining.f.fangdd.com">遂宁</a>
                                            </dd>
                </dl>
                            <dl>
                    <dt>西北地区</dt>
                    <dd>
                                                        <a href="http://taiyuan.f.fangdd.com">太原</a>
                                                        <a href="http://xian.f.fangdd.com">西安</a>
                                            </dd>
                </dl>
                            <dl>
                    <dt>华中地区</dt>
                    <dd>
                                                        <a href="http://wuhan.f.fangdd.com">武汉</a>
                                                        <a href="http://zhengzhou.f.fangdd.com">郑州</a>
                                                        <a href="http://pingdingshan.f.fangdd.com">平顶山</a>
                                                        <a href="http://jingzhou.f.fangdd.com">荆州</a>
                                                        <a href="http://xiangyang.f.fangdd.com">襄阳</a>
                                                        <a href="http://fuyang.f.fangdd.com">阜阳</a>
                                                        <a href="http://shiyan.f.fangdd.com">十堰</a>
                                                        <a href="http://xianning.f.fangdd.com">咸宁</a>
                                            </dd>
                </dl>
                            <dl>
                    <dt>东北地区</dt>
                    <dd>
                                                        <a href="http://haerbin.f.fangdd.com">哈尔滨</a>
                                                        <a href="http://baishan.f.fangdd.com">白山</a>
                                                        <a href="http://shenyang.f.fangdd.com">沈阳</a>
                                                        <a href="http://changchun.f.fangdd.com">长春</a>
                                            </dd>
                </dl>
                            <dl>
                    <dt>华北地区</dt>
                    <dd>
                                                        <a href="http://beijing.f.fangdd.com">北京</a>
                                                        <a href="http://tianjin.f.fangdd.com">天津</a>
                                            </dd>
                </dl>
                                </div>
        
        <div class="city-list-ft">
            <a href="http://www.fangdd.com/index/index/city">更多城市&nbsp;&gt;</a>
        </div>
    </div>
    <!-- /城市列表弹层 -->
</div>
            <div class="slogan">
                <img src="http://static.fangdd.com/www/xf/v1/style/images/slogan.png" alt="让买房卖房更爽！">
            </div>

        </div>
        <div class="header-main-r">
            <!-- 搜索栏 -->

<div class="search-wrap" widget="autocomplete" data-param='{"id":"houseAC","data":"/house/search","matchFieldName":"name", "noCache": true}'>
        <div class="search-bar" id="searchBar">
          <form action="/house/list" data-action-esf="http://hefei.esf.fangdd.com/sale/sale/list" data-action-house="/house/list" class="search-form">
            <div class="search-menu">
              <div class="search-tab">
                <a class="tab-item current" href="javascript:;" val="1" data-placeholder="楼盘名称 / 地址">新房</a>
                              </div>
              <i></i>
              <input type="hidden" name="type" value="1">
            </div>
            <input type="text" role="elem" class="search-input" name="kw" value="" autocomplete="off" placeholder="楼盘名称 / 地址">
            <button type="submit" class="search-btn">搜索</button>
          </form>
        </div>
      </div>



            <!-- /搜索栏 -->

        </div>
    </div>
</div>

<!-- 导航栏 -->
<div id="nav">
    <div class="nav-inner">
        <!-- 主菜单 -->
        <ul class="menu-main">
            <li class="menu-item">
                <a class="in" href="/">首页</a>
            </li>
            <li class="menu-item current">
                <a class="in" href="/house/list" ga="xinpantab-nav">新房</a>
            </li>
            
            
            <li class="menu-item " widget="tooltip" data-param='{"hoverClassName":"menu-item-trigger"}'>
                                    <a class="in" href="/map/house" ga="">地图找房</a>
                            </li>
            <li class="menu-item ">
                <a class="in" href="http://hefei.esf.fangdd.com/mf/index/index" ga="maifang-nav">卖房</a>
            </li>
        </ul>
        <!-- /主菜单 -->

    </div>
</div><!-- 导航栏 -->                    </div>
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
            <!-- 平台保障安全 -->
<div class="sg-area">
    <ul class="safeguard clearfix">
        <li class="sa-1">
            <i class="realsrc"></i>
            <h4>在线选新房</h4>
            <p>一房一价，在线缴定金选房，可售 房源一览无余！</p>
        </li>
        <li class="sa-2">
            <i class="realsvc"></i>
            <h4>100%真实房源</h4>
            <p>完全业主挂盘，市场上在售房源应有尽有。</p>
        </li>
        <li    class="sa-3">
            <i class="realsaf"></i>
            <h4>选靠谱服务</h4>
            <p>基于看房服务的评价体系，靠谱经纪人/<br>置业顾问带你看房，虚假房源不再有！</p>
        </li>
    </ul>
</div>
<!-- /平台保障安全 -->

<!-- <div class="link-wp">
  <div class="fd-link  ">
                <ul>
                        <li class="clearfix">
                                        <div class="link-tt">友情链接:</div>
                                        <div class="link-set"><span><a href="#">金地集团</a></span> | <span><a href="#">保利地产</a></span> | <span><a href="#">万科品牌馆</a></span> | <span><a href="#">猫扑网</a> </span>| <span><a href="#">招商地产</a></span> | <span><a href="#">魔力估价</a></span> | <span><a href="#">卓越集团</a></span> | <span><a href="#">中粮集团</a></span> | <span><a href="#">碧桂园</a> </span>| <span><a href="#">深业集团</a></span> | <span><a href="#">深圳酒店预订</a></span> | <span><a href="#">京基地产</a></span> | <span><a href="#">中信集团</a></span> | <span><a href="#">佳兆业集团</a></span> | <span><a href="#">益田集团星河集团</a></span>
                                        </div>
                        </li>
                        <li class="clearfix">
                                        <div class="link-tt">合作品牌:</div>
                                        <div class="link-set"><span><a href="#">绿景集团</a></span> | <span><a href="#">万科</a></span> | <span><a href="#">SOHO中国</a></span> | <span><a href="#">招商地产</a> </span>| <span><a href="#">保利地产</a></span> | <span><a href="#">世茂集团</a></span> | <span><a href="#">华润集团</a></span> | <span><a href="#">富力集团</a></span> | <span><a href="#">中国金茂</a> </span>| <span><a href="#">方兴地产</a></span> | <span><a href="#">龙湖集团</a></span> | <span><a href="#">绿城集团</a></span> | <span><a href="#">金地集团</a></span> | <span><a href="#">鲁能集团</a></span> | <span><a href="#">新城控股</a></span> | <span><a href="#">碧桂园</a></span>
                                        </div>
                        </li>
                        <li class="clearfix">
                                        <div class="link-tt">深圳楼盘:</div>

                                        <div class="link-set"><span><a href="#">宝安区楼盘</a></span> | <span><a href="#">福田区楼盘</a></span> | <span><a href="#">龙岗区楼盘</a></span> | <span><a href="#">罗湖区楼盘</a> </span>| <span><a href="#">南山区楼盘</a></span> | <span><a href="#">盐田区楼盘</a></span> | <span><a href="#">龙华楼盘</a></span> | <span><a href="#"> 光明楼盘 </a></span> | <span><a href="#">坪山楼盘</a> </span>| <span><a href="#">大鹏楼盘</a></span>
                                        </div>
                        </li>
                        <li class="clearfix">
                                        <div class="link-tt">开通城市:</div>
                                        <div class="link-set"><span><a href="#">北京</a></span> | <span><a href="#">上海</a></span> | <span><a href="#">广州</a></span> | <span><a href="#">深圳</a> </span>| <span><a href="#">天津</a></span> | <span><a href="#">长沙</a></span> | <span><a href="#">沈阳</a></span> | <span><a href="#">南京</a></span> | <span><a href="#">杭州</a> </span>| <span><a href="#">苏州</a></span> | <span><a href="#">武汉</a></span> | <span><a href="#">重庆</a></span> | <span><a href="#">成都</a></span> | <span><a href="#">西安</a></span> | <span><a href="#">长春</a></span> | <span><a href="#">惠州</a></span> | <span><a href="#">郑州</a></span> | <span><a href="#">珠海</a></span> | <span><a href="#">海口</a></span> | <span><a href="#">昆明</a></span> | <span><a href="#">大连</a></span> | <span><a href="#">东莞</a></span> | <span><a href="#">石家庄</a></span> | <span><a href="#">佛山</a></span> | <span><a href="#">太原</a></span> | <span><a href="#">哈尔滨</a></span> | <span><a href="#">青岛</a></span> | <span><a href="#">济南</a></span> | <span><a href="#">中山</a></span> | <span><a href="#">宁波</a></span>

                                        </div>
                        </li>
                </ul>
 </div>
 </div> -->
<div class="footer-inner ">	
    <!-- 版权及其它 -->
    <div class="copyright">
        <p class="other-links">
            <a href="http://www.fangdd.com/about" target="_blank">关于房多多</a>
            <span>|</span>
            <a href="http://www.fangdd.com/contact" target="_blank">联系我们</a>
            <span>|</span>
            <a href="http://www.fangdd.com/service" target="_blank">服务声明</a>
            <span>|</span>
            <a href="http://www.fangdd.com/faq" target="_blank">常见问题</a>
            <span>|</span>
            <a href="/app" target="_blank">手机房多多</a>
                        <!-- <span>|</span>
            <a href="/house/list" target="_blank">合肥楼盘大全</a> -->
                    </p>
        <p>邮箱: service@fangdd.com         客服热线: 400-008-9900(新房)         400-602-0888(二手房)</p>
        <p>copyright &copy; 2011-2012 www.fangdd.com All Rights Reserved</p>
        <p>粤ICP备<a href="http://www.miibeian.gov.cn" target="_blank">12079924</a>号</p>
    </div>
    <!-- /版权及其它 -->
</div>
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