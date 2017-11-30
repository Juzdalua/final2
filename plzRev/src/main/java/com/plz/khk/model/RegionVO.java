package com.plz.khk.model;

public class RegionVO {

	private int regionno;			// 지역번호
	private String regionname;		// 지역이름
	
	public RegionVO() { }
	public RegionVO(int regionno, String regionname) {
	
		this.regionno = regionno;
		this.regionname = regionname;
	}

	public int getRegionno() {
		return regionno;
	}

	public void setRegionno(int regionno) {
		this.regionno = regionno;
	}

	public String getRegionname() {
		return regionname;
	}

	public void setRegionname(String regionname) {
		this.regionname = regionname;
	}
	
	
	
}
