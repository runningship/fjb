package com.youwei.fjb.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class HouseImage {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer id;
	
	public Integer estateId;
	
	// 效果图(2) | 实景图(14) | 规划图(6) | 户型样板间图 | 户型 等
	public String type;
	
	public String path;
}
