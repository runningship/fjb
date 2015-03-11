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
import org.bc.web.WebMethod;

import com.youwei.fjb.admin.EstateQuery;
import com.youwei.fjb.entity.Estate;
import com.youwei.fjb.util.ConfigHelper;
import com.youwei.fjb.util.DataHelper;

@Module(name="/m/")
public class MobilePageService {

	CommonDaoService dao = TransactionalServiceHelper.getTransactionalService(CommonDaoService.class);
	
	@WebMethod
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView();
		
		long total = dao.countHql("select count(*) from Estate where city=?","合肥" );
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
		page.setPageSize(2);
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
		
//		//已经成交
//		long dealCount = dao.countHql("select count(*) from House house, Estate est where house.estateId=est.id and est.tehui=1 and house.hasSold=1");
//		mv.jspData.put("dealCount", dealCount);
		
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
		page.setPageSize(2);
		page = dao.findPage(page, "select est.id as id, est.name as name , est.quyu as quyu ,est.tejia as tejia , est.junjia as junjia , "
				+ " est.opentime as opendate, est.youhuiEndtime as youhuiEndtime, img.path as img , est.yufu as yufu, est.shidi as shidi from Estate est,"
				+ "HouseImage img where est.uuid=img.estateUUID and est.tehui=1 and est.city=? and img.type='main'", true,new Object[]{ThreadSessionHelper.getCity()});
		mv.data.put("page", JSONHelper.toJSON(page));
		
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
		page.setPageSize(12);
		StringBuilder hql = new StringBuilder("select est.id as id, est.name as name , est.quyu as quyu ,est.tejia as tejia , est.junjia as junjia , "
				+ "  est.opentime as opendate, est.youhuiEndtime as youhuiEndtime, img.path as img from Estate est,"
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
		mv.jspData.put("page", page);
		return mv;
	}
	
	@WebMethod
	public ModelAndView info(Integer estateId){
		ModelAndView mv = new ModelAndView();
		Estate po = dao.get(Estate.class, estateId);
		mv.jspData.put("estate", po);
		return mv;
	}
}
