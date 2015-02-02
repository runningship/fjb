package com.youwei.fjb.util;

import java.util.List;

import org.bc.sdak.SimpDaoTool;
import org.bc.web.ModelAndView;

import com.youwei.fjb.entity.Config;
import com.youwei.fjb.entity.HuXing;

public class ConfigHelper {

	public static ModelAndView queryItems(ModelAndView mv){
		//查询条件
		List<Config> quyus = SimpDaoTool.getGlobalCommonDaoService().listByParams(Config.class, "from Config where type=? and attr='合肥' ","quyu");
		
		List<Config> lxings = SimpDaoTool.getGlobalCommonDaoService().listByParams(Config.class, "from Config where type=?","lxing");
		List<Config> zxius = SimpDaoTool.getGlobalCommonDaoService().listByParams(Config.class, "from Config where type=?","zxiu");
		mv.jspData.put("quyus", quyus);
//		mv.jspData.put("hxings", hxings);
		mv.jspData.put("lxings", lxings);
		mv.jspData.put("zxius", zxius);
		return  mv;
	}
}
