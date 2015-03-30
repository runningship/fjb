package com.youwei.fjb.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.bc.sdak.CommonDaoService;
import org.bc.sdak.Page;
import org.bc.sdak.TransactionalServiceHelper;
import org.bc.sdak.utils.JSONHelper;
import org.bc.web.ModelAndView;
import org.bc.web.Module;
import org.bc.web.ThreadSession;
import org.bc.web.WebMethod;

import com.youwei.fjb.FjbConstant;
import com.youwei.fjb.entity.Estate;
import com.youwei.fjb.entity.House;
import com.youwei.fjb.entity.HouseImage;
import com.youwei.fjb.entity.HuXing;
import com.youwei.fjb.entity.HouseOrder;
import com.youwei.fjb.entity.OrderGenJin;
import com.youwei.fjb.entity.User;
import com.youwei.fjb.util.ConfigHelper;
import com.youwei.fjb.util.DataHelper;
import com.youwei.fjb.util.VerifyCodeHelper;

@Module(name="/admin/order")
public class OrderService {

	CommonDaoService dao = TransactionalServiceHelper.getTransactionalService(CommonDaoService.class);
	
	@WebMethod
	public ModelAndView list(){
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	@WebMethod
	public ModelAndView add(){
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	@WebMethod
	public ModelAndView edit(Integer id){
		ModelAndView mv = new ModelAndView();
		HouseOrder po = dao.get(HouseOrder.class, id);
		if(po.sellerId!=null){
			User seller = dao.get(User.class, po.sellerId);
			mv.jspData.put("sellerTel", seller.tel);
		}
		Estate estate = dao.get(Estate.class, po.estateId);
		House house = dao.get(House.class, po.hid);
		mv.jspData.put("order", po);
		mv.jspData.put("estate", estate);
		mv.jspData.put("house", house);
		List<String> statusList = new ArrayList<String>();
		statusList.add(FjbConstant.HouseOrderAccepted);
		statusList.add(FjbConstant.HouseOrderDaiKan);
		statusList.add(FjbConstant.HouseOrderNotAccept);
		statusList.add(FjbConstant.HouseOrderDeal);
		statusList.add(FjbConstant.HouseOrderCancel);
		mv.jspData.put("statusList",statusList);
		
		List<OrderGenJin> genjiList = dao.listByParams(OrderGenJin.class, "from OrderGenJin where orderId=?", id);
		mv.jspData.put("genjiList", genjiList);
		return mv;
	}
	
	@WebMethod
	public ModelAndView update(HouseOrder order){
		ModelAndView mv = new ModelAndView();
		HouseOrder po = dao.get(HouseOrder.class, order.id);
		po.status = order.status;
		dao.saveOrUpdate(po);
		return mv;
	}
	
	@WebMethod
	public ModelAndView doSave(HouseOrder order , String yzm){
		VerifyCodeHelper.verify(yzm);
		User seller = (User)ThreadSession.getHttpSession().getAttribute("user");
		order.status = FjbConstant.HouseOrderNotAccept;
		if(seller!=null){
			order.sellerId = seller.id;
			order.sellerName = seller.name;
		}
		ModelAndView mv = new ModelAndView();
		order.addtime = new Date();
		dao.saveOrUpdate(order);
		return mv;
	}
	
	@WebMethod
	public ModelAndView fankui(OrderGenJin genjin){
		ModelAndView mv = new ModelAndView();
		genjin.addtime = new Date();
		dao.saveOrUpdate(genjin);
		mv.data.put("genjin", JSONHelper.toJSON(genjin , DataHelper.sdf3.toPattern()));
		return mv;
	}
	
	@WebMethod
	public ModelAndView accept(Integer id){
		ModelAndView mv = new ModelAndView();
		HouseOrder po = dao.get(HouseOrder.class, id);
		po.status = FjbConstant.HouseOrderAccepted;
		return mv;
	}
	
	@WebMethod
	public ModelAndView deal(Integer id){
		ModelAndView mv = new ModelAndView();
		HouseOrder po = dao.get(HouseOrder.class, id);
		po.status = FjbConstant.HouseOrderDeal;
		return mv;
	}
	
	@WebMethod
	public ModelAndView delete(Integer id){
		ModelAndView mv = new ModelAndView();
		HouseOrder po = dao.get(HouseOrder.class, id);
		if(po!=null){
			dao.delete(po);
		}
		return mv;
	}
	
	@WebMethod
	public ModelAndView listHouseData(Page<Map> page , OrderQuery query){
		ModelAndView mv = new ModelAndView();
		StringBuilder hql = new StringBuilder("select  order.id as id, est.name as estateName, house.dhao as dhao , house.unit as unit,house.fhao as fhao"
				+ ",order.sellerName as sellerName ,  order.buyerName as buyerName ,order.buyerTel as buyerTel ,order.addtime as addtime, order.status as status from HouseOrder order, "
				+ "Estate est,House house where order.estateId=est.id and order.hid=house.id ");
		List<Object> params = new ArrayList<Object>();
		setQuery(hql, params , query);
		page = dao.findPage(page, hql.toString(), true,params.toArray());
		mv.data.put("page", JSONHelper.toJSON(page , DataHelper.dateSdf.toPattern()));
		return mv;
	}
	
	@WebMethod
	public ModelAndView listEstateData(Page<Map> page ,OrderQuery query){
		ModelAndView mv = new ModelAndView();
		StringBuilder hql = new StringBuilder("select  order.id as id, est.name as estateName, order.buyerName as buyerName ,order.buyerTel as buyerTel,"
				+ " order.sellerName as sellerName , order.addtime as addtime, order.status as status from HouseOrder order, "
				+ "Estate est where order.estateId=est.id and order.hid is null");
		List<Object> params = new ArrayList<Object>();
		setQuery(hql, params , query);
		page = dao.findPage(page, hql.toString(), true,params.toArray());
		mv.data.put("page", JSONHelper.toJSON(page , DataHelper.dateSdf.toPattern()));
		return mv;
	}
	
	private void setQuery(StringBuilder hql , List<Object> params ,OrderQuery query){
		if(query.estateId!=null){
			hql.append(" and estateId=?");
			params.add(query.estateId);
		}
		if(query.sellerId!=null){
			hql.append(" and order.sellerId=?");
			params.add(query.sellerId);
		}
		if(StringUtils.isNotEmpty(query.buyerName)){
			hql.append(" and order.buyerName like ?");
			params.add("%"+query.buyerName+"%");
		}
		if(StringUtils.isNotEmpty(query.buyerTel)){
			hql.append(" and order.buyerTel like ?");
			params.add("%"+query.buyerTel+"%");
		}
		if(StringUtils.isNotEmpty(query.estateName)){
			hql.append(" and est.name like ?");
			params.add("%"+query.estateName+"%");
		}
		if(StringUtils.isNotEmpty(query.sellerName)){
			hql.append(" and order.sellerName like ?");
			params.add("%"+query.sellerName+"%");
		}
	}
}
