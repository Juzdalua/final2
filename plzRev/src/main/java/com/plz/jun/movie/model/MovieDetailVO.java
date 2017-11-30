package com.plz.jun.movie.model;

public class MovieDetailVO {
	
	private int fk_movieno;
	private int runtime;
	private String director;
	private String  actors;
	private String  summary;
	private int fk_genreno;
	private int fk_countryno;
	private int fk_companyno;
	private int fk_movietypeno;
	
	public MovieDetailVO(){}
	
	public MovieDetailVO(int fk_movieno, int runtime, String director, String actors, String summary, int fk_genreno,
			int fk_countryno, int fk_companyno, int fk_movietypeno) {
		super();
		this.fk_movieno = fk_movieno;
		this.runtime = runtime;
		this.director = director;
		this.actors = actors;
		this.summary = summary;
		this.fk_genreno = fk_genreno;
		this.fk_countryno = fk_countryno;
		this.fk_companyno = fk_companyno;
		this.fk_movietypeno = fk_movietypeno;
	}

	public int getFk_movieno() {
		return fk_movieno;
	}

	public void setFk_movieno(int fk_movieno) {
		this.fk_movieno = fk_movieno;
	}

	public int getRuntime() {
		return runtime;
	}

	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActors() {
		return actors;
	}

	public void setActors(String actors) {
		this.actors = actors;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public int getFk_genreno() {
		return fk_genreno;
	}

	public void setFk_genreno(int fk_genreno) {
		this.fk_genreno = fk_genreno;
	}

	public int getFk_countryno() {
		return fk_countryno;
	}

	public void setFk_countryno(int fk_countryno) {
		this.fk_countryno = fk_countryno;
	}

	public int getFk_companyno() {
		return fk_companyno;
	}

	public void setFk_companyno(int fk_companyno) {
		this.fk_companyno = fk_companyno;
	}

	public int getFk_movietypeno() {
		return fk_movietypeno;
	}

	public void setFk_movietypeno(int fk_movietypeno) {
		this.fk_movietypeno = fk_movietypeno;
	}
	
	
	
}
