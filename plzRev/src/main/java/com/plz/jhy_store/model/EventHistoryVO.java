package com.plz.jhy_store.model;

public class EventHistoryVO {
	
	private int fk_store_eventno;
	private int status;
	private String buy_date;
	private String unable_date;
	private int discount_money;
	private int cnt;
	private String fk_email;
	public int getFk_store_eventno() {
		return fk_store_eventno;
	}
	public void setFk_store_eventno(int fk_store_eventno) {
		this.fk_store_eventno = fk_store_eventno;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}
	public String getUnable_date() {
		return unable_date;
	}
	public void setUnable_date(String unable_date) {
		this.unable_date = unable_date;
	}
	public int getDiscount_money() {
		return discount_money;
	}
	public void setDiscount_money(int discount_money) {
		this.discount_money = discount_money;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getFk_email() {
		return fk_email;
	}
	public void setFk_email(String fk_email) {
		this.fk_email = fk_email;
	}
	
	public EventHistoryVO(int fk_store_eventno, int status, String buy_date, String unable_date, int discount_money,
			int cnt, String fk_email) {
		
		this.fk_store_eventno = fk_store_eventno;
		this.status = status;
		this.buy_date = buy_date;
		this.unable_date = unable_date;
		this.discount_money = discount_money;
		this.cnt = cnt;
		this.fk_email = fk_email;
	}
	
	public EventHistoryVO(){
		
	}
	

}
