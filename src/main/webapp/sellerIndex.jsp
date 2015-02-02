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
                    
                    <div><a href="#" class="sel">个人资料</a></div>
                    <div><a href="buyer.jsp">客户列表</a></div>
               
               </div>
               
               <div class="userRight">
               
                    <div class="tit"><a href="#">我的好屋</a> > <span>个人资料</span></div>
                    
                    <div class="con">
                        <div class="txImg">
                            <img src="images/p2.png"><br>
                            <a href="/user/touxiang">修改头像</a>
                        </div>
                        
                        <div class="user_inforight">
                        姓名：叶新舟&#12288;本账户ID：15856985122<br>
                        手机号码：15856985122&#12288;&#12288;
                        </div>
                        
                        <div class="user_moreinfo">
                             
                            <h2>账户安全</h2>
			
			
                            <div class="table">
                                <table width="600">
                                    <tbody><tr>
                                        <td width="20%"><img src="images/user_icon1.png"> 认证手机</td>
                                        <td width="65%"><span style="color:#4682da">15856985122</span></td>
                                        <td width="15%"></td>
                                    </tr>
                                    <tr>
                                        <td width="20%"><img src="images/user_icon4.png"> 更改密码</td>
                                        <td width="65%">修改密码之后要牢记密码,不要把密码给陌生人看</td>
                                        <td width="15%"><a type="button" onclick="openNewWin('bookroom','xgmm.jsp','fsfsdf');" title="" href="javascript:">更改密码</a></td>
                                    </tr>
                                </tbody></table>
                                
                             </div>
                             
                        
                        </div>
                        
                    </div>
                    
               
               </div>
               
          </div>
          
     </div>

</div>

<jsp:include page="foot.jsp" />
</body>
</html>
