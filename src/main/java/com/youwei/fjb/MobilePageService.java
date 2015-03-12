package com.youwei.fjb;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.bc.sdak.CommonDaoService;
import org.bc.sdak.Page;
import org.bc.sdak.TransactionalServiceHelper;
import org.bc.sdak.utils.JSONHelper;
import org.bc.web.ModelAndView;
import org.bc.web.Module;
import org.bc.web.ThreadSession;
import org.bc.web.WebMethod;

import com.youwei.fjb.admin.EstateQuery;
import com.youwei.fjb.admin.OrderQuery;
import com.youwei.fjb.entity.Estate;
import com.youwei.fjb.entity.House;
import com.youwei.fjb.entity.HouseImage;
import com.youwei.fjb.entity.HouseOrder;
import com.youwei.fjb.entity.OrderGenJin;
import com.youwei.fjb.entity.User;
import com.youwei.fjb.util.ConfigHelper;
import com.youwei.fjb.util.DataHelper;

@Module(name="/m/")
public class MobilePageService {

	CommonDaoService dao = TransactionalServiceHelper.getTransactionalService(CommonDaoService.class);
	
	@WebMethod
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView();
//		ThreadSession.getHttpSession().setAttribute(FjbConstant.Session_Attr_City, "合肥");
		long total = dao.countHql("select count(*) from Estate where city=?",ThreadSessionHelper.getCity() );
		mv.jspData.put("total", total);
		
		//最大优惠
		Page<Map> page2 = new Page<Map>();
		page2.setPageSize(1);
		page2 = dao.findPage(page2, "select (h.shidi-h.yufu) as youhui from Estate est, House h where h.estateId=est.id and est.city=? order by youhui desc", true , new Object[]{ThreadSessionHelper.getCity()});
		if(!page2.getResult().isEmpty()){
			mv.jspData.put("maxYouhui", page2.getResult().get(0).get("youhui"));
		}
		return mv;
	}
	
	@WebMethod
	public ModelAndView listIndexData(Page<Map> page){
		ModelAndView mv = new ModelAndView();
		List<String> params = new ArrayList<String>();
		page.setPageSize(10);
		page = dao.findPage(page, "select est.id as id, est.name as name , est.quyu as quyu , est.addr as addr, est.junjia as junjia , "
				+ "img.path as img , est.yufu as yufu , est.shidi as shidi from Estate est,HouseImage img"
				+ " where est.uuid=img.estateUUID and est.tuijian=1 and est.city=? and img.type='main'", true,new Object[]{ThreadSessionHelper.getCity()});
		mv.data.put("page", JSONHelper.toJSON(page , DataHelper.dateSdf.toPattern()));
		return mv;
	}
	
	
	@WebMethod
	public ModelAndView sales(Page<Map> page){
		ModelAndView mv = new ModelAndView();
		mv = ConfigHelper.queryItems(mv);
		
		for(Map map : page.getResult()){
			//预约数量
			long count = dao.countHql("select count(*) from HouseOrder where estateId=?", map.get("id"));
			map.put("orderCount", count);
		}
		return mv;
	}
	
	@WebMethod
	public ModelAndView listSalesData(Page<Map> page){
		ModelAndView mv = new ModelAndView();
		page.setPageSize(10);
		page = dao.findPage(page, "select est.id as id, est.name as name , est.quyu as quyu ,est.tejia as tejia , est.junjia as junjia , "
				+ " est.opentime as opendate, est.addr as addr ,est.youhuiEndtime as youhuiEndtime, img.path as img , est.yufu as yufu, est.shidi as shidi from Estate est,"
				+ "HouseImage img where est.uuid=img.estateUUID and est.tehui=1 and est.city=? and img.type='main'", true,new Object[]{ThreadSessionHelper.getCity()});
		mv.data.put("page", JSONHelper.toJSON(page , DataHelper.dateSdf.toPattern()));
		return mv;
	}
	
	
	@WebMethod
	public ModelAndView houses(Page<Map> page , EstateQuery query){
		ModelAndView mv = new ModelAndView();
		mv = ConfigHelper.queryItems(mv);
		mv.jspData.put("selectedQuyu", query.quyu);
		mv.jspData.put("selectedLxing",query.lxing);
		mv.jspData.put("searchText", query.searchText);
		mv.jspData.put("jiageStart", query.jiageStart);
		mv.jspData.put("jiageEnd", query.jiageEnd);
		return mv;
	}
	
	@WebMethod
	public ModelAndView listHousesData(Page<Map> page , EstateQuery query){
		ModelAndView mv = new ModelAndView();
		List<Object> params = new ArrayList<Object>();
		params.add(ThreadSessionHelper.getCity());
		page.setPageSize(10);
		StringBuilder hql = new StringBuilder("select est.id as id, est.name as name , est.quyu as quyu ,est.tejia as tejia , est.junjia as junjia , "
				+ "  est.opentime as opendate, est.addr as addr,  est.yufu as yufu, est.shidi as shidi , img.path as img from Estate est,"
				+ "HouseImage img where est.uuid=img.estateUUID and est.city=? and img.type='main'");
		if(StringUtils.isNotEmpty(query.quyu)){
			hql.append(" and est.quyu=?");
			params.add(query.quyu);
		}
		if(StringUtils.isNotEmpty(query.lxing)){
			hql.append(" and est.lxing like ?");
			params.add("%"+query.lxing+"%");
		}
		if(StringUtils.isNotEmpty(query.searchText)){
			hql.append(" and est.name like ?");
			params.add("%"+query.searchText+"%");
		}
		if(query.jiageStart!=null){
			hql.append(" and est.junjia>=?");
			params.add(query.jiageStart);
		}
		if(query.jiageEnd!=null){
			hql.append(" and est.junjia<=?");
			params.add(query.jiageEnd);
		}
		page = dao.findPage(page, hql.toString() , true, params.toArray());
		mv.data.put("page", JSONHelper.toJSON(page , DataHelper.dateSdf.toPattern()));
		return mv;
	}
	
	@WebMethod
	public ModelAndView info(Integer estateId){
		ModelAndView mv = new ModelAndView();
		Estate po = dao.get(Estate.class, estateId);
		mv.jspData.put("estate", po);
		
		HouseImage mainImg = dao.getUniqueByParams(HouseImage.class, new String[]{"estateUUID" ,"type"}, new Object[]{po.uuid , FjbConstant.Main});
		if(mainImg!=null){
			mv.jspData.put("main_img", mainImg.path);
		}
		//在线剩余套数
		long leftCount = dao.countHql("select count(*) from House where estateId=? and hasSold=0", estateId);
		mv.jspData.put("leftCount", leftCount);
		
		Page<Map> page = new Page<Map>();
		page.setPageSize(1);
		page = dao.findPage(page, "select totalPrice as totalPrice from House where estateId=? order by totalPrice desc", true, new Object[]{estateId});
		if(!page.getResult().isEmpty()){
			mv.jspData.put("minTotalPrice", page.getResult().get(0).get("totalPrice"));
		}
		return mv;
	}
	
	@WebMethod
	public ModelAndView houseMap(){
		ModelAndView mv = new ModelAndView();
		List<Map> list = dao.listAsMap("select name as name, jingdu as jingdu , weidu as weidu ,id as id from Estate where city=?",ThreadSessionHelper.getCity());
		mv.jspData.put("houses", list);
		return mv;
	}
	
	@WebMethod
	public ModelAndView user(){
		ModelAndView mv = new ModelAndView();
		User u = ThreadSessionHelper.getUser();
		mv.jspData.put("user", u);
		return mv;
	}
	
	@WebMethod
	public ModelAndView order(Integer estateId , Integer hid){
		ModelAndView mv = new ModelAndView();
		House house = dao.get(House.class, hid);
		if(house!=null){
			mv.jspData.put("house" , house);
		}
		Estate estate = dao.get(Estate.class, estateId);
		mv.jspData.put("estate" , estate);
		return  mv;
	}
	
	
	@WebMethod
	public ModelAndView listOrder(Page<Map> page , Integer sellerId){
		ModelAndView mv = new ModelAndView();
		StringBuilder hql = new StringBuilder("select  order.id as id, est.name as estateName, order.buyerName as buyerName ,order.buyerTel as buyerTel,"
				+ " order.sellerName as sellerName , order.addtime as addtime, order.status as status from HouseOrder order, "
				+ "Estate est where order.estateId=est.id and order.sellerId=?");
		List<Object> params = new ArrayList<Object>();
		params.add(sellerId);
		page.setPageSize(10);
		page = dao.findPage(page, hql.toString(), true,params.toArray());
		mv.data.put("page", JSONHelper.toJSON(page , DataHelper.dateSdf.toPattern()));
		return mv;
	}
	
	@WebMethod
	public ModelAndView xxfk(Page<Map> page , Integer orderId){
		ModelAndView mv = new ModelAndView();
		List<OrderGenJin> genjiList = dao.listByParams(OrderGenJin.class, "from OrderGenJin where orderId=?", orderId);
		mv.jspData.put("genjiList", genjiList);
		HouseOrder order = dao.get(HouseOrder.class, orderId);
		mv.jspData.put("order" , order);
		Estate estate = dao.get(Estate.class, order.estateId);
		House house = dao.get(House.class, order.hid);
		mv.jspData.put("estate", estate);
		mv.jspData.put("house", house);
		return mv;
	}
}
