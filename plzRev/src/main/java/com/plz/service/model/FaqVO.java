package com.plz.service.model;

public class FaqVO {
	
	private int fk_faqno;        /* 고객센터번호 */
	private String title;        /* 제목 */
	private String content;      /* 내용 */
	private String writedate;    /* 등록일 */
	private int cnt;             /* 조회수 */  
	private int status;          /* 상태  0- 삭제/ 1- 정상 */
	
	private ServiceCategotyVO categoryvo;
	
	public FaqVO(){ }
	

	public FaqVO(int fk_faqno, String title, String content, String writedate, int cnt, int status,
			ServiceCategotyVO categoryvo) {
		super();
		this.fk_faqno = fk_faqno;
		this.title = title;
		this.content = content;
		this.writedate = writedate;
		this.cnt = cnt;
		this.status = status;
		this.categoryvo = categoryvo;
	}

	public ServiceCategotyVO getCategoryvo() {
		return categoryvo;
	}

	public void setCategoryvo(ServiceCategotyVO categoryvo) {
		this.categoryvo = categoryvo;
	}

	public int getFk_faqno() {
		return fk_faqno;
	}

	public void setFk_faqno(int fk_faqno) {
		this.fk_faqno = fk_faqno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
	
	
}
