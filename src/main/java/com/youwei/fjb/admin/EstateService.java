package com.youwei.fjb.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.bc.sdak.CommonDaoService;
import org.bc.sdak.Page;
import org.bc.sdak.TransactionalServiceHelper;
import org.bc.sdak.utils.JSONHelper;
import org.bc.web.ModelAndView;
import org.bc.web.Module;
import org.bc.web.WebMethod;

import com.youwei.fjb.entity.Estate;
import com.youwei.fjb.entity.HouseImage;
import com.youwei.fjb.util.ConfigHelper;
import com.youwei.fjb.util.DataHelper;

@Module(name="/admin/estate")
public class EstateService {

	CommonDaoService dao = TransactionalServiceHelper.getTransactionalService(CommonDaoService.class);
	
	@WebMethod
	public ModelAndView list(){
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	@WebMethod
	public ModelAndView add(){
		ModelAndView mv = new ModelAndView();
		mv = ConfigHelper.queryItems(mv);
		mv.jspData.put("estate_uuid", UUID.randomUUID().toString());
		return mv;
	}
	
	@WebMethod
	public ModelAndView edit(Integer id){
		ModelAndView mv = new ModelAndView();
		Estate po = dao.get(Estate.class, id);
		mv = ConfigHelper.queryItems(mv);
		mv.jspData.put("estate", po);
		return mv;
	}
	
	@WebMethod
	public ModelAndView update(Estate estate){
		ModelAndView mv = new ModelAndView();
		Estate po = dao.get(Estate.class, estate.id);
		po.quyu = estate.quyu;
		po.name = estate.name;
		dao.saveOrUpdate(estate);
		return mv;
	}
	
	@WebMethod
	public ModelAndView doSave(Estate estate){
		ModelAndView mv = new ModelAndView();
		dao.saveOrUpdate(estate);
		return mv;
	}
	
	@WebMethod
	public ModelAndView listData(Page<Estate> page){
		ModelAndView mv = new ModelAndView();
		List<String> params = new ArrayList<String>();
		page = dao.findPage(page, "from Estate", params.toArray());
		mv.data.put("page", JSONHelper.toJSON(page , DataHelper.dateSdf.toPattern()));
		return mv;
	}
	
	@WebMethod
	public ModelAndView listImage(String estateUUID , String imgType){
		ModelAndView mv = new ModelAndView();
		List<HouseImage> images = dao.listByParams(HouseImage.class, "from HouseImage where estateUUID=? and type=?", estateUUID , imgType);
		mv.data.put("images", JSONHelper.toJSONArray(images));
		return mv;
	}
	
	@WebMethod
	public ModelAndView deleteImage(Integer id){
		ModelAndView mv = new ModelAndView();
		HouseImage po = dao.get(HouseImage.class, id);
		if(po!=null){
			dao.delete(po);
		}
		return mv;
	}
}
