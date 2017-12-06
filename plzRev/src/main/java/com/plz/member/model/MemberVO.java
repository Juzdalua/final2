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

	
	public MemberVO(String email, String passwd, String name, String birth, String joindate, int point) {
		
		this.email = email;
		this.passwd = passwd;
		this.name = name;
		this.birth = birth;
		this.joindate = joindate;
		this.point = point;
	}
	public MemberVO() {}
	
	
}




