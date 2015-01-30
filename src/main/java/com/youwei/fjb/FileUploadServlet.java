package com.youwei.fjb;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.bc.sdak.SimpDaoTool;
import org.bc.sdak.utils.LogUtil;

import com.youwei.fjb.entity.HouseImage;

public class FileUploadServlet extends HttpServlet {

	static final int MAX_SIZE = 1024000*5;
//	static final String BaseFileDir = "F:\\temp\\upload";
	static final String BaseFileDir = "../upload/";
	String rootPath, successMessage;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		// get path in which to save file
		rootPath = config.getInitParameter("RootPath");
		if (rootPath == null) {
			rootPath = "/";
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		ServletOutputStream out = null;
		
		JSONObject result = new JSONObject();
		result.put("result", 0);
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			out = response.getOutputStream();
			response.setContentType("text/plain");
			String estateId;
			String type="";
			try{
				type = request.getParameter("imgType");
				estateId = request.getParameter("estateId");
			}catch(Exception ex){
				response.setStatus(500);
				out.write("recordId should be number ".getBytes());
				return;
			}
			request.setCharacterEncoding("utf8");
			List<FileItem> items = upload.parseRequest(request);
			for(FileItem item : items){
				if(item.isFormField()){
					continue;
				}
				HouseImage image = new HouseImage();
				if(item.getSize()<=0){
					throw new RuntimeException("no file selected.");
				}else{
					if("main".equals(type)){
						//主图片只有一张
						SimpDaoTool.getGlobalCommonDaoService().execute("delete from HouseImage where estateUUID=? and type='main'" , estateId);
					}
					if(item.getSize()>=MAX_SIZE){
						throw new RuntimeException("file size exceed 5M");
					}else{
						LogUtil.info("uploading file "+ item.getName());
						String imgDir = request.getServletContext().getRealPath("/")+File.separator +"upload/"+request.getServletContext().getContextPath();
						image.path=request.getServletContext().getContextPath()+  File.separator + estateId + File.separator + item.getName();
						FileUtils.copyInputStreamToFile(item.getInputStream(), new File(imgDir
								+  File.separator + estateId + File.separator + item.getName()));
					}
				}
				image.estateUUID = estateId;
				image.type = type;
				SimpDaoTool.getGlobalCommonDaoService().saveOrUpdate(image);
			}
			result.put("msg", "success");
			out.write(result.toString().getBytes());
		} catch (Exception e) {
			result.put("result", 1);
			result.put("msg", e.getMessage());
			try {
				out.write(result.toString().getBytes());
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}
}
