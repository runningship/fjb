<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<jsp:include page="../header.jsp" />
<link rel="stylesheet" href="css/public.css" type="text/css" />
<script type="text/javascript" src="js/swipe.qq.min.js"></script>
<script type="text/javascript"  src="js/home.min.js"></script>
<script type="text/javascript">
function smart_jump(obj){
  var url=$(obj).attr('href').split('转')[0];
  var wx_sign='#mp.weixin.qq.com';
  if(anchor != wx_sign)
  {
      window.location=url + wx_sign;
  }
}

function chooseImg(type,obj){
  $('.thumb-item').removeClass('thumb-selected');
  $(obj).addClass('thumb-selected ');
  filter_type = type;
  reSlide();
}

function SeePic(){
  window.location="seePic.jsp?estateId=${estate.id}";
}

</script>
<style text="text/css">
.thumb-item{float:left;width:21%;margin-left:3%;position:relative}
.thumb-item img{height:65px;width:100%;}
.thumb-selected img{border: 1px solid;border-color: red;}
.cover-layer{  position: absolute;  left: 0px;  bottom: 0px;  color: white;  width: 100%;  background: #444;  text-align: center;opacity:0.9}
</style>
</head>

<body >
<jsp:include page="top.jsp"></jsp:include>
<div class="main">
     
<!--      <div id="top" style="text-align:center"> -->
<%--      		<span class="s5">${estate.name}</span> --%>
<!--      </div> -->
     
<%--      <div id="banner"><img src="../${upload_path}/${main_img}" /></div> --%>
     <div class="swipe" id="imgSwipe" style="visibility: visible;">
   	  <div class="swipe-wrap" style="height:190px;">
   	  		<c:forEach items="${images}"  var="image">
   	  			<div style="" class="swipe_pic "  type="${image.type }"><img src="../${upload_path}/${image.path }" onclick="SeePic();return false"  style="max-height:395px;"/></div>
   	  		</c:forEach>
           
       </div>
      <span class="swipe_num"><span id="nowNum">1</span>/<span id="totalNum"></span></span>
	 </div>
	 <div role="thumb" class="thumb" style="height:90px;background:white;margin-top:-15px;padding-left:3%">
           <c:if test="${huxing_img !=null }">
           <a role="thumbItem" class="thumb-item  " href="#" onclick="chooseImg('huxing',this);return false;">
               <img alt="" src="../../${upload_path}/${huxing_img }">
               <span class="cover-layer">户型图</span>
           </a>
           </c:if>
           <c:if test="${xiaoguo_img !=null}">
            <a role="thumbItem" class="thumb-item " href="#" onclick="chooseImg('xiaoguo',this);return false;">
                <img alt="" src="../../${upload_path}/${xiaoguo_img }"><span class="cover-layer">效果图</span></img>
            </a>
           </c:if>
           
           <c:if test="${shijing_img !=null}">
           	<a role="thumbItem" class="thumb-item  " href="#" onclick="chooseImg('shijing',this);return false;">
                <img alt="" src="../../${upload_path}/${shijing_img }">
                <p class="cover-layer">实景图</p>
            </a>
           </c:if>
           
           <c:if test="${guihua_img !=null }">
            <a role="thumbItem" class="thumb-item  last" href="#" onclick="chooseImg('guihua',this);return false;">
                <img alt="" src="../../${upload_path}/${guihua_img }">
                <p class="cover-layer">规划图</p>
            </a>
           </c:if>
         </div>
                          
     <div id="infoCon">
     
          <div class="line">
          	<div class="coloReds" style="font-size:25px;color:#868686;float:left;">${estate.name}</div>
<%--           	<a style="float:left" href="order.jsp?estateId=${estate.id }"><img src="../images/tuijian.jpg"/ style="height:35px;margin-left:20px" /></a> --%>
          	
          </div>
          <div class="line" style="color:#868686">${estate.addr }</div>
<%--           <div class="line">${estate.tese }</div> --%>
          <div class="tit line" style="margin: 5px 2%;"><i></i><span style="color:#868686">独家特惠:</span> <span style="color:#fe5802;font-size:25px">${estate.youhuiPlan }</span></div>
          <div >
               
               
<%--                <div class="line">可售：${leftCount }套 总价：${minTotalPrice}起</div> --%>
<%--                <div class="line">${estate.yufu}抵${estate.shidi}</div> --%>
<%--                <div class="line">截止时间：<fmt:formatDate value="${estate.youhuiEndtime }" pattern="yyyy-MM-dd"/></div> --%>

				<div class="line" style="width:295px;">
					<div style="display:inline-block;  background-color: rgb(247,150,70);line-height:40px;height:40px;border-radius: 10px;padding: 0px 30px;">
						<a style="color:red;font-size: 16px; font-weight: bold;" href="order.jsp?estateId=${estate.id }" >预约看房</a>
					</div>
					<div style="display:inline-block;  background-color: rgb(247,150,70);line-height:40px;height:40px;border-radius: 10px;padding: 0px 30px;float:right">
						<a style="color:red;font-size: 16px; font-weight: bold;" href="#center_div" >项目介绍</a>
					</div>
				</div>
				
				<div class="line" style="">
					<div style="display:inline-block;  background-color: rgb(247,150,70);line-height:40px;height:40px;border-radius: 10px;padding: 0px 10px;width:275px">
						<a style="color:red;font-size: 16px; font-weight: bold;" href="tel:${estate.tel}" onclick="smart_jump(this);return false;">
						<img style="width:24px;padding: 0px 10px;" src="images/tel.png" /> 详情请致电: 项目经理 ${estate.manager }</a>
					</div>
<!-- 					<div style="display:inline-block;background-color: rgb(247,150,70);line-height:40px;height:40px;width:40%"> -->
<%-- 					<a style="color:red" href="order.jsp?estateId=${estate.id }">我要推荐</a> --%>
<!-- 					</div> -->
				</div>
				
          </div>
          
          <div class="xiangxi" name="center_div" id="center_div">
               <div class="tit">基础信息</div>
              <c:if test="${estate.mainHuxing!=null}">
                <div class="line">主力户型：${estate.mainHuxing }</div>
              </c:if>
              <c:if test="${estate.zxiu!=null}">
               <div class="line">装修状态：${estate.zxiu}</div>
              </c:if>
              <c:if test="${estate.shouloubu!=null}">
                <div class="line">售楼处地址：${estate.shouloubu }</div>
              </c:if>
              <c:if test="${estate.developer!=null}">
                <div class="line">开发商：${estate.developer }</div>
              </c:if>
              <c:if test="${estate.gongjijin!=null}">
                <div class="line">公积金贷款：${estate.gongjijin }</div>
              </c:if>
              <c:if test="${estate.daili!=null}">
                <div class="line">代理商：${estate.daili }</div>
              </c:if>
              <c:if test="${estate.fukuang!=null}">
                <div class="line">付款方式：${estate.fukuang }</div>
              </c:if>
              <c:if test="${estate.opentime!=null}">
                <div class="line">开盘时间：<fmt:formatDate value="${estate.opentime}" pattern="yyyy-MM-dd"/></div>
              </c:if>
              <c:if test="${estate.hushu!=null}">
                <div class="line">交房时间：<fmt:formatDate value="${estate.jiaofangDate}" pattern="yyyy-MM-dd"/></div>
              </c:if>
          </div>
     
          <div class="xiangxi" >
               <div class="tit">建筑信息</div>
              <c:if test="${estate.chanquan!=null}">
                <div class="line">土地年限：${estate.chanquan }年</div>
              </c:if>
              <c:if test="${estate.hushu!=null}">
                <div class="line">规划户数：${estate.hushu }户</div>
              </c:if>
              <c:if test="${estate.guishu!=null}">
                <div class="line">产证归属：${estate.guishu }</div>
              </c:if>
              <c:if test="${estate.ghmj!=null}">
                <div class="line">规划面积：${estate.ghmj }平方</div>
              </c:if>
              <c:if test="${estate.jzmj!=null}">
                <div class="line">建筑面积：${estate.jzmj }平方</div>
              </c:if>
              <c:if test="${estate.gongtan!=null}">
                <div class="line">公摊面积：${estate.gongtan }%</div>
              </c:if>
              <c:if test="${estate.lxing!=null}">
                <div class="line">建筑类别：${estate.lxing }</div>
              </c:if>
              <c:if test="${estate.tese!=null}">
                <div class="line">项目特色：${estate.tese }</div>
              </c:if>
          </div>

          <div class="xiangxi">
               <div class="tit">物业信息</div>
              <c:if test="${estate.jzmj!=null}">
                <div class="line">物业类型：${estate.jzmj }</div>
              </c:if>
              <c:if test="${estate.rongji!=null}">
                <div class="line">容积率：${estate.rongji }%</div>
              </c:if>
              <c:if test="${estate.lvhua!=null}">
                <div class="line">绿化率：${estate.lvhua }%</div>
              </c:if>
              <c:if test="${estate.wyfee!=null}">
                <div class="line">物业费：${estate.wyfee }元/月/平米</div>
              </c:if>
              <c:if test="${estate.jzmj!=null}">
                <div class="line">物业公司：${estate.jzmj }</div>
              </c:if>
              <c:if test="${estate.chewei!=null}">
                <div class="line">车位：${estate.chewei }</div>
              </c:if>
          </div>

          <c:if test="${estate.jieshao!=null}">
            <div class="xiangxi">
                 <div class="tit">介绍</div>
                  <div class="line">${estate.jieshao }</div>
            </div>
          </c:if>
     	
          <div class="xiangxi">
          </div>
     </div>
     

     <jsp:include page="bottom.jsp" />
</div>

</body>
</html>
