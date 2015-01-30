package com.youwei.fjb.util;

import org.bc.sdak.GException;
import org.bc.web.PlatformExceptionType;
import org.bc.web.ThreadSession;

public class VerifyCodeHelper {

	public static void verify(String yzm){
		if(yzm==null){
			yzm="";
		}
		String session_yzm = (String)ThreadSession.getHttpSession().getAttribute("yzm");
		if(!yzm.toUpperCase().equals(session_yzm)){
			throw new GException(PlatformExceptionType.BusinessException,"验证码不正确。");
		}
	}
}
