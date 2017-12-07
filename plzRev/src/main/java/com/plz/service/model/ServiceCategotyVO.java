package com.plz.service.model;

public class ServiceCategotyVO {

	private int categoryno;		/* 고객센터시퀀스       1- FAQ / 2- 공지사항 / 3- 1:1 문의 */
	private int categorycode;   /* 고객센터코드          0- 전체/1-영화관이용 / 2-회원 /  3-온라인 / 4-할인혜택 / 5-관람권 / 6-기프트샵 */
	
	public ServiceCategotyVO(){ }
	
	public ServiceCategotyVO(int categoryno, int categorycode) {
		super();
		this.categoryno = categoryno;
		this.categorycode = categorycode;
	}

	public int getCategoryno() {
		return categoryno;
	}

	public void setCategoryno(int categoryno) {
		this.categoryno = categoryno;
	}

	public int getCategorycode() {
		return categorycode;
	}

	public void setCategorycode(int categorycode) {
		this.categorycode = categorycode;
	}
	
	
}
