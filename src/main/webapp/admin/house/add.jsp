<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${projectName }/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${projectName }/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${projectName }/Css/style.css" />
    <script type="text/javascript" src="${projectName }/js/jquery.js"></script>
    <script type="text/javascript" src="${projectName }/js/bootstrap.js"></script>
    <script type="text/javascript" src="${projectName }/js/artDialog/jquery.artDialog.source.js?skin=default"></script>
    <script type="text/javascript" src="${projectName }/js/artDialog/plugins/iframeTools.source.js"></script>
    <script type="text/javascript" src="${projectName }/js/buildHtml.js"></script>
    <script type="text/javascript" src="${projectName}/js/uploadify/jquery.uploadify.js"></script>
	<script type="text/javascript">
		function cfgChild(radio){
			if(radio.value==1){
				$('#tr_conts').css('display','none');
			}else{
				$('#tr_conts').css('display','');
			}
		}
		
		$(function(){
			setTimeout(function(){
				initUploadHouseImage('hxing_upload' , 'hxing');
				initUploadHouseImage('xiaoguo_upload' , 'xiaoguo');
				initUploadHouseImage('main_upload' , 'main');
			},100);
			
		});
		
		function save(){
		    var a=$('form[name=form1]').serialize();
		    YW.ajax({
		        type: 'POST',
		        url: '${projectName}/c/admin/estate/doSave',
		        data:a,
		        mysuccess: function(data){
		            alert('添加成功');
		        }
		    });
		}
		
function initUploadHouseImage(id , imgType){
	  $('#'+id).uploadify({
	      'swf'      : '${projectName}/js/uploadify/uploadify.swf',
	      'uploader' : '${projectName}/file/upload?imgType='+imgType+'&estateId=${estate_uuid}',
	      'buttonText': '上传图片',
	      'removeTimeout': 0.1,
	      'fileSizeLimit' : '5MB',
	      'onUploadError' : function(file, errorCode, errorMsg, errorString){
	          console.log('The file ' + file.name + ' could not be uploaded: ' + errorString);
	      },
	      'onUploadComplete':function(file){
	          console.log('finish:'+file);
	      },
	      'onUploadSuccess' : function(file, data, response) {
	        var json = JSON.parse(data);
	        if(json['result']!=0){
	          $('#' + file.id).find('.data').html('-文件上传失败,'+json['msg']);
	        }else{
	        	 getImgList(imgType);
	        }
	      },
	      'onQueueComplete' : function(queueData) {
	        console.log(queueData);
	      }
	      // Put your options here
	  });
	}

function getImgList(imgType){
	YW.ajax({
        type: 'get',
        url: '${projectName}/c/admin/estate/listImage?estateUUID=${estate_uuid}&imgType='+imgType,
        dataType:'json',
        mysuccess: function(data){
        	$('#'+imgType+'_img_container').empty();
        	for(var i=0;i<data.images.length;i++){
        		var img = '<img style="width:120px;height:80px;" src="../../upload/'+data.images[i].path+'" />';
            	$('#'+imgType+'_img_container').append(img);
        	}
        }
    });
	
}
</script>
</head>
<body>
<form name="form1" method="post" class="definewidth m20">
	<input type="hidden" name="uuid"  value="${estate_uuid }"/>
<table class="table table-bordered table-hover m10">
	
    <tr>
        <td class="tableleft">名称</td>
        <td><input type="text" name="name"/></td>
    </tr>
    <tr>
        <td class="tableleft">主图片</td>
        <td><input id="main_upload"  style="display:none;margin-top:5px;">
        	<div id="main_img_container">
        	</div>
        </td>
    </tr>
    <tr>
        <td class="tableleft">区域</td>
        <td>
        	<select  class="sortSelect" name="quyu">
                <option value="" >所有</option>
                <c:forEach items="${quyus}" var="quyu">
                  <option value="${quyu.value}">${quyu.value}</option>
                </c:forEach>
            </select>
        </td>
    </tr>
    <tr>
        <td class="tableleft">均价</td>
        <td><input type="text" name="junjia"/>元/平方</td>
    </tr>
    
    <tr id="tr_conts" >
    	<td class="tableleft">开盘时间</td>
    	<td></td>
    </tr>
    <tr>
        <td class="tableleft">建筑类型</td>
        <td>
        	<select  class="sortSelect" name="lxing">
                <option value="" >所有</option>
                <c:forEach items="${lxings}" var="lxing">
                  <option value="${lxing.value}">${lxing.value}</option>
                </c:forEach>
            </select>
       </td>
    </tr>
    <tr>
        <td class="tableleft">物业类型</td>
        <td><select  class="sortSelect" name="wylx">
                <option value="" >所有</option>
                <c:forEach items="${wylxs}" var="wylx">
                  <option value="${wylx.value}">${wylx.value}</option>
                </c:forEach>
            </select></td>
    </tr>
    <tr>
        <td class="tableleft">装修</td>
        <td><select  class="sortSelect" name="zxiu">
                <option value="" >所有</option>
                <c:forEach items="${zxius}" var="zxiu">
                  <option value="${zxiu.value}">${zxiu.value}</option>
                </c:forEach>
            </select></td>
    </tr>
    <tr>
        <td class="tableleft">建筑面积</td>
        <td><input type="text" name="jzmj"/>平方</td>
    </tr>
    <tr>
        <td class="tableleft">容积率</td>
        <td><input type="text" name="rongji"/></td>
    </tr>
    <tr>
        <td class="tableleft">规划面积</td>
        <td><input type="text" name="ghmj"/>平方</td>
    </tr>
    <tr>
        <td class="tableleft">绿化率</td>
        <td><input type="text" name="lvhua"/></td>
    </tr>
    <tr>
        <td class="tableleft">车位数</td>
        <td><input type="text" name="chewei"/></td>
    </tr>
    <tr>
        <td class="tableleft">规划户数</td>
        <td><input type="text" name="hushu"/></td>
    </tr>
    <tr>
        <td class="tableleft">物业费</td>
        <td><input type="text" name="wyfee"/>元/平方*月</td>
    </tr>
    <tr>
        <td class="tableleft">楼盘特色</td>
        <td><textarea name="tese" ></textarea></td>
    </tr>
    <tr>
        <td class="tableleft">开发商</td>
        <td><input type="text" name="developer"/></td>
    </tr>
    <tr>
        <td class="tableleft">物业公司</td>
        <td><input type="text" name="wyComp"/></td>
    </tr>
    <tr>
        <td class="tableleft">地址</td>
        <td><input type="text" name="addr"/></td>
    </tr>
    <tr>
        <td class="tableleft">户型图</td>
        <td><input id="hxing_upload"  style="display:none;margin-top:5px;">
        	<div id="hxing_img_container">
        	</div>
        </td>
    </tr>
     <tr>
        <td class="tableleft">效果图</td>
        <td><input id="xiaoguo_upload"  style="display:none;margin-top:5px;">
        	<div id="xiaoguo_img_container">
        	</div>
        </td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button class="btn btn-primary" type="button" onclick="save();return false;">保存</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>