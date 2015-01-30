package com.youwei.fjb.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class House {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer id;
	
	public Integer estateId;
	
	public String dhao;
	
	public Integer unit;
	
	public String fhao;
	
	public Float mji;
	
	public String hxing;
	
	public Integer djia;
	
	public String zkou;
	
	//折后总价
	public Float totalPrice;
	
	public String cxiang;
	
	public String zxiu;
	
}
