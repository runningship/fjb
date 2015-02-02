<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="style/css.css" />
<link rel="stylesheet" type="text/css" href="style/user.css" />
<script src="js/jquery-1.6.4.min.js"></script>
<script src="js/jquery.nivo.slider.pack.js"></script> 
</head>

<body>

<jsp:include page="top.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>

<div class="warp">

     <div class="main">
     
          <div class="user">
               <div class="userLeft">
                    
                    <h2>叶新舟</h2>
                    
                    <div class="txImg"><img src="images/p2.png" /></div>
                    
                    <div><a href="#">个人资料</a></div>
                    <div><a href="#" class="sel">客户列表</a></div>
               
               </div>
               
               <div class="userRight">
               
                    <div class="tit"><a href="#">我的好屋</a> > <span>客户列表</span></div>
                    
                    <div class="con">
                    
                        <h2></h2>
                        
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="35" width="30" align="center" valign="middle" bgcolor="#eeeeee"></td>
    <td align="center" valign="middle" bgcolor="#eeeeee">姓名</td>
    <td align="center" valign="middle" bgcolor="#eeeeee">电话</td>
    <td align="center" valign="middle" bgcolor="#eeeeee">预约楼盘</td>
    <td align="center" valign="middle" bgcolor="#eeeeee">预约时间</td>
    <td align="center" valign="middle" bgcolor="#eeeeee">看房时间</td>
    <td align="center" valign="middle" bgcolor="#eeeeee"></td>
    <td align="center" valign="middle" bgcolor="#eeeeee"></td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle">1</td>
    <td align="center" valign="middle">叶新舟</td>
    <td align="center" valign="middle">15855443322</td>
    <td align="center" valign="middle">玫瑰绅城5#1708</td>
    <td align="center" valign="middle">2015-01-20</td>
    <td align="center" valign="middle">2015-01-30</td>
    <td align="center" valign="middle">已处理</td>
    <td align="center" valign="middle"><a href="javascript:" onclick="openNewWin('bookroom','预约信息反馈','xxfk.html');">查看</a></td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle">2</td>
    <td align="center" valign="middle">叶新舟</td>
    <td align="center" valign="middle">15855443322</td>
    <td align="center" valign="middle">玫瑰绅城5#1708</td>
    <td align="center" valign="middle">2015-01-20</td>
    <td align="center" valign="middle">2015-01-30</td>
    <td align="center" valign="middle">已成交</td>
    <td align="center" valign="middle"><a href="#">查看</a></td>
  </tr>
</table>

                        
                 </div>
                    
               
               </div>
               
          </div>
          
     </div>

</div>


<jsp:include page="foot.jsp"></jsp:include>

</body>
</html>
