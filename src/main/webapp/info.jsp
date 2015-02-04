<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script type="text/javascript" src="${projectName}/js/pagination.js"></script>
<jsp:include page="header.jsp" />
<script type="text/javascript">
function doSearch(){
    var a=$('form[name=form1]').serialize();
    YW.ajax({
        type: 'get',
        url: '${projectName}/c/admin/house/listData?estateId=${estate.id}',
        data: a,
        dataType:'json',
        mysuccess: function(json){
            buildHtmlWithJsonArray("repeat",json.page.data);
            Page.setPageInfo(json.page);
        }
      });
}

$(function () {
    Page.Init();
    doSearch();
});

</script>
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
                            <h1>[${estate.quyu}]  ${estate.name }</h1>
                            <h2>
                                ${estate.tese }
                            </h2>
                            <div class="bd">

                                <p class="price"><em>${estate.junjia }</em>元/平米</p> 
                                
                                
                                <a class="btn-main " onclick="openNewWin('estate_order', '预约看房 ','yykf.jsp?estateId=${estate.id}');" id="booking" href="javascript:;">预约看房</a>

                                <a class="btn-sub  " href="#online-choose-room">在线选房 (125)</a>



                                <p class="tips-info">
                                    (在线剩余${leftCount}套，总价${po.totalPrice}万起)
                                </p>

                             </div>
                         </div>
                    </div>
                    <!-- /楼盘描述 -->

                    <!-- 相册 -->
                    <div class="photos">
                                                <a class="pic" target="_blank" href="picList.jsp?estateId=${estate.id }">
                            <img alt="楼盘图片" src="./upload/${main_img }">
                        </a>
                                                <!-- 列表分页 -->
                        <div role="thumb" class="thumb">
                            <c:if test="${huxing_img !=null }">
                            <a role="thumbItem" class="thumb-item  " href="picList.jsp?estateId=${estate.id }">
                                <img alt="" src="./upload/${huxing_img }">
                                <p class="cover-layer">户型图</p>
                                <span class="photo-frame"></span>
                            </a>
                            </c:if>
                            <c:if test="${xiaoguo_img !=null}">
	                            <a role="thumbItem" class="thumb-item  " href="picList.jsp?estateId=${estate.id }">
	                                <img alt="" src="./upload/${xiaoguo_img }">
	                                <p class="cover-layer">效果图</p>
	                                <span class="photo-frame"></span>
	                            </a>
                            </c:if>
                            
                            <c:if test="${shijing_img !=null}">
                            	<a role="thumbItem" class="thumb-item  " href="picList.jsp?estateId=${estate.id }">
	                                <img alt="" src="./upload/${shijing_img }">
	                                <p class="cover-layer">实景图</p>
	                                <span class="photo-frame"></span>
	                            </a>
                            </c:if>
                            
                            <c:if test="${guihua_img !=null }">
	                            <a role="thumbItem" class="thumb-item  last" href="picList.jsp?estateId=${estate.id }">
	                                <img alt="" src="./upload/${guihua_img }">
	                                <p class="cover-layer">规划图</p>
	                                <span class="photo-frame"></span>
	                            </a>
                            </c:if>
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
                    <h3 class="hd">在线选房<span>以下房源真实在售</span></h3>
                    <div class="fl online-order">
                        <div class="choose-room">
                            
                            <div role="contents" class="bd">
                                <form class="form-inline definewidth m20" name="form1"  method="get" onsubmit="doSearch();return false;">
                                <input type="hidden" name="pageSize" value="5"/>
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
            <tr style="display:none" class="repeat">
                                            <td title="楼栋">$[dhao]</td>
                                            <td title="单元">$[unit]</td>
                                            <td title="房间">$[fhao]</td>
                                            <td title="面积">$[mji]</td>
                                            <td title="户型">$[hxing]</td>
                                            <td title="单价">$[djia]</td>
                                            <td title="折扣">$[zkou]</td>
                                            <td title="折后总价">$[totalPrice]</td>
                                            <td><a onclick="openNewWin('house_order','预约看房','yykf.jsp?estateId=${estate.id}&hid=$[id]');" href="javascript:;" class="btn-choose btn-order ">预定此房</a>
                                            </td>
                                     </tr>
    
                                </table>
                                <div class="footer" style="margin-top:5px;margin-left:35px;">
							        <div class="maxHW mainCont ymx_page foot_page_box"></div>
							    </div>
                        	</form>
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
                            <td>${estate.opentime }</td>
                            <th>建筑类型</th>
                            <td>${estate.lxing }</td>
                        </tr>
                        <tr>
                            <th>建筑装修</th>
                            <td>${estate.zxiu }</td>
                            <th>物业类型</th>
                            <td>${estate.wylx }</td>
                        </tr>
                        <tr>
                            <th>建筑面积</th>
                            <td>${estate.jzmj }㎡</td>
                            <th>容积率</th>
                            <td>${estate.rongji }%</td>
                        </tr>
                        <tr>
                            <th>规划面积</th>
                            <td>${estate.ghmj}㎡</td>
                            <th>绿化率</th>
                            <td>${estate.lvhua }%</td>
                        </tr>
                        <tr>
                            <th>车位数</th>
                            <td>${estate.chewei }</td>
                            <th>规划户数</th>
                            <td>${estate.hushu }</td>
                        </tr>
                        <tr>
                            <th>物业费</th>
                            <td>${estate.wyfee }</td>
                            <th>楼盘特色</th>
                            <td>${estate.tese }</td>
                        </tr>
                        <tr>
                            <th>开发商</th>
                            <td>${estate.developer }</td>
                            <th>物业公司</th>
                            <td>${estate.wyComp }</td>
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

</body>
</html>
