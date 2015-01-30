package com.youwei.fjb.user;

import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.bc.sdak.CommonDaoService;
import org.bc.sdak.GException;
import org.bc.sdak.TransactionalServiceHelper;
import org.bc.web.ModelAndView;
import org.bc.web.Module;
import org.bc.web.PlatformExceptionType;
import org.bc.web.ThreadSession;
import org.bc.web.WebMethod;

import com.youwei.fjb.ThreadSessionHelper;
import com.youwei.fjb.entity.User;
import com.youwei.fjb.util.SecurityHelper;
import com.youwei.fjb.util.VerifyCodeHelper;

@Module(name="/user")
public class UserService {
	CommonDaoService dao = TransactionalServiceHelper.getTransactionalService(CommonDaoService.class);
	
	@WebMethod
	public ModelAndView login(User user , String yzm){
		ModelAndView mv = new ModelAndView();
		User po = null;
		if("admin".equals(user.type)){
			po = loginAsAdmin(user);
		}else{
			VerifyCodeHelper.verify(yzm);
			po = loginAsSeller(user);
		}
		ThreadSession.getHttpSession().setAttribute("user", po);
		return mv;
	}
	
	public User loginAsSeller(User user){
		String pwd = SecurityHelper.Md5(user.pwd);
		User po = dao.getUniqueByParams(User.class, new String[]{"tel" , "pwd"}, new Object[]{user.tel  , pwd});
		if(po==null){
			throw new GException(PlatformExceptionType.BusinessException,"用户名或密码不正确。");
		}
		return po;
	}
	public User loginAsAdmin(User user){
		String pwd = SecurityHelper.Md5(user.pwd);
		User po = dao.getUniqueByParams(User.class, new String[]{"name" , "pwd"}, new Object[]{user.name  , pwd});
		if(po==null){
			throw new GException(PlatformExceptionType.BusinessException,"用户名或密码不正确。");
		}
		return po;
	}
	
	@WebMethod
	public ModelAndView logout(){
		ModelAndView mv = new ModelAndView();
		ThreadSession.getHttpSession().removeAttribute("user");
		mv.redirect="/admin/public/login.jsp";
		return mv;
	}
	
	@WebMethod
	public ModelAndView modifyPwd(String oldPwd,String newPwd){
		ModelAndView mv = new ModelAndView();
		User me = ThreadSessionHelper.getUser();
		User po = dao.get(User.class, me.id);
		if(!po.pwd.equals(SecurityHelper.Md5(oldPwd))){
			throw new GException(PlatformExceptionType.BusinessException,"原密码不正确。");
		}
		po.pwd = SecurityHelper.Md5(newPwd);
		dao.saveOrUpdate(po);
		return mv;
	}
	
	@WebMethod
	public ModelAndView doRegiste(User user , String yzm){
		ModelAndView mv = new ModelAndView();
		VerifyCodeHelper.verify(yzm);
		user.pwd = SecurityHelper.Md5(user.pwd);
		//经纪人
		user.type = "seller";
		user.addtime = new Date();
		user.valid = 0;
		dao.saveOrUpdate(user);
		return mv;
	}
	
	@WebMethod
	public ModelAndView active(User user){
		ModelAndView mv = new ModelAndView();
		User po = dao.get(User.class, user.id);
		if(po!=null){
			if(StringUtils.isNotEmpty(po.activeCode) && po.activeCode.equals(user.activeCode)){
				po.valid = 1;
				dao.saveOrUpdate(po);
				//跳转到登录页面
			}
		}
		return mv;
	}
}
