package com.plz.jhy_store.model;

public class ImgVO {
	
	private String name;
	private String img_main;
	private String img_detail;
	
	public ImgVO(String name, String img_main, String img_detail) {
		super();
		this.name = name;
		this.img_main = img_main;
		this.img_detail = img_detail;
	}
	
	public ImgVO(){
		
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg_main() {
		return img_main;
	}

	public void setImg_main(String img_main) {
		this.img_main = img_main;
	}

	public String getImg_detail() {
		return img_detail;
	}

	public void setImg_detail(String img_detail) {
		this.img_detail = img_detail;
	}
	
	
}
