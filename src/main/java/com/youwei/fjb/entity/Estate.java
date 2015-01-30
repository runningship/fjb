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
	
	public String lxing;
	
	public String zxiu;
	
	//均价,房金宝的价格
	public Float junjia;
	//物业类型
	public String wylx;
	
	//建筑面积
	public String jzmj;
	
	//规划面积
	public String ghmj;
	
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
	
	public Float yongjin;
	
	//市场价,指平方价格
	public Float sjia;
	
	//优惠方案
	public String youhui;
	
	public Date youhuiEnd;
	
	//是否推荐
	public Integer tuijian;
	
	public String img;
	
	//1限时特惠
	public Integer tehui;
}
