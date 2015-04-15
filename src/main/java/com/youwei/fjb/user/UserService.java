package com.youwei.fjb.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;

import org.apache.commons.lang.StringUtils;
import org.bc.sdak.CommonDaoService;
import org.bc.sdak.GException;
import org.bc.sdak.Page;
import org.bc.sdak.TransactionalServiceHelper;
import org.bc.sdak.utils.JSONHelper;
import org.bc.sdak.utils.LogUtil;
import org.bc.web.ModelAndView;
import org.bc.web.Module;
import org.bc.web.PlatformExceptionType;
import org.bc.web.ThreadSession;
import org.bc.web.WebMethod;

import com.youwei.fjb.ThreadSessionHelper;
import com.youwei.fjb.entity.House;
import com.youwei.fjb.entity.User;
import com.youwei.fjb.util.DataHelper;
import com.youwei.fjb.util.SecurityHelper;
import com.youwei.fjb.util.VerifyCodeHelper;

@Module(name="/admin/user")
public class UserService {
	CommonDaoService dao = TransactionalServiceHelper.getTransactionalService(CommonDaoService.class);
	
	@WebMethod
	public ModelAndView login(User user , String yzm){
		ModelAndView mv = new ModelAndView();
		LogUtil.info("username:"+user.tel+",password="+user.pwd);
		User po = null;
		yzm = yzm.replace(String.valueOf((char)8198), "");
		if("admin".equals(user.type)){
			po = loginAsAdmin(user);
		}else{
			VerifyCodeHelper.verify(yzm);
			po = loginAsSeller(user , false);
		}
		ThreadSession.getHttpSession().setAttribute("user", po);
		return mv;
	}
	
	public User loginAsSeller(User user , boolean isMD5){
		String pwd = user.pwd;
		if(!isMD5){
			pwd = SecurityHelper.Md5(user.pwd);
		}
		User po = dao.getUniqueByParams(User.class, new String[]{"tel" , "pwd" , "type"}, new Object[]{user.tel  , pwd , "seller"});
		if(po==null){
			throw new GException(PlatformExceptionType.BusinessException,"用户名或密码不正确。");
		}
		if(po.valid==0){
			throw new GException(PlatformExceptionType.BusinessException,"账户未审核，请电话联系为您审核。");
		}
		return po;
	}
	public User loginAsAdmin(User user){
		String pwd = SecurityHelper.Md5(user.pwd);
		User po = dao.getUniqueByParams(User.class, new String[]{"account" , "pwd"}, new Object[]{user.account  , pwd});
		if(po==null){
			throw new GException(PlatformExceptionType.BusinessException,"用户名或密码不正确。");
		}
		return po;
	}
	
	@WebMethod
	public ModelAndView logout(){
		ModelAndView mv = new ModelAndView();
		ThreadSession.getHttpSession().removeAttribute("user");
		mv.redirect="../login.jsp";
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
	public ModelAndView updateSeller(User seller , String modifyPwd){
		ModelAndView mv = new ModelAndView();
		User po = dao.get(User.class, seller.id);
		po.compName = seller.compName;
		po.deptName = seller.deptName;
		po.name = seller.name;
		po.tel = seller.tel;
		po.city = seller.city;
		po.province= seller.province;
		po.quyu = seller.quyu;
		po.adminId = seller.adminId;
		User admin = dao.get(User.class, seller.adminId);
		if(admin!=null){
			po.adminName = admin.name;
		}
		if("1".equals(modifyPwd)){
			po.pwd = SecurityHelper.Md5(seller.pwd);
		}
		dao.saveOrUpdate(po);
		return mv;
	}
	
	@WebMethod
	public ModelAndView sellerList(){
		ModelAndView mv = new ModelAndView();
		List<User> admins = dao.listByParams(User.class, "from User where type=?", "admin");
		mv.jspData.put("admins", admins);
		return mv;
	}
	
	@WebMethod
	public ModelAndView sellerEdit(Integer id){
		ModelAndView mv = new ModelAndView();
		User seller = dao.get(User.class, id);
		mv.jspData.put("seller", seller);
		List<User> admins = dao.listByParams(User.class, "from User where type=?", "admin");
		mv.jspData.put("admins", admins);
		return mv;
	}
	
	@WebMethod
	public ModelAndView doRegiste(User user , String yzm){
		ModelAndView mv = new ModelAndView();
		User po = dao.getUniqueByParams(User.class, new String[]{"type" , "tel"}, new Object[]{"seller" , user.tel});
		if(po!=null){
			throw new GException(PlatformExceptionType.BusinessException,"该手机号码已经被注册");
		}
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
	public ModelAndView doSave(User user){
		ModelAndView mv = new ModelAndView();
		user.pwd = SecurityHelper.Md5(user.pwd);
		if(StringUtils.isEmpty(user.tel)){
			throw new GException(PlatformExceptionType.BusinessException,"电话号码不能为空");
		}
		//经纪人
		user.addtime = new Date();
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
	
	@WebMethod
	public ModelAndView delete(Integer id){
		ModelAndView mv = new ModelAndView();
		User po = dao.get(User.class, id);
		if(po!=null){
			dao.delete(po);
		}
		return mv;
	}
	
	@WebMethod
	public ModelAndView listData(Page<House> page , String type , String city , String quyu , Integer adminId){
		ModelAndView mv = new ModelAndView();
		StringBuilder hql = new StringBuilder("from User where 1=1 ");
		List<Object> params = new ArrayList<Object>();
		if(StringUtils.isNotEmpty(type)){
			params.add(type);
			hql.append(" and type=?");
		}
		if(StringUtils.isNotEmpty(city)){
			hql.append(" and city = ?");
			params.add(city);
		}
		if(StringUtils.isNotEmpty(quyu)){
			hql.append(" and quyu = ?");
			params.add(quyu);
		}
		if(adminId!=null){
			hql.append(" and adminId = ?");
			params.add(adminId);
		}
		page = dao.findPage(page, hql.toString(), params.toArray());
		mv.data.put("page", JSONHelper.toJSON(page , DataHelper.dateSdf.toPattern()));
		return mv;
	}
	
	@WebMethod
	public ModelAndView toggleShenHe(Integer id){
		ModelAndView mv = new ModelAndView();
		User po = dao.get(User.class, id);
		if(po.valid==1){
			po.valid = 0 ;
		}else{
			po.valid =1;
		}
		dao.saveOrUpdate(po);
		return mv;
	}
}
