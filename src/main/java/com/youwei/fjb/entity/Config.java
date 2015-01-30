package com.youwei.fjb.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Config {

	@Id
	public Integer id;
	
	public String type;
	
	public String attr;
	
	public String value;
}
