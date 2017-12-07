package com.plz.member.model;

/*
   VO(Value Object) 
   또는 
   DTO(Data Transfer Object)
   생성하기 
 */

public class MemberVO {
	
	private String email; 		/* 이메일 */
	private String passwd; 		/* 암호 */
	private String name; 		/* 이름 */
	private String birth; 		/* 생년월일(9403182)형태로 삽입 */
	private String post1; 		/* 우편번호1 */
	private String post2; 		/* 우편번호2 */
	private String addr1; 		/* 주소1 */
	private String addr2; 		/* 주소2 */
	private String joindate; 	/* 가입일 default sysdate */
	private int point; 			/* 포인트 */
	
	
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPost1() {
		return post1;
	}

	public void setPost1(String post1) {
		this.post1 = post1;
	}

	public String getPost2() {
		return post2;
	}

	public void setPost2(String post2) {
		this.post2 = post2;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	
	public String getAllPost() {
		return post1+"-"+post2;
	}
	
	public String getAllAddr() {
		return addr1+" "+addr2;
	}

	public MemberVO(String email, String passwd, String name, String birth, String post1, String post2, String addr1,
			String addr2, String joindate, int point) {
		
		this.email = email;
		this.passwd = passwd;
		this.name = name;
		this.birth = birth;
		this.post1 = post1;
		this.post2 = post2;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.joindate = joindate;
		this.point = point;
	}
	public MemberVO() {}
	
	
}




