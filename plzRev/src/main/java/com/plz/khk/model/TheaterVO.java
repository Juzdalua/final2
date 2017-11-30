package com.plz.khk.model;

public class TheaterVO {

	private int theaterno;				// 극장번호
	private int fk_regionno;			// 지역번호
	private String theaterlocation;		// 극장위치
	private String theatername;			// 극장이름
	private String theaterintro;		// 극장소개
	private int theaterscreeno;			// 관갯수
	private int theaterlatitude;		// 극장위치위도
	private int theaterlongitude;		// 극장위치경도
	
	public TheaterVO() { }
	public TheaterVO(int theaterno, int fk_regionno, String theaterlocation, String theatername, String theaterintro,
			int theaterscreeno, int theaterlatitude, int theaterlongitude) {
	
		this.theaterno = theaterno;
		this.fk_regionno = fk_regionno;
		this.theaterlocation = theaterlocation;
		this.theatername = theatername;
		this.theaterintro = theaterintro;
		this.theaterscreeno = theaterscreeno;
		this.theaterlatitude = theaterlatitude;
		this.theaterlongitude = theaterlongitude;
	}
	public int getTheaterno() {
		return theaterno;
	}
	
	public void setTheaterno(int theaterno) {
		this.theaterno = theaterno;
	}
	
	public int getFk_regionno() {
		return fk_regionno;
	}
	
	public void setFk_regionno(int fk_regionno) {
		this.fk_regionno = fk_regionno;
	}
	
	public String getTheaterlocation() {
		return theaterlocation;
	}
	
	public void setTheaterlocation(String theaterlocation) {
		this.theaterlocation = theaterlocation;
	}
	
	public String getTheatername() {
		return theatername;
	}
	
	public void setTheatername(String theatername) {
		this.theatername = theatername;
	}
	
	public String getTheaterintro() {
		return theaterintro;
	}
	
	public void setTheaterintro(String theaterintro) {
		this.theaterintro = theaterintro;
	}
	
	public int getTheaterscreeno() {
		return theaterscreeno;
	}
	
	public void setTheaterscreeno(int theaterscreeno) {
		this.theaterscreeno = theaterscreeno;
	}
	
	public int getTheaterlatitude() {
		return theaterlatitude;
	}
	
	public void setTheaterlatitude(int theaterlatitude) {
		this.theaterlatitude = theaterlatitude;
	}
	
	public int getTheaterlongitude() {
		return theaterlongitude;
	}
	
	public void setTheaterlongitude(int theaterlongitude) {
		this.theaterlongitude = theaterlongitude;
	}
	
	
	
}
