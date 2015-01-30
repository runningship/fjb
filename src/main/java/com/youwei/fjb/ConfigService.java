package com.youwei.fjb;

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
import com.youwei.fjb.entity.Config;
import com.youwei.fjb.entity.User;
import com.youwei.fjb.util.SecurityHelper;

@Module(name="/conf")
public class ConfigService {
	CommonDaoService dao = TransactionalServiceHelper.getTransactionalService(CommonDaoService.class);
	
	@WebMethod
	public ModelAndView login(User user){
		ModelAndView mv = new ModelAndView();
		String pwd = SecurityHelper.Md5(user.pwd);
		User po = dao.getUniqueByParams(User.class, new String[]{"name" , "pwd"}, new Object[]{user.name  , pwd});
		if(po==null){
			throw new GException(PlatformExceptionType.BusinessException,"用户名或密码不正确。");
		}
		ThreadSession.getHttpSession().setAttribute("user", po);
		return mv;
	}
	
	
	@WebMethod
	public ModelAndView doSave(Config conf){
		ModelAndView mv = new ModelAndView();
		if(StringUtils.isEmpty(conf.type) || StringUtils.isEmpty(conf.attr)){
			throw new GException(PlatformExceptionType.BusinessException,"配置项类别或名称不能为空。");
		}
		Config po = dao.getUniqueByParams(Config.class, new String[]{"type" , "attr"}, new Object[]{conf.type, conf.attr});
		if(po!=null){
			throw new GException(PlatformExceptionType.BusinessException,"存在相同的配置项。");
		}
		dao.saveOrUpdate(conf);
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
