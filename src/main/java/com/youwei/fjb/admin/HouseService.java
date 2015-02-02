package com.youwei.fjb.admin;

import java.util.ArrayList;
import java.util.List;

import org.bc.sdak.CommonDaoService;
import org.bc.sdak.GException;
import org.bc.sdak.Page;
import org.bc.sdak.SimpDaoTool;
import org.bc.sdak.TransactionalServiceHelper;
import org.bc.sdak.utils.JSONHelper;
import org.bc.web.ModelAndView;
import org.bc.web.Module;
import org.bc.web.PlatformExceptionType;
import org.bc.web.WebMethod;

import com.youwei.fjb.entity.House;
import com.youwei.fjb.entity.HuXing;
import com.youwei.fjb.util.ConfigHelper;
import com.youwei.fjb.util.DataHelper;

@Module(name="/admin/house")
public class HouseService {

	CommonDaoService dao = TransactionalServiceHelper.getTransactionalService(CommonDaoService.class);
	
	@WebMethod
	public ModelAndView list(Integer estateId){
		ModelAndView mv = new ModelAndView();
		mv.jspData.put("estateId", estateId);
		return mv;
	}
	
	@WebMethod
	public ModelAndView add(Integer estateId){
		ModelAndView mv = new ModelAndView();
		mv = ConfigHelper.queryItems(mv);
		List<HuXing> hxings = SimpDaoTool.getGlobalCommonDaoService().listByParams(HuXing.class, "from HuXing where estateId=?",estateId);
		mv.jspData.put("hxings", hxings);
		mv.jspData.put("estateId", estateId);
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
	public ModelAndView doSave(House house , Integer fhaoStart , Integer fhaoEnd){
		ModelAndView mv = new ModelAndView();
		if(fhaoEnd==null){
			//检查栋号，单元，房间号
			House po = dao.getUniqueByParams(House.class, new String[]{"dhao" , "unit" , "fhao"}, new Object[]{house.dhao , house.unit , house.fhao});
			if(po!=null){
				throw new GException(PlatformExceptionType.BusinessException,"房源重复,请检查栋号，单元，房间号后提交");
			}
			dao.saveOrUpdate(house);
		}else{
			int count = 0;
			for(int i=fhaoStart;i<=fhaoEnd;i++){
				//检查栋号，单元，房间号
				House po = dao.getUniqueByParams(House.class, new String[]{"dhao" , "unit" , "fhao"}, new Object[]{house.dhao , house.unit , String.valueOf(i)});
				if(po==null){
					house.fhao = String.valueOf(i);
					house.id = null;
					dao.saveOrUpdate(house);
					count++;
				}
			}
			mv.data.put("result", "成功添加"+count+"套房源");
		}
		
		return mv;
	}
	
	@WebMethod
	public ModelAndView listData(Page<House> page , Integer estateId){
		ModelAndView mv = new ModelAndView();
		StringBuilder hql = new StringBuilder("from House where 1=1 ");
		List<Object> params = new ArrayList<Object>();
		if(estateId!=null){
			params.add(estateId);
			hql.append(" and estateId=?");
		}
		page = dao.findPage(page, hql.toString() , params.toArray());
		mv.data.put("page", JSONHelper.toJSON(page , DataHelper.dateSdf.toPattern()));
		return mv;
	}
}
