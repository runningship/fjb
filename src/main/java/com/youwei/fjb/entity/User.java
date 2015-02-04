package com.youwei.fjb.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="fjb_user")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer id;
	
	public String name;
	
	public String account;
	
	public String pwd;
	
	public String tel;
	
	public String compName;
	
	public Date addtime;
	
	public Date lasttime;
	
	//seller(经纪人),admin(房金宝用户)
	public String type;
	
	public String email;
	
	//是否通过审核
	public int valid;
	
	//意向
	public Float intentPrice;
	
	public String city;
	
	public String activeCode;
}
