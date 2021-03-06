package com.youwei.fjb;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bc.sdak.GException;
import org.bc.web.PlatformExceptionType;
import org.bc.web.ThreadSession;

public class UserSessionFilter implements Filter {

	private FjbUserOfflineHandler handler = new FjbUserOfflineHandler();
	// Filter注销方法
	@Override
	public void destroy() {

	}

	// filter要实现的功能
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req  = (HttpServletRequest)request;
//		ThreadSession.setHttpServletRequest(req);
//		ThreadSession.setHttpServletResponse(resp);
		ThreadSession.setHttpSession(req.getSession());
		try{
			ThreadSessionHelper.getUser();
		}catch(GException ex){
			if(ex.getType()==PlatformExceptionType.UserOfflineException){
				handler.handle(req, response);
				return;
			}
		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}
