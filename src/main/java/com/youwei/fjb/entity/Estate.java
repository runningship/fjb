package com.youwei.fjb.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Estate {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer id;
	
	public String quyu;
	
	public String name;
	
	public String tel;
	
	public String addr;
	
	public Date opentime;
	
	//建筑类型，楼型
	public String lxing;
	
	public String zxiu;
	
	//均价,房金宝的价格
	public Float junjia;
	//物业类型
	public String wylx;
	
	//建筑面积
	public Float jzmj;
	
	//规划面积
	public Float ghmj;
	
	//容积率
	public Float rongji;
	
	//绿化率
	public Float lvhua;
	
	public Integer chewei;
	
	//户数
	public Integer hushu;
	
	//物业费
	public String wyfee;
	
	public String tese;
	
	//开发商
	public String developer;
	
	//物业公司
	public String wyComp;
	
	//可预约数量
	public Integer unSold;
	
	//总价
	public Float totalPrice;
	
//	public Float yongjin;
	
	//特惠价
	public Float tejia;
	
	//预付
	public Integer yufu;
	
	//实抵
	public Integer shidi;
	
	public Date youhuiEndtime;
	
	//是否推荐
	public Integer tuijian;
	
	//住图片
	public String img;
	
	//1限时特惠
	public Integer tehui;
	
	public String uuid;
	
	public Float jingdu;
	
	public Float weidu;
	
	public String city;
	
	public String province;
	
	//即将推出，文字性描述 
	public String jjtc;
}
