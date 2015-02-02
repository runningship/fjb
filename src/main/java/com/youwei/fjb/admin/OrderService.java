package com.youwei.fjb.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.bc.sdak.CommonDaoService;
import org.bc.sdak.Page;
import org.bc.sdak.TransactionalServiceHelper;
import org.bc.sdak.utils.JSONHelper;
import org.bc.web.ModelAndView;
import org.bc.web.Module;
import org.bc.web.WebMethod;

import com.youwei.fjb.entity.Estate;
import com.youwei.fjb.entity.House;
import com.youwei.fjb.entity.HouseImage;
import com.youwei.fjb.entity.HuXing;
import com.youwei.fjb.entity.HouseOrder;
import com.youwei.fjb.util.ConfigHelper;
import com.youwei.fjb.util.DataHelper;

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
		HuXing po = dao.get(HuXing.class, id);
		Estate estate = dao.get(Estate.class, po.estateId);
		mv = ConfigHelper.queryItems(mv);
		List<HouseImage> images = dao.listByParams(HouseImage.class, "from HouseImage where type='hxing' and estateUUID=?", estate.uuid);
		mv.jspData.put("huxing", po);
		mv.jspData.put("images", images);
		return mv;
	}
	
	@WebMethod
	public ModelAndView update(HouseOrder order){
		ModelAndView mv = new ModelAndView();
		House po = dao.get(House.class, order.id);
		dao.saveOrUpdate(po);
		return mv;
	}
	
	@WebMethod
	public ModelAndView doSave(HouseOrder order){
		ModelAndView mv = new ModelAndView();
		dao.saveOrUpdate(order);
		return mv;
	}
	
	@WebMethod
	public ModelAndView listData(Page<House> page , String estateId){
		ModelAndView mv = new ModelAndView();
		StringBuilder hql = new StringBuilder("select  order.id as id, est.name as estateName, house.dhao as dhao , house.unit as unit,house.fhao as fhao"
				+ ", order.buyerName as buyerName ,order.buyerTel as buyerTel ,order.addtime as addtime, order.status as staus from HouseOrder order, "
				+ "Estate est,House house where order.estateId=est.id and order.hid=house.id");
		List<String> params = new ArrayList<String>();
		if(StringUtils.isNotEmpty(estateId)){
			params.add(estateId);
			hql.append(" and estateId=?");
		}
		page = dao.findPage(page, hql.toString(), params.toArray());
		mv.data.put("page", JSONHelper.toJSON(page , DataHelper.dateSdf.toPattern()));
		return mv;
	}
}
