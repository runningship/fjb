package com.youwei.fjb;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.bc.sdak.GException;
import org.bc.web.PlatformExceptionType;
import org.bc.web.ThreadSession;

import com.youwei.fjb.entity.User;
import com.youwei.fjb.user.UserService;

public class ThreadSessionHelper {

	public static User getUser(){
    	HttpSession session = ThreadSession.getHttpSession();
    	if(session==null){
    		return null;
    	}
    	User u = (User)session.getAttribute("user");
    	if(u==null){
    		Cookie[] cookies = ThreadSession.HttpServletRequest.get().getCookies();
    		User seller = new User();
    		for(Cookie cookie : cookies){
    			if("tel".equals(cookie.getName())){
    				seller.tel = cookie.getValue();
    			}
    			if("pwd".equals(cookie.getName())){
    				seller.pwd = cookie.getValue();
    			}
    		}
    		UserService us = new UserService();
    		try{
    			User po = us.loginAsSeller(seller);
    			ThreadSession.getHttpSession().setAttribute("user", po);
    			return po;
    		}catch(Exception ex){
    			throw new GException(PlatformExceptionType.UserOfflineException , "");
    		}
    	}
    	return u;
    }
	
    public static String getIp(){
    	HttpSession session = ThreadSession.getHttpSession();
    	return (String)session.getAttribute("ip");
    }
   
    public static String getCity(){
    	HttpSession session = ThreadSession.getHttpSession();
    	String city = (String)session.getAttribute(FjbConstant.Session_Attr_City);
    	if(StringUtils.isEmpty(city)){
    		
    	}
    	return city;
    }
}
