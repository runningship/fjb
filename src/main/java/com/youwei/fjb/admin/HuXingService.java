package com.youwei.fjb.admin;

import java.util.ArrayList;
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
import org.bc.web.WebMethod;

import com.youwei.fjb.entity.Estate;
import com.youwei.fjb.entity.House;
import com.youwei.fjb.entity.HouseImage;
import com.youwei.fjb.entity.HuXing;
import com.youwei.fjb.util.ConfigHelper;
import com.youwei.fjb.util.DataHelper;

@Module(name="/admin/huxing")
public class HuXingService {

	CommonDaoService dao = TransactionalServiceHelper.getTransactionalService(CommonDaoService.class);
	
	@WebMethod
	public ModelAndView list(){
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	@WebMethod
	public ModelAndView add(Integer estateId){
		ModelAndView mv = new ModelAndView();
		mv = ConfigHelper.queryItems(mv);
		mv.jspData.put("estateId", estateId);
		mv.jspData.put("uuid", UUID.randomUUID().toString());
		return mv;
	}
	
	@WebMethod
	public ModelAndView edit(Integer id){
		ModelAndView mv = new ModelAndView();
		HuXing po = dao.get(HuXing.class, id);
		Estate estate = dao.get(Estate.class, po.estateId);
//		mv = ConfigHelper.queryItems(mv);
//		List<HouseImage> images = dao.listByParams(HouseImage.class, "from HouseImage where type='hxing' and estateUUID=?", estate.uuid);
		mv.jspData.put("huxing", po);
		mv.jspData.put("estate", estate);
//		mv.jspData.put("images", images);
		return mv;
	}
	
	@WebMethod
	public ModelAndView update(HuXing huxing){
		ModelAndView mv = new ModelAndView();
		HuXing po = dao.get(HuXing.class, huxing.id);
		if(po!=null){
			po.name = huxing.name;
			po.conts = huxing.conts;
			dao.saveOrUpdate(po);
		}
		
		return mv;
	}
	
	@WebMethod
	public ModelAndView doSave(HuXing huxing){
		ModelAndView mv = new ModelAndView();
		dao.saveOrUpdate(huxing);
		return mv;
	}
	
	@WebMethod
	public ModelAndView listData(Page<Map> page , String estateId){
		ModelAndView mv = new ModelAndView();
		StringBuilder hql = new StringBuilder("select hx.id as id, hx.name as name , est.name as estateName from HuXing hx, Estate est where est.id=hx.estateId ");
		List<String> params = new ArrayList<String>();
		if(StringUtils.isNotEmpty(estateId)){
			params.add(estateId);
			hql.append(" and hx.estateId=?");
		}
		page = dao.findPage(page, hql.toString(), true , params.toArray());
		mv.data.put("page", JSONHelper.toJSON(page , DataHelper.dateSdf.toPattern()));
		return mv;
	}
}
