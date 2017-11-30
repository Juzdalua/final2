package com.plz.jun.movie.model;

public class MediaVO {

	private int mediano;
	private String medianame;
	private int mediatype;		//0:사진 1:동영상
	private int fk_movieno;
	
	public MediaVO(){}
	
	public MediaVO(int mediano, String medianame, int mediatype, int fk_movieno) {
		super();
		this.mediano = mediano;
		this.medianame = medianame;
		this.mediatype = mediatype;
		this.fk_movieno = fk_movieno;
	}

	public int getMediano() {
		return mediano;
	}

	public void setMediano(int mediano) {
		this.mediano = mediano;
	}

	public String getMedianame() {
		return medianame;
	}

	public void setMedianame(String medianame) {
		this.medianame = medianame;
	}

	public int getMediatype() {
		return mediatype;
	}

	public void setMediatype(int mediatype) {
		this.mediatype = mediatype;
	}

	public int getFk_movieno() {
		return fk_movieno;
	}

	public void setFk_movieno(int fk_movieno) {
		this.fk_movieno = fk_movieno;
	}
	
	
	
}
