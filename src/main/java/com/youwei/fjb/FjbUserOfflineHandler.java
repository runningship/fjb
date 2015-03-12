package com.youwei.fjb;

import java.io.IOException;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.bc.web.UserOfflineHandler;

public class FjbUserOfflineHandler implements UserOfflineHandler{


	@Override
	public void handle(HttpServletRequest req, ServletResponse response) {
		try {
			if(req.getRequestURI().contains("admin")){
				response.getWriter().write("<script type='text/javascript'>window.top.location='"+req.getServletContext().getContextPath()+"/admin/login.jsp'</script>");
			}else if(req.getRequestURI().contains("/m/")){
				response.getWriter().write("<script type='text/javascript'>window.top.location='"+req.getServletContext().getContextPath()+"/m/login.jsp'</script>");
			}else{
				response.getWriter().write("<script type='text/javascript'>window.top.location='"+req.getServletContext().getContextPath()+"/login.jsp'</script>");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
