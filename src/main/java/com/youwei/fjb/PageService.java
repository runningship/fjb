package com.youwei.fjb;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.bc.sdak.CommonDaoService;
import org.bc.sdak.Page;
import org.bc.sdak.TransactionalServiceHelper;
import org.bc.web.ModelAndView;
import org.bc.web.Module;
import org.bc.web.WebMethod;

import com.youwei.fjb.entity.Config;
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
		page = dao.findPage(page, "select est.id as id, est.name as name , est.quyu as quyu ,est.junjia as junjia , est.youhui as youhui, "
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
		mv.jspData.put("youhuiList", youhuiList);
		return mv;
	}
	
	@WebMethod
	public ModelAndView sale(Page<Map> page){
		ModelAndView mv = new ModelAndView();
		mv = ConfigHelper.queryItems(mv);
		mv = tehui(mv);
		mv.jspData.put("currNav", "sale");
		page.setPageSize(3);
		page = dao.findPage(page, "select est.id as id, est.name as name , est.quyu as quyu ,est.sjia as sjia , est.junjia as junjia , "
				+ "est.youhui as youhui, est.opentime as opendate, est.youhuiEnd as youhuiEnd, img.path as img from Estate est,"
				+ "HouseImage img where est.uuid=img.estateUUID and est.tehui=1 and img.type='main'", true,new Object[]{});
//		List<Map> youhuiList = new ArrayList<Map>();
//		for(int i=0;i<6;i++){
//			Map map = new HashMap();
//			map.put("name", "合肥世茂翡翠首府");
//			map.put("quyu", "经开区");
//			map.put("sjia", "7900");
//			map.put("junjia", "7500");
//			map.put("youhui", "6000享2万");
//			map.put("opendate", "2015年06月");
//			map.put("img", "images/tuPic.jpg");
//			map.put("chengjiao", "12");
//			map.put("youhuiEnd", System.currentTimeMillis()+1000*3600*24*3);
//			youhuiList.add(map);
//		}
		
		mv.jspData.put("page", page);
		return mv;
	}
	
	@WebMethod
	public ModelAndView yykf(){
		ModelAndView mv = new ModelAndView();
		mv.jspData.put("dhao", "1");
		mv.jspData.put("unit", "A");
		mv.jspData.put("fhao", "302");
		return  mv;
	}
	
	@WebMethod
	public ModelAndView houses(Page<Map> page){
		ModelAndView mv = new ModelAndView();
		mv = ConfigHelper.queryItems(mv);
		mv = tehui(mv);
		mv.jspData.put("currNav", "houses");
		page.setPageSize(3);
		page = dao.findPage(page, "select est.id as id, est.name as name , est.quyu as quyu ,est.sjia as sjia , est.junjia as junjia , "
				+ "est.youhui as youhui, est.opentime as opendate, est.youhuiEnd as youhuiEnd, img.path as img from Estate est,"
				+ "HouseImage img where est.uuid=img.estateUUID and img.type='main'", true,new Object[]{});
		mv.jspData.put("page", page);
		return mv;
	}
	
	
}
