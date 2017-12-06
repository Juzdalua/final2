package com.plz.jhy_store.model;

public class EventVO {
	
	private int store_eventno;
	private int category;
	private int coupon_price;
	private String start_day;
	private String end_day;
	private int status;
	private String fk_name;
	private ImgVO imgvo;
	
	public EventVO(){
		
	}
	public EventVO(int store_eventno, int category, int coupon_price, String start_day, String end_day, int status,
			String fk_name, ImgVO imgvo) {
		
		this.store_eventno = store_eventno;
		this.category = category;
		this.coupon_price = coupon_price;
		this.start_day = start_day;
		this.end_day = end_day;
		this.status = status;
		this.fk_name = fk_name;
		this.imgvo = imgvo;
	}
	public int getStore_eventno() {
		return store_eventno;
	}
	public void setStore_eventno(int store_eventno) {
		this.store_eventno = store_eventno;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getCoupon_price() {
		return coupon_price;
	}
	public void setCoupon_price(int coupon_price) {
		this.coupon_price = coupon_price;
	}
	public String getStart_day() {
		return start_day;
	}
	public void setStart_day(String start_day) {
		this.start_day = start_day;
	}
	public String getEnd_day() {
		return end_day;
	}
	public void setEnd_day(String end_day) {
		this.end_day = end_day;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getFk_name() {
		return fk_name;
	}
	public void setFk_name(String fk_name) {
		this.fk_name = fk_name;
	}
	public ImgVO getImgvo() {
		return imgvo;
	}
	public void setImgvo(ImgVO imgvo) {
		this.imgvo = imgvo;
	}
	

}
