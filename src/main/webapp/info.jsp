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
          
          
          <div class="fl main-info">
                                <div class="clearfix">
                    <!-- 楼盘描述 -->
                    <div class="photos-info">
                        <div class="photos-text">
                            <h1>[包河区]  玫瑰绅城</h1>
                            <h2>
                                医院：合肥长江医院  周边学校： 工大附中  超市：家乐福、...<br> 
                                楼盘地址：合肥市包河区当涂路与南淝河路交叉口西，淝河路99号
                            </h2>
                            <div class="bd">

                                <p class="price"><em>7500</em>元/平米</p> 
                                
                                
                                <a class="btn-main " onclick="openNewWin('bookroom','yykf.jsp');" id="booking" href="javascript:;">预约看房</a>

                                <a class="btn-sub  " href="#online-choose-room">在线选房 (125)</a>



                                <p class="tips-info">
                                    (在线剩余125套，总价114.9761万起)
                                </p>

                             </div>
                         </div>
                    </div>
                    <!-- /楼盘描述 -->

                    <!-- 相册 -->
                    <div class="photos">
                                                <a class="pic" target="_blank" href="/house/3796/photo">
                            <img alt="楼盘图片" src="http://fs.fangdd.com/thumb/390m265/orig/000/001/817/-sGdTitbF-Sd_I-1yOKP9k9zTv4.jpg">
                        </a>
                                                <!-- 列表分页 -->
                        <div role="thumb" class="thumb">
                                                            
                            <a role="thumbItem" class="thumb-item  " href="/house/3796/flat#104">
                                <img alt="" src="http://fs.fangdd.com/thumb/166x120/000/001/817/m-29_Ro4hitrCuUz7IUW619Q4es.jpg">
                                <p class="cover-layer">户型图</p>
                                <span class="photo-frame"></span>
                            </a>
                                
                            <a role="thumbItem" class="thumb-item  " href="/house/3796/photo#101">
                                <img alt="" src="http://fs.fangdd.com/thumb/166x120/000/001/817/-sGdTitbF-Sd_I-1yOKP9k9zTv4.jpg">
                                <p class="cover-layer">效果图</p>
                                <span class="photo-frame"></span>
                            </a>
                                
                            <a role="thumbItem" class="thumb-item  " href="/house/3796/photo#102">
                                <img alt="" src="http://fs.fangdd.com/thumb/166x120/000/001/817/AIcOmCTY4yW06d6fRDsV08XWvdQ.jpg">
                                <p class="cover-layer">实景图</p>
                                <span class="photo-frame"></span>
                            </a>
                                
                            <a role="thumbItem" class="thumb-item  last" href="/house/3796/photo#103">
                                <img alt="" src="http://fs.fangdd.com/thumb/166x120/000/001/817/C3c6QRjWlVWhZsdzju55P4keB7M.jpg">
                                <p class="cover-layer">规划图</p>
                                <span class="photo-frame"></span>
                            </a>
                                
                                                    </div>


                        <!-- /列表分页 -->
                    </div>
                    <!-- /相册 -->
                </div>

                <!-- 分享模块 -->

<!--<div class="tool-bar">
    <a href="javascript:;" data-param="{&quot;url&quot;:&quot;/fang/house/ajax-add-house-favorite?houseId=3796&quot;}" class="collect" id="collectHouse"><i></i>收藏</a>

  


  <span data-share=" 均价为：售价待定, 地址：[包河区] 合肥市包河区当涂路与南淝河路交叉口西，淝河路99号,  电话：4000989900 转 99368  " class="share" id="share">
    <i></i>分享到
    <div class="jiathis_style">
      <a class="jiathis_button_tsina" title="分享到新浪微博"><span class="jiathis_txt jtico jtico_tsina"></span></a>
      <a class="jiathis_button_tqq" title="分享到腾讯微博"><span class="jiathis_txt jtico jtico_tqq"></span></a>
      <a class="jiathis_button_renren" title="分享到人人网"><span class="jiathis_txt jtico jtico_renren"></span></a>
      <a class="jiathis_button_douban" title="分享到豆瓣"><span class="jiathis_txt jtico jtico_douban"></span></a>
      <a class="jiathis_button_qzone" title="分享到QQ空间"><span class="jiathis_txt jtico jtico_qzone"></span></a>
    </div>
  </span>
</div>-->

                <div class="trends">
                                                         <span class="label">动态</span>
                     <div class="trends-con">
                         <h2><a href="/house/3796/news/64077">玫瑰绅城在售叠加别墅 2013-11-06</a></h2>
                         <p>玫瑰绅城在售叠加别墅，户型200-220平米，均价7500元/平米，在售联排240-330平米的户型，均价14500元/...</p>
                         <a class="more" href="/house/3796/news">更多动态</a>
                     </div>
                    
                
                </div>
                
                
                
                <div id="online-choose-room" class="sct screen-nd clearfix">
            <!-- 在线选房 -->
                    <h3 class="hd">在线选房<span>以下房源真实在售，在线缴纳定金即可锁定。</span></h3>
                    <div class="fl online-order">
                        <div class="choose-room">
                            
                            <div role="contents" class="bd">
                                
                                
                                <table cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th style="border-left: 1px solid #e8e8e8;">楼栋</th>
                                            <th>单元</th>
                                            <th>房间</th>
                                            <th>面积</th>
                                            <th>户型</th>
                                            <th>单价</th>
                                            <th>折扣</th>
                                            <th>折后总价</th>
                                            <th>状态/操作</th>
                                        </tr>
                                    </thead>
                                     <tr>
                                            <td title="楼栋">B4</td>
                                            <td title="单元">1单元</td>
                                            <td title="房间">1504</td>
                                            <td title="面积">223.02</td>
                                            <td title="户型">H户型</td>
                                            <td title="单价">7091</td>
                                            <td title="折扣">2万抵6.588903万</td>
                                            <td title="折后总价">158.1337万</td>
                                            <td><a href="javascript:;" class="btn-choose btn-order ">预定此房</a>
                                            </td>
                                     </tr>
                                     <tr>
                                            <td title="楼栋">B4</td>
                                            <td title="单元">1单元</td>
                                            <td title="房间">1504</td>
                                            <td title="面积">223.02</td>
                                            <td title="户型">H户型</td>
                                            <td title="单价">7091</td>
                                            <td title="折扣">2万抵6.588903万</td>
                                            <td title="折后总价">158.1337万</td>
                                            <td><a onclick="baidu_cal_event('bookroom','预定此房');" href="javascript:;" class="btn-choose btn-order ">预定此房</a>
                                            </td>
                                     </tr>
                                     <tr>
                                            <td title="楼栋">B4</td>
                                            <td title="单元">1单元</td>
                                            <td title="房间">1504</td>
                                            <td title="面积">223.02</td>
                                            <td title="户型">H户型</td>
                                            <td title="单价">7091</td>
                                            <td title="折扣">2万抵6.588903万</td>
                                            <td title="折后总价">158.1337万</td>
                                            <td><a onclick="baidu_cal_event('bookroom','预定此房');" href="javascript:;" class="btn-choose btn-order ">预定此房</a>
                                            </td>
                                     </tr>
                                     <tr>
                                            <td title="楼栋">B4</td>
                                            <td title="单元">1单元</td>
                                            <td title="房间">1504</td>
                                            <td title="面积">223.02</td>
                                            <td title="户型">H户型</td>
                                            <td title="单价">7091</td>
                                            <td title="折扣">2万抵6.588903万</td>
                                            <td title="折后总价">158.1337万</td>
                                            <td><a onclick="baidu_cal_event('bookroom','预定此房');" href="javascript:;" class="btn-choose btn-order ">预定此房</a>
                                            </td>
                                     </tr>
                                     <tr>
                                            <td title="楼栋">B4</td>
                                            <td title="单元">1单元</td>
                                            <td title="房间">1504</td>
                                            <td title="面积">223.02</td>
                                            <td title="户型">H户型</td>
                                            <td title="单价">7091</td>
                                            <td title="折扣">2万抵6.588903万</td>
                                            <td title="折后总价">158.1337万</td>
                                            <td><a onclick="baidu_cal_event('bookroom','预定此房');" href="javascript:;" class="btn-choose btn-order ">预定此房</a>
                                            </td>
                                     </tr>
                                     <tr>
                                            <td title="楼栋">B4</td>
                                            <td title="单元">1单元</td>
                                            <td title="房间">1504</td>
                                            <td title="面积">223.02</td>
                                            <td title="户型">H户型</td>
                                            <td title="单价">7091</td>
                                            <td title="折扣">2万抵6.588903万</td>
                                            <td title="折后总价">158.1337万</td>
                                            <td><a onclick="baidu_cal_event('bookroom','预定此房');" href="javascript:;" class="btn-choose btn-order ">预定此房</a>
                                            </td>
                                     </tr>
                                     <tr>
                                            <td title="楼栋">B4</td>
                                            <td title="单元">1单元</td>
                                            <td title="房间">1504</td>
                                            <td title="面积">223.02</td>
                                            <td title="户型">H户型</td>
                                            <td title="单价">7091</td>
                                            <td title="折扣">2万抵6.588903万</td>
                                            <td title="折后总价">158.1337万</td>
                                            <td><a onclick="baidu_cal_event('bookroom','预定此房');" href="javascript:;" class="btn-choose btn-order ">预定此房</a>
                                            </td>
                                     </tr>
                                     <tr>
                                            <td title="楼栋">B4</td>
                                            <td title="单元">1单元</td>
                                            <td title="房间">1504</td>
                                            <td title="面积">223.02</td>
                                            <td title="户型">H户型</td>
                                            <td title="单价">7091</td>
                                            <td title="折扣">2万抵6.588903万</td>
                                            <td title="折后总价">158.1337万</td>
                                            <td><a onclick="baidu_cal_event('bookroom','预定此房');" href="javascript:;" class="btn-choose btn-order ">预定此房</a>
                                            </td>
                                     </tr>
                                </table>
                        
                                
                            </div>
                        
                        </div>
        
        
        
        
                     </div>

                </div>
                
                
                
                
                
                <div class="sct screen-rd">
                <!-- 基本信息 -->
                    <h3 class="hd">基本信息</h3>
                    <table cellspacing="0" class="table-text">
                        <tbody><tr>
                            <th>开盘时间</th>
                            <td>2013-03-21</td>
                            <th>建筑类型</th>
                            <td>高层,双拼别墅,联排别墅</td>
                        </tr>
                        <tr>
                            <th>建筑装修</th>
                            <td>毛坯</td>
                            <th>物业类型</th>
                            <td>住宅,别墅</td>
                        </tr>
                        <tr>
                            <th>建筑面积</th>
                            <td>400000㎡</td>
                            <th>容积率</th>
                            <td>0.70%</td>
                        </tr>
                        <tr>
                            <th>规划面积</th>
                            <td>150000㎡</td>
                            <th>绿化率</th>
                            <td>暂无</td>
                        </tr>
                        <tr>
                            <th>车位数</th>
                            <td>3100</td>
                            <th>规划户数</th>
                            <td>暂无</td>
                        </tr>
                        <tr>
                            <th>物业费</th>
                            <td>1.2</td>
                            <th>楼盘特色</th>
                            <td>医院：合肥长江医院  周边学校： 工大附中  超市：家乐福、...</td>
                        </tr>
                        <tr>
                            <th>开发商</th>
                            <td>上海城开集团合肥置业有限公司</td>
                            <th>物业公司</th>
                            <td>合肥申大物业服务有限公司</td>
                        </tr>
                    </tbody></table>
                <!-- /基本信息 -->
                </div>
                
                
                
                <div class="screen-sur">
                
                     <h3 class="hd">周边配套</h3>
                     
                     <div class="panel-bd">
                     
                          <div id="mapTags" class="surround-hd">
                              <a rel="bus" href="javascript:;" class="facility selected">公交</a>
                              <a rel="subway" href="javascript:;" class="facility">地铁</a>
                              <a rel="education" href="javascript:;" class="facility">教育设施</a>
                              <a rel="hospital" href="javascript:;" class="facility">医院</a>
                              <a rel="bank" href="javascript:;" class="facility">银行</a>
                              <a rel="fun" href="javascript:;" class="facility">休闲娱乐</a>
                              <a rel="shopping" href="javascript:;" class="facility">购物</a>
                              <a rel="catering" href="javascript:;" class="facility">餐饮</a>
                              <a rel="sport" href="javascript:;" class="facility">运动健身</a>
                            </div>
                     
                     </div>
                     
                     <div class="surround-bd">
                     
                          
                     
                     </div>
                     
                     
                
                </div>
                
                
                
                
                

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
