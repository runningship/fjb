package com.youwei.fjb.admin;

import java.util.ArrayList;
import java.util.List;

import org.bc.sdak.CommonDaoService;
import org.bc.sdak.Page;
import org.bc.sdak.TransactionalServiceHelper;
import org.bc.sdak.utils.JSONHelper;
import org.bc.web.ModelAndView;
import org.bc.web.Module;
import org.bc.web.WebMethod;

import com.youwei.fjb.entity.House;
import com.youwei.fjb.util.ConfigHelper;
import com.youwei.fjb.util.DataHelper;

@Module(name="/admin/house")
public class HouseService {

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
		return mv;
	}
	
	@WebMethod
	public ModelAndView edit(Integer id){
		ModelAndView mv = new ModelAndView();
		House po = dao.get(House.class, id);
		mv = ConfigHelper.queryItems(mv);
		mv.jspData.put("house", po);
		return mv;
	}
	
	@WebMethod
	public ModelAndView update(House house){
		ModelAndView mv = new ModelAndView();
		House po = dao.get(House.class, house.id);
		dao.saveOrUpdate(po);
		return mv;
	}
	
	@WebMethod
	public ModelAndView doSave(House house){
		ModelAndView mv = new ModelAndView();
		dao.saveOrUpdate(house);
		return mv;
	}
	
	@WebMethod
	public ModelAndView listData(Page<House> page){
		ModelAndView mv = new ModelAndView();
		List<String> params = new ArrayList<String>();
		page = dao.findPage(page, "from House", params.toArray());
		mv.data.put("page", JSONHelper.toJSON(page , DataHelper.dateSdf.toPattern()));
		return mv;
	}
}
