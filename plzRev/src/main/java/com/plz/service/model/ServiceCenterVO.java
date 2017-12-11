package com.plz.service.model;

public class ServiceCenterVO {

	private int serviceno;            
	private String categoryno;            
	private String title;                 /* 제목 */
	private String msg;                   /* 내용 */
	private String writedate;             /* 등록일 */
	private int cnt ;                     /* 조회수 */
	private int status;                   /* 상태 */
	private int commentCount;             /* 댓글수 */
	private String fk_email;              /* 이메일 */
	private int important;         			  /* 공지여부 */
    private int fk_theaterno;             // 극장번호 
	
    
    public ServiceCenterVO(){ }


	public ServiceCenterVO(int serviceno, String categoryno, String title, String msg, String writedate, int cnt,
			int status, int commentCount, String fk_email, int important, int fk_theaterno) {
		super();
		this.serviceno = serviceno;
		this.categoryno = categoryno;
		this.title = title;
		this.msg = msg;
		this.writedate = writedate;
		this.cnt = cnt;
		this.status = status;
		this.commentCount = commentCount;
		this.fk_email = fk_email;
		this.important = important;
		this.fk_theaterno = fk_theaterno;
		
	}


	public int getServiceno() {
		return serviceno;
	}


	public void setServiceno(int serviceno) {
		this.serviceno = serviceno;
	}


	public String getCategoryno() {
		return categoryno;
	}


	public void setCategoryno(String categoryno) {
		this.categoryno = categoryno;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getMsg() {
		return msg;
	}


	public void setMsg(String msg) {
		this.msg = msg;
	}


	public String getWritedate() {
		return writedate;
	}


	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}


	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public int getCommentCount() {
		return commentCount;
	}


	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}


	public String getFk_email() {
		return fk_email;
	}


	public void setFk_email(String fk_email) {
		this.fk_email = fk_email;
	}


	public int getImportant() {
		return important;
	}


	public void setImportant(int important) {
		this.important = important;
	}


	public int getFk_theaterno() {
		return fk_theaterno;
	}


	public void setFk_theaterno(int fk_theaterno) {
		this.fk_theaterno = fk_theaterno;
	}

    
}
