package com.youwei.fjb.order;

import java.util.Date;

import org.bc.sdak.CommonDaoService;
import org.bc.sdak.TransactionalServiceHelper;
import org.bc.web.ModelAndView;
import org.bc.web.Module;
import org.bc.web.WebMethod;

import com.youwei.fjb.entity.Order;
import com.youwei.fjb.util.VerifyCodeHelper;

@Module(name="/order")
public class OrderService {

	CommonDaoService dao = TransactionalServiceHelper.getTransactionalService(CommonDaoService.class);
	
	@WebMethod
	public ModelAndView doSave(Order order , String yzm){
		VerifyCodeHelper.verify(yzm);
		ModelAndView mv = new ModelAndView();
		order.addtime = new Date();
		return mv;
	}
}
