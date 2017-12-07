package com.plz.service.model;

public class CommentVO {

	private int no;           	    /* 답글번호 */
	private int fk_commentno; 		/* 고객센터번호 */
	private String content;         /* 댓글내용 */
	private String comment_date;    /* 작성일자 */
	private int status;             /* 상태 0- 삭제/ 1- 정상 */
	
	public CommentVO(){ }
	
	public CommentVO(int no, int fk_commentno, String content, String comment_date, int status) {
		super();
		this.no = no;
		this.fk_commentno = fk_commentno;
		this.content = content;
		this.comment_date = comment_date;
		this.status = status;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getFk_commentno() {
		return fk_commentno;
	}

	public void setFk_commentno(int fk_commentno) {
		this.fk_commentno = fk_commentno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getComment_date() {
		return comment_date;
	}

	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
	
}
