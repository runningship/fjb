package com.youwei.fjb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bc.sdak.CommonDaoService;
import org.bc.sdak.Page;
import org.bc.sdak.TransactionalServiceHelper;
import org.bc.sdak.utils.JSONHelper;
import org.bc.web.ModelAndView;
import org.bc.web.Module;
import org.bc.web.ThreadSession;
import org.bc.web.WebMethod;

import com.youwei.fjb.entity.Config;
import com.youwei.fjb.entity.Estate;
import com.youwei.fjb.entity.House;
import com.youwei.fjb.entity.HouseImage;
import com.youwei.fjb.entity.HouseOrder;
import com.youwei.fjb.entity.OrderGenJin;
import com.youwei.fjb.entity.User;
import com.youwei.fjb.util.ConfigHelper;

@Module(name="/")
public class PageService {

	CommonDaoService dao = TransactionalServiceHelper.getTransactionalService(CommonDaoService.class);
	
	@WebMethod
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView();
		mv = tehui(mv);
		//推荐楼盘
		Page<Map> page = new Page<Map>();
		page.setPageSize(9);
		page = dao.findPage(page, "select est.id as id, est.name as name , est.quyu as quyu ,est.junjia as junjia , "
				+ "img.path as img from Estate est,HouseImage img"
				+ " where est.uuid=img.estateUUID and est.tuijian=1 and img.type='main'", true,new Object[]{});
//		for(Map map : page.getResult()){
//		}
//		List<Map> tuijianList = new ArrayList<Map>();
//		for(int i=0;i<6;i++){
//			Map map = new HashMap();
//			map.put("name", "国贸天琴湾");
//			map.put("quyu", "瑶海区");
//			map.put("junjia", "7500");
//			map.put("youhui", "3000抵5万");
//			map.put("img", "images/p1.png");
//			tuijianList.add(map);
//		}
		mv.jspData.put("tuijianList", page.getResult());
		
		mv.jspData.put("currNav", "index");
		return mv;
	}
	
	private ModelAndView tehui(ModelAndView mv){
		//限时特惠
		Page<Map> page = new Page<Map>();
		page.setPageSize(6);
		page = dao.findPage(page, "select est.id as id, est.name as name , est.quyu as quyu ,est.tejia as tejia , est.junjia as junjia , "
				+ " est.opentime as opendate, est.youhuiEndtime as youhuiEndtime, img.path as img from Estate est,"
				+ "HouseImage img where est.uuid=img.estateUUID and est.tehui=1 and img.type='main'", true,new Object[]{});
		List<Map> youhuiList = new ArrayList<Map>();
		for(int i=0;i<6;i++){
			Map map = new HashMap();
			map.put("name", "滨湖万科城");
			map.put("quyu", "滨湖区");
			map.put("junjia", "6500");
			map.put("youhuijia", "6300");
			map.put("img", "images/p1.png");
			youhuiList.add(map);
		}
		mv.jspData.put("youhuiList", page.getResult());
		return mv;
	}
	
	@WebMethod
	public ModelAndView sale(Page<Map> page){
		ModelAndView mv = new ModelAndView();
		mv = ConfigHelper.queryItems(mv);
		mv = tehui(mv);
		mv.jspData.put("currNav", "sale");
		page.setPageSize(3);
		page = dao.findPage(page, "select est.id as id, est.name as name , est.quyu as quyu ,est.tejia as tejia , est.junjia as junjia , "
				+ " est.opentime as opendate, est.youhuiEndtime as youhuiEndtime, img.path as img from Estate est,"
				+ "HouseImage img where est.uuid=img.estateUUID and est.tehui=1 and img.type='main'", true,new Object[]{});
		mv.jspData.put("page", page);
//		//已经成交
//		long dealCount = dao.countHql("select count(*) from House house, Estate est where house.estateId=est.id and est.tehui=1 and house.hasSold=1");
//		mv.jspData.put("dealCount", dealCount);
		return mv;
	}
	
	@WebMethod
	public ModelAndView yykf(String estateId , Integer hid){
		ModelAndView mv = new ModelAndView();
//		User seller = (User)ThreadSession.getHttpSession().getAttribute("user");
		House house = dao.get(House.class, hid);
		if(house!=null){
			mv.jspData.put("house" , house);
		}
		mv.jspData.put("estateId" , estateId);
		return  mv;
	}
	
	@WebMethod
	public ModelAndView setCity(String city){
		ModelAndView mv = new ModelAndView();
		ThreadSession.getHttpSession().setAttribute(FjbConstant.Session_Attr_City, city);
		return  mv;
	}
	
	@WebMethod
	public ModelAndView houses(Page<Map> page){
		ModelAndView mv = new ModelAndView();
		mv = ConfigHelper.queryItems(mv);
		mv = tehui(mv);
		mv.jspData.put("currNav", "houses");
		page.setPageSize(3);
		page = dao.findPage(page, "select est.id as id, est.name as name , est.quyu as quyu ,est.tejia as tejia , est.junjia as junjia , "
				+ "  est.opentime as opendate, est.youhuiEndtime as youhuiEndtime, img.path as img from Estate est,"
				+ "HouseImage img where est.uuid=img.estateUUID and img.type='main'", true,new Object[]{});
		mv.jspData.put("page", page);
		return mv;
	}
	
	@WebMethod
	public ModelAndView sellerIndex(){
		ModelAndView mv = new ModelAndView();
		User seller = ThreadSessionHelper.getUser();
		mv.jspData.put("seller", seller);
		return mv;
	}
	
	@WebMethod
	public ModelAndView houseMap(){
		ModelAndView mv = new ModelAndView();
		List<Map> list = dao.listAsMap("select name as name, jingdu as jingdu , weidu as weidu from Estate where 1=1");
		mv.jspData.put("houses", list);
		return mv;
	}
	
	@WebMethod
	public ModelAndView info(Integer estateId){
		ModelAndView mv = new ModelAndView();
		Estate po = dao.get(Estate.class, estateId);
		mv.jspData.put("estate", po);
		//户型图
		List<HouseImage> images = dao.listByParams(HouseImage.class, "from HouseImage where estateUUID=?", po.uuid);
		for(HouseImage img : images){
			if(FjbConstant.HuXing.equals(img.type)){
				mv.jspData.put("huxing_img", img.path);
			}else if(FjbConstant.XiaoGuo.equals(img.type)){
				mv.jspData.put("xiaoguo_img", img.path);
			}else if(FjbConstant.ShiJing.equals(img.type)){
				mv.jspData.put("shijing_img", img.path);
			}else if(FjbConstant.GuiHua.equals(img.type)){
				mv.jspData.put("guihua_img", img.path);
			}else if(FjbConstant.Main.equals(img.type)){
				mv.jspData.put("main_img", img.path);
			}
		}
		//在线剩余套数
		long leftCount = dao.countHql("select count(*) from House where estateId=? and hasSold=0", estateId);
		mv.jspData.put("leftCount", leftCount);
		return mv;
	}
	
	@WebMethod
	public ModelAndView buyer(Page<Map> page){
		ModelAndView mv = new ModelAndView();
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
	
	@WebMethod
	public ModelAndView picList(Integer estateId){
		ModelAndView mv = new ModelAndView();
		Estate estate = dao.get(Estate.class, estateId);
		List<Map> fenleiList = dao.listAsMap("select type as name ,count(*) as total from HouseImage where estateUUID=? group by type", estate.uuid);
		int all = 0;
		for(Map map : fenleiList){
			Long total = (Long)map.get("total");
			all+=total;
		}
		List<HouseImage> images = dao.listByParams(HouseImage.class, "from HouseImage where estateUUID=?", estate.uuid);
		mv.jspData.put("estate", estate);
		mv.jspData.put("fenleiList", fenleiList);
		mv.jspData.put("images", images);
		mv.jspData.put("all", all);
		return mv;
	}
	@WebMethod
	public ModelAndView logout(){
		ModelAndView mv = new ModelAndView();
		ThreadSession.getHttpSession().removeAttribute("user");
		mv.redirect="./index.jsp";
		return mv;
	}
}
