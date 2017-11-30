package com.plz.jun.movie.model;

public class MovieVO {

	private int movieno;
	private String moviename;
	private String releasedate;
	private double gradesum;
	private int moviestatus;	//0:상영예정/1:상영중/2:상영종료
	private int fk_ratingno;
	
	private MovieDetailVO mdvo;

	public MovieVO(){}
	
	public MovieVO(int movieno, String moviename, String releasedate, double gradesum, int moviestatus, int fk_ratingno,
			MovieDetailVO mdvo) {
		super();
		this.movieno = movieno;
		this.moviename = moviename;
		this.releasedate = releasedate;
		this.gradesum = gradesum;
		this.moviestatus = moviestatus;
		this.fk_ratingno = fk_ratingno;
		this.mdvo = mdvo;
	}

	public int getMovieno() {
		return movieno;
	}

	public void setMovieno(int movieno) {
		this.movieno = movieno;
	}

	public String getMoviename() {
		return moviename;
	}

	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}

	public String getReleasedate() {
		return releasedate;
	}

	public void setReleasedate(String releasedate) {
		this.releasedate = releasedate;
	}

	public double getGradesum() {
		return gradesum;
	}

	public void setGradesum(int gradesum) {
		this.gradesum = gradesum;
	}

	public int getMoviestatus() {
		return moviestatus;
	}

	public void setMoviestatus(int moviestatus) {
		this.moviestatus = moviestatus;
	}

	public int getFk_ratingno() {
		return fk_ratingno;
	}

	public void setFk_ratingno(int fk_ratingno) {
		this.fk_ratingno = fk_ratingno;
	}

	public MovieDetailVO getMdvo() {
		return mdvo;
	}

	public void setMdvo(MovieDetailVO mdvo) {
		this.mdvo = mdvo;
	}
	
	
	
}
