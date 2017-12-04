package com.plz.khk.model;

public class TheaterVO {

	private int theaterno;				// 극장번호
	private int fk_regionno;			// 지역번호
	private String theaterlocation;		// 극장위치
	private String theatername;			// 극장이름
	private String theaterintro;		// 극장소개
	private int theaterscreenno;		// 관갯수
	private double theaterlatitude;		// 극장위치위도
	private double theaterlongitude;	// 극장위치경도
	
	
	public TheaterVO() { }

	public TheaterVO(int theaterno, int fk_regionno, String theaterlocation, String theatername, String theaterintro,
			int theaterscreenno, double theaterlatitude, double theaterlongitude) {
		super();
		this.theaterno = theaterno;
		this.fk_regionno = fk_regionno;
		this.theaterlocation = theaterlocation;
		this.theatername = theatername;
		this.theaterintro = theaterintro;
		this.theaterscreenno = theaterscreenno;
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

	public int getTheaterscreenno() {
		return theaterscreenno;
	}

	public void setTheaterscreenno(int theaterscreenno) {
		this.theaterscreenno = theaterscreenno;
	}

	public double getTheaterlatitude() {
		return theaterlatitude;
	}

	public void setTheaterlatitude(double theaterlatitude) {
		this.theaterlatitude = theaterlatitude;
	}

	public double getTheaterlongitude() {
		return theaterlongitude;
	}

	public void setTheaterlongitude(double theaterlongitude) {
		this.theaterlongitude = theaterlongitude;
	}

	
}